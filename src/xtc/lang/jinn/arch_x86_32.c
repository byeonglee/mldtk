
/* intermediate code */
static void *proxy_address = bda_j2c_proxy;


static void bda_j2c_proxy(JNIEnv *env, jobject classOrObject, ...)
{

  /* for incoming parameters and outgoing result.*/
  uintptr_t return_eax, return_edx;
  void *arg_begin, *saved_my_esp;

  /* information about the orignial native method. */
  struct native_method_descriptor *bind;
  void* original_native_target;
  unsigned int jni_arg_size;

  /* for stitching call frame. */
  void *saved_return_addr, *saved_prev_fp;
  void *c2j_return_addr, *c2j_prev_fp;
  struct bda_jni_function_frame const * c2j;
  struct bda_native_method_frame native_frame;
  struct bda_state_info *s;

  /* obtain the target native method infomation.*/
#if defined(__GNUC__) && defined(__i386__)
  asm("movl %%eax, %0;" : "=m" (bind));
#elif defined(__GNUC__) && defined(__x86_64__)
  asm("movl %%rax, %0;" : "=m" (bind));
#elif defined(_WIN32)
  __asm mov bind, eax;
#else
#error "Unsupported"
#endif

  original_native_target = bind->original_native_method_address;
  jni_arg_size = bind->num_words_for_arguments;
  GET_RETURN_ADDRESS(saved_return_addr);
  GET_PREVIOUS_FRAME_POINTER(saved_prev_fp);

  s = bda_get_state_info(env);
  if (s != NULL) {
    /* stitch frame. */
    c2j = s->head_c2j;
    if (c2j != NULL) {
      c2j_return_addr = c2j->return_addr;
      c2j_prev_fp = c2j->caller_fp;
    } else {
      c2j_return_addr = NULL;
      c2j_prev_fp = NULL;
    }
    SET_RETURN_ADDRESS(c2j_return_addr);
    SET_PREVIOUS_FRAME_POINTER(c2j_prev_fp);

    /* notify j2c_call event. */
    native_frame.methodID = bind->method_id;
    native_frame.native_method_address = original_native_target;
    native_frame.is_user_method = bind->is_user_method;
    native_frame.env = env;
    bda_state_j2c_call(s, &native_frame);

    if (agent_options.jinn) {
      int index;
      va_list argp;
      const char **args;

      bda_local_ref_enter(s, bind->num_words_for_arguments, 1);
      if (classOrObject != NULL) {bda_local_ref_add(s, classOrObject);}
      va_start(argp, classOrObject);

      for(index = 0, args = bind->argumentTypes; *args;args++, index++){
          const char *cdesc = *args;
          switch(cdesc[0]) {
          case 'Z': case 'B': case 'C': case 'I': case 'S': case 'F': {
              va_arg(argp, jint);
              break;
          }
          case 'J': case 'D': {
              va_arg(argp, jint);
              va_arg(argp, jint);
              break;
          }
          case 'L': case '[': {
              jobject v = (jobject)va_arg(argp, jobject);
              if (v != NULL) {
                  bda_local_ref_add(s, v);
              }
              break;
          }
          default:
              assert(0);
              break;
          }
      }
      va_end(argp);
      bda_local_ref_enter(s, 16, 0);
    }
  }

  /* Now, call the original native method.*/
  arg_begin = &env + (jni_arg_size-1);
#if defined(__GNUC__) && defined(__i386__)
  asm(
      "movl %%esp, %0;"
      "movl %5, %%ecx;"
      "movl %4, %%eax;"
      "L: pushl (%%eax);"
      "sub $4, %%eax;"
      "loop L;"
      "movl %6, %%eax;"
      "call *%%eax;"
      "mov %%eax, %1;"
      "mov %%edx, %2;"
      "movl %3, %%eax;"
      "movl %%eax, %%esp;"
      : "=m"(saved_my_esp), "=m"(return_eax), "=m"(return_edx)
      : "m"(saved_my_esp), "m"(arg_begin), "m"(jni_arg_size), "m"(original_native_target)
      : "%eax","%ecx","%edx","%esp"
      );
#elif defined(_WIN32)
  __asm
  {
      mov saved_my_esp, esp
      mov ecx, jni_arg_size
      mov eax, arg_begin
   L_2:
      push [eax]
      sub eax, 4
      loop L_2
      mov eax, original_native_target
      call eax
      mov return_eax, eax
      mov return_edx, edx
      mov eax, saved_my_esp
      mov esp,eax
  }
#else
#error "Unsupported"

#endif

  if (s != NULL) {

    if (agent_options.jinn) {
        int success  = 1;

        if (success) {
            if ((bind->returnType[0] == 'L') ||(bind->returnType[0] == '[')) {
                if ((jobject)return_eax != NULL) {
                    success = bda_check_ref_dangling(s, (jobject)return_eax, 0, bind->fullname);
                }
            }
        }

        if (success) {
            success = bda_check_local_frame_double_free(s);
        }
        bda_local_ref_leave(s);

        if (success) {
            success = bda_check_local_frame_leak(s); /* the frame must be sential.*/
        }
        bda_local_ref_leave(s); /* sential frame */
    }

    /* notify j2c_return event. */
    bda_state_j2c_return(s, &native_frame);

    /* unstitch this frame.*/
    SET_PREVIOUS_FRAME_POINTER(saved_prev_fp);
    SET_RETURN_ADDRESS(saved_return_addr);
  }

    /* return to caller.*/
#if defined(__GNUC__) && defined(__i386__)
  asm(
      "mov %0, %%eax;"
      "mov %1, %%edx;"
      :
      : "m"(return_eax), "m"(return_edx)
      );
#elif defined(_WIN32)
  __asm
  {
    mov eax, return_eax
    mov edx, return_edx
  }
#else
#error "Unsupported"
#endif
}


void bda_generate_intermediate_proxy(struct native_method_descriptor *ndesc)
{
    uintptr_t paddr = (uintptr_t)&proxy_address;
    unsigned char *pcode;  /* the code area containing the proxy */
    uintptr_t descid = (uintptr_t)ndesc;

#if (defined(__GNUC__) && defined(__i386__)) || defined(_WIN32)
    const unsigned char code_template[] = {
        0xb8, 0x00, 0x00, 0x00, 0x00,       /* movl $descid, %eax */
        0xff, 0x25, 0x00, 0x00, 0x00, 0x00, /* jmp *($paddr) */
    };

    pcode = bda_alloc_proxy_code(sizeof code_template);
    memcpy(pcode, code_template, sizeof code_template);

    pcode[1] = ((descid) & 0x000000FF);
    pcode[2] = ((descid) & 0x0000FF00) >> 8;
    pcode[3] = ((descid) & 0x00FF0000) >> 16;
    pcode[4] = ((descid) & 0xFF000000) >> 24;

    pcode[7] = (paddr & 0x000000FF);
    pcode[8] = (paddr & 0x0000FF00) >> 8;
    pcode[9] = (paddr & 0x00FF0000) >> 16;
    pcode[10] = (paddr & 0xFF000000) >> 24;

#else
#error "Unsupported"
#endif

    ndesc->proxy_address=pcode;
}
