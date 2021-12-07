#include <jni.h>
#include <jvmti.h>
#include <assert.h>
#include <stdlib.h>
#include <classfile_constants.h>
#include <string.h>
#include <stdint.h>

#include "agent_main.h"
#include "state.h"
#include "agent.h"
#include "util.h"
#include "options.h"
#include "jnicheck.h"
#include "j2c_proxy.h"

#define PROXY_CODE_BLOCK_SIZE (4096)
#define PROXY_CODE_ALIGN_UNIT (4)
#define PROXY_CODE_ALIGN(addr) (((addr) + (PROXY_CODE_ALIGN_UNIT - 1)) & ~(PROXY_CODE_ALIGN_UNIT - 1))


struct deferred_proxy_info {
    jmethodID method;
    void *address;
    struct deferred_proxy_info *next;
};

struct proxy_code_block {
    struct proxy_code_block *next;
    const char *current;  /* inclusive */
    const char *limit;    /* exclusive*/
    char code[0]; 
};

static void bda_j2c_proxy(JNIEnv *env, jobject classOrObject, ...);

/* a list of native methods and their proxies. */
static struct native_method_descriptor *bda_binding_list = NULL;
static struct proxy_code_block *bda_proxy_code_blocks = NULL;

/* a list of of deferred proxies. */
static struct deferred_proxy_info *deferred_native_methods = NULL;

/* The lock protecting global variables in this file. */
MUTEX_DECL(bda_native_methods_lock)

void bda_j2c_proxy_init()
{
    MUTEX_INIT(bda_native_methods_lock);
}

unsigned char *bda_alloc_proxy_code(int _size)
{
    int size = PROXY_CODE_ALIGN(_size);
    struct proxy_code_block *block;
    unsigned char *pcode;

    MUTEX_LOCK(bda_native_methods_lock);
    block = bda_proxy_code_blocks;
    if (!block || 
	((block->current + 
size - 1) >= 
block->limit) ) {
      block=VM_ALLOC_EXECUTABLE(PROXY_CODE_BLOCK_SIZE);
        block->current=(char *)PROXY_CODE_ALIGN((uintptr_t)&block->code[0]);
        block->limit=(char *)block + PROXY_CODE_BLOCK_SIZE;
        block->next=bda_proxy_code_blocks;
        bda_proxy_code_blocks=block;
    }
    pcode=(unsigned char *)block->current;
    block->current += size;
    MUTEX_UNLOCK(bda_native_methods_lock);

    return pcode;
}


