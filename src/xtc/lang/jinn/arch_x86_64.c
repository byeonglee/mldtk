#include <assert.h>
#include <jni.h>
#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "j2c_proxy.h"
#include "jnicheck.h"
#include "options.h"
#include "state.h"

#define ARRAY_LENGTH(x) (sizeof x / sizeof x[0])

typedef unsigned char u8;
typedef unsigned long u64;
typedef signed int disp32;
typedef signed int imm32;
typedef signed int rel32;

enum reg_type {
  GPR, FPR,
};

struct _reg {
  const u8 code;
  enum reg_type type;
  const char * const name;
};

typedef const struct _reg *reg;

struct codebuf {
  unsigned char *entry;
  size_t size;
  unsigned char *p;
};

struct param_iter {
  const u64 *gprparams;
  const u64 *fprparams;
  const u64 *stackparams;
  int idx_gpr_params;
  int idx_fpr_params;
  int idx_stack_params;
  struct native_method_descriptor *ndesc;
  int ordinal;
};

static const struct _reg _RAX = { 0, GPR, "RAX" }, * const RAX = &_RAX;
static const struct _reg _RCX = { 1, GPR, "RCX", }, * const RCX = &_RCX;
static const struct _reg _RDX = { 2, GPR, "RDX", }, * const RDX = &_RDX;
static const struct _reg _RSI = { 6, GPR, "RSI", }, * const RSI = &_RSI;
static const struct _reg _RDI = { 7, GPR, "RDI", }, * const RDI = &_RDI;
static const struct _reg _R8 = { 8, GPR, "R8", }, * const R8 = &_R8;
static const struct _reg _R9 = { 9, GPR, "R9", }, * const R9 = &_R9;
static const struct _reg _R11 = { 11, GPR, "R11", }, * const R11 = &_R11;
static const struct _reg _XMM0 = { 0, FPR, "XMM0", }, * const XMM0 = &_XMM0;
static const struct _reg _XMM1 = { 1, FPR, "XMM1", }, * const XMM1 = &_XMM1;
static const struct _reg _XMM2 = { 2, FPR, "XMM2", }, * const XMM2 = &_XMM2;
static const struct _reg _XMM3 = { 3, FPR, "XMM3", }, * const XMM3 = &_XMM3;
static const struct _reg _XMM4 = { 4, FPR, "XMM4", }, * const XMM4 = &_XMM4;
static const struct _reg _XMM5 = { 5, FPR, "XMM5", }, * const XMM5 = &_XMM5;
static const struct _reg _XMM6 = { 6, FPR, "XMM6", }, * const XMM6 = &_XMM6;
static const struct _reg _XMM7 = { 7, FPR, "XMM7", }, * const XMM7 = &_XMM7;

static reg param_gprs[] = { RDI, RSI, RDX, RCX, R8, R9 };

static reg param_fprs[] = { XMM0, XMM1, XMM2, XMM3, XMM4, XMM5, XMM6, XMM7 };

static int is_fp_type(const char *cdesc) {
  switch (cdesc[0]) {
  case 'D':
  case 'F':
    return 1;
  default:
    return 0;
  }
}

static void param_iter_start(struct param_iter *i,
    struct native_method_descriptor *ndesc, u64 gprparams[], u64 fprparams[],
    u64 stkparams[]) {
  i->gprparams = gprparams;
  i->fprparams = fprparams;
  i->stackparams = stkparams;
  i->idx_gpr_params = 0;
  i->idx_fpr_params = 0;
  i->idx_stack_params;
  i->idx_fpr_params = 0;
  i->idx_gpr_params = 0;
  i->idx_stack_params = 0;
  i->ndesc = ndesc;
  i->ordinal = 0;
}

static int param_iter_has_next(struct param_iter *i) {
  return i->ordinal < (2 + i->ndesc->number_of_arguments);
}

