#include <assert.h>
#include <jni.h>
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

static const struct _reg _RAX = { 0, GPR, "RAX" }, * const RAX = &_RAX;
static const struct _reg _RCX = { 1, GPR, "RCX", }, * const RCX = &_RCX;
static const struct _reg _RDX = { 2, GPR, "RDX", }, * const RDX = &_RDX;
static const struct _reg _RSP = { 4, GPR, "RSP", }, * const RSP = &_RSP;
static const struct _reg _RBP = { 5, GPR, "RBP", }, * const RBP = &_RBP;
static const struct _reg _RSI = { 6, GPR, "RSI", }, * const RSI = &_RSI;
static const struct _reg _RDI = { 7, GPR, "RDI", }, * const RDI = &_RDI;
static const struct _reg _R8 = { 8, GPR, "R8", }, * const R8 = &_R8;
static const struct _reg _R9 = { 9, GPR, "R9", }, * const R9 = &_R9;
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

static void codebuf_check(struct codebuf *cbuf, size_t requested_bytes) {
  assert(cbuf->p >= cbuf->entry);
  assert(cbuf->p - cbuf->entry + requested_bytes < cbuf->size);
}

static u8 modrm(u8 mode, u8 reg_opcode, u8 rm) {
  return ((mode & 3) << 6) | ((reg_opcode & 7) << 3) | (rm & 7);
}

static u8 reg2opcode(reg r) {
  return r->code & 7;
}

static void asm_emit(struct codebuf *cbuf, u8 v) {
  codebuf_check(cbuf, 1);
  cbuf->p[0] = v;
  cbuf->p += 1;
}

static void asm_emit_disp32(struct codebuf *cbuf, disp32 offset) {
  codebuf_check(cbuf, 4);
  cbuf->p[0] = (offset >> 0) & 0xff;
  cbuf->p[1] = (offset >> 8) & 0xff;
  cbuf->p[2] = (offset >> 16) & 0xff;
  cbuf->p[3] = (offset >> 24) & 0xff;
  cbuf->p += 4;
}