void bda_j2c_proxy_add(jvmtiEnv *jvmti, JNIEnv *env, jmethodID method, 
                              void* address, void** new_address_ptr)
{
  struct native_method_descriptor *bind;

  jvmtiError err;
  jclass clazz;
  jobject cloader;
  char *cdesc, *mname, *mdesc;
  int modifier, num_words_for_arguments, number_of_arguments;
  int index;
  const char **args;
  int len_fullname;
  char *fullname;

  assert(address != NULL);
  bind = malloc(sizeof *bind);

  MUTEX_LOCK(bda_native_methods_lock);
  bind->next = bda_binding_list;
  bda_binding_list = bind;
  MUTEX_UNLOCK(bda_native_methods_lock);

  bind->method_id = method;
  bind->original_native_method_address = address;

  err = (*jvmti)->GetMethodDeclaringClass(jvmti, method, &clazz); 
  assert(err == JVMTI_ERROR_NONE);
  err = (*jvmti)->GetClassLoader(jvmti, clazz, &cloader);
  assert(err == JVMTI_ERROR_NONE);
  bind->is_user_method = cloader != NULL;
  err = (*jvmti)->GetMethodModifiers(jvmti, method, &modifier);
  assert(err == JVMTI_ERROR_NONE);
  err = (*jvmti)->GetClassSignature(jvmti, clazz, &cdesc, NULL);
  assert(err == JVMTI_ERROR_NONE);
  err = (*jvmti)->GetMethodName(jvmti, method, &mname, &mdesc, NULL);
  assert(err == JVMTI_ERROR_NONE);
  
  len_fullname=strlen(cdesc) + 1 + strlen(mname) + strlen(mdesc);
  fullname=malloc(len_fullname + 1);
  sprintf(fullname, "%s.%s%s", cdesc, mname, mdesc);
  bind->fullname=fullname;
  bda_parse_method_descriptor(mdesc, &bind->argumentTypes, &bind->returnType);
  err = (*jvmti)->Deallocate(jvmti, (unsigned char*)mname);
  assert(err == JVMTI_ERROR_NONE);
  err = (*jvmti)->Deallocate(jvmti, (unsigned char*)mdesc);
  assert(err == JVMTI_ERROR_NONE);
  err = (*jvmti)->Deallocate(jvmti, (unsigned char*)cdesc);
  assert(err == JVMTI_ERROR_NONE);

  /* Compute the number of slots for the incoming arguments. */
  number_of_arguments = 0;
  num_words_for_arguments = 2; /* JNIEnv and [class|object] are default native method arguments. */
  for(index = 0, args = bind->argumentTypes; *args;args++, index++){
      const char *cdesc = *args;
      number_of_arguments++;
      switch(cdesc[0]) {
      case 'B': case 'C': case 'I':  case 'S':case 'Z': case 'F': 
      case 'L': case '[':
          num_words_for_arguments += 1;
          break;
      case 'D': case 'J' :
          num_words_for_arguments += 2;
          break;
      default:
          assert(0);
          break;
      } 
  }
  bind->num_words_for_arguments = num_words_for_arguments;
  bind->number_of_arguments = number_of_arguments;

  bda_generate_intermediate_proxy(bind);
  *new_address_ptr = bind->proxy_address;
}


void bda_j2c_proxy_add_deferred(jmethodID method, void *address)
{
    struct deferred_proxy_info *pinfo;

    pinfo = malloc(sizeof *deferred_native_methods);
    pinfo->method=method;
    pinfo->address=address;

    MUTEX_LOCK(bda_native_methods_lock);
    pinfo->next= deferred_native_methods;
    deferred_native_methods=pinfo;
    MUTEX_UNLOCK(bda_native_methods_lock);

}

void bda_j2c_proxy_deferred_methods_reregister(jvmtiEnv *jvmti, JNIEnv *env)
{
  jvmtiError err;
  jint jni_err;
  struct deferred_proxy_info *pinfo;

  MUTEX_LOCK(bda_native_methods_lock);
  pinfo=deferred_native_methods;
  if (pinfo != NULL) {
      deferred_native_methods=pinfo->next;
  }
  MUTEX_UNLOCK(bda_native_methods_lock);

  while (pinfo != NULL) {
      JNINativeMethod jni_method;
      jmethodID method = pinfo->method;
      void* address = pinfo->address;
      jclass clazz;
      char *mname, *mdesc;

      err = (*jvmti)->GetMethodDeclaringClass(jvmti, method, &clazz);
      assert(err == JVMTI_ERROR_NONE);
      err = (*jvmti)->GetMethodName(jvmti, method, &mname, &mdesc, NULL);
      assert(err == JVMTI_ERROR_NONE);
      
      jni_method.name = mname;
      jni_method.signature = mdesc;
      jni_method.fnPtr = address;
      assert(bda_orig_jni_funcs != NULL);
      jni_err = bda_orig_jni_funcs->RegisterNatives(env, clazz, &jni_method, 1);
      assert(jni_err == 0);
      
      err = (*jvmti)->Deallocate(jvmti, (unsigned char*)mname);
      assert(err == JVMTI_ERROR_NONE);
      err = (*jvmti)->Deallocate(jvmti, (unsigned char*)mdesc);
      assert(err == JVMTI_ERROR_NONE);

      MUTEX_LOCK(bda_native_methods_lock);
      pinfo=deferred_native_methods;
      if (pinfo != NULL) {
          deferred_native_methods=pinfo->next;
      }
      MUTEX_UNLOCK(bda_native_methods_lock);
  }

}