static u64 param_iter_next(struct param_iter *i) {
  int ordinal = i->ordinal++;

  assert(ordinal < (2 + i->ndesc->number_of_arguments));
  if (ordinal == 0) {
    return i->gprparams[i->idx_gpr_params++];
  }
  if (ordinal == 1) {
    return i->gprparams[i->idx_gpr_params++];
  }

  if (is_fp_type(i->ndesc->argumentTypes[ordinal - 2])) {
    if (i->idx_fpr_params < ARRAY_LENGTH(param_fprs)) {
      return i->fprparams[i->idx_fpr_params++];
    } else {
      return i->stackparams[i->idx_stack_params++];
    }
  } else {
    if (i->idx_gpr_params < ARRAY_LENGTH(param_gprs)) {
      return i->gprparams[i->idx_gpr_params++];
    } else {
      return i->stackparams[i->idx_stack_params++];
    }
  }
}

static const char *param_iter_type_desc(struct param_iter *i) {
  assert(i->ordinal >= 2);
  return i->ndesc->argumentTypes[i->ordinal - 2];
}

static void codebuf_check(struct codebuf *cbuf, size_t requested_bytes) {
  assert(cbuf->p >= cbuf->entry);
  assert(cbuf->p - cbuf->entry + requested_bytes < cbuf->size);
}

static u8 modrm(u8 mode, u8 reg_opcode, u8 rm) {
  return ((mode & 3) << 6) | ((reg_opcode & 7) << 3) | (rm & 7);
}


static void asm_emit(struct codebuf *cbuf, u8 v) {
  codebuf_check(cbuf, 1);
  cbuf->p[0] = v;
  cbuf->p += 1;
}

static void asm_emit_imm64(struct codebuf *cbuf, u64 imm) {
  codebuf_check(cbuf, 8);
  cbuf->p[0] = (imm >> 0) & 0xff;
  cbuf->p[1] = (imm >> 8) & 0xff;
  cbuf->p[2] = (imm >> 16) & 0xff;
  cbuf->p[3] = (imm >> 24) & 0xff;
  cbuf->p[4] = (imm >> 32) & 0xff;
  cbuf->p[5] = (imm >> 40) & 0xff;
  cbuf->p[6] = (imm >> 48) & 0xff;
  cbuf->p[7] = (imm >> 56) & 0xff;
  cbuf->p += 8;
}

static void asm_emit_rex_prefix(struct codebuf *cbuf, int w, reg r, reg x,
    reg b) {
  unsigned char w_bit = w ? 8 : 0;
  unsigned char r_bit = !r || r->code < 8 ? 0 : 4;
  unsigned char x_bit = !x || x->code < 8 ? 0 : 2;
  unsigned char b_bit = !b || b->code < 8 ? 0 : 1;
  if (w_bit || r_bit || x_bit || b_bit) {
    asm_emit(cbuf, 0x40 | w_bit | r_bit | b_bit);
  }
}

static void asm_emit_jmp_reg(struct codebuf *cbuf, reg dst) {
  asm_emit_rex_prefix(cbuf, 0, NULL, NULL, dst);
  asm_emit(cbuf, 0xff);
  asm_emit(cbuf, modrm(0x3, 0x4, dst->code));
}

static void asm_emit_mov_reg_imm_quad(struct codebuf *cbuf, reg dst, u64 imm) {
  asm_emit_rex_prefix(cbuf, 1, NULL, NULL, dst);
  asm_emit(cbuf, 0xb8 | (dst->code & 0x07));
  asm_emit_imm64(cbuf, imm);
}



int nmdesc_get_stack_arg_count(struct native_method_descriptor *ndesc) {
  int index, num_gpr_params, num_fpr_params, stack_arg_count;

  num_fpr_params = 0;
  stack_arg_count = 0;
  num_gpr_params = 2;

  /* Process the follow-up parameters. */
  for (index = 0; index < ndesc->number_of_arguments; index++) {
    const char *cdesc = ndesc->argumentTypes[index];
    if (is_fp_type(cdesc) && num_fpr_params < ARRAY_LENGTH(param_fprs)) {
      num_fpr_params++;
    } else if (!is_fp_type(cdesc) && num_gpr_params < ARRAY_LENGTH(param_gprs)) {
      num_gpr_params++;
    } else {
      stack_arg_count++;
    }
  }
  return stack_arg_count;
}

