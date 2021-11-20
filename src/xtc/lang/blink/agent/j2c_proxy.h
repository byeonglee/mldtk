#include <jni.h>

struct native_method_descriptor {
  const char **argumentTypes;
  int number_of_arguments;
  const char *returnType;
  int is_static;
  const char *fullname;

  void *proxy_address;
  void *original_native_method_address;
  jmethodID method_id;
  int is_user_method;      /* Whether or not user native method. */
  int num_words_for_arguments;  /* The number of arguments including JNI env pointer */

  struct native_method_descriptor *next;
};

extern void bda_generate_intermediate_proxy(struct native_method_descriptor *ndesc);
extern unsigned char *bda_alloc_proxy_code(int _size);