static void asm_emit_imm32(struct codebuf *cbuf, imm32 imm) {
  codebuf_check(cbuf, 4);
  cbuf->p[0] = (imm >> 0) & 0xff;
  cbuf->p[1] = (imm >> 8) & 0xff;
  cbuf->p[2] = (imm >> 16) & 0xff;
  cbuf->p[3] = (imm >> 24) & 0xff;
  cbuf->p += 4;
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

static void asm_emit_add_reg_imm32(struct codebuf *cbuf, reg dst, imm32 imm) {
  asm_emit_rex_prefix(cbuf, 1, NULL, NULL, dst);
  asm_emit(cbuf, 0x81);
  asm_emit(cbuf, modrm(0x3, 0x0, dst->code));
  asm_emit_imm32(cbuf, imm);
}

static void asm_emit_call_reg(struct codebuf *cbuf, reg src) {
  asm_emit_rex_prefix(cbuf, 0, NULL, NULL, src);
  asm_emit(cbuf, 0xff);
  asm_emit(cbuf, modrm(0x3, 0x2, src->code));
}

static void asm_emit_endbr64(struct codebuf *cbuf) {
  static char code[] = { 0xf3, 0x0f, 0x1e, 0xfa, };
  codebuf_check(cbuf, sizeof(code));
  memcpy(cbuf->p, code, sizeof(code));
  cbuf->p += sizeof(code);
}

static void asm_emit_mov_reg_disp32_reg_quad(struct codebuf *cbuf, reg dst,
    disp32 disp, reg src) {
  asm_emit_rex_prefix(cbuf, 1, src, NULL, dst);
  asm_emit(cbuf, 0x89);
  asm_emit(cbuf, modrm(0x02, src->code, dst->code));
  asm_emit_disp32(cbuf, disp);
}

static void asm_emit_mov_reg_imm_quad(struct codebuf *cbuf, reg dst, u64 imm) {
  asm_emit_rex_prefix(cbuf, 1, NULL, NULL, dst);
  asm_emit(cbuf, 0xb8 | (dst->code & 0x07));
  asm_emit_imm64(cbuf, imm);
}

static void asm_emit_mov_reg_reg_disp32_quad(struct codebuf *cbuf, reg dst,
    reg src, disp32 disp) {
  asm_emit_rex_prefix(cbuf, 1, dst, NULL, src);
  asm_emit(cbuf, 0x8b);
  asm_emit(cbuf, modrm(0x02, dst->code, src->code));
  asm_emit_disp32(cbuf, disp);
}

static void asm_emit_mov_reg_reg_quad(struct codebuf *cbuf, reg dst, reg src) {
  asm_emit_rex_prefix(cbuf, 1, src, NULL, dst);
  asm_emit(cbuf, 0x89);
  asm_emit(cbuf, modrm(0x03, src->code, dst->code));
}

static void asm_emit_pop_reg(struct codebuf *cbuf, reg dst) {
  asm_emit_rex_prefix(cbuf, 0, NULL, NULL, dst);
  asm_emit(cbuf, 0x58 + reg2opcode(dst));
}

static void asm_emit_push_reg(struct codebuf *cbuf, reg src) {
  asm_emit_rex_prefix(cbuf, 0, NULL, NULL, src);
  asm_emit(cbuf, 0x50 + reg2opcode(src));
}

static void asm_emit_push_reg_disp32(struct codebuf *cbuf, reg src,
    disp32 offset) {
  asm_emit_rex_prefix(cbuf, 0, NULL, NULL, src);
  asm_emit(cbuf, 0xff);
  asm_emit(cbuf, modrm(0x2, 0x6, src->code));
  asm_emit_disp32(cbuf, offset);
}

static void asm_emit_ret(struct codebuf *cbuf) {
  asm_emit(cbuf, 0xc3);
}

static void asm_emit_sub_reg_imm32(struct codebuf *cbuf, reg dst, imm32 v) {
  asm_emit_rex_prefix(cbuf, 1, NULL, NULL, dst);
  asm_emit(cbuf, 0x81);
  asm_emit(cbuf, modrm(0x3, 0x05, dst->code));
  asm_emit_imm32(cbuf, v);
}

static int is_fp_type(const char *cdesc) {
  switch (cdesc[0]) {
  case 'D':
  case 'F':
    return 1;
  default:
    return 0;
  }
}

static void prof_j2c_call(struct native_method_descriptor *bind, u64 params[]) {
  struct bda_native_method_frame native_frame;
  JNIEnv * const env = (JNIEnv *) params[0];
  struct bda_state_info * const s = bda_get_state_info(env);

  if (s == NULL) {
    return;
  }

  /* notify j2c_call event. */
  native_frame.methodID = bind->method_id;
  native_frame.native_method_address = bind->original_native_method_address;
  native_frame.is_user_method = bind->is_user_method;
  native_frame.env = env;
  bda_state_j2c_call(s, &native_frame);

  if (agent_options.jinn) {
    int index;
    const jobject classOrObject = (jobject) params[1];

    bda_local_ref_enter(s, bind->num_words_for_arguments, 1);
    if (classOrObject != NULL) {
      bda_local_ref_add(s, classOrObject);
    }

    for (index = 0; index < bind->number_of_arguments; index++) {
      const char *cdesc = bind->argumentTypes[index];
      switch (cdesc[0]) {
      case 'L':
      case '[': {
        const jobject v = (jobject) params[2 + index];
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

static void prof_j2c_return(struct native_method_descriptor *bind,
    JNIEnv * const env, u64 result) {
  struct bda_state_info * const s = bda_get_state_info(env);
  struct bda_native_method_frame native_frame;

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

static size_t alignup16(size_t v) {
  return (v + 0x10 - 1) & ~(0x10 - 1);
}

void bda_generate_intermediate_proxy(struct native_method_descriptor *ndesc) {
  enum param_loc_type {
    REGISTER, STACK
  };
  struct param_location {
    enum param_loc_type loc_type;
    union {
      reg reg;
      disp32 stack_offset;
    };
  };
  const int num_params = 2 + ndesc->number_of_arguments;
  const int stack_storage_size = alignup16(sizeof(void *) * (num_params + 1));
  const int stack_offset_saved_params = -stack_storage_size;
  const int stack_offset_saved_result = stack_offset_saved_params
      + sizeof(void *) * num_params;
  struct param_location *param_locations;
  int index, num_gpr_params, num_fpr_params, arg_stack_size;
  disp32 param_stack_offset;
  int stack_align_padding;
  struct codebuf cbuf;

  param_stack_offset = sizeof(void *) * 2;
  param_locations = (struct param_location *) malloc(
    sizeof(*param_locations) * num_params);
  num_gpr_params = 0;
  num_fpr_params = 0;
  arg_stack_size = 0;

  /* Process the first parameter of the "JNIEnv" pointer type. */
  assert(num_gpr_params < ARRAY_LENGTH(param_gprs));
  param_locations[0].loc_type = REGISTER;
  param_locations[0].reg = param_gprs[num_gpr_params];
  num_gpr_params = 1;

  /* Process "this" or "class" parameter in case of an instance method. */
  assert(num_gpr_params < ARRAY_LENGTH(param_fprs));
  param_locations[1].loc_type = REGISTER;
  param_locations[1].reg = param_gprs[num_gpr_params];
  num_gpr_params = 2;

  /* Process the follow-up parameters. */
  for (index = 0; index < ndesc->number_of_arguments; index++) {
    const char *cdesc = ndesc->argumentTypes[index];
    struct param_location *ploc = &param_locations[2 + index];

    if (is_fp_type(cdesc) && num_fpr_params < ARRAY_LENGTH(param_fprs)) {
      ploc->loc_type = REGISTER;
      ploc->reg = param_fprs[num_fpr_params];
      num_fpr_params++;
    } else if (!is_fp_type(cdesc) && num_gpr_params < ARRAY_LENGTH(param_gprs)) {
      ploc->loc_type = REGISTER;
      ploc->reg = param_gprs[num_gpr_params];
      num_gpr_params++;
    } else {
      ploc->loc_type = STACK;
      ploc->stack_offset = param_stack_offset;
      param_stack_offset += sizeof(void *);
      arg_stack_size += sizeof(void *);
    }
  }

  cbuf.size = 4096;
  cbuf.entry = bda_alloc_proxy_code(cbuf.size);
  cbuf.p = cbuf.entry;

  /* Emit a prolog sequence to set up a stack frame. */
  asm_emit_endbr64(&cbuf);
  asm_emit_push_reg(&cbuf, RBP);
  asm_emit_mov_reg_reg_quad(&cbuf, RBP, RSP);

  asm_emit_sub_reg_imm32(&cbuf, RSP, stack_storage_size);

  /* Save the incoming parameters into the stack frame */
  for (index = 0; index < num_params; index++) {
    struct param_location *ploc = param_locations + index;
    int saved_stack_offset = stack_offset_saved_params + index * sizeof(void *);

    if (ploc->loc_type == REGISTER) {
      if (ploc->reg->type == GPR) {
        asm_emit_mov_reg_disp32_reg_quad(&cbuf, RBP, saved_stack_offset,
          ploc->reg);
      } else {
        assert(ploc->reg->type == FPR);
      }
    } else {
      assert(ploc->loc_type == STACK);
      asm_emit_mov_reg_reg_disp32_quad(&cbuf, RAX, RBP, ploc->stack_offset);
      asm_emit_mov_reg_disp32_reg_quad(&cbuf, RBP, saved_stack_offset, RAX);
    }
  }

  /* Emit a call sequence of calling a profiling subroutine. */
  asm_emit_mov_reg_imm_quad(&cbuf, param_gprs[0], (uintptr_t) ndesc);
  asm_emit_mov_reg_reg_quad(&cbuf, param_gprs[1], RBP);
  asm_emit_add_reg_imm32(&cbuf, param_gprs[1], stack_offset_saved_params);
  asm_emit_mov_reg_imm_quad(&cbuf, RAX, (uintptr_t) prof_j2c_call);
  asm_emit_call_reg(&cbuf, RAX);

  /* Emit a call sequence of placing arguments and jumping to the target. */
  stack_align_padding = (16 - arg_stack_size % 16) % 16;
  asm_emit_sub_reg_imm32(&cbuf, RSP, stack_align_padding);
  for (index = num_params - 1; index >= 0; index--) {
    struct param_location *ploc = param_locations + index;
    int saved_stack_offset = stack_offset_saved_params + index * sizeof(void *);

    if (ploc->loc_type == REGISTER) {
      if (ploc->reg->type == GPR) {
        asm_emit_mov_reg_reg_disp32_quad(&cbuf, ploc->reg, RBP,
          saved_stack_offset);
      } else {
      }
    } else {
      assert(ploc->loc_type == STACK);
      asm_emit_push_reg_disp32(&cbuf, RBP, saved_stack_offset);
    }
  }
  asm_emit_mov_reg_imm_quad(&cbuf, RAX,
    (u64) ndesc->original_native_method_address);
  asm_emit_call_reg(&cbuf, RAX);
  asm_emit_add_reg_imm32(&cbuf, RSP, stack_align_padding + arg_stack_size);
  asm_emit_mov_reg_disp32_reg_quad(&cbuf, RBP, stack_offset_saved_result, RAX);

  /* Emit a call sequence of calling a profiling subroutine. */
  asm_emit_mov_reg_imm_quad(&cbuf, param_gprs[0], (uintptr_t) ndesc);
  asm_emit_mov_reg_reg_disp32_quad(&cbuf, param_gprs[1], RBP,
    stack_offset_saved_params + 0 * sizeof(void *));
  asm_emit_mov_reg_reg_disp32_quad(&cbuf, param_gprs[2], RBP,
    stack_offset_saved_result);
  asm_emit_mov_reg_imm_quad(&cbuf, RAX, (uintptr_t) prof_j2c_return);
  asm_emit_call_reg(&cbuf, RAX);
  asm_emit_mov_reg_reg_disp32_quad(&cbuf, RAX, RBP, stack_offset_saved_result);

  /* Emit a return sequence. */
  asm_emit_add_reg_imm32(&cbuf, RSP, stack_storage_size);
  asm_emit_pop_reg(&cbuf, RBP);
  asm_emit_ret(&cbuf);

  free(param_locations);
  ndesc->proxy_address = cbuf.entry;
}