void bda_generate_intermediate_proxy(struct native_method_descriptor *ndesc) {
  struct codebuf cbuf;
  extern int bda_j2c_proxy();

  cbuf.size = 32;
  cbuf.entry = bda_alloc_proxy_code(cbuf.size);
  cbuf.p = cbuf.entry;

  asm_emit_mov_reg_imm_quad(&cbuf, RAX, (intptr_t) ndesc);
  asm_emit_mov_reg_imm_quad(&cbuf, R11, (intptr_t) bda_j2c_proxy);
  asm_emit_jmp_reg(&cbuf, R11);

//  printf("0x%12lx,+%ld %s\n", (uintptr_t) cbuf.entry, cbuf.p - cbuf.entry,
//    ndesc->fullname);
  ndesc->proxy_address = cbuf.entry;
}


void *nmdesc_get_orig_target(struct native_method_descriptor *ndesc) {
  return ndesc->original_native_method_address;
}

void *bda_state_c2j_old_fp(struct bda_state_info * const s) {
  if (s->head_c2j) {
    return s->head_c2j->caller_fp;
  } else {
    return NULL;
  }
}

void *bda_state_c2j_ret_addr(struct bda_state_info * const s) {
  if (s->head_c2j) {
    return s->head_c2j->return_addr;
  } else {
    return NULL;
  }
}

void prof_j2c_call(struct bda_state_info * const s,
    struct native_method_descriptor *bind, u64 gprparams[], u64 fprparams[],
    u64 stackparams[]) {
  struct bda_native_method_frame native_frame;
  JNIEnv * const env = (JNIEnv *) gprparams[0];
  assert(s != NULL);

  /* notify j2c_call event. */
  native_frame.methodID = bind->method_id;
  native_frame.native_method_address = bind->original_native_method_address;
  native_frame.is_user_method = bind->is_user_method;
  native_frame.env = env;
  bda_state_j2c_call(s, &native_frame);

  if (agent_options.jinn) {
    struct param_iter it;

    param_iter_start(&it, bind, gprparams, fprparams, stackparams);
    param_iter_next(&it);
    const jobject classOrObject = (jobject) param_iter_next(&it);

    bda_local_ref_enter(s, bind->num_words_for_arguments, 1);
    if (classOrObject != NULL) {
      bda_local_ref_add(s, classOrObject);
    }

    while (param_iter_has_next(&it)) {
      const char *cdesc = param_iter_type_desc(&it);
      u64 value = param_iter_next(&it);
      switch (cdesc[0]) {
      case 'L':
      case '[': {
        const jobject v = (jobject) value;
        if (v != NULL) {
          bda_local_ref_add(s, v);
        }
        break;
      }
      default:
        break;
      }
    }
    bda_local_ref_enter(s, 16, 0);
  }
}

void prof_j2c_return(struct bda_state_info * const s,
    struct native_method_descriptor *bind, JNIEnv * const env, u64 result) {
  struct bda_native_method_frame native_frame;

  assert(s != NULL);

  /* notify j2c_call event. */
  native_frame.methodID = bind->method_id;
  native_frame.native_method_address = bind->original_native_method_address;
  native_frame.is_user_method = bind->is_user_method;
  native_frame.env = env;

  if (s == NULL) {
    return;
  }
  if (agent_options.jinn) {
    int success = 1;

    if (success) {
      if ((bind->returnType[0] == 'L') || (bind->returnType[0] == '[')) {
        if ((jobject) result != NULL) {
          success = bda_check_ref_dangling(s, (jobject) result, 0,
            bind->fullname);
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
}
