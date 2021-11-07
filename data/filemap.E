# 1 "mm/filemap.c"
# 1 "<built-in>"
# 1 "<command line>"
# 1 "mm/filemap.c"
# 12 "mm/filemap.c"
# 1 "include/linux/config.h" 1



# 1 "include/linux/autoconf.h" 1
# 5 "include/linux/config.h" 2
# 13 "mm/filemap.c" 2
# 1 "include/linux/module.h" 1
# 10 "include/linux/module.h"
# 1 "include/linux/sched.h" 1



# 1 "include/asm/param.h" 1
# 5 "include/linux/sched.h" 2


# 1 "include/linux/capability.h" 1
# 16 "include/linux/capability.h"
# 1 "include/linux/types.h" 1
# 13 "include/linux/types.h"
# 1 "include/linux/posix_types.h" 1



# 1 "include/linux/stddef.h" 1
# 5 "include/linux/posix_types.h" 2
# 36 "include/linux/posix_types.h"
typedef struct {
        unsigned long fds_bits [(1024/(8 * sizeof(unsigned long)))];
} __kernel_fd_set;


typedef void (*__kernel_sighandler_t)(int);


typedef int __kernel_key_t;
typedef int __kernel_mqd_t;

# 1 "include/asm/posix_types.h" 1
# 10 "include/asm/posix_types.h"
typedef unsigned long __kernel_ino_t;
typedef unsigned short __kernel_mode_t;
typedef unsigned short __kernel_nlink_t;
typedef long __kernel_off_t;
typedef int __kernel_pid_t;
typedef unsigned short __kernel_ipc_pid_t;
typedef unsigned short __kernel_uid_t;
typedef unsigned short __kernel_gid_t;
typedef unsigned int __kernel_size_t;
typedef int __kernel_ssize_t;
typedef int __kernel_ptrdiff_t;
typedef long __kernel_time_t;
typedef long __kernel_suseconds_t;
typedef long __kernel_clock_t;
typedef int __kernel_timer_t;
typedef int __kernel_clockid_t;
typedef int __kernel_daddr_t;
typedef char * __kernel_caddr_t;
typedef unsigned short __kernel_uid16_t;
typedef unsigned short __kernel_gid16_t;
typedef unsigned int __kernel_uid32_t;
typedef unsigned int __kernel_gid32_t;

typedef unsigned short __kernel_old_uid_t;
typedef unsigned short __kernel_old_gid_t;
typedef unsigned short __kernel_old_dev_t;


typedef long long __kernel_loff_t;


typedef struct {

        int val[2];



} __kernel_fsid_t;
# 48 "include/linux/posix_types.h" 2
# 14 "include/linux/types.h" 2
# 1 "include/asm/types.h" 1





typedef unsigned short umode_t;






typedef __signed__ char __s8;
typedef unsigned char __u8;

typedef __signed__ short __s16;
typedef unsigned short __u16;

typedef __signed__ int __s32;
typedef unsigned int __u32;


typedef __signed__ long long __s64;
typedef unsigned long long __u64;
# 40 "include/asm/types.h"
typedef signed char s8;
typedef unsigned char u8;

typedef signed short s16;
typedef unsigned short u16;

typedef signed int s32;
typedef unsigned int u32;

typedef signed long long s64;
typedef unsigned long long u64;




typedef u64 dma_addr_t;



typedef u64 dma64_addr_t;


typedef u64 sector_t;



typedef unsigned short kmem_bufctl_t;
# 15 "include/linux/types.h" 2



typedef __u32 __kernel_dev_t;

typedef __kernel_fd_set fd_set;
typedef __kernel_dev_t dev_t;
typedef __kernel_ino_t ino_t;
typedef __kernel_mode_t mode_t;
typedef __kernel_nlink_t nlink_t;
typedef __kernel_off_t off_t;
typedef __kernel_pid_t pid_t;
typedef __kernel_daddr_t daddr_t;
typedef __kernel_key_t key_t;
typedef __kernel_suseconds_t suseconds_t;
typedef __kernel_timer_t timer_t;
typedef __kernel_clockid_t clockid_t;
typedef __kernel_mqd_t mqd_t;


typedef __kernel_uid32_t uid_t;
typedef __kernel_gid32_t gid_t;
typedef __kernel_uid16_t uid16_t;
typedef __kernel_gid16_t gid16_t;



typedef __kernel_old_uid_t old_uid_t;
typedef __kernel_old_gid_t old_gid_t;
# 55 "include/linux/types.h"
typedef __kernel_loff_t loff_t;
# 64 "include/linux/types.h"
typedef __kernel_size_t size_t;




typedef __kernel_ssize_t ssize_t;




typedef __kernel_ptrdiff_t ptrdiff_t;




typedef __kernel_time_t time_t;




typedef __kernel_clock_t clock_t;




typedef __kernel_caddr_t caddr_t;



typedef unsigned char u_char;
typedef unsigned short u_short;
typedef unsigned int u_int;
typedef unsigned long u_long;


typedef unsigned char unchar;
typedef unsigned short ushort;
typedef unsigned int uint;
typedef unsigned long ulong;




typedef __u8 u_int8_t;
typedef __s8 int8_t;
typedef __u16 u_int16_t;
typedef __s16 int16_t;
typedef __u32 u_int32_t;
typedef __s32 int32_t;



typedef __u8 uint8_t;
typedef __u16 uint16_t;
typedef __u32 uint32_t;


typedef __u64 uint64_t;
typedef __u64 u_int64_t;
typedef __s64 int64_t;
# 150 "include/linux/types.h"
struct ustat {
        __kernel_daddr_t f_tfree;
        __kernel_ino_t f_tinode;
        char f_fname[6];
        char f_fpack[6];
};
# 17 "include/linux/capability.h" 2
# 1 "include/linux/compiler.h" 1
# 24 "include/linux/compiler.h"
# 1 "include/linux/compiler-gcc3.h" 1



# 1 "include/linux/compiler-gcc.h" 1
# 5 "include/linux/compiler-gcc3.h" 2
# 25 "include/linux/compiler.h" 2
# 18 "include/linux/capability.h" 2
# 32 "include/linux/capability.h"
typedef struct __user_cap_header_struct {
        __u32 version;
        int pid;
} *cap_user_header_t;

typedef struct __user_cap_data_struct {
        __u32 effective;
        __u32 permitted;
        __u32 inheritable;
} *cap_user_data_t;



# 1 "include/linux/spinlock.h" 1
# 9 "include/linux/spinlock.h"
# 1 "include/linux/preempt.h" 1
# 10 "include/linux/preempt.h"
# 1 "include/linux/linkage.h" 1




# 1 "include/asm/linkage.h" 1
# 6 "include/linux/linkage.h" 2
# 11 "include/linux/preempt.h" 2
# 26 "include/linux/preempt.h"
 __attribute__((regparm(0))) void preempt_schedule(void);
# 10 "include/linux/spinlock.h" 2


# 1 "include/linux/thread_info.h" 1
# 13 "include/linux/thread_info.h"
struct restart_block {
        long (*fn)(struct restart_block *);
        unsigned long arg0, arg1, arg2, arg3;
};

extern long do_no_restart_syscall(struct restart_block *parm);

# 1 "include/linux/bitops.h" 1



# 1 "include/asm/bitops.h" 1
# 37 "include/asm/bitops.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void set_bit(int nr, volatile unsigned long * addr)
{
        __asm__ __volatile__( "lock ; "
                "btsl %1,%0"
                :"=m" ((*(volatile long *) addr))
                :"Ir" (nr));
}
# 54 "include/asm/bitops.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void __set_bit(int nr, volatile unsigned long * addr)
{
        __asm__(
                "btsl %1,%0"
                :"=m" ((*(volatile long *) addr))
                :"Ir" (nr));
}
# 72 "include/asm/bitops.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void clear_bit(int nr, volatile unsigned long * addr)
{
        __asm__ __volatile__( "lock ; "
                "btrl %1,%0"
                :"=m" ((*(volatile long *) addr))
                :"Ir" (nr));
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void __clear_bit(int nr, volatile unsigned long * addr)
{
        __asm__ __volatile__(
                "btrl %1,%0"
                :"=m" ((*(volatile long *) addr))
                :"Ir" (nr));
}
# 99 "include/asm/bitops.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void __change_bit(int nr, volatile unsigned long * addr)
{
        __asm__ __volatile__(
                "btcl %1,%0"
                :"=m" ((*(volatile long *) addr))
                :"Ir" (nr));
}
# 116 "include/asm/bitops.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void change_bit(int nr, volatile unsigned long * addr)
{
        __asm__ __volatile__( "lock ; "
                "btcl %1,%0"
                :"=m" ((*(volatile long *) addr))
                :"Ir" (nr));
}
# 132 "include/asm/bitops.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int test_and_set_bit(int nr, volatile unsigned long * addr)
{
        int oldbit;

        __asm__ __volatile__( "lock ; "
                "btsl %2,%1\n\tsbbl %0,%0"
                :"=r" (oldbit),"=m" ((*(volatile long *) addr))
                :"Ir" (nr) : "memory");
        return oldbit;
}
# 152 "include/asm/bitops.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int __test_and_set_bit(int nr, volatile unsigned long * addr)
{
        int oldbit;

        __asm__(
                "btsl %2,%1\n\tsbbl %0,%0"
                :"=r" (oldbit),"=m" ((*(volatile long *) addr))
                :"Ir" (nr));
        return oldbit;
}
# 171 "include/asm/bitops.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int test_and_clear_bit(int nr, volatile unsigned long * addr)
{
        int oldbit;

        __asm__ __volatile__( "lock ; "
                "btrl %2,%1\n\tsbbl %0,%0"
                :"=r" (oldbit),"=m" ((*(volatile long *) addr))
                :"Ir" (nr) : "memory");
        return oldbit;
}
# 191 "include/asm/bitops.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int __test_and_clear_bit(int nr, volatile unsigned long *addr)
{
        int oldbit;

        __asm__(
                "btrl %2,%1\n\tsbbl %0,%0"
                :"=r" (oldbit),"=m" ((*(volatile long *) addr))
                :"Ir" (nr));
        return oldbit;
}


static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int __test_and_change_bit(int nr, volatile unsigned long *addr)
{
        int oldbit;

        __asm__ __volatile__(
                "btcl %2,%1\n\tsbbl %0,%0"
                :"=r" (oldbit),"=m" ((*(volatile long *) addr))
                :"Ir" (nr) : "memory");
        return oldbit;
}
# 222 "include/asm/bitops.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int test_and_change_bit(int nr, volatile unsigned long* addr)
{
        int oldbit;

        __asm__ __volatile__( "lock ; "
                "btcl %2,%1\n\tsbbl %0,%0"
                :"=r" (oldbit),"=m" ((*(volatile long *) addr))
                :"Ir" (nr) : "memory");
        return oldbit;
}
# 242 "include/asm/bitops.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int constant_test_bit(int nr, const volatile unsigned long *addr)
{
        return ((1UL << (nr & 31)) & (addr[nr >> 5])) != 0;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int variable_test_bit(int nr, const volatile unsigned long * addr)
{
        int oldbit;

        __asm__ __volatile__(
                "btl %2,%1\n\tsbbl %0,%0"
                :"=r" (oldbit)
                :"m" ((*(volatile long *) addr)),"Ir" (nr));
        return oldbit;
}
# 273 "include/asm/bitops.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int find_first_zero_bit(const unsigned long *addr, unsigned size)
{
        int d0, d1, d2;
        int res;

        if (!size)
                return 0;

        __asm__ __volatile__(
                "movl $-1,%%eax\n\t"
                "xorl %%edx,%%edx\n\t"
                "repe; scasl\n\t"
                "je 1f\n\t"
                "xorl -4(%%edi),%%eax\n\t"
                "subl $4,%%edi\n\t"
                "bsfl %%eax,%%edx\n"
                "1:\tsubl %%ebx,%%edi\n\t"
                "shll $3,%%edi\n\t"
                "addl %%edi,%%edx"
                :"=d" (res), "=&c" (d0), "=&D" (d1), "=&a" (d2)
                :"1" ((size + 31) >> 5), "2" (addr), "b" (addr) : "memory");
        return res;
}







int find_next_zero_bit(const unsigned long *addr, int size, int offset);
# 313 "include/asm/bitops.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int find_first_bit(const unsigned long *addr, unsigned size)
{
        int d0, d1;
        int res;


        __asm__ __volatile__(
                "xorl %%eax,%%eax\n\t"
                "repe; scasl\n\t"
                "jz 1f\n\t"
                "leal -4(%%edi),%%edi\n\t"
                "bsfl (%%edi),%%eax\n"
                "1:\tsubl %%ebx,%%edi\n\t"
                "shll $3,%%edi\n\t"
                "addl %%edi,%%eax"
                :"=a" (res), "=&c" (d0), "=&D" (d1)
                :"1" ((size + 31) >> 5), "2" (addr), "b" (addr) : "memory");
        return res;
}







int find_next_bit(const unsigned long *addr, int size, int offset);







static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned long ffz(unsigned long word)
{
        __asm__("bsfl %1,%0"
                :"=r" (word)
                :"r" (~word));
        return word;
}







static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned long __ffs(unsigned long word)
{
        __asm__("bsfl %1,%0"
                :"=r" (word)
                :"rm" (word));
        return word;
}
# 383 "include/asm/bitops.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int sched_find_first_bit(const unsigned long *b)
{
        if (__builtin_expect(!!(b[0]), 0))
                return __ffs(b[0]);
        if (__builtin_expect(!!(b[1]), 0))
                return __ffs(b[1]) + 32;
        if (__builtin_expect(!!(b[2]), 0))
                return __ffs(b[2]) + 64;
        if (b[3])
                return __ffs(b[3]) + 96;
        return __ffs(b[4]) + 128;
}
# 404 "include/asm/bitops.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int ffs(int x)
{
        int r;

        __asm__("bsfl %1,%0\n\t"
                "jnz 1f\n\t"
                "movl $-1,%0\n"
                "1:" : "=r" (r) : "rm" (x));
        return r+1;
}
# 5 "include/linux/bitops.h" 2







static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int generic_ffs(int x)
{
        int r = 1;

        if (!x)
                return 0;
        if (!(x & 0xffff)) {
                x >>= 16;
                r += 16;
        }
        if (!(x & 0xff)) {
                x >>= 8;
                r += 8;
        }
        if (!(x & 0xf)) {
                x >>= 4;
                r += 4;
        }
        if (!(x & 3)) {
                x >>= 2;
                r += 2;
        }
        if (!(x & 1)) {
                x >>= 1;
                r += 1;
        }
        return r;
}





extern __inline__ __attribute__((always_inline)) int generic_fls(int x)
{
        int r = 32;

        if (!x)
                return 0;
        if (!(x & 0xffff0000u)) {
                x <<= 16;
                r -= 16;
        }
        if (!(x & 0xff000000u)) {
                x <<= 8;
                r -= 8;
        }
        if (!(x & 0xf0000000u)) {
                x <<= 4;
                r -= 4;
        }
        if (!(x & 0xc0000000u)) {
                x <<= 2;
                r -= 2;
        }
        if (!(x & 0x80000000u)) {
                x <<= 1;
                r -= 1;
        }
        return r;
}

extern __inline__ __attribute__((always_inline)) int get_bitmask_order(unsigned int count)
{
        int order;

        order = generic_fls(count);
        return order;
}






static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned int generic_hweight32(unsigned int w)
{
        unsigned int res = (w & 0x55555555) + ((w >> 1) & 0x55555555);
        res = (res & 0x33333333) + ((res >> 2) & 0x33333333);
        res = (res & 0x0F0F0F0F) + ((res >> 4) & 0x0F0F0F0F);
        res = (res & 0x00FF00FF) + ((res >> 8) & 0x00FF00FF);
        return (res & 0x0000FFFF) + ((res >> 16) & 0x0000FFFF);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned int generic_hweight16(unsigned int w)
{
        unsigned int res = (w & 0x5555) + ((w >> 1) & 0x5555);
        res = (res & 0x3333) + ((res >> 2) & 0x3333);
        res = (res & 0x0F0F) + ((res >> 4) & 0x0F0F);
        return (res & 0x00FF) + ((res >> 8) & 0x00FF);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned int generic_hweight8(unsigned int w)
{
        unsigned int res = (w & 0x55) + ((w >> 1) & 0x55);
        res = (res & 0x33) + ((res >> 2) & 0x33);
        return (res & 0x0F) + ((res >> 4) & 0x0F);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned long generic_hweight64(__u64 w)
{

        return generic_hweight32((unsigned int)(w >> 32)) +
                                generic_hweight32((unsigned int)w);
# 125 "include/linux/bitops.h"
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned long hweight_long(unsigned long w)
{
        return sizeof(w) == 4 ? generic_hweight32(w) : generic_hweight64(w);
}
# 21 "include/linux/thread_info.h" 2
# 1 "include/asm/thread_info.h" 1
# 13 "include/asm/thread_info.h"
# 1 "include/asm/page.h" 1
# 43 "include/asm/page.h"
extern unsigned long long __supported_pte_mask;
extern int nx_enabled;
typedef struct { unsigned long pte_low, pte_high; } pte_t;
typedef struct { unsigned long long pmd; } pmd_t;
typedef struct { unsigned long long pgd; } pgd_t;
typedef struct { unsigned long long pgprot; } pgprot_t;
# 106 "include/asm/page.h"
static __inline__ __attribute__((always_inline)) int get_order(unsigned long size)
{
        int order;

        size = (size-1) >> (12 -1);
        order = -1;
        do {
                size >>= 1;
                order++;
        } while (size);
        return order;
}
# 14 "include/asm/thread_info.h" 2


# 1 "include/asm/processor.h" 1
# 10 "include/asm/processor.h"
# 1 "include/asm/vm86.h" 1
# 68 "include/asm/vm86.h"
struct vm86_regs {



        long ebx;
        long ecx;
        long edx;
        long esi;
        long edi;
        long ebp;
        long eax;
        long __null_ds;
        long __null_es;
        long __null_fs;
        long __null_gs;
        long orig_eax;
        long eip;
        unsigned short cs, __csh;
        long eflags;
        long esp;
        unsigned short ss, __ssh;



        unsigned short es, __esh;
        unsigned short ds, __dsh;
        unsigned short fs, __fsh;
        unsigned short gs, __gsh;
};

struct revectored_struct {
        unsigned long __map[8];
};

struct vm86_struct {
        struct vm86_regs regs;
        unsigned long flags;
        unsigned long screen_bitmap;
        unsigned long cpu_type;
        struct revectored_struct int_revectored;
        struct revectored_struct int21_revectored;
};






struct vm86plus_info_struct {
        unsigned long force_return_for_pic:1;
        unsigned long vm86dbg_active:1;
        unsigned long vm86dbg_TFpendig:1;
        unsigned long unused:28;
        unsigned long is_vm86pus:1;
        unsigned char vm86dbg_intxxtab[32];
};

struct vm86plus_struct {
        struct vm86_regs regs;
        unsigned long flags;
        unsigned long screen_bitmap;
        unsigned long cpu_type;
        struct revectored_struct int_revectored;
        struct revectored_struct int21_revectored;
        struct vm86plus_info_struct vm86plus;
};
# 145 "include/asm/vm86.h"
struct kernel_vm86_regs {



        long ebx;
        long ecx;
        long edx;
        long esi;
        long edi;
        long ebp;
        long eax;
        long __null_ds;
        long __null_es;
        long orig_eax;
        long eip;
        unsigned short cs, __csh;
        long eflags;
        long esp;
        unsigned short ss, __ssh;



        unsigned short es, __esh;
        unsigned short ds, __dsh;
        unsigned short fs, __fsh;
        unsigned short gs, __gsh;
};

struct kernel_vm86_struct {
        struct kernel_vm86_regs regs;
# 184 "include/asm/vm86.h"
        unsigned long flags;
        unsigned long screen_bitmap;
        unsigned long cpu_type;
        struct revectored_struct int_revectored;
        struct revectored_struct int21_revectored;
        struct vm86plus_info_struct vm86plus;
        struct pt_regs *regs32;
# 201 "include/asm/vm86.h"
};

void handle_vm86_fault(struct kernel_vm86_regs *, long);
int handle_vm86_trap(struct kernel_vm86_regs *, long, int);
# 11 "include/asm/processor.h" 2
# 1 "include/asm/math_emu.h" 1



# 1 "include/asm/sigcontext.h" 1
# 20 "include/asm/sigcontext.h"
struct _fpreg {
        unsigned short significand[4];
        unsigned short exponent;
};

struct _fpxreg {
        unsigned short significand[4];
        unsigned short exponent;
        unsigned short padding[3];
};

struct _xmmreg {
        unsigned long element[4];
};

struct _fpstate {

        unsigned long cw;
        unsigned long sw;
        unsigned long tag;
        unsigned long ipoff;
        unsigned long cssel;
        unsigned long dataoff;
        unsigned long datasel;
        struct _fpreg _st[8];
        unsigned short status;
        unsigned short magic;


        unsigned long _fxsr_env[6];
        unsigned long mxcsr;
        unsigned long reserved;
        struct _fpxreg _fxsr_st[8];
        struct _xmmreg _xmm[8];
        unsigned long padding[56];
};



struct sigcontext {
        unsigned short gs, __gsh;
        unsigned short fs, __fsh;
        unsigned short es, __esh;
        unsigned short ds, __dsh;
        unsigned long edi;
        unsigned long esi;
        unsigned long ebp;
        unsigned long esp;
        unsigned long ebx;
        unsigned long edx;
        unsigned long ecx;
        unsigned long eax;
        unsigned long trapno;
        unsigned long err;
        unsigned long eip;
        unsigned short cs, __csh;
        unsigned long eflags;
        unsigned long esp_at_signal;
        unsigned short ss, __ssh;
        struct _fpstate * fpstate;
        unsigned long oldmask;
        unsigned long cr2;
};
# 5 "include/asm/math_emu.h" 2

int restore_i387_soft(void *s387, struct _fpstate *buf);
int save_i387_soft(void *s387, struct _fpstate *buf);





struct info {
        long ___orig_eip;
        long ___ebx;
        long ___ecx;
        long ___edx;
        long ___esi;
        long ___edi;
        long ___ebp;
        long ___eax;
        long ___ds;
        long ___es;
        long ___orig_eax;
        long ___eip;
        long ___cs;
        long ___eflags;
        long ___esp;
        long ___ss;
        long ___vm86_es;
        long ___vm86_ds;
        long ___vm86_fs;
        long ___vm86_gs;
};
# 12 "include/asm/processor.h" 2
# 1 "include/asm/segment.h" 1
# 13 "include/asm/processor.h" 2



# 1 "include/asm/cpufeature.h" 1
# 17 "include/asm/processor.h" 2
# 1 "include/asm/msr.h" 1
# 27 "include/asm/msr.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void wrmsrl (unsigned long msr, unsigned long long val)
{
        unsigned long lo, hi;
        lo = (unsigned long) val;
        hi = val >> 32;
        __asm__ __volatile__("wrmsr" : : "c" (msr), "a" (lo), "d" (hi));
}
# 18 "include/asm/processor.h" 2
# 1 "include/asm/system.h" 1




# 1 "include/linux/kernel.h" 1
# 10 "include/linux/kernel.h"
# 1 "/usr/lib/gcc-lib/i486-slackware-linux/3.3.4/include/stdarg.h" 1 3 4
# 43 "/usr/lib/gcc-lib/i486-slackware-linux/3.3.4/include/stdarg.h" 3 4
typedef __builtin_va_list __gnuc_va_list;
# 105 "/usr/lib/gcc-lib/i486-slackware-linux/3.3.4/include/stdarg.h" 3 4
typedef __gnuc_va_list va_list;
# 11 "include/linux/kernel.h" 2




# 1 "include/asm/byteorder.h" 1
# 14 "include/asm/byteorder.h"
static __inline__ __attribute__((always_inline)) __attribute__((__const__)) __u32 ___arch__swab32(__u32 x)
{

        __asm__("bswap %0" : "=r" (x) : "0" (x));







        return x;
}

static __inline__ __attribute__((always_inline)) __attribute__((__const__)) __u64 ___arch__swab64(__u64 val)
{
        union {
                struct { __u32 a,b; } s;
                __u64 u;
        } v;
        v.u = val;

        asm("bswapl %0 ; bswapl %1 ; xchgl %0,%1"
            : "=r" (v.s.a), "=r" (v.s.b)
            : "0" (v.s.a), "1" (v.s.b));





        return v.u;
}
# 57 "include/asm/byteorder.h"
# 1 "include/linux/byteorder/little_endian.h" 1
# 11 "include/linux/byteorder/little_endian.h"
# 1 "include/linux/byteorder/swab.h" 1
# 133 "include/linux/byteorder/swab.h"
static __inline__ __attribute__((always_inline)) __attribute__((__const__)) __u16 __fswab16(__u16 x)
{
        return ({ __u16 __tmp = (x) ; ({ __u16 __x = (__tmp); ((__u16)( (((__u16)(__x) & (__u16)0x00ffU) << 8) | (((__u16)(__x) & (__u16)0xff00U) >> 8) )); }); });
}
static __inline__ __attribute__((always_inline)) __u16 __swab16p(const __u16 *x)
{
        return ({ __u16 __tmp = (*(x)) ; ({ __u16 __x = (__tmp); ((__u16)( (((__u16)(__x) & (__u16)0x00ffU) << 8) | (((__u16)(__x) & (__u16)0xff00U) >> 8) )); }); });
}
static __inline__ __attribute__((always_inline)) void __swab16s(__u16 *addr)
{
        do { *(addr) = ({ __u16 __tmp = (*((addr))) ; ({ __u16 __x = (__tmp); ((__u16)( (((__u16)(__x) & (__u16)0x00ffU) << 8) | (((__u16)(__x) & (__u16)0xff00U) >> 8) )); }); }); } while (0);
}

static __inline__ __attribute__((always_inline)) __attribute__((__const__)) __u32 __fswab32(__u32 x)
{
        return ___arch__swab32(x);
}
static __inline__ __attribute__((always_inline)) __u32 __swab32p(const __u32 *x)
{
        return ___arch__swab32(*(x));
}
static __inline__ __attribute__((always_inline)) void __swab32s(__u32 *addr)
{
        do { *(addr) = ___arch__swab32(*((addr))); } while (0);
}


static __inline__ __attribute__((always_inline)) __attribute__((__const__)) __u64 __fswab64(__u64 x)
{





        return ___arch__swab64(x);

}
static __inline__ __attribute__((always_inline)) __u64 __swab64p(const __u64 *x)
{
        return ___arch__swab64(*(x));
}
static __inline__ __attribute__((always_inline)) void __swab64s(__u64 *addr)
{
        do { *(addr) = ___arch__swab64(*((addr))); } while (0);
}
# 12 "include/linux/byteorder/little_endian.h" 2
# 66 "include/linux/byteorder/little_endian.h"
# 1 "include/linux/byteorder/generic.h" 1
# 150 "include/linux/byteorder/generic.h"
extern __u32 ntohl(__u32);
extern __u32 htonl(__u32);
extern unsigned short int ntohs(unsigned short int);
extern unsigned short int htons(unsigned short int);
# 67 "include/linux/byteorder/little_endian.h" 2
# 58 "include/asm/byteorder.h" 2
# 16 "include/linux/kernel.h" 2
# 1 "include/asm/bug.h" 1
# 17 "include/linux/kernel.h" 2
# 39 "include/linux/kernel.h"
extern int console_printk[];






struct completion;


void __might_sleep(char *file, int line);
# 67 "include/linux/kernel.h"
extern struct notifier_block *panic_notifier_list;
 void panic(const char * fmt, ...)
        __attribute__ ((noreturn, format (printf, 1, 2)));
 __attribute__((regparm(0))) void do_exit(long error_code)
        __attribute__((noreturn));
 void complete_and_exit(struct completion *, long)
        __attribute__((noreturn));
extern unsigned long simple_strtoul(const char *,char **,unsigned int);
extern long simple_strtol(const char *,char **,unsigned int);
extern unsigned long long simple_strtoull(const char *,char **,unsigned int);
extern long long simple_strtoll(const char *,char **,unsigned int);
extern int sprintf(char * buf, const char * fmt, ...)
        __attribute__ ((format (printf, 2, 3)));
extern int vsprintf(char *buf, const char *, va_list);
extern int snprintf(char * buf, size_t size, const char * fmt, ...)
        __attribute__ ((format (printf, 3, 4)));
extern int vsnprintf(char *buf, size_t size, const char *fmt, va_list args);
extern int scnprintf(char * buf, size_t size, const char * fmt, ...)
        __attribute__ ((format (printf, 3, 4)));
extern int vscnprintf(char *buf, size_t size, const char *fmt, va_list args);

extern int sscanf(const char *, const char *, ...)
        __attribute__ ((format (scanf,2,3)));
extern int vsscanf(const char *, const char *, va_list);

extern int get_option(char **str, int *pint);
extern char *get_options(const char *str, int nints, int *ints);
extern unsigned long long memparse(char *ptr, char **retptr);

extern int __kernel_text_address(unsigned long addr);
extern int kernel_text_address(unsigned long addr);
extern int session_of_pgrp(int pgrp);

 __attribute__((regparm(0))) int printk(const char * fmt, ...)
        __attribute__ ((format (printf, 1, 2)));

unsigned long int_sqrt(unsigned long);

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int __attribute__((pure)) long_log2(unsigned long x)
{
        int r = 0;
        for (x >>= 1; x > 0; x >>= 1)
                r++;
        return r;
}


extern int printk_ratelimit(void);
extern int __printk_ratelimit(int ratelimit_jiffies, int ratelimit_burst);

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void console_silent(void)
{
        (console_printk[0]) = 0;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void console_verbose(void)
{
        if ((console_printk[0]))
                (console_printk[0]) = 15;
}

extern void bust_spinlocks(int yes);
extern int oops_in_progress;
extern int panic_on_oops;
extern int tainted;
extern const char *print_tainted(void);


extern enum system_states {
        SYSTEM_BOOTING,
        SYSTEM_RUNNING,
        SYSTEM_HALT,
        SYSTEM_POWER_OFF,
        SYSTEM_RESTART,
} system_state;






extern void dump_stack(void);
# 248 "include/linux/kernel.h"
struct sysinfo {
        long uptime;
        unsigned long loads[3];
        unsigned long totalram;
        unsigned long freeram;
        unsigned long sharedram;
        unsigned long bufferram;
        unsigned long totalswap;
        unsigned long freeswap;
        unsigned short procs;
        unsigned short pad;
        unsigned long totalhigh;
        unsigned long freehigh;
        unsigned int mem_unit;
        char _f[20-2*sizeof(long)-sizeof(int)];
};

extern void BUILD_BUG(void);
# 6 "include/asm/system.h" 2






struct task_struct;
extern struct task_struct * __switch_to(struct task_struct *prev, struct task_struct *next) __attribute__((regparm(3)));
# 61 "include/asm/system.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned long _get_base(char * addr)
{
        unsigned long __base;
        __asm__("movb %3,%%dh\n\t"
                "movb %2,%%dl\n\t"
                "shll $16,%%edx\n\t"
                "movw %1,%%dx"
                :"=&d" (__base)
                :"m" (*((addr)+2)),
                 "m" (*((addr)+4)),
                 "m" (*((addr)+7)));
        return __base;
}
# 134 "include/asm/system.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned long get_limit(unsigned long segment)
{
        unsigned long __limit;
        __asm__("lsll %1,%0"
                :"=r" (__limit):"r" (segment));
        return __limit+1;
}







struct __xchg_dummy { unsigned long a[100]; };
# 166 "include/asm/system.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void __set_64bit (unsigned long long * ptr,
                unsigned int low, unsigned int high)
{
        __asm__ __volatile__ (
                "\n1:\t"
                "movl (%0), %%eax\n\t"
                "movl 4(%0), %%edx\n\t"
                "lock cmpxchg8b (%0)\n\t"
                "jnz 1b"
                :
                : "D"(ptr),
                        "b"(low),
                        "c"(high)
                : "ax","dx","memory");
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void __set_64bit_constant (unsigned long long *ptr,
                                                 unsigned long long value)
{
        __set_64bit(ptr,(unsigned int)(value), (unsigned int)((value)>>32ULL));
}



static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void __set_64bit_var (unsigned long long *ptr,
                         unsigned long long value)
{
        __set_64bit(ptr,*(((unsigned int*)&(value))+0), *(((unsigned int*)&(value))+1));
}
# 211 "include/asm/system.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned long __xchg(unsigned long x, volatile void * ptr, int size)
{
        switch (size) {
                case 1:
                        __asm__ __volatile__("xchgb %b0,%1"
                                :"=q" (x)
                                :"m" (*((struct __xchg_dummy *)(ptr))), "0" (x)
                                :"memory");
                        break;
                case 2:
                        __asm__ __volatile__("xchgw %w0,%1"
                                :"=r" (x)
                                :"m" (*((struct __xchg_dummy *)(ptr))), "0" (x)
                                :"memory");
                        break;
                case 4:
                        __asm__ __volatile__("xchgl %0,%1"
                                :"=r" (x)
                                :"m" (*((struct __xchg_dummy *)(ptr))), "0" (x)
                                :"memory");
                        break;
        }
        return x;
}
# 246 "include/asm/system.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned long __cmpxchg(volatile void *ptr, unsigned long old,
                                      unsigned long new, int size)
{
        unsigned long prev;
        switch (size) {
        case 1:
                __asm__ __volatile__("lock ; " "cmpxchgb %b1,%2"
                                     : "=a"(prev)
                                     : "q"(new), "m"(*((struct __xchg_dummy *)(ptr))), "0"(old)
                                     : "memory");
                return prev;
        case 2:
                __asm__ __volatile__("lock ; " "cmpxchgw %w1,%2"
                                     : "=a"(prev)
                                     : "q"(new), "m"(*((struct __xchg_dummy *)(ptr))), "0"(old)
                                     : "memory");
                return prev;
        case 4:
                __asm__ __volatile__("lock ; " "cmpxchgl %1,%2"
                                     : "=a"(prev)
                                     : "q"(new), "m"(*((struct __xchg_dummy *)(ptr))), "0"(old)
                                     : "memory");
                return prev;
        }
        return old;
}






struct alt_instr {
        __u8 *instr;
        __u8 *replacement;
        __u8 cpuid;
        __u8 instrlen;
        __u8 replacementlen;
        __u8 pad;
};
# 465 "include/asm/system.h"
void disable_hlt(void);
void enable_hlt(void);

extern int es7000_plat;
# 19 "include/asm/processor.h" 2
# 1 "include/linux/cache.h" 1





# 1 "include/asm/cache.h" 1
# 7 "include/linux/cache.h" 2
# 20 "include/asm/processor.h" 2

# 1 "include/linux/threads.h" 1
# 22 "include/asm/processor.h" 2


extern int tsc_disable;

struct desc_struct {
        unsigned long a,b;
};
# 47 "include/asm/processor.h"
struct cpuinfo_x86 {
        __u8 x86;
        __u8 x86_vendor;
        __u8 x86_model;
        __u8 x86_mask;
        char wp_works_ok;
        char hlt_works_ok;
        char hard_math;
        char rfu;
        int cpuid_level;
        unsigned long x86_capability[6];
        char x86_vendor_id[16];
        char x86_model_id[64];
        int x86_cache_size;

        int x86_cache_alignment;
        int fdiv_bug;
        int f00f_bug;
        int coma_bug;
        unsigned long loops_per_jiffy;
} __attribute__((__aligned__((1 << (7)))));
# 85 "include/asm/processor.h"
extern struct cpuinfo_x86 boot_cpu_data;
extern struct cpuinfo_x86 new_cpu_data;
extern struct tss_struct init_tss[8];
extern struct tss_struct doublefault_tss;


extern struct cpuinfo_x86 cpu_data[];






extern char ignore_fpu_irq;

extern void identify_cpu(struct cpuinfo_x86 *);
extern void print_cpu_info(struct cpuinfo_x86 *);
extern void dodgy_tsc(void);
# 128 "include/asm/processor.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void cpuid(int op, int *eax, int *ebx, int *ecx, int *edx)
{
        __asm__("cpuid"
                : "=a" (*eax),
                  "=b" (*ebx),
                  "=c" (*ecx),
                  "=d" (*edx)
                : "0" (op));
}




static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned int cpuid_eax(unsigned int op)
{
        unsigned int eax;

        __asm__("cpuid"
                : "=a" (eax)
                : "0" (op)
                : "bx", "cx", "dx");
        return eax;
}
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned int cpuid_ebx(unsigned int op)
{
        unsigned int eax, ebx;

        __asm__("cpuid"
                : "=a" (eax), "=b" (ebx)
                : "0" (op)
                : "cx", "dx" );
        return ebx;
}
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned int cpuid_ecx(unsigned int op)
{
        unsigned int eax, ecx;

        __asm__("cpuid"
                : "=a" (eax), "=c" (ecx)
                : "0" (op)
                : "bx", "dx" );
        return ecx;
}
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned int cpuid_edx(unsigned int op)
{
        unsigned int eax, edx;

        __asm__("cpuid"
                : "=a" (eax), "=d" (edx)
                : "0" (op)
                : "bx", "cx");
        return edx;
}
# 207 "include/asm/processor.h"
extern unsigned long mmu_cr4_features;

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void set_in_cr4 (unsigned long mask)
{
        mmu_cr4_features |= mask;
        __asm__("movl %%cr4,%%eax\n\t"
                "orl %0,%%eax\n\t"
                "movl %%eax,%%cr4\n"
                : : "irg" (mask)
                :"ax");
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void clear_in_cr4 (unsigned long mask)
{
        mmu_cr4_features &= ~mask;
        __asm__("movl %%cr4,%%eax\n\t"
                "andl %0,%%eax\n\t"
                "movl %%eax,%%cr4\n"
                : : "irg" (~mask)
                :"ax");
}
# 263 "include/asm/processor.h"
extern int MCA_bus;

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void __monitor(const void *eax, unsigned long ecx,
                unsigned long edx)
{

        asm volatile(
                ".byte 0x0f,0x01,0xc8;"
                : :"a" (eax), "c" (ecx), "d"(edx));
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void __mwait(unsigned long eax, unsigned long ecx)
{

        asm volatile(
                ".byte 0x0f,0x01,0xc9;"
                : :"a" (eax), "c" (ecx));
}



extern unsigned int machine_id;
extern unsigned int machine_submodel_id;
extern unsigned int BIOS_revision;
extern unsigned int mca_pentium_flag;
# 308 "include/asm/processor.h"
struct i387_fsave_struct {
        long cwd;
        long swd;
        long twd;
        long fip;
        long fcs;
        long foo;
        long fos;
        long st_space[20];
        long status;
};

struct i387_fxsave_struct {
        unsigned short cwd;
        unsigned short swd;
        unsigned short twd;
        unsigned short fop;
        long fip;
        long fcs;
        long foo;
        long fos;
        long mxcsr;
        long mxcsr_mask;
        long st_space[32];
        long xmm_space[32];
        long padding[56];
} __attribute__ ((aligned (16)));

struct i387_soft_struct {
        long cwd;
        long swd;
        long twd;
        long fip;
        long fcs;
        long foo;
        long fos;
        long st_space[20];
        unsigned char ftop, changed, lookahead, no_update, rm, alimit;
        struct info *info;
        unsigned long entry_eip;
};

union i387_union {
        struct i387_fsave_struct fsave;
        struct i387_fxsave_struct fxsave;
        struct i387_soft_struct soft;
};

typedef struct {
        unsigned long seg;
} mm_segment_t;

struct tss_struct {
        unsigned short back_link,__blh;
        unsigned long esp0;
        unsigned short ss0,__ss0h;
        unsigned long esp1;
        unsigned short ss1,__ss1h;
        unsigned long esp2;
        unsigned short ss2,__ss2h;
        unsigned long __cr3;
        unsigned long eip;
        unsigned long eflags;
        unsigned long eax,ecx,edx,ebx;
        unsigned long esp;
        unsigned long ebp;
        unsigned long esi;
        unsigned long edi;
        unsigned short es, __esh;
        unsigned short cs, __csh;
        unsigned short ss, __ssh;
        unsigned short ds, __dsh;
        unsigned short fs, __fsh;
        unsigned short gs, __gsh;
        unsigned short ldt, __ldth;
        unsigned short trace, io_bitmap_base;






        unsigned long io_bitmap[((65536/8)/sizeof(long)) + 1];



        unsigned long __cacheline_filler[37];



        unsigned long stack[64];
} __attribute__((packed));



struct thread_struct {

        struct desc_struct tls_array[3];
        unsigned long esp0;
        unsigned long sysenter_cs;
        unsigned long eip;
        unsigned long esp;
        unsigned long fs;
        unsigned long gs;

        unsigned long debugreg[8];

        unsigned long cr2, trap_no, error_code;

        union i387_union i387;

        struct vm86_struct * vm86_info;
        unsigned long screen_bitmap;
        unsigned long v86flags, v86mask, saved_esp0;
        unsigned int saved_fs, saved_gs;

        unsigned long *io_bitmap_ptr;
};
# 449 "include/asm/processor.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void load_esp0(struct tss_struct *tss, struct thread_struct *thread)
{
        tss->esp0 = thread->esp0;

        if (__builtin_expect(!!(tss->ss1 != thread->sysenter_cs), 0)) {
                tss->ss1 = thread->sysenter_cs;
                __asm__ __volatile__("wrmsr" : : "c" (0x174), "a" (thread->sysenter_cs), "d" (0));
        }
}
# 471 "include/asm/processor.h"
struct task_struct;
struct mm_struct;


extern void release_thread(struct task_struct *);


extern void prepare_to_copy(struct task_struct *tsk);




extern int kernel_thread(int (*fn)(void *), void * arg, unsigned long flags);

extern unsigned long thread_saved_pc(struct task_struct *tsk);
void show_trace(struct task_struct *task, unsigned long *stack);

unsigned long get_wchan(struct task_struct *p);
# 508 "include/asm/processor.h"
struct microcode_header {
        unsigned int hdrver;
        unsigned int rev;
        unsigned int date;
        unsigned int sig;
        unsigned int cksum;
        unsigned int ldrver;
        unsigned int pf;
        unsigned int datasize;
        unsigned int totalsize;
        unsigned int reserved[3];
};

struct microcode {
        struct microcode_header hdr;
        unsigned int bits[0];
};

typedef struct microcode microcode_t;
typedef struct microcode_header microcode_header_t;


struct extended_signature {
        unsigned int sig;
        unsigned int pf;
        unsigned int cksum;
};

struct extended_sigtable {
        unsigned int count;
        unsigned int cksum;
        unsigned int reserved[3];
        struct extended_signature sigs[0];
};




static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void rep_nop(void)
{
        __asm__ __volatile__("rep;nop": : :"memory");
}
# 621 "include/asm/processor.h"
extern __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void prefetch(const void *x)
{
        asm volatile ("661:\n\t" ".byte 0x8d,0x74,0x26,0x00\n" "\n662:\n" ".section .altinstructions,\"a\"\n" "  .align 4\n" "  .long 661b\n" "  .long 663f\n" "  .byte %c0\n" "  .byte 662b-661b\n" "  .byte 664f-663f\n" ".previous\n" ".section .altinstr_replacement,\"ax\"\n" "663:\n\t" "prefetchnta (%1)" "\n664:\n" ".previous" :: "i" ((0*32+25)), "r" (x));



}







extern __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void prefetchw(const void *x)
{
        asm volatile ("661:\n\t" ".byte 0x8d,0x74,0x26,0x00\n" "\n662:\n" ".section .altinstructions,\"a\"\n" "  .align 4\n" "  .long 661b\n" "  .long 663f\n" "  .byte %c0\n" "  .byte 662b-661b\n" "  .byte 664f-663f\n" ".previous\n" ".section .altinstr_replacement,\"ax\"\n" "663:\n\t" "prefetchw (%1)" "\n664:\n" ".previous" :: "i" ((1*32+31)), "r" (x));



}


extern void select_idle_routine(const struct cpuinfo_x86 *c);
# 17 "include/asm/thread_info.h" 2
# 27 "include/asm/thread_info.h"
struct thread_info {
        struct task_struct *task;
        struct exec_domain *exec_domain;
        unsigned long flags;
        unsigned long status;
        __u32 cpu;
        __s32 preempt_count;


        mm_segment_t addr_limit;



        struct restart_block restart_block;

        unsigned long previous_esp;


        __u8 supervisor_stack[0];
};
# 87 "include/asm/thread_info.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct thread_info *current_thread_info(void)
{
        struct thread_info *ti;
        __asm__("andl %%esp,%0; ":"=r" (ti) : "0" (~((4096) - 1)));
        return ti;
}


static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned long current_stack_pointer(void)
{
        unsigned long ti;
        __asm__("movl %%esp,%0; ":"=r" (ti) : );
        return ti;
}
# 22 "include/linux/thread_info.h" 2
# 30 "include/linux/thread_info.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void set_thread_flag(int flag)
{
        set_bit(flag,&current_thread_info()->flags);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void clear_thread_flag(int flag)
{
        clear_bit(flag,&current_thread_info()->flags);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int test_and_set_thread_flag(int flag)
{
        return test_and_set_bit(flag,&current_thread_info()->flags);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int test_and_clear_thread_flag(int flag)
{
        return test_and_clear_bit(flag,&current_thread_info()->flags);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int test_thread_flag(int flag)
{
        return (__builtin_constant_p(flag) ? constant_test_bit((flag),(&current_thread_info()->flags)) : variable_test_bit((flag),(&current_thread_info()->flags)));
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void set_ti_thread_flag(struct thread_info *ti, int flag)
{
        set_bit(flag,&ti->flags);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void clear_ti_thread_flag(struct thread_info *ti, int flag)
{
        clear_bit(flag,&ti->flags);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int test_and_set_ti_thread_flag(struct thread_info *ti, int flag)
{
        return test_and_set_bit(flag,&ti->flags);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int test_and_clear_ti_thread_flag(struct thread_info *ti, int flag)
{
        return test_and_clear_bit(flag,&ti->flags);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int test_ti_thread_flag(struct thread_info *ti, int flag)
{
        return (__builtin_constant_p(flag) ? constant_test_bit((flag),(&ti->flags)) : variable_test_bit((flag),(&ti->flags)));
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void set_need_resched(void)
{
        set_thread_flag(3);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void clear_need_resched(void)
{
        clear_thread_flag(3);
}
# 13 "include/linux/spinlock.h" 2

# 1 "include/linux/stringify.h" 1
# 15 "include/linux/spinlock.h" 2
# 39 "include/linux/spinlock.h"
# 1 "include/asm/spinlock.h" 1



# 1 "include/asm/atomic.h" 1
# 22 "include/asm/atomic.h"
typedef struct { volatile int counter; } atomic_t;
# 50 "include/asm/atomic.h"
static __inline__ __attribute__((always_inline)) void atomic_add(int i, atomic_t *v)
{
        __asm__ __volatile__(
                "lock ; " "addl %1,%0"
                :"=m" (v->counter)
                :"ir" (i), "m" (v->counter));
}
# 65 "include/asm/atomic.h"
static __inline__ __attribute__((always_inline)) void atomic_sub(int i, atomic_t *v)
{
        __asm__ __volatile__(
                "lock ; " "subl %1,%0"
                :"=m" (v->counter)
                :"ir" (i), "m" (v->counter));
}
# 82 "include/asm/atomic.h"
static __inline__ __attribute__((always_inline)) int atomic_sub_and_test(int i, atomic_t *v)
{
        unsigned char c;

        __asm__ __volatile__(
                "lock ; " "subl %2,%0; sete %1"
                :"=m" (v->counter), "=qm" (c)
                :"ir" (i), "m" (v->counter) : "memory");
        return c;
}







static __inline__ __attribute__((always_inline)) void atomic_inc(atomic_t *v)
{
        __asm__ __volatile__(
                "lock ; " "incl %0"
                :"=m" (v->counter)
                :"m" (v->counter));
}







static __inline__ __attribute__((always_inline)) void atomic_dec(atomic_t *v)
{
        __asm__ __volatile__(
                "lock ; " "decl %0"
                :"=m" (v->counter)
                :"m" (v->counter));
}
# 129 "include/asm/atomic.h"
static __inline__ __attribute__((always_inline)) int atomic_dec_and_test(atomic_t *v)
{
        unsigned char c;

        __asm__ __volatile__(
                "lock ; " "decl %0; sete %1"
                :"=m" (v->counter), "=qm" (c)
                :"m" (v->counter) : "memory");
        return c != 0;
}
# 148 "include/asm/atomic.h"
static __inline__ __attribute__((always_inline)) int atomic_inc_and_test(atomic_t *v)
{
        unsigned char c;

        __asm__ __volatile__(
                "lock ; " "incl %0; sete %1"
                :"=m" (v->counter), "=qm" (c)
                :"m" (v->counter) : "memory");
        return c != 0;
}
# 168 "include/asm/atomic.h"
static __inline__ __attribute__((always_inline)) int atomic_add_negative(int i, atomic_t *v)
{
        unsigned char c;

        __asm__ __volatile__(
                "lock ; " "addl %2,%0; sets %1"
                :"=m" (v->counter), "=qm" (c)
                :"ir" (i), "m" (v->counter) : "memory");
        return c;
}
# 5 "include/asm/spinlock.h" 2
# 1 "include/asm/rwlock.h" 1
# 6 "include/asm/spinlock.h" 2




 __attribute__((regparm(0))) int printk(const char * fmt, ...)
        __attribute__ ((format (printf, 1, 2)));





typedef struct {
        volatile unsigned int lock;

        unsigned magic;

} spinlock_t;
# 88 "include/asm/spinlock.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void _raw_spin_unlock(spinlock_t *lock)
{

        do { if (__builtin_expect(!!((lock->magic != 0xdead4ead)!=0), 0)) __asm__ __volatile__( "ud2\n" "\t.word %c0\n" "\t.long %c1\n" : : "i" (91), "i" ("include/asm/spinlock.h")); } while(0);
        do { if (__builtin_expect(!!((!(*(volatile signed char *)(&(lock)->lock) <= 0))!=0), 0)) __asm__ __volatile__( "ud2\n" "\t.word %c0\n" "\t.long %c1\n" : : "i" (92), "i" ("include/asm/spinlock.h")); } while(0);

        __asm__ __volatile__(
                "movb $1,%0" :"=m" (lock->lock) : : "memory"
        );
}
# 120 "include/asm/spinlock.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int _raw_spin_trylock(spinlock_t *lock)
{
        char oldval;
        __asm__ __volatile__(
                "xchgb %b0,%1"
                :"=q" (oldval), "=m" (lock->lock)
                :"0" (0) : "memory");
        return oldval > 0;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void _raw_spin_lock(spinlock_t *lock)
{

        __label__ here;
here:
        if (__builtin_expect(!!(lock->magic != 0xdead4ead), 0)) {
                printk("eip: %p\n", &&here);
                __asm__ __volatile__( "ud2\n" "\t.word %c0\n" "\t.long %c1\n" : : "i" (137), "i" ("include/asm/spinlock.h"));
        }

        __asm__ __volatile__(
                "\n1:\t" "lock ; decb %0\n\t" "js 2f\n" ".subsection 1\n\t" "" ".ifndef " ".text.lock." "filemap" "\n\t" ".text.lock." "filemap" ":\n\t" ".endif\n\t" "2:\t" "rep;nop\n\t" "cmpb $0,%0\n\t" "jle 2b\n\t" "jmp 1b\n" ".previous\n\t"
                :"=m" (lock->lock) : : "memory");
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void _raw_spin_lock_flags (spinlock_t *lock, unsigned long flags)
{

        __label__ here;
here:
        if (__builtin_expect(!!(lock->magic != 0xdead4ead), 0)) {
                printk("eip: %p\n", &&here);
                __asm__ __volatile__( "ud2\n" "\t.word %c0\n" "\t.long %c1\n" : : "i" (152), "i" ("include/asm/spinlock.h"));
        }

        __asm__ __volatile__(
                "\n1:\t" "lock ; decb %0\n\t" "js 2f\n\t" ".subsection 1\n\t" "" ".ifndef " ".text.lock." "filemap" "\n\t" ".text.lock." "filemap" ":\n\t" ".endif\n\t" "2:\t" "testl $0x200, %1\n\t" "jz 3f\n\t" "sti\n\t" "3:\t" "rep;nop\n\t" "cmpb $0, %0\n\t" "jle 3b\n\t" "cli\n\t" "jmp 1b\n" ".previous\n\t"
                :"=m" (lock->lock) : "r" (flags) : "memory");
}
# 170 "include/asm/spinlock.h"
typedef struct {
        volatile unsigned int lock;

        unsigned magic;

} rwlock_t;
# 202 "include/asm/spinlock.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void _raw_read_lock(rwlock_t *rw)
{

        do { if (__builtin_expect(!!((rw->magic != 0xdeaf1eed)!=0), 0)) __asm__ __volatile__( "ud2\n" "\t.word %c0\n" "\t.long %c1\n" : : "i" (205), "i" ("include/asm/spinlock.h")); } while(0);

        do { if (__builtin_constant_p(rw)) asm volatile("lock ; " "subl $1,%0\n\t" "js 2f\n" "1:\n" ".subsection 1\n\t" "" ".ifndef " ".text.lock." "filemap" "\n\t" ".text.lock." "filemap" ":\n\t" ".endif\n\t" "2:\tpushl %%eax\n\t" "leal %0,%%eax\n\t" "call " "__read_lock_failed" "\n\t" "popl %%eax\n\t" "jmp 1b\n" ".previous\n\t" :"=m" (*(volatile int *)rw) : : "memory"); else asm volatile("lock ; " "subl $1,(%0)\n\t" "js 2f\n" "1:\n" ".subsection 1\n\t" "" ".ifndef " ".text.lock." "filemap" "\n\t" ".text.lock." "filemap" ":\n\t" ".endif\n\t" "2:\tcall " "__read_lock_failed" "\n\t" "jmp 1b\n" ".previous\n\t" ::"a" (rw) : "memory"); } while (0);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void _raw_write_lock(rwlock_t *rw)
{

        do { if (__builtin_expect(!!((rw->magic != 0xdeaf1eed)!=0), 0)) __asm__ __volatile__( "ud2\n" "\t.word %c0\n" "\t.long %c1\n" : : "i" (213), "i" ("include/asm/spinlock.h")); } while(0);

        do { if (__builtin_constant_p(rw)) asm volatile("lock ; " "subl $" "0x01000000" ",%0\n\t" "jnz 2f\n" "1:\n" ".subsection 1\n\t" "" ".ifndef " ".text.lock." "filemap" "\n\t" ".text.lock." "filemap" ":\n\t" ".endif\n\t" "2:\tpushl %%eax\n\t" "leal %0,%%eax\n\t" "call " "__write_lock_failed" "\n\t" "popl %%eax\n\t" "jmp 1b\n" ".previous\n\t" :"=m" (*(volatile int *)rw) : : "memory"); else asm volatile("lock ; " "subl $" "0x01000000" ",(%0)\n\t" "jnz 2f\n" "1:\n" ".subsection 1\n\t" "" ".ifndef " ".text.lock." "filemap" "\n\t" ".text.lock." "filemap" ":\n\t" ".endif\n\t" "2:\tcall " "__write_lock_failed" "\n\t" "jmp 1b\n" ".previous\n\t" ::"a" (rw) : "memory"); } while (0);
}




static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int _raw_write_trylock(rwlock_t *lock)
{
        atomic_t *count = (atomic_t *)lock;
        if (atomic_sub_and_test(0x01000000, count))
                return 1;
        atomic_add(0x01000000, count);
        return 0;
}
# 40 "include/linux/spinlock.h" 2
# 203 "include/linux/spinlock.h"
void __preempt_spin_lock(spinlock_t *lock);
void __preempt_write_lock(rwlock_t *lock);
# 397 "include/linux/spinlock.h"
extern int atomic_dec_and_lock(atomic_t *atomic, spinlock_t *lock);
# 406 "include/linux/spinlock.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void bit_spin_lock(int bitnum, unsigned long *addr)
{







        do { do { (current_thread_info()->preempt_count)++; } while (0); __asm__ __volatile__("": : :"memory"); } while (0);

        while (test_and_set_bit(bitnum, addr)) {
                while ((__builtin_constant_p(bitnum) ? constant_test_bit((bitnum),(addr)) : variable_test_bit((bitnum),(addr))))
                        rep_nop();
        }

}




static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int bit_spin_trylock(int bitnum, unsigned long *addr)
{

        int ret;

        do { do { (current_thread_info()->preempt_count)++; } while (0); __asm__ __volatile__("": : :"memory"); } while (0);
        ret = !test_and_set_bit(bitnum, addr);
        if (!ret)
                do { do { __asm__ __volatile__("": : :"memory"); do { (current_thread_info()->preempt_count)--; } while (0); } while (0); do { if (__builtin_expect(!!(test_thread_flag(3)), 0)) preempt_schedule(); } while (0); } while (0);
        return ret;




}




static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void bit_spin_unlock(int bitnum, unsigned long *addr)
{

        do { if (__builtin_expect(!!((!(__builtin_constant_p(bitnum) ? constant_test_bit((bitnum),(addr)) : variable_test_bit((bitnum),(addr))))!=0), 0)) __asm__ __volatile__( "ud2\n" "\t.word %c0\n" "\t.long %c1\n" : : "i" (449), "i" ("include/linux/spinlock.h")); } while(0);
        __asm__ __volatile__("": : :"memory");
        clear_bit(bitnum, addr);

        do { do { __asm__ __volatile__("": : :"memory"); do { (current_thread_info()->preempt_count)--; } while (0); } while (0); do { if (__builtin_expect(!!(test_thread_flag(3)), 0)) preempt_schedule(); } while (0); } while (0);
}




static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int bit_spin_is_locked(int bitnum, unsigned long *addr)
{

        return (__builtin_constant_p(bitnum) ? constant_test_bit((bitnum),(addr)) : variable_test_bit((bitnum),(addr)));





}
# 46 "include/linux/capability.h" 2

extern spinlock_t task_capability_lock;
# 59 "include/linux/capability.h"
typedef __u32 kernel_cap_t;
# 291 "include/linux/capability.h"
extern kernel_cap_t cap_bset;
# 319 "include/linux/capability.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) kernel_cap_t cap_combine(kernel_cap_t a, kernel_cap_t b)
{
     kernel_cap_t dest;
     (dest) = (a) | (b);
     return dest;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) kernel_cap_t cap_intersect(kernel_cap_t a, kernel_cap_t b)
{
     kernel_cap_t dest;
     (dest) = (a) & (b);
     return dest;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) kernel_cap_t cap_drop(kernel_cap_t a, kernel_cap_t drop)
{
     kernel_cap_t dest;
     (dest) = (a) & ~(drop);
     return dest;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) kernel_cap_t cap_invert(kernel_cap_t c)
{
     kernel_cap_t dest;
     (dest) = ~(c);
     return dest;
}
# 8 "include/linux/sched.h" 2



# 1 "include/linux/timex.h" 1
# 155 "include/linux/timex.h"
# 1 "include/asm/timex.h" 1
# 37 "include/asm/timex.h"
typedef unsigned long long cycles_t;

extern cycles_t cacheflush_time;

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) cycles_t get_cycles (void)
{



        unsigned long long ret;

        __asm__ __volatile__("rdtsc" : "=A" (ret));
        return ret;

}

extern unsigned long cpu_khz;
# 156 "include/linux/timex.h" 2
# 186 "include/linux/timex.h"
# 1 "include/linux/time.h" 1
# 9 "include/linux/time.h"
struct timespec {
        time_t tv_sec;
        long tv_nsec;
};


struct timeval {
        time_t tv_sec;
        suseconds_t tv_usec;
};

struct timezone {
        int tz_minuteswest;
        int tz_dsttime;
};




# 1 "include/linux/seqlock.h" 1
# 33 "include/linux/seqlock.h"
typedef struct {
        unsigned sequence;
        spinlock_t lock;
} seqlock_t;
# 50 "include/linux/seqlock.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void write_seqlock(seqlock_t *sl)
{
        do { do { do { (current_thread_info()->preempt_count)++; } while (0); __asm__ __volatile__("": : :"memory"); } while (0); if (__builtin_expect(!!(!_raw_spin_trylock(&sl->lock)), 0)) __preempt_spin_lock(&sl->lock); } while (0);
        ++sl->sequence;
        __asm__ __volatile__ ("": : :"memory");
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void write_sequnlock(seqlock_t *sl)
{
        __asm__ __volatile__ ("": : :"memory");
        sl->sequence++;
        do { _raw_spin_unlock(&sl->lock); do { do { __asm__ __volatile__("": : :"memory"); do { (current_thread_info()->preempt_count)--; } while (0); } while (0); do { if (__builtin_expect(!!(test_thread_flag(3)), 0)) preempt_schedule(); } while (0); } while (0); } while (0);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int write_tryseqlock(seqlock_t *sl)
{
        int ret = ({do { do { (current_thread_info()->preempt_count)++; } while (0); __asm__ __volatile__("": : :"memory"); } while (0); _raw_spin_trylock(&sl->lock) ? 1 : ({do { do { __asm__ __volatile__("": : :"memory"); do { (current_thread_info()->preempt_count)--; } while (0); } while (0); do { if (__builtin_expect(!!(test_thread_flag(3)), 0)) preempt_schedule(); } while (0); } while (0); 0;});});

        if (ret) {
                ++sl->sequence;
                __asm__ __volatile__ ("": : :"memory");
        }
        return ret;
}


static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned read_seqbegin(const seqlock_t *sl)
{
        unsigned ret = sl->sequence;
        asm volatile ("661:\n\t" "lock; addl $0,0(%%esp)" "\n662:\n" ".section .altinstructions,\"a\"\n" "  .align 4\n" "  .long 661b\n" "  .long 663f\n" "  .byte %c0\n" "  .byte 662b-661b\n" "  .byte 664f-663f\n" ".previous\n" ".section .altinstr_replacement,\"ax\"\n" "663:\n\t" "lfence" "\n664:\n" ".previous" :: "i" ((0*32+26)) : "memory");
        return ret;
}
# 91 "include/linux/seqlock.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int read_seqretry(const seqlock_t *sl, unsigned iv)
{
        asm volatile ("661:\n\t" "lock; addl $0,0(%%esp)" "\n662:\n" ".section .altinstructions,\"a\"\n" "  .align 4\n" "  .long 661b\n" "  .long 663f\n" "  .byte %c0\n" "  .byte 662b-661b\n" "  .byte 664f-663f\n" ".previous\n" ".section .altinstr_replacement,\"ax\"\n" "663:\n\t" "lfence" "\n664:\n" ".previous" :: "i" ((0*32+26)) : "memory");
        return (iv & 1) | (sl->sequence ^ iv);
}
# 105 "include/linux/seqlock.h"
typedef struct seqcount {
        unsigned sequence;
} seqcount_t;





static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned read_seqcount_begin(const seqcount_t *s)
{
        unsigned ret = s->sequence;
        asm volatile ("661:\n\t" "lock; addl $0,0(%%esp)" "\n662:\n" ".section .altinstructions,\"a\"\n" "  .align 4\n" "  .long 661b\n" "  .long 663f\n" "  .byte %c0\n" "  .byte 662b-661b\n" "  .byte 664f-663f\n" ".previous\n" ".section .altinstr_replacement,\"ax\"\n" "663:\n\t" "lfence" "\n664:\n" ".previous" :: "i" ((0*32+26)) : "memory");
        return ret;
}






static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int read_seqcount_retry(const seqcount_t *s, unsigned iv)
{
        asm volatile ("661:\n\t" "lock; addl $0,0(%%esp)" "\n662:\n" ".section .altinstructions,\"a\"\n" "  .align 4\n" "  .long 661b\n" "  .long 663f\n" "  .byte %c0\n" "  .byte 662b-661b\n" "  .byte 664f-663f\n" ".previous\n" ".section .altinstr_replacement,\"ax\"\n" "663:\n\t" "lfence" "\n664:\n" ".previous" :: "i" ((0*32+26)) : "memory");
        return (iv & 1) | (s->sequence ^ iv);
}






static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void write_seqcount_begin(seqcount_t *s)
{
        s->sequence++;
        __asm__ __volatile__ ("": : :"memory");
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void write_seqcount_end(seqcount_t *s)
{
        __asm__ __volatile__ ("": : :"memory");
        s->sequence++;
}
# 29 "include/linux/time.h" 2
# 1 "include/linux/timex.h" 1
# 30 "include/linux/time.h" 2
# 1 "include/asm/div64.h" 1
# 38 "include/asm/div64.h"
extern __inline__ __attribute__((always_inline)) __attribute__((always_inline)) long
div_ll_X_l_rem(long long divs, long div, long *rem)
{
        long dum2;
      __asm__("divl %2":"=a"(dum2), "=d"(*rem)
      : "rm"(div), "A"(divs));

        return dum2;

}
# 31 "include/linux/time.h" 2
# 187 "include/linux/time.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned int jiffies_to_msecs(const unsigned long j)
{

        return (1000 / 1000) * j;





}
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned long msecs_to_jiffies(const unsigned int m)
{

        return (m + (1000 / 1000) - 1) / (1000 / 1000);





}
# 219 "include/linux/time.h"
static __inline__ __attribute__((always_inline)) unsigned long
timespec_to_jiffies(const struct timespec *value)
{
        unsigned long sec = value->tv_sec;
        long nsec = value->tv_nsec + (( ((1000000UL * 1000 / (( ((1193182 / ((1193182 + 1000/2) / 1000)) << 8) + (((1193182 % ((1193182 + 1000/2) / 1000)) << 8) + ((1193182 + 1000/2) / 1000) / 2) / ((1193182 + 1000/2) / 1000)))) << 8) + (((1000000UL * 1000 % (( ((1193182 / ((1193182 + 1000/2) / 1000)) << 8) + (((1193182 % ((1193182 + 1000/2) / 1000)) << 8) + ((1193182 + 1000/2) / 1000) / 2) / ((1193182 + 1000/2) / 1000)))) << 8) + (( ((1193182 / ((1193182 + 1000/2) / 1000)) << 8) + (((1193182 % ((1193182 + 1000/2) / 1000)) << 8) + ((1193182 + 1000/2) / 1000) / 2) / ((1193182 + 1000/2) / 1000))) / 2) / (( ((1193182 / ((1193182 + 1000/2) / 1000)) << 8) + (((1193182 % ((1193182 + 1000/2) / 1000)) << 8) + ((1193182 + 1000/2) / 1000) / 2) / ((1193182 + 1000/2) / 1000))))) - 1;

        if (sec >= (long)((u64)((u64)((~0UL >> 1)-1) * (( ((1000000UL * 1000 / (( ((1193182 / ((1193182 + 1000/2) / 1000)) << 8) + (((1193182 % ((1193182 + 1000/2) / 1000)) << 8) + ((1193182 + 1000/2) / 1000) / 2) / ((1193182 + 1000/2) / 1000)))) << 8) + (((1000000UL * 1000 % (( ((1193182 / ((1193182 + 1000/2) / 1000)) << 8) + (((1193182 % ((1193182 + 1000/2) / 1000)) << 8) + ((1193182 + 1000/2) / 1000) / 2) / ((1193182 + 1000/2) / 1000)))) << 8) + (( ((1193182 / ((1193182 + 1000/2) / 1000)) << 8) + (((1193182 % ((1193182 + 1000/2) / 1000)) << 8) + ((1193182 + 1000/2) / 1000) / 2) / ((1193182 + 1000/2) / 1000))) / 2) / (( ((1193182 / ((1193182 + 1000/2) / 1000)) << 8) + (((1193182 % ((1193182 + 1000/2) / 1000)) << 8) + ((1193182 + 1000/2) / 1000) / 2) / ((1193182 + 1000/2) / 1000)))))) / (1000000000L))){
                sec = (long)((u64)((u64)((~0UL >> 1)-1) * (( ((1000000UL * 1000 / (( ((1193182 / ((1193182 + 1000/2) / 1000)) << 8) + (((1193182 % ((1193182 + 1000/2) / 1000)) << 8) + ((1193182 + 1000/2) / 1000) / 2) / ((1193182 + 1000/2) / 1000)))) << 8) + (((1000000UL * 1000 % (( ((1193182 / ((1193182 + 1000/2) / 1000)) << 8) + (((1193182 % ((1193182 + 1000/2) / 1000)) << 8) + ((1193182 + 1000/2) / 1000) / 2) / ((1193182 + 1000/2) / 1000)))) << 8) + (( ((1193182 / ((1193182 + 1000/2) / 1000)) << 8) + (((1193182 % ((1193182 + 1000/2) / 1000)) << 8) + ((1193182 + 1000/2) / 1000) / 2) / ((1193182 + 1000/2) / 1000))) / 2) / (( ((1193182 / ((1193182 + 1000/2) / 1000)) << 8) + (((1193182 % ((1193182 + 1000/2) / 1000)) << 8) + ((1193182 + 1000/2) / 1000) / 2) / ((1193182 + 1000/2) / 1000)))))) / (1000000000L));
                nsec = 0;
        }
        return (((u64)sec * ((unsigned long)((((u64)(1000000000L) << (32 - 10)) + (( ((1000000UL * 1000 / (( ((1193182 / ((1193182 + 1000/2) / 1000)) << 8) + (((1193182 % ((1193182 + 1000/2) / 1000)) << 8) + ((1193182 + 1000/2) / 1000) / 2) / ((1193182 + 1000/2) / 1000)))) << 8) + (((1000000UL * 1000 % (( ((1193182 / ((1193182 + 1000/2) / 1000)) << 8) + (((1193182 % ((1193182 + 1000/2) / 1000)) << 8) + ((1193182 + 1000/2) / 1000) / 2) / ((1193182 + 1000/2) / 1000)))) << 8) + (( ((1193182 / ((1193182 + 1000/2) / 1000)) << 8) + (((1193182 % ((1193182 + 1000/2) / 1000)) << 8) + ((1193182 + 1000/2) / 1000) / 2) / ((1193182 + 1000/2) / 1000))) / 2) / (( ((1193182 / ((1193182 + 1000/2) / 1000)) << 8) + (((1193182 % ((1193182 + 1000/2) / 1000)) << 8) + ((1193182 + 1000/2) / 1000) / 2) / ((1193182 + 1000/2) / 1000))))) -1) / (u64)(( ((1000000UL * 1000 / (( ((1193182 / ((1193182 + 1000/2) / 1000)) << 8) + (((1193182 % ((1193182 + 1000/2) / 1000)) << 8) + ((1193182 + 1000/2) / 1000) / 2) / ((1193182 + 1000/2) / 1000)))) << 8) + (((1000000UL * 1000 % (( ((1193182 / ((1193182 + 1000/2) / 1000)) << 8) + (((1193182 % ((1193182 + 1000/2) / 1000)) << 8) + ((1193182 + 1000/2) / 1000) / 2) / ((1193182 + 1000/2) / 1000)))) << 8) + (( ((1193182 / ((1193182 + 1000/2) / 1000)) << 8) + (((1193182 % ((1193182 + 1000/2) / 1000)) << 8) + ((1193182 + 1000/2) / 1000) / 2) / ((1193182 + 1000/2) / 1000))) / 2) / (( ((1193182 / ((1193182 + 1000/2) / 1000)) << 8) + (((1193182 % ((1193182 + 1000/2) / 1000)) << 8) + ((1193182 + 1000/2) / 1000) / 2) / ((1193182 + 1000/2) / 1000)))))))) +
                (((u64)nsec * ((unsigned long)((((u64)1 << ((32 - 10) + 29)) + (( ((1000000UL * 1000 / (( ((1193182 / ((1193182 + 1000/2) / 1000)) << 8) + (((1193182 % ((1193182 + 1000/2) / 1000)) << 8) + ((1193182 + 1000/2) / 1000) / 2) / ((1193182 + 1000/2) / 1000)))) << 8) + (((1000000UL * 1000 % (( ((1193182 / ((1193182 + 1000/2) / 1000)) << 8) + (((1193182 % ((1193182 + 1000/2) / 1000)) << 8) + ((1193182 + 1000/2) / 1000) / 2) / ((1193182 + 1000/2) / 1000)))) << 8) + (( ((1193182 / ((1193182 + 1000/2) / 1000)) << 8) + (((1193182 % ((1193182 + 1000/2) / 1000)) << 8) + ((1193182 + 1000/2) / 1000) / 2) / ((1193182 + 1000/2) / 1000))) / 2) / (( ((1193182 / ((1193182 + 1000/2) / 1000)) << 8) + (((1193182 % ((1193182 + 1000/2) / 1000)) << 8) + ((1193182 + 1000/2) / 1000) / 2) / ((1193182 + 1000/2) / 1000))))) -1) / (u64)(( ((1000000UL * 1000 / (( ((1193182 / ((1193182 + 1000/2) / 1000)) << 8) + (((1193182 % ((1193182 + 1000/2) / 1000)) << 8) + ((1193182 + 1000/2) / 1000) / 2) / ((1193182 + 1000/2) / 1000)))) << 8) + (((1000000UL * 1000 % (( ((1193182 / ((1193182 + 1000/2) / 1000)) << 8) + (((1193182 % ((1193182 + 1000/2) / 1000)) << 8) + ((1193182 + 1000/2) / 1000) / 2) / ((1193182 + 1000/2) / 1000)))) << 8) + (( ((1193182 / ((1193182 + 1000/2) / 1000)) << 8) + (((1193182 % ((1193182 + 1000/2) / 1000)) << 8) + ((1193182 + 1000/2) / 1000) / 2) / ((1193182 + 1000/2) / 1000))) / 2) / (( ((1193182 / ((1193182 + 1000/2) / 1000)) << 8) + (((1193182 % ((1193182 + 1000/2) / 1000)) << 8) + ((1193182 + 1000/2) / 1000) / 2) / ((1193182 + 1000/2) / 1000)))))))) >>
                 (((32 - 10) + 29) - (32 - 10)))) >> (32 - 10);

}

static __inline__ __attribute__((always_inline)) void
jiffies_to_timespec(const unsigned long jiffies, struct timespec *value)
{




        u64 nsec = (u64)jiffies * (( ((1000000UL * 1000 / (( ((1193182 / ((1193182 + 1000/2) / 1000)) << 8) + (((1193182 % ((1193182 + 1000/2) / 1000)) << 8) + ((1193182 + 1000/2) / 1000) / 2) / ((1193182 + 1000/2) / 1000)))) << 8) + (((1000000UL * 1000 % (( ((1193182 / ((1193182 + 1000/2) / 1000)) << 8) + (((1193182 % ((1193182 + 1000/2) / 1000)) << 8) + ((1193182 + 1000/2) / 1000) / 2) / ((1193182 + 1000/2) / 1000)))) << 8) + (( ((1193182 / ((1193182 + 1000/2) / 1000)) << 8) + (((1193182 % ((1193182 + 1000/2) / 1000)) << 8) + ((1193182 + 1000/2) / 1000) / 2) / ((1193182 + 1000/2) / 1000))) / 2) / (( ((1193182 / ((1193182 + 1000/2) / 1000)) << 8) + (((1193182 % ((1193182 + 1000/2) / 1000)) << 8) + ((1193182 + 1000/2) / 1000) / 2) / ((1193182 + 1000/2) / 1000)))));
        value->tv_sec = div_ll_X_l_rem(nsec,(1000000000L),&value->tv_nsec);
}
# 258 "include/linux/time.h"
static __inline__ __attribute__((always_inline)) unsigned long
timeval_to_jiffies(const struct timeval *value)
{
        unsigned long sec = value->tv_sec;
        long usec = value->tv_usec;

        if (sec >= (long)((u64)((u64)((~0UL >> 1)-1) * (( ((1000000UL * 1000 / (( ((1193182 / ((1193182 + 1000/2) / 1000)) << 8) + (((1193182 % ((1193182 + 1000/2) / 1000)) << 8) + ((1193182 + 1000/2) / 1000) / 2) / ((1193182 + 1000/2) / 1000)))) << 8) + (((1000000UL * 1000 % (( ((1193182 / ((1193182 + 1000/2) / 1000)) << 8) + (((1193182 % ((1193182 + 1000/2) / 1000)) << 8) + ((1193182 + 1000/2) / 1000) / 2) / ((1193182 + 1000/2) / 1000)))) << 8) + (( ((1193182 / ((1193182 + 1000/2) / 1000)) << 8) + (((1193182 % ((1193182 + 1000/2) / 1000)) << 8) + ((1193182 + 1000/2) / 1000) / 2) / ((1193182 + 1000/2) / 1000))) / 2) / (( ((1193182 / ((1193182 + 1000/2) / 1000)) << 8) + (((1193182 % ((1193182 + 1000/2) / 1000)) << 8) + ((1193182 + 1000/2) / 1000) / 2) / ((1193182 + 1000/2) / 1000)))))) / (1000000000L))){
                sec = (long)((u64)((u64)((~0UL >> 1)-1) * (( ((1000000UL * 1000 / (( ((1193182 / ((1193182 + 1000/2) / 1000)) << 8) + (((1193182 % ((1193182 + 1000/2) / 1000)) << 8) + ((1193182 + 1000/2) / 1000) / 2) / ((1193182 + 1000/2) / 1000)))) << 8) + (((1000000UL * 1000 % (( ((1193182 / ((1193182 + 1000/2) / 1000)) << 8) + (((1193182 % ((1193182 + 1000/2) / 1000)) << 8) + ((1193182 + 1000/2) / 1000) / 2) / ((1193182 + 1000/2) / 1000)))) << 8) + (( ((1193182 / ((1193182 + 1000/2) / 1000)) << 8) + (((1193182 % ((1193182 + 1000/2) / 1000)) << 8) + ((1193182 + 1000/2) / 1000) / 2) / ((1193182 + 1000/2) / 1000))) / 2) / (( ((1193182 / ((1193182 + 1000/2) / 1000)) << 8) + (((1193182 % ((1193182 + 1000/2) / 1000)) << 8) + ((1193182 + 1000/2) / 1000) / 2) / ((1193182 + 1000/2) / 1000)))))) / (1000000000L));
                usec = 0;
        }
        return (((u64)sec * ((unsigned long)((((u64)(1000000000L) << (32 - 10)) + (( ((1000000UL * 1000 / (( ((1193182 / ((1193182 + 1000/2) / 1000)) << 8) + (((1193182 % ((1193182 + 1000/2) / 1000)) << 8) + ((1193182 + 1000/2) / 1000) / 2) / ((1193182 + 1000/2) / 1000)))) << 8) + (((1000000UL * 1000 % (( ((1193182 / ((1193182 + 1000/2) / 1000)) << 8) + (((1193182 % ((1193182 + 1000/2) / 1000)) << 8) + ((1193182 + 1000/2) / 1000) / 2) / ((1193182 + 1000/2) / 1000)))) << 8) + (( ((1193182 / ((1193182 + 1000/2) / 1000)) << 8) + (((1193182 % ((1193182 + 1000/2) / 1000)) << 8) + ((1193182 + 1000/2) / 1000) / 2) / ((1193182 + 1000/2) / 1000))) / 2) / (( ((1193182 / ((1193182 + 1000/2) / 1000)) << 8) + (((1193182 % ((1193182 + 1000/2) / 1000)) << 8) + ((1193182 + 1000/2) / 1000) / 2) / ((1193182 + 1000/2) / 1000))))) -1) / (u64)(( ((1000000UL * 1000 / (( ((1193182 / ((1193182 + 1000/2) / 1000)) << 8) + (((1193182 % ((1193182 + 1000/2) / 1000)) << 8) + ((1193182 + 1000/2) / 1000) / 2) / ((1193182 + 1000/2) / 1000)))) << 8) + (((1000000UL * 1000 % (( ((1193182 / ((1193182 + 1000/2) / 1000)) << 8) + (((1193182 % ((1193182 + 1000/2) / 1000)) << 8) + ((1193182 + 1000/2) / 1000) / 2) / ((1193182 + 1000/2) / 1000)))) << 8) + (( ((1193182 / ((1193182 + 1000/2) / 1000)) << 8) + (((1193182 % ((1193182 + 1000/2) / 1000)) << 8) + ((1193182 + 1000/2) / 1000) / 2) / ((1193182 + 1000/2) / 1000))) / 2) / (( ((1193182 / ((1193182 + 1000/2) / 1000)) << 8) + (((1193182 % ((1193182 + 1000/2) / 1000)) << 8) + ((1193182 + 1000/2) / 1000) / 2) / ((1193182 + 1000/2) / 1000)))))))) +
                (((u64)usec * ((unsigned long)((((u64)(1000L) << ((32 - 10) + 19)) + (( ((1000000UL * 1000 / (( ((1193182 / ((1193182 + 1000/2) / 1000)) << 8) + (((1193182 % ((1193182 + 1000/2) / 1000)) << 8) + ((1193182 + 1000/2) / 1000) / 2) / ((1193182 + 1000/2) / 1000)))) << 8) + (((1000000UL * 1000 % (( ((1193182 / ((1193182 + 1000/2) / 1000)) << 8) + (((1193182 % ((1193182 + 1000/2) / 1000)) << 8) + ((1193182 + 1000/2) / 1000) / 2) / ((1193182 + 1000/2) / 1000)))) << 8) + (( ((1193182 / ((1193182 + 1000/2) / 1000)) << 8) + (((1193182 % ((1193182 + 1000/2) / 1000)) << 8) + ((1193182 + 1000/2) / 1000) / 2) / ((1193182 + 1000/2) / 1000))) / 2) / (( ((1193182 / ((1193182 + 1000/2) / 1000)) << 8) + (((1193182 % ((1193182 + 1000/2) / 1000)) << 8) + ((1193182 + 1000/2) / 1000) / 2) / ((1193182 + 1000/2) / 1000))))) -1) / (u64)(( ((1000000UL * 1000 / (( ((1193182 / ((1193182 + 1000/2) / 1000)) << 8) + (((1193182 % ((1193182 + 1000/2) / 1000)) << 8) + ((1193182 + 1000/2) / 1000) / 2) / ((1193182 + 1000/2) / 1000)))) << 8) + (((1000000UL * 1000 % (( ((1193182 / ((1193182 + 1000/2) / 1000)) << 8) + (((1193182 % ((1193182 + 1000/2) / 1000)) << 8) + ((1193182 + 1000/2) / 1000) / 2) / ((1193182 + 1000/2) / 1000)))) << 8) + (( ((1193182 / ((1193182 + 1000/2) / 1000)) << 8) + (((1193182 % ((1193182 + 1000/2) / 1000)) << 8) + ((1193182 + 1000/2) / 1000) / 2) / ((1193182 + 1000/2) / 1000))) / 2) / (( ((1193182 / ((1193182 + 1000/2) / 1000)) << 8) + (((1193182 % ((1193182 + 1000/2) / 1000)) << 8) + ((1193182 + 1000/2) / 1000) / 2) / ((1193182 + 1000/2) / 1000))))))) + (u64)(((u64)1 << ((32 - 10) + 19)) - 1)) >>
                 (((32 - 10) + 19) - (32 - 10)))) >> (32 - 10);
}

static __inline__ __attribute__((always_inline)) void
jiffies_to_timeval(const unsigned long jiffies, struct timeval *value)
{




        u64 nsec = (u64)jiffies * (( ((1000000UL * 1000 / (( ((1193182 / ((1193182 + 1000/2) / 1000)) << 8) + (((1193182 % ((1193182 + 1000/2) / 1000)) << 8) + ((1193182 + 1000/2) / 1000) / 2) / ((1193182 + 1000/2) / 1000)))) << 8) + (((1000000UL * 1000 % (( ((1193182 / ((1193182 + 1000/2) / 1000)) << 8) + (((1193182 % ((1193182 + 1000/2) / 1000)) << 8) + ((1193182 + 1000/2) / 1000) / 2) / ((1193182 + 1000/2) / 1000)))) << 8) + (( ((1193182 / ((1193182 + 1000/2) / 1000)) << 8) + (((1193182 % ((1193182 + 1000/2) / 1000)) << 8) + ((1193182 + 1000/2) / 1000) / 2) / ((1193182 + 1000/2) / 1000))) / 2) / (( ((1193182 / ((1193182 + 1000/2) / 1000)) << 8) + (((1193182 % ((1193182 + 1000/2) / 1000)) << 8) + ((1193182 + 1000/2) / 1000) / 2) / ((1193182 + 1000/2) / 1000)))));
        value->tv_sec = div_ll_X_l_rem(nsec,(1000000000L),&value->tv_usec);
        value->tv_usec /= (1000L);
}

static __inline__ __attribute__((always_inline)) int timespec_equal(struct timespec *a, struct timespec *b)
{
        return (a->tv_sec == b->tv_sec) && (a->tv_nsec == b->tv_nsec);
}
# 305 "include/linux/time.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned long
mktime (unsigned int year, unsigned int mon,
        unsigned int day, unsigned int hour,
        unsigned int min, unsigned int sec)
{
        if (0 >= (int) (mon -= 2)) {
                mon += 12;
                year -= 1;
        }

        return (((
                (unsigned long) (year/4 - year/100 + year/400 + 367*mon/12 + day) +
                        year*365 - 719499
            )*24 + hour
          )*60 + min
        )*60 + sec;
}

extern struct timespec xtime;
extern struct timespec wall_to_monotonic;
extern seqlock_t xtime_lock;

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned long get_seconds(void)
{
        return xtime.tv_sec;
}

struct timespec current_kernel_time(void);
# 341 "include/linux/time.h"
extern void do_gettimeofday(struct timeval *tv);
extern int do_settimeofday(struct timespec *tv);
extern int do_sys_settimeofday(struct timespec *tv, struct timezone *tz);
extern void clock_was_set(void);
extern int do_posix_clock_monotonic_gettime(struct timespec *tp);
extern long do_nanosleep(struct timespec *t);
extern long do_utimes(char * filename, struct timeval * times);
struct itimerval;
extern int do_setitimer(int which, struct itimerval *value, struct itimerval *ovalue);
extern int do_getitimer(int which, struct itimerval *value);

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void
set_normalized_timespec (struct timespec *ts, time_t sec, long nsec)
{
        while (nsec > (1000000000L)) {
                nsec -= (1000000000L);
                ++sec;
        }
        while (nsec < 0) {
                nsec += (1000000000L);
                --sec;
        }
        ts->tv_sec = sec;
        ts->tv_nsec = nsec;
}
# 382 "include/linux/time.h"
struct itimerspec {
        struct timespec it_interval;
        struct timespec it_value;
};

struct itimerval {
        struct timeval it_interval;
        struct timeval it_value;
};
# 187 "include/linux/timex.h" 2




struct timex {
        unsigned int modes;
        long offset;
        long freq;
        long maxerror;
        long esterror;
        int status;
        long constant;
        long precision;
        long tolerance;


        struct timeval time;
        long tick;

        long ppsfreq;
        long jitter;
        int shift;
        long stabil;
        long jitcnt;
        long calcnt;
        long errcnt;
        long stbcnt;

        int :32; int :32; int :32; int :32;
        int :32; int :32; int :32; int :32;
        int :32; int :32; int :32; int :32;
};
# 283 "include/linux/timex.h"
extern unsigned long tick_usec;
extern unsigned long tick_nsec;
extern int tickadj;




extern int time_state;
extern int time_status;
extern long time_offset;
extern long time_constant;
extern long time_tolerance;
extern long time_precision;
extern long time_maxerror;
extern long time_esterror;

extern long time_phase;
extern long time_freq;
extern long time_adj;
extern long time_reftime;

extern long time_adjust;
extern long time_next_adjust;


extern long pps_offset;
extern long pps_jitter;
extern long pps_freq;
extern long pps_stabil;
extern long pps_valid;


extern int pps_shift;
extern long pps_jitcnt;
extern long pps_calcnt;
extern long pps_errcnt;
extern long pps_stbcnt;
# 402 "include/linux/timex.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void
time_interpolator_update(long delta_nsec)
{
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void
time_interpolator_reset(void)
{
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned long
time_interpolator_get_offset(void)
{
        return 0;
}
# 12 "include/linux/sched.h" 2
# 1 "include/linux/jiffies.h" 1
# 16 "include/linux/jiffies.h"
extern u64 jiffies_64;
extern unsigned long volatile jiffies;


u64 get_jiffies_64(void);
# 13 "include/linux/sched.h" 2
# 1 "include/linux/rbtree.h" 1
# 100 "include/linux/rbtree.h"
struct rb_node
{
        struct rb_node *rb_parent;
        int rb_color;


        struct rb_node *rb_right;
        struct rb_node *rb_left;
};

struct rb_root
{
        struct rb_node *rb_node;
};





extern void rb_insert_color(struct rb_node *, struct rb_root *);
extern void rb_erase(struct rb_node *, struct rb_root *);


extern struct rb_node *rb_next(struct rb_node *);
extern struct rb_node *rb_prev(struct rb_node *);
extern struct rb_node *rb_first(struct rb_root *);


extern void rb_replace_node(struct rb_node *victim, struct rb_node *new,
                            struct rb_root *root);

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void rb_link_node(struct rb_node * node, struct rb_node * parent,
                                struct rb_node ** rb_link)
{
        node->rb_parent = parent;
        node->rb_color = 0;
        node->rb_left = node->rb_right = ((void *)0);

        *rb_link = node;
}
# 14 "include/linux/sched.h" 2

# 1 "include/linux/cpumask.h" 1
# 77 "include/linux/cpumask.h"
# 1 "include/linux/bitmap.h" 1







# 1 "include/linux/string.h" 1
# 16 "include/linux/string.h"
extern char * strpbrk(const char *,const char *);
extern char * strsep(char **,const char *);
extern __kernel_size_t strspn(const char *,const char *);
extern __kernel_size_t strcspn(const char *,const char *);




# 1 "include/asm/string.h" 1
# 31 "include/asm/string.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) char * strcpy(char * dest,const char *src)
{
int d0, d1, d2;
__asm__ __volatile__(
        "1:\tlodsb\n\t"
        "stosb\n\t"
        "testb %%al,%%al\n\t"
        "jne 1b"
        : "=&S" (d0), "=&D" (d1), "=&a" (d2)
        :"0" (src),"1" (dest) : "memory");
return dest;
}


static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) char * strncpy(char * dest,const char *src,size_t count)
{
int d0, d1, d2, d3;
__asm__ __volatile__(
        "1:\tdecl %2\n\t"
        "js 2f\n\t"
        "lodsb\n\t"
        "stosb\n\t"
        "testb %%al,%%al\n\t"
        "jne 1b\n\t"
        "rep\n\t"
        "stosb\n"
        "2:"
        : "=&S" (d0), "=&D" (d1), "=&c" (d2), "=&a" (d3)
        :"0" (src),"1" (dest),"2" (count) : "memory");
return dest;
}


static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) char * strcat(char * dest,const char * src)
{
int d0, d1, d2, d3;
__asm__ __volatile__(
        "repne\n\t"
        "scasb\n\t"
        "decl %1\n"
        "1:\tlodsb\n\t"
        "stosb\n\t"
        "testb %%al,%%al\n\t"
        "jne 1b"
        : "=&S" (d0), "=&D" (d1), "=&a" (d2), "=&c" (d3)
        : "0" (src), "1" (dest), "2" (0), "3" (0xffffffffu):"memory");
return dest;
}


static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) char * strncat(char * dest,const char * src,size_t count)
{
int d0, d1, d2, d3;
__asm__ __volatile__(
        "repne\n\t"
        "scasb\n\t"
        "decl %1\n\t"
        "movl %8,%3\n"
        "1:\tdecl %3\n\t"
        "js 2f\n\t"
        "lodsb\n\t"
        "stosb\n\t"
        "testb %%al,%%al\n\t"
        "jne 1b\n"
        "2:\txorl %2,%2\n\t"
        "stosb"
        : "=&S" (d0), "=&D" (d1), "=&a" (d2), "=&c" (d3)
        : "0" (src),"1" (dest),"2" (0),"3" (0xffffffffu), "g" (count)
        : "memory");
return dest;
}


static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int strcmp(const char * cs,const char * ct)
{
int d0, d1;
register int __res;
__asm__ __volatile__(
        "1:\tlodsb\n\t"
        "scasb\n\t"
        "jne 2f\n\t"
        "testb %%al,%%al\n\t"
        "jne 1b\n\t"
        "xorl %%eax,%%eax\n\t"
        "jmp 3f\n"
        "2:\tsbbl %%eax,%%eax\n\t"
        "orb $1,%%al\n"
        "3:"
        :"=a" (__res), "=&S" (d0), "=&D" (d1)
                     :"1" (cs),"2" (ct));
return __res;
}


static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int strncmp(const char * cs,const char * ct,size_t count)
{
register int __res;
int d0, d1, d2;
__asm__ __volatile__(
        "1:\tdecl %3\n\t"
        "js 2f\n\t"
        "lodsb\n\t"
        "scasb\n\t"
        "jne 3f\n\t"
        "testb %%al,%%al\n\t"
        "jne 1b\n"
        "2:\txorl %%eax,%%eax\n\t"
        "jmp 4f\n"
        "3:\tsbbl %%eax,%%eax\n\t"
        "orb $1,%%al\n"
        "4:"
                     :"=a" (__res), "=&S" (d0), "=&D" (d1), "=&c" (d2)
                     :"1" (cs),"2" (ct),"3" (count));
return __res;
}


static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) char * strchr(const char * s, int c)
{
int d0;
register char * __res;
__asm__ __volatile__(
        "movb %%al,%%ah\n"
        "1:\tlodsb\n\t"
        "cmpb %%ah,%%al\n\t"
        "je 2f\n\t"
        "testb %%al,%%al\n\t"
        "jne 1b\n\t"
        "movl $1,%1\n"
        "2:\tmovl %1,%0\n\t"
        "decl %0"
        :"=a" (__res), "=&S" (d0) : "1" (s),"0" (c));
return __res;
}


static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) char * strrchr(const char * s, int c)
{
int d0, d1;
register char * __res;
__asm__ __volatile__(
        "movb %%al,%%ah\n"
        "1:\tlodsb\n\t"
        "cmpb %%ah,%%al\n\t"
        "jne 2f\n\t"
        "leal -1(%%esi),%0\n"
        "2:\ttestb %%al,%%al\n\t"
        "jne 1b"
        :"=g" (__res), "=&S" (d0), "=&a" (d1) :"0" (0),"1" (s),"2" (c));
return __res;
}




static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) size_t strlen(const char * s)
{
int d0;
register int __res;
__asm__ __volatile__(
        "repne\n\t"
        "scasb\n\t"
        "notl %0\n\t"
        "decl %0"
        :"=c" (__res), "=&D" (d0) :"1" (s),"a" (0), "0" (0xffffffffu));
return __res;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void * __memcpy(void * to, const void * from, size_t n)
{
int d0, d1, d2;
__asm__ __volatile__(
        "rep ; movsl\n\t"
        "testb $2,%b4\n\t"
        "je 1f\n\t"
        "movsw\n"
        "1:\ttestb $1,%b4\n\t"
        "je 2f\n\t"
        "movsb\n"
        "2:"
        : "=&c" (d0), "=&D" (d1), "=&S" (d2)
        :"0" (n/4), "q" (n),"1" ((long) to),"2" ((long) from)
        : "memory");
return (to);
}





static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void * __constant_memcpy(void * to, const void * from, size_t n)
{
        if (n <= 128)
                return __builtin_memcpy(to, from, n);
# 233 "include/asm/string.h"
{
        int d0, d1, d2;
        switch (n % 4) {
                case 0: __asm__ __volatile__( "rep ; movsl" "" : "=&c" (d0), "=&D" (d1), "=&S" (d2) : "0" (n/4),"1" ((long) to),"2" ((long) from) : "memory");; return to;
                case 1: __asm__ __volatile__( "rep ; movsl" "\n\tmovsb" : "=&c" (d0), "=&D" (d1), "=&S" (d2) : "0" (n/4),"1" ((long) to),"2" ((long) from) : "memory");; return to;
                case 2: __asm__ __volatile__( "rep ; movsl" "\n\tmovsw" : "=&c" (d0), "=&D" (d1), "=&S" (d2) : "0" (n/4),"1" ((long) to),"2" ((long) from) : "memory");; return to;
                default: __asm__ __volatile__( "rep ; movsl" "\n\tmovsw\n\tmovsb" : "=&c" (d0), "=&D" (d1), "=&S" (d2) : "0" (n/4),"1" ((long) to),"2" ((long) from) : "memory");; return to;
        }
}


}
# 289 "include/asm/string.h"
void *memmove(void * dest,const void * src, size_t n);




static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void * memchr(const void * cs,int c,size_t count)
{
int d0;
register void * __res;
if (!count)
        return ((void *)0);
__asm__ __volatile__(
        "repne\n\t"
        "scasb\n\t"
        "je 1f\n\t"
        "movl $1,%0\n"
        "1:\tdecl %0"
        :"=D" (__res), "=&c" (d0) : "a" (c),"0" (cs),"1" (count));
return __res;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void * __memset_generic(void * s, char c,size_t count)
{
int d0, d1;
__asm__ __volatile__(
        "rep\n\t"
        "stosb"
        : "=&c" (d0), "=&D" (d1)
        :"a" (c),"1" (s),"0" (count)
        :"memory");
return s;
}
# 330 "include/asm/string.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void * __constant_c_memset(void * s, unsigned long c, size_t count)
{
int d0, d1;
__asm__ __volatile__(
        "rep ; stosl\n\t"
        "testb $2,%b3\n\t"
        "je 1f\n\t"
        "stosw\n"
        "1:\ttestb $1,%b3\n\t"
        "je 2f\n\t"
        "stosb\n"
        "2:"
        : "=&c" (d0), "=&D" (d1)
        :"a" (c), "q" (count), "0" (count/4), "1" ((long) s)
        :"memory");
return (s);
}



static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) size_t strnlen(const char * s, size_t count)
{
int d0;
register int __res;
__asm__ __volatile__(
        "movl %2,%0\n\t"
        "jmp 2f\n"
        "1:\tcmpb $0,(%0)\n\t"
        "je 3f\n\t"
        "incl %0\n"
        "2:\tdecl %1\n\t"
        "cmpl $-1,%1\n\t"
        "jne 1b\n"
        "3:\tsubl %2,%0"
        :"=a" (__res), "=&d" (d0)
        :"c" (s),"1" (count));
return __res;
}




extern char *strstr(const char *cs, const char *ct);





static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void * __constant_c_and_count_memset(void * s, unsigned long pattern, size_t count)
{
        switch (count) {
                case 0:
                        return s;
                case 1:
                        *(unsigned char *)s = pattern;
                        return s;
                case 2:
                        *(unsigned short *)s = pattern;
                        return s;
                case 3:
                        *(unsigned short *)s = pattern;
                        *(2+(unsigned char *)s) = pattern;
                        return s;
                case 4:
                        *(unsigned long *)s = pattern;
                        return s;
        }







{
        int d0, d1;
        switch (count % 4) {
                case 0: __asm__ __volatile__( "rep ; stosl" "" : "=&c" (d0), "=&D" (d1) : "a" (pattern),"0" (count/4),"1" ((long) s) : "memory"); return s;
                case 1: __asm__ __volatile__( "rep ; stosl" "\n\tstosb" : "=&c" (d0), "=&D" (d1) : "a" (pattern),"0" (count/4),"1" ((long) s) : "memory"); return s;
                case 2: __asm__ __volatile__( "rep ; stosl" "\n\tstosw" : "=&c" (d0), "=&D" (d1) : "a" (pattern),"0" (count/4),"1" ((long) s) : "memory"); return s;
                default: __asm__ __volatile__( "rep ; stosl" "\n\tstosw\n\tstosb" : "=&c" (d0), "=&D" (d1) : "a" (pattern),"0" (count/4),"1" ((long) s) : "memory"); return s;
        }
}


}
# 437 "include/asm/string.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void * memscan(void * addr, int c, size_t size)
{
        if (!size)
                return addr;
        __asm__("repnz; scasb\n\t"
                "jnz 1f\n\t"
                "dec %%edi\n"
                "1:"
                : "=D" (addr), "=c" (size)
                : "0" (addr), "1" (size), "a" (c));
        return addr;
}
# 25 "include/linux/string.h" 2
# 33 "include/linux/string.h"
size_t strlcpy(char *, const char *, size_t);
# 42 "include/linux/string.h"
extern size_t strlcat(char *, const char *, __kernel_size_t);
# 51 "include/linux/string.h"
extern int strnicmp(const char *, const char *, __kernel_size_t);





extern char * strnchr(const char *, size_t, int);
# 85 "include/linux/string.h"
extern int __builtin_memcmp(const void *,const void *,__kernel_size_t);
# 9 "include/linux/bitmap.h" 2
# 73 "include/linux/bitmap.h"
extern int __bitmap_empty(const unsigned long *bitmap, int bits);
extern int __bitmap_full(const unsigned long *bitmap, int bits);
extern int __bitmap_equal(const unsigned long *bitmap1,
                        const unsigned long *bitmap2, int bits);
extern void __bitmap_complement(unsigned long *dst, const unsigned long *src,
                        int bits);
extern void __bitmap_shift_right(unsigned long *dst,
                        const unsigned long *src, int shift, int bits);
extern void __bitmap_shift_left(unsigned long *dst,
                        const unsigned long *src, int shift, int bits);
extern void __bitmap_and(unsigned long *dst, const unsigned long *bitmap1,
                        const unsigned long *bitmap2, int bits);
extern void __bitmap_or(unsigned long *dst, const unsigned long *bitmap1,
                        const unsigned long *bitmap2, int bits);
extern void __bitmap_xor(unsigned long *dst, const unsigned long *bitmap1,
                        const unsigned long *bitmap2, int bits);
extern void __bitmap_andnot(unsigned long *dst, const unsigned long *bitmap1,
                        const unsigned long *bitmap2, int bits);
extern int __bitmap_intersects(const unsigned long *bitmap1,
                        const unsigned long *bitmap2, int bits);
extern int __bitmap_subset(const unsigned long *bitmap1,
                        const unsigned long *bitmap2, int bits);
extern int __bitmap_weight(const unsigned long *bitmap, int bits);

extern int bitmap_scnprintf(char *buf, unsigned int len,
                        const unsigned long *src, int nbits);
extern int bitmap_parse(const char *ubuf, unsigned int ulen,
                        unsigned long *dst, int nbits);







static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void bitmap_zero(unsigned long *dst, int nbits)
{
        if (nbits <= 32)
                *dst = 0UL;
        else {
                int len = (((nbits)+32 -1)/32) * sizeof(unsigned long);
                (__builtin_constant_p(0) ? (__builtin_constant_p((len)) ? __constant_c_and_count_memset(((dst)),((0x01010101UL*(unsigned char)(0))),((len))) : __constant_c_memset(((dst)),((0x01010101UL*(unsigned char)(0))),((len)))) : (__builtin_constant_p((len)) ? __memset_generic((((dst))),(((0))),(((len)))) : __memset_generic(((dst)),((0)),((len)))));
        }
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void bitmap_fill(unsigned long *dst, int nbits)
{
        size_t nlongs = (((nbits)+32 -1)/32);
        if (nlongs > 1) {
                int len = (nlongs - 1) * sizeof(unsigned long);
                (__builtin_constant_p(0xff) ? (__builtin_constant_p((len)) ? __constant_c_and_count_memset(((dst)),((0x01010101UL*(unsigned char)(0xff))),((len))) : __constant_c_memset(((dst)),((0x01010101UL*(unsigned char)(0xff))),((len)))) : (__builtin_constant_p((len)) ? __memset_generic((((dst))),(((0xff))),(((len)))) : __memset_generic(((dst)),((0xff)),((len)))));
        }
        dst[nlongs - 1] = ( ((nbits) % 32) ? (1UL<<((nbits) % 32))-1 : ~0UL );
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void bitmap_copy(unsigned long *dst, const unsigned long *src,
                        int nbits)
{
        if (nbits <= 32)
                *dst = *src;
        else {
                int len = (((nbits)+32 -1)/32) * sizeof(unsigned long);
                (__builtin_constant_p(len) ? __constant_memcpy((dst),(src),(len)) : __memcpy((dst),(src),(len)));
        }
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void bitmap_and(unsigned long *dst, const unsigned long *src1,
                        const unsigned long *src2, int nbits)
{
        if (nbits <= 32)
                *dst = *src1 & *src2;
        else
                __bitmap_and(dst, src1, src2, nbits);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void bitmap_or(unsigned long *dst, const unsigned long *src1,
                        const unsigned long *src2, int nbits)
{
        if (nbits <= 32)
                *dst = *src1 | *src2;
        else
                __bitmap_or(dst, src1, src2, nbits);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void bitmap_xor(unsigned long *dst, const unsigned long *src1,
                        const unsigned long *src2, int nbits)
{
        if (nbits <= 32)
                *dst = *src1 ^ *src2;
        else
                __bitmap_xor(dst, src1, src2, nbits);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void bitmap_andnot(unsigned long *dst, const unsigned long *src1,
                        const unsigned long *src2, int nbits)
{
        if (nbits <= 32)
                *dst = *src1 & ~(*src2);
        else
                __bitmap_andnot(dst, src1, src2, nbits);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void bitmap_complement(unsigned long *dst, const unsigned long *src,
                        int nbits)
{
        if (nbits <= 32)
                *dst = ~(*src) & ( ((nbits) % 32) ? (1UL<<((nbits) % 32))-1 : ~0UL );
        else
                __bitmap_complement(dst, src, nbits);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int bitmap_equal(const unsigned long *src1,
                        const unsigned long *src2, int nbits)
{
        if (nbits <= 32)
                return ! ((*src1 ^ *src2) & ( ((nbits) % 32) ? (1UL<<((nbits) % 32))-1 : ~0UL ));
        else
                return __bitmap_equal(src1, src2, nbits);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int bitmap_intersects(const unsigned long *src1,
                        const unsigned long *src2, int nbits)
{
        if (nbits <= 32)
                return ((*src1 & *src2) & ( ((nbits) % 32) ? (1UL<<((nbits) % 32))-1 : ~0UL )) != 0;
        else
                return __bitmap_intersects(src1, src2, nbits);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int bitmap_subset(const unsigned long *src1,
                        const unsigned long *src2, int nbits)
{
        if (nbits <= 32)
                return ! ((*src1 & ~(*src2)) & ( ((nbits) % 32) ? (1UL<<((nbits) % 32))-1 : ~0UL ));
        else
                return __bitmap_subset(src1, src2, nbits);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int bitmap_empty(const unsigned long *src, int nbits)
{
        if (nbits <= 32)
                return ! (*src & ( ((nbits) % 32) ? (1UL<<((nbits) % 32))-1 : ~0UL ));
        else
                return __bitmap_empty(src, nbits);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int bitmap_full(const unsigned long *src, int nbits)
{
        if (nbits <= 32)
                return ! (~(*src) & ( ((nbits) % 32) ? (1UL<<((nbits) % 32))-1 : ~0UL ));
        else
                return __bitmap_full(src, nbits);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int bitmap_weight(const unsigned long *src, int nbits)
{
        return __bitmap_weight(src, nbits);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void bitmap_shift_right(unsigned long *dst,
                        const unsigned long *src, int n, int nbits)
{
        if (nbits <= 32)
                *dst = *src >> n;
        else
                __bitmap_shift_right(dst, src, n, nbits);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void bitmap_shift_left(unsigned long *dst,
                        const unsigned long *src, int n, int nbits)
{
        if (nbits <= 32)
                *dst = (*src << n) & ( ((nbits) % 32) ? (1UL<<((nbits) % 32))-1 : ~0UL );
        else
                __bitmap_shift_left(dst, src, n, nbits);
}
# 78 "include/linux/cpumask.h" 2


typedef struct { unsigned long bits[(((8)+32 -1)/32)]; } cpumask_t;
extern cpumask_t _unused_cpumask_arg_;


static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void __cpu_set(int cpu, volatile cpumask_t *dstp)
{
        set_bit(cpu, dstp->bits);
}


static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void __cpu_clear(int cpu, volatile cpumask_t *dstp)
{
        clear_bit(cpu, dstp->bits);
}


static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void __cpus_setall(cpumask_t *dstp, int nbits)
{
        bitmap_fill(dstp->bits, nbits);
}


static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void __cpus_clear(cpumask_t *dstp, int nbits)
{
        bitmap_zero(dstp->bits, nbits);
}





static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int __cpu_test_and_set(int cpu, cpumask_t *addr)
{
        return test_and_set_bit(cpu, addr->bits);
}


static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void __cpus_and(cpumask_t *dstp, const cpumask_t *src1p,
                                        const cpumask_t *src2p, int nbits)
{
        bitmap_and(dstp->bits, src1p->bits, src2p->bits, nbits);
}


static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void __cpus_or(cpumask_t *dstp, const cpumask_t *src1p,
                                        const cpumask_t *src2p, int nbits)
{
        bitmap_or(dstp->bits, src1p->bits, src2p->bits, nbits);
}


static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void __cpus_xor(cpumask_t *dstp, const cpumask_t *src1p,
                                        const cpumask_t *src2p, int nbits)
{
        bitmap_xor(dstp->bits, src1p->bits, src2p->bits, nbits);
}



static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void __cpus_andnot(cpumask_t *dstp, const cpumask_t *src1p,
                                        const cpumask_t *src2p, int nbits)
{
        bitmap_andnot(dstp->bits, src1p->bits, src2p->bits, nbits);
}


static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void __cpus_complement(cpumask_t *dstp,
                                        const cpumask_t *srcp, int nbits)
{
        bitmap_complement(dstp->bits, srcp->bits, nbits);
}


static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int __cpus_equal(const cpumask_t *src1p,
                                        const cpumask_t *src2p, int nbits)
{
        return bitmap_equal(src1p->bits, src2p->bits, nbits);
}


static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int __cpus_intersects(const cpumask_t *src1p,
                                        const cpumask_t *src2p, int nbits)
{
        return bitmap_intersects(src1p->bits, src2p->bits, nbits);
}


static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int __cpus_subset(const cpumask_t *src1p,
                                        const cpumask_t *src2p, int nbits)
{
        return bitmap_subset(src1p->bits, src2p->bits, nbits);
}


static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int __cpus_empty(const cpumask_t *srcp, int nbits)
{
        return bitmap_empty(srcp->bits, nbits);
}


static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int __cpus_full(const cpumask_t *srcp, int nbits)
{
        return bitmap_full(srcp->bits, nbits);
}


static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int __cpus_weight(const cpumask_t *srcp, int nbits)
{
        return bitmap_weight(srcp->bits, nbits);
}



static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void __cpus_shift_right(cpumask_t *dstp,
                                        const cpumask_t *srcp, int n, int nbits)
{
        bitmap_shift_right(dstp->bits, srcp->bits, n, nbits);
}



static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void __cpus_shift_left(cpumask_t *dstp,
                                        const cpumask_t *srcp, int n, int nbits)
{
        bitmap_shift_left(dstp->bits, srcp->bits, n, nbits);
}


static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int __first_cpu(const cpumask_t *srcp, int nbits)
{
        return find_first_bit(srcp->bits, nbits);
}


static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int __next_cpu(int n, const cpumask_t *srcp, int nbits)
{
        return find_next_bit(srcp->bits, nbits, n+1);
}
# 264 "include/linux/cpumask.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int __cpumask_scnprintf(char *buf, int len,
                                        const cpumask_t *srcp, int nbits)
{
        return bitmap_scnprintf(buf, len, srcp->bits, nbits);
}



static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int __cpumask_parse(const char *buf, int len,
                                        cpumask_t *dstp, int nbits)
{
        return bitmap_parse(buf, len, dstp->bits, nbits);
}
# 343 "include/linux/cpumask.h"
extern cpumask_t cpu_possible_map;
extern cpumask_t cpu_online_map;
extern cpumask_t cpu_present_map;
# 16 "include/linux/sched.h" 2


# 1 "include/asm/semaphore.h" 1
# 41 "include/asm/semaphore.h"
# 1 "include/linux/wait.h" 1
# 14 "include/linux/wait.h"
# 1 "include/linux/list.h" 1






# 1 "include/linux/prefetch.h" 1
# 58 "include/linux/prefetch.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void prefetch_range(void *addr, size_t len)
{

        char *cp;
        char *end = addr + len;

        for (cp = addr; cp < end; cp += (4*(1 << (7))))
                prefetch(cp);

}
# 8 "include/linux/list.h" 2
# 28 "include/linux/list.h"
struct list_head {
        struct list_head *next, *prev;
};
# 47 "include/linux/list.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void __list_add(struct list_head *new,
                              struct list_head *prev,
                              struct list_head *next)
{
        next->prev = new;
        new->next = next;
        new->prev = prev;
        prev->next = new;
}
# 65 "include/linux/list.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void list_add(struct list_head *new, struct list_head *head)
{
        __list_add(new, head, head->next);
}
# 78 "include/linux/list.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void list_add_tail(struct list_head *new, struct list_head *head)
{
        __list_add(new, head->prev, head);
}







static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void __list_add_rcu(struct list_head * new,
                struct list_head * prev, struct list_head * next)
{
        new->next = next;
        new->prev = prev;
        __asm__ __volatile__ ("": : :"memory");
        next->prev = new;
        prev->next = new;
}
# 115 "include/linux/list.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void list_add_rcu(struct list_head *new, struct list_head *head)
{
        __list_add_rcu(new, head, head->next);
}
# 136 "include/linux/list.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void list_add_tail_rcu(struct list_head *new,
                                        struct list_head *head)
{
        __list_add_rcu(new, head->prev, head);
}
# 149 "include/linux/list.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void __list_del(struct list_head * prev, struct list_head * next)
{
        next->prev = prev;
        prev->next = next;
}







static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void list_del(struct list_head *entry)
{
        __list_del(entry->prev, entry->next);
        entry->next = ((void *) 0x00100100);
        entry->prev = ((void *) 0x00200200);
}
# 192 "include/linux/list.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void list_del_rcu(struct list_head *entry)
{
        __list_del(entry->prev, entry->next);
        entry->prev = ((void *) 0x00200200);
}





static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void list_del_init(struct list_head *entry)
{
        __list_del(entry->prev, entry->next);
        do { (entry)->next = (entry); (entry)->prev = (entry); } while (0);
}






static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void list_move(struct list_head *list, struct list_head *head)
{
        __list_del(list->prev, list->next);
        list_add(list, head);
}






static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void list_move_tail(struct list_head *list,
                                  struct list_head *head)
{
        __list_del(list->prev, list->next);
        list_add_tail(list, head);
}





static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int list_empty(const struct list_head *head)
{
        return head->next == head;
}
# 252 "include/linux/list.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int list_empty_careful(const struct list_head *head)
{
        struct list_head *next = head->next;
        return (next == head) && (next == head->prev);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void __list_splice(struct list_head *list,
                                 struct list_head *head)
{
        struct list_head *first = list->next;
        struct list_head *last = list->prev;
        struct list_head *at = head->next;

        first->prev = head;
        head->next = first;

        last->next = at;
        at->prev = last;
}






static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void list_splice(struct list_head *list, struct list_head *head)
{
        if (!list_empty(list))
                __list_splice(list, head);
}
# 290 "include/linux/list.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void list_splice_init(struct list_head *list,
                                    struct list_head *head)
{
        if (!list_empty(list)) {
                __list_splice(list, head);
                do { (list)->next = (list); (list)->prev = (list); } while (0);
        }
}
# 484 "include/linux/list.h"
struct hlist_head {
        struct hlist_node *first;
};

struct hlist_node {
        struct hlist_node *next, **pprev;
};






static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int hlist_unhashed(const struct hlist_node *h)
{
        return !h->pprev;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int hlist_empty(const struct hlist_head *h)
{
        return !h->first;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void __hlist_del(struct hlist_node *n)
{
        struct hlist_node *next = n->next;
        struct hlist_node **pprev = n->pprev;
        *pprev = next;
        if (next)
                next->pprev = pprev;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void hlist_del(struct hlist_node *n)
{
        __hlist_del(n);
        n->next = ((void *) 0x00100100);
        n->pprev = ((void *) 0x00200200);
}
# 542 "include/linux/list.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void hlist_del_rcu(struct hlist_node *n)
{
        __hlist_del(n);
        n->pprev = ((void *) 0x00200200);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void hlist_del_init(struct hlist_node *n)
{
        if (n->pprev) {
                __hlist_del(n);
                ((n)->next = ((void *)0), (n)->pprev = ((void *)0));
        }
}



static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void hlist_add_head(struct hlist_node *n, struct hlist_head *h)
{
        struct hlist_node *first = h->first;
        n->next = first;
        if (first)
                first->pprev = &n->next;
        h->first = n;
        n->pprev = &h->first;
}
# 588 "include/linux/list.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void hlist_add_head_rcu(struct hlist_node *n,
                                        struct hlist_head *h)
{
        struct hlist_node *first = h->first;
        n->next = first;
        n->pprev = &h->first;
        __asm__ __volatile__ ("": : :"memory");
        if (first)
                first->pprev = &n->next;
        h->first = n;
}


static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void hlist_add_before(struct hlist_node *n,
                                        struct hlist_node *next)
{
        n->pprev = next->pprev;
        n->next = next;
        next->pprev = &n->next;
        *(n->pprev) = n;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void hlist_add_after(struct hlist_node *n,
                                        struct hlist_node *next)
{
        next->next = n->next;
        n->next = next;
        next->pprev = &n->next;

        if(next->next)
                next->next->pprev = &next->next;
}
# 15 "include/linux/wait.h" 2




typedef struct __wait_queue wait_queue_t;
typedef int (*wait_queue_func_t)(wait_queue_t *wait, unsigned mode, int sync, void *key);
int default_wake_function(wait_queue_t *wait, unsigned mode, int sync, void *key);

struct __wait_queue {
        unsigned int flags;

        struct task_struct * task;
        wait_queue_func_t func;
        struct list_head task_list;
};

struct __wait_queue_head {
        spinlock_t lock;
        struct list_head task_list;
};
typedef struct __wait_queue_head wait_queue_head_t;
# 57 "include/linux/wait.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void init_waitqueue_head(wait_queue_head_t *q)
{
        q->lock = (spinlock_t) { 1 , 0xdead4ead };
        do { (&q->task_list)->next = (&q->task_list); (&q->task_list)->prev = (&q->task_list); } while (0);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void init_waitqueue_entry(wait_queue_t *q, struct task_struct *p)
{
        q->flags = 0;
        q->task = p;
        q->func = default_wake_function;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void init_waitqueue_func_entry(wait_queue_t *q,
                                        wait_queue_func_t func)
{
        q->flags = 0;
        q->task = ((void *)0);
        q->func = func;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int waitqueue_active(wait_queue_head_t *q)
{
        return !list_empty(&q->task_list);
}

extern void add_wait_queue(wait_queue_head_t *q, wait_queue_t * wait) __attribute__((regparm(3)));
extern void add_wait_queue_exclusive(wait_queue_head_t *q, wait_queue_t * wait) __attribute__((regparm(3)));
extern void remove_wait_queue(wait_queue_head_t *q, wait_queue_t * wait) __attribute__((regparm(3)));

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void __add_wait_queue(wait_queue_head_t *head, wait_queue_t *new)
{
        list_add(&new->task_list, &head->task_list);
}




static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void __add_wait_queue_tail(wait_queue_head_t *head,
                                                wait_queue_t *new)
{
        list_add_tail(&new->task_list, &head->task_list);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void __remove_wait_queue(wait_queue_head_t *head,
                                                        wait_queue_t *old)
{
        list_del(&old->task_list);
}

void __wake_up(wait_queue_head_t *q, unsigned int mode, int nr, void *key) __attribute__((regparm(3)));
extern void __wake_up_locked(wait_queue_head_t *q, unsigned int mode) __attribute__((regparm(3)));
extern void __wake_up_sync(wait_queue_head_t *q, unsigned int mode, int nr) __attribute__((regparm(3)));
# 225 "include/linux/wait.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void add_wait_queue_exclusive_locked(wait_queue_head_t *q,
                                                   wait_queue_t * wait)
{
        wait->flags |= 0x01;
        __add_wait_queue_tail(q, wait);
}




static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void remove_wait_queue_locked(wait_queue_head_t *q,
                                            wait_queue_t * wait)
{
        __remove_wait_queue(q, wait);
}






extern void sleep_on(wait_queue_head_t *q) __attribute__((regparm(3)));
extern long sleep_on_timeout(wait_queue_head_t *q, signed long timeout) __attribute__((regparm(3)));

extern void interruptible_sleep_on(wait_queue_head_t *q) __attribute__((regparm(3)));
extern long interruptible_sleep_on_timeout(wait_queue_head_t *q, signed long timeout) __attribute__((regparm(3)));





void prepare_to_wait(wait_queue_head_t *q, wait_queue_t *wait, int state) __attribute__((regparm(3)));

void prepare_to_wait_exclusive(wait_queue_head_t *q, wait_queue_t *wait, int state) __attribute__((regparm(3)));

void finish_wait(wait_queue_head_t *q, wait_queue_t *wait) __attribute__((regparm(3)));
int autoremove_wake_function(wait_queue_t *wait, unsigned mode, int sync, void *key);
# 42 "include/asm/semaphore.h" 2
# 1 "include/linux/rwsem.h" 1
# 22 "include/linux/rwsem.h"
struct rw_semaphore;




# 1 "include/asm/rwsem.h" 1
# 44 "include/asm/rwsem.h"
struct rwsem_waiter;

extern struct rw_semaphore *rwsem_down_read_failed(struct rw_semaphore *sem) __attribute__((regparm(3)));
extern struct rw_semaphore *rwsem_down_write_failed(struct rw_semaphore *sem) __attribute__((regparm(3)));
extern struct rw_semaphore *rwsem_wake(struct rw_semaphore *) __attribute__((regparm(3)));
extern struct rw_semaphore *rwsem_downgrade_wake(struct rw_semaphore *sem) __attribute__((regparm(3)));




struct rw_semaphore {
        signed long count;






        spinlock_t wait_lock;
        struct list_head wait_list;



};
# 85 "include/asm/rwsem.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void init_rwsem(struct rw_semaphore *sem)
{
        sem->count = 0x00000000;
        do { *(&sem->wait_lock) = (spinlock_t) { 1 , 0xdead4ead }; } while(0);
        do { (&sem->wait_list)->next = (&sem->wait_list); (&sem->wait_list)->prev = (&sem->wait_list); } while (0);



}




static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void __down_read(struct rw_semaphore *sem)
{
        __asm__ __volatile__(
                "# beginning down_read\n\t"
"lock ; " "  incl      (%%eax)\n\t"
                "  js        2f\n\t"
                "1:\n\t"
                ".subsection 1\n\t" "" ".ifndef " ".text.lock." "filemap" "\n\t" ".text.lock." "filemap" ":\n\t" ".endif\n\t"
                "2:\n\t"
                "  pushl     %%ecx\n\t"
                "  pushl     %%edx\n\t"
                "  call      rwsem_down_read_failed\n\t"
                "  popl      %%edx\n\t"
                "  popl      %%ecx\n\t"
                "  jmp       1b\n"
                ".previous\n\t"
                "# ending down_read\n\t"
                : "=m"(sem->count)
                : "a"(sem), "m"(sem->count)
                : "memory", "cc");
}




static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int __down_read_trylock(struct rw_semaphore *sem)
{
        __s32 result, tmp;
        __asm__ __volatile__(
                "# beginning __down_read_trylock\n\t"
                "  movl      %0,%1\n\t"
                "1:\n\t"
                "  movl	     %1,%2\n\t"
                "  addl      %3,%2\n\t"
                "  jle	     2f\n\t"
"lock ; " "  cmpxchgl  %2,%0\n\t"
                "  jnz	     1b\n\t"
                "2:\n\t"
                "# ending __down_read_trylock\n\t"
                : "+m"(sem->count), "=&a"(result), "=&r"(tmp)
                : "i"(0x00000001)
                : "memory", "cc");
        return result>=0 ? 1 : 0;
}




static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void __down_write(struct rw_semaphore *sem)
{
        int tmp;

        tmp = ((-0x00010000) + 0x00000001);
        __asm__ __volatile__(
                "# beginning down_write\n\t"
"lock ; " "  xadd      %%edx,(%%eax)\n\t"
                "  testl     %%edx,%%edx\n\t"
                "  jnz       2f\n\t"
                "1:\n\t"
                ".subsection 1\n\t" "" ".ifndef " ".text.lock." "filemap" "\n\t" ".text.lock." "filemap" ":\n\t" ".endif\n\t"
                "2:\n\t"
                "  pushl     %%ecx\n\t"
                "  call      rwsem_down_write_failed\n\t"
                "  popl      %%ecx\n\t"
                "  jmp       1b\n"
                ".previous\n\t"
                "# ending down_write"
                : "=m"(sem->count), "=d"(tmp)
                : "a"(sem), "1"(tmp), "m"(sem->count)
                : "memory", "cc");
}




static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int __down_write_trylock(struct rw_semaphore *sem)
{
        signed long ret = ((__typeof__(*(&sem->count)))__cmpxchg((&sem->count),(unsigned long)(0x00000000), (unsigned long)(((-0x00010000) + 0x00000001)),sizeof(*(&sem->count))));


        if (ret == 0x00000000)
                return 1;
        return 0;
}




static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void __up_read(struct rw_semaphore *sem)
{
        __s32 tmp = -0x00000001;
        __asm__ __volatile__(
                "# beginning __up_read\n\t"
"lock ; " "  xadd      %%edx,(%%eax)\n\t"
                "  js        2f\n\t"
                "1:\n\t"
                ".subsection 1\n\t" "" ".ifndef " ".text.lock." "filemap" "\n\t" ".text.lock." "filemap" ":\n\t" ".endif\n\t"
                "2:\n\t"
                "  decw      %%dx\n\t"
                "  jnz       1b\n\t"
                "  pushl     %%ecx\n\t"
                "  call      rwsem_wake\n\t"
                "  popl      %%ecx\n\t"
                "  jmp       1b\n"
                ".previous\n\t"
                "# ending __up_read\n"
                : "=m"(sem->count), "=d"(tmp)
                : "a"(sem), "1"(tmp), "m"(sem->count)
                : "memory", "cc");
}




static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void __up_write(struct rw_semaphore *sem)
{
        __asm__ __volatile__(
                "# beginning __up_write\n\t"
                "  movl      %2,%%edx\n\t"
"lock ; " "  xaddl     %%edx,(%%eax)\n\t"
                "  jnz       2f\n\t"
                "1:\n\t"
                ".subsection 1\n\t" "" ".ifndef " ".text.lock." "filemap" "\n\t" ".text.lock." "filemap" ":\n\t" ".endif\n\t"
                "2:\n\t"
                "  decw      %%dx\n\t"
                "  jnz       1b\n\t"
                "  pushl     %%ecx\n\t"
                "  call      rwsem_wake\n\t"
                "  popl      %%ecx\n\t"
                "  jmp       1b\n"
                ".previous\n\t"
                "# ending __up_write\n"
                : "=m"(sem->count)
                : "a"(sem), "i"(-((-0x00010000) + 0x00000001)), "m"(sem->count)
                : "memory", "cc", "edx");
}




static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void __downgrade_write(struct rw_semaphore *sem)
{
        __asm__ __volatile__(
                "# beginning __downgrade_write\n\t"
"lock ; " "  addl      %2,(%%eax)\n\t"
                "  js        2f\n\t"
                "1:\n\t"
                ".subsection 1\n\t" "" ".ifndef " ".text.lock." "filemap" "\n\t" ".text.lock." "filemap" ":\n\t" ".endif\n\t"
                "2:\n\t"
                "  pushl     %%ecx\n\t"
                "  pushl     %%edx\n\t"
                "  call      rwsem_downgrade_wake\n\t"
                "  popl      %%edx\n\t"
                "  popl      %%ecx\n\t"
                "  jmp       1b\n"
                ".previous\n\t"
                "# ending __downgrade_write\n"
                : "=m"(sem->count)
                : "a"(sem), "i"(-(-0x00010000)), "m"(sem->count)
                : "memory", "cc");
}




static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void rwsem_atomic_add(int delta, struct rw_semaphore *sem)
{
        __asm__ __volatile__(
"lock ; " "addl %1,%0"
                : "=m"(sem->count)
                : "ir"(delta), "m"(sem->count));
}




static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int rwsem_atomic_update(int delta, struct rw_semaphore *sem)
{
        int tmp = delta;

        __asm__ __volatile__(
"lock ; " "xadd %0,(%2)"
                : "+r"(tmp), "=m"(sem->count)
                : "r"(sem), "m"(sem->count)
                : "memory");

        return tmp+delta;
}
# 28 "include/linux/rwsem.h" 2
# 41 "include/linux/rwsem.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void down_read(struct rw_semaphore *sem)
{
        __might_sleep("include/linux/rwsem.h", 43);
        ;
        __down_read(sem);
        ;
}




static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int down_read_trylock(struct rw_semaphore *sem)
{
        int ret;
        ;
        ret = __down_read_trylock(sem);
        ;
        return ret;
}




static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void down_write(struct rw_semaphore *sem)
{
        __might_sleep("include/linux/rwsem.h", 66);
        ;
        __down_write(sem);
        ;
}




static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int down_write_trylock(struct rw_semaphore *sem)
{
        int ret;
        ;
        ret = __down_write_trylock(sem);
        ;
        return ret;
}




static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void up_read(struct rw_semaphore *sem)
{
        ;
        __up_read(sem);
        ;
}




static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void up_write(struct rw_semaphore *sem)
{
        ;
        __up_write(sem);
        ;
}




static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void downgrade_write(struct rw_semaphore *sem)
{
        ;
        __downgrade_write(sem);
        ;
}
# 43 "include/asm/semaphore.h" 2

struct semaphore {
        atomic_t count;
        int sleepers;
        wait_queue_head_t wait;



};
# 73 "include/asm/semaphore.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void sema_init (struct semaphore *sem, int val)
{






        (((&sem->count)->counter) = (val));
        sem->sleepers = 0;
        init_waitqueue_head(&sem->wait);



}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void init_MUTEX (struct semaphore *sem)
{
        sema_init(sem, 1);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void init_MUTEX_LOCKED (struct semaphore *sem)
{
        sema_init(sem, 0);
}

 __attribute__((regparm(0))) void __down_failed(void );
 __attribute__((regparm(0))) int __down_failed_interruptible(void );
 __attribute__((regparm(0))) int __down_failed_trylock(void );
 __attribute__((regparm(0))) void __up_wakeup(void );

 __attribute__((regparm(0))) void __down(struct semaphore * sem);
 __attribute__((regparm(0))) int __down_interruptible(struct semaphore * sem);
 __attribute__((regparm(0))) int __down_trylock(struct semaphore * sem);
 __attribute__((regparm(0))) void __up(struct semaphore * sem);






static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void down(struct semaphore * sem)
{



        __might_sleep("include/asm/semaphore.h", 119);
        __asm__ __volatile__(
                "# atomic down operation\n\t"
                "lock ; " "decl %0\n\t"
                "js 2f\n"
                "1:\n"
                ".subsection 1\n\t" "" ".ifndef " ".text.lock." "filemap" "\n\t" ".text.lock." "filemap" ":\n\t" ".endif\n\t"
                "2:\tcall __down_failed\n\t"
                "jmp 1b\n"
                ".previous\n\t"
                :"=m" (sem->count)
                :"c" (sem)
                :"memory");
}





static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int down_interruptible(struct semaphore * sem)
{
        int result;




        __might_sleep("include/asm/semaphore.h", 145);
        __asm__ __volatile__(
                "# atomic interruptible down operation\n\t"
                "lock ; " "decl %1\n\t"
                "js 2f\n\t"
                "xorl %0,%0\n"
                "1:\n"
                ".subsection 1\n\t" "" ".ifndef " ".text.lock." "filemap" "\n\t" ".text.lock." "filemap" ":\n\t" ".endif\n\t"
                "2:\tcall __down_failed_interruptible\n\t"
                "jmp 1b\n"
                ".previous\n\t"
                :"=a" (result), "=m" (sem->count)
                :"c" (sem)
                :"memory");
        return result;
}





static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int down_trylock(struct semaphore * sem)
{
        int result;





        __asm__ __volatile__(
                "# atomic interruptible down operation\n\t"
                "lock ; " "decl %1\n\t"
                "js 2f\n\t"
                "xorl %0,%0\n"
                "1:\n"
                ".subsection 1\n\t" "" ".ifndef " ".text.lock." "filemap" "\n\t" ".text.lock." "filemap" ":\n\t" ".endif\n\t"
                "2:\tcall __down_failed_trylock\n\t"
                "jmp 1b\n"
                ".previous\n\t"
                :"=a" (result), "=m" (sem->count)
                :"c" (sem)
                :"memory");
        return result;
}







static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void up(struct semaphore * sem)
{



        __asm__ __volatile__(
                "# atomic up operation\n\t"
                "lock ; " "incl %0\n\t"
                "jle 2f\n"
                "1:\n"
                ".subsection 1\n\t" "" ".ifndef " ".text.lock." "filemap" "\n\t" ".text.lock." "filemap" ":\n\t" ".endif\n\t"
                "2:\tcall __up_wakeup\n\t"
                "jmp 1b\n"
                ".previous\n\t"
                ".subsection 0\n"
                :"=m" (sem->count)
                :"c" (sem)
                :"memory");
}
# 19 "include/linux/sched.h" 2

# 1 "include/asm/ptrace.h" 1
# 26 "include/asm/ptrace.h"
struct pt_regs {
        long ebx;
        long ecx;
        long edx;
        long esi;
        long edi;
        long ebp;
        long eax;
        int xds;
        int xes;
        long orig_eax;
        long eip;
        int xcs;
        long eflags;
        long esp;
        int xss;
};
# 21 "include/linux/sched.h" 2
# 1 "include/asm/mmu.h" 1
# 11 "include/asm/mmu.h"
typedef struct {
        int size;
        struct semaphore sem;
        void *ldt;
} mm_context_t;
# 22 "include/linux/sched.h" 2

# 1 "include/linux/smp.h" 1
# 17 "include/linux/smp.h"
# 1 "include/asm/smp.h" 1
# 16 "include/asm/smp.h"
# 1 "include/asm/fixmap.h" 1
# 18 "include/asm/fixmap.h"
# 1 "include/asm/acpi.h" 1
# 58 "include/asm/acpi.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int
__acpi_acquire_global_lock (unsigned int *lock)
{
        unsigned int old, new, val;
        do {
                old = *lock;
                new = (((old & ~0x3) + 2) + ((old >> 1) & 0x1));
                val = ((__typeof__(*(lock)))__cmpxchg((lock),(unsigned long)(old), (unsigned long)(new),sizeof(*(lock))));
        } while (__builtin_expect(!!(val != old), 0));
        return (new < 3) ? -1 : 0;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int
__acpi_release_global_lock (unsigned int *lock)
{
        unsigned int old, new, val;
        do {
                old = *lock;
                new = old & ~0x3;
                val = ((__typeof__(*(lock)))__cmpxchg((lock),(unsigned long)(old), (unsigned long)(new),sizeof(*(lock))));
        } while (__builtin_expect(!!(val != old), 0));
        return old & 0x1;
}
# 106 "include/asm/acpi.h"
extern int acpi_lapic;
extern int acpi_ioapic;
extern int acpi_noirq;
extern int acpi_strict;
extern int acpi_disabled;
extern int acpi_ht;
extern int acpi_pci_disabled;
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void disable_acpi(void)
{
        acpi_disabled = 1;
        acpi_ht = 0;
        acpi_pci_disabled = 1;
        acpi_noirq = 1;
}




extern int acpi_gsi_to_irq(u32 gsi, unsigned int *irq);
extern int (*platform_rename_gsi)(int ioapic, int gsi);


extern int skip_ioapic_setup;
extern int acpi_skip_timer_override;

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void disable_ioapic_setup(void)
{
        skip_ioapic_setup = 1;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int ioapic_setup_disabled(void)
{
        return skip_ioapic_setup;
}
# 154 "include/asm/acpi.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void acpi_noirq_set(void) { acpi_noirq = 1; }
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void acpi_disable_pci(void)
{
        acpi_pci_disabled = 1;
        acpi_noirq_set();
}
extern int acpi_irq_balance_set(char *str);
# 170 "include/asm/acpi.h"
extern int acpi_save_state_mem(void);
extern int acpi_save_state_disk(void);
extern void acpi_restore_state_mem(void);

extern unsigned long acpi_wakeup_address;


extern void acpi_reserve_bootmem(void);
# 19 "include/asm/fixmap.h" 2
# 1 "include/asm/apicdef.h" 1
# 127 "include/asm/apicdef.h"
struct local_apic {

        struct { unsigned int __reserved[4]; } __reserved_01;

        struct { unsigned int __reserved[4]; } __reserved_02;

        struct {
                unsigned int __reserved_1 : 24,
                        phys_apic_id : 4,
                        __reserved_2 : 4;
                unsigned int __reserved[3];
        } id;

        const
        struct {
                unsigned int version : 8,
                        __reserved_1 : 8,
                        max_lvt : 8,
                        __reserved_2 : 8;
                unsigned int __reserved[3];
        } version;

        struct { unsigned int __reserved[4]; } __reserved_03;

        struct { unsigned int __reserved[4]; } __reserved_04;

        struct { unsigned int __reserved[4]; } __reserved_05;

        struct { unsigned int __reserved[4]; } __reserved_06;

        struct {
                unsigned int priority : 8,
                        __reserved_1 : 24;
                unsigned int __reserved_2[3];
        } tpr;

        const
        struct {
                unsigned int priority : 8,
                        __reserved_1 : 24;
                unsigned int __reserved_2[3];
        } apr;

        const
        struct {
                unsigned int priority : 8,
                        __reserved_1 : 24;
                unsigned int __reserved_2[3];
        } ppr;

        struct {
                unsigned int eoi;
                unsigned int __reserved[3];
        } eoi;

        struct { unsigned int __reserved[4]; } __reserved_07;

        struct {
                unsigned int __reserved_1 : 24,
                        logical_dest : 8;
                unsigned int __reserved_2[3];
        } ldr;

        struct {
                unsigned int __reserved_1 : 28,
                        model : 4;
                unsigned int __reserved_2[3];
        } dfr;

        struct {
                unsigned int spurious_vector : 8,
                        apic_enabled : 1,
                        focus_cpu : 1,
                        __reserved_2 : 22;
                unsigned int __reserved_3[3];
        } svr;

        struct {
                unsigned int bitfield;
                unsigned int __reserved[3];
        } isr [8];

        struct {
                unsigned int bitfield;
                unsigned int __reserved[3];
        } tmr [8];

        struct {
                unsigned int bitfield;
                unsigned int __reserved[3];
        } irr [8];

        union {
                struct {
                        unsigned int send_cs_error : 1,
                                receive_cs_error : 1,
                                send_accept_error : 1,
                                receive_accept_error : 1,
                                __reserved_1 : 1,
                                send_illegal_vector : 1,
                                receive_illegal_vector : 1,
                                illegal_register_address : 1,
                                __reserved_2 : 24;
                        unsigned int __reserved_3[3];
                } error_bits;
                struct {
                        unsigned int errors;
                        unsigned int __reserved_3[3];
                } all_errors;
        } esr;

        struct { unsigned int __reserved[4]; } __reserved_08;

        struct { unsigned int __reserved[4]; } __reserved_09;

        struct { unsigned int __reserved[4]; } __reserved_10;

        struct { unsigned int __reserved[4]; } __reserved_11;

        struct { unsigned int __reserved[4]; } __reserved_12;

        struct { unsigned int __reserved[4]; } __reserved_13;

        struct { unsigned int __reserved[4]; } __reserved_14;

        struct {
                unsigned int vector : 8,
                        delivery_mode : 3,
                        destination_mode : 1,
                        delivery_status : 1,
                        __reserved_1 : 1,
                        level : 1,
                        trigger : 1,
                        __reserved_2 : 2,
                        shorthand : 2,
                        __reserved_3 : 12;
                unsigned int __reserved_4[3];
        } icr1;

        struct {
                union {
                        unsigned int __reserved_1 : 24,
                                phys_dest : 4,
                                __reserved_2 : 4;
                        unsigned int __reserved_3 : 24,
                                logical_dest : 8;
                } dest;
                unsigned int __reserved_4[3];
        } icr2;

        struct {
                unsigned int vector : 8,
                        __reserved_1 : 4,
                        delivery_status : 1,
                        __reserved_2 : 3,
                        mask : 1,
                        timer_mode : 1,
                        __reserved_3 : 14;
                unsigned int __reserved_4[3];
        } lvt_timer;

        struct {
                unsigned int vector : 8,
                        delivery_mode : 3,
                        __reserved_1 : 1,
                        delivery_status : 1,
                        __reserved_2 : 3,
                        mask : 1,
                        __reserved_3 : 15;
                unsigned int __reserved_4[3];
        } lvt_thermal;

        struct {
                unsigned int vector : 8,
                        delivery_mode : 3,
                        __reserved_1 : 1,
                        delivery_status : 1,
                        __reserved_2 : 3,
                        mask : 1,
                        __reserved_3 : 15;
                unsigned int __reserved_4[3];
        } lvt_pc;

        struct {
                unsigned int vector : 8,
                        delivery_mode : 3,
                        __reserved_1 : 1,
                        delivery_status : 1,
                        polarity : 1,
                        remote_irr : 1,
                        trigger : 1,
                        mask : 1,
                        __reserved_2 : 15;
                unsigned int __reserved_3[3];
        } lvt_lint0;

        struct {
                unsigned int vector : 8,
                        delivery_mode : 3,
                        __reserved_1 : 1,
                        delivery_status : 1,
                        polarity : 1,
                        remote_irr : 1,
                        trigger : 1,
                        mask : 1,
                        __reserved_2 : 15;
                unsigned int __reserved_3[3];
        } lvt_lint1;

        struct {
                unsigned int vector : 8,
                        __reserved_1 : 4,
                        delivery_status : 1,
                        __reserved_2 : 3,
                        mask : 1,
                        __reserved_3 : 15;
                unsigned int __reserved_4[3];
        } lvt_error;

        struct {
                unsigned int initial_count;
                unsigned int __reserved_2[3];
        } timer_icr;

        const
        struct {
                unsigned int curr_count;
                unsigned int __reserved_2[3];
        } timer_ccr;

        struct { unsigned int __reserved[4]; } __reserved_16;

        struct { unsigned int __reserved[4]; } __reserved_17;

        struct { unsigned int __reserved[4]; } __reserved_18;

        struct { unsigned int __reserved[4]; } __reserved_19;

        struct {
                unsigned int divisor : 4,
                        __reserved_1 : 28;
                unsigned int __reserved_2[3];
        } timer_dcr;

        struct { unsigned int __reserved[4]; } __reserved_20;

} __attribute__ ((packed));
# 20 "include/asm/fixmap.h" 2



# 1 "include/asm/kmap_types.h" 1
# 12 "include/asm/kmap_types.h"
enum km_type {
__KM_FENCE_0 , KM_BOUNCE_READ,
__KM_FENCE_1 , KM_SKB_SUNRPC_DATA,
__KM_FENCE_2 , KM_SKB_DATA_SOFTIRQ,
__KM_FENCE_3 , KM_USER0,
__KM_FENCE_4 , KM_USER1,
__KM_FENCE_5 , KM_BIO_SRC_IRQ,
__KM_FENCE_6 , KM_BIO_DST_IRQ,
__KM_FENCE_7 , KM_PTE0,
__KM_FENCE_8 , KM_PTE1,
__KM_FENCE_9 , KM_IRQ0,
__KM_FENCE_10 , KM_IRQ1,
__KM_FENCE_11 , KM_SOFTIRQ0,
__KM_FENCE_12 , KM_SOFTIRQ1,
__KM_FENCE_13 , KM_TYPE_NR
};
# 24 "include/asm/fixmap.h" 2
# 44 "include/asm/fixmap.h"
enum fixed_addresses {
        FIX_HOLE,
        FIX_VSYSCALL,

        FIX_APIC_BASE,


        FIX_IO_APIC_BASE_0,
        FIX_IO_APIC_BASE_END = FIX_IO_APIC_BASE_0 + 8 -1,
# 67 "include/asm/fixmap.h"
        FIX_KMAP_BEGIN,
        FIX_KMAP_END = FIX_KMAP_BEGIN+(KM_TYPE_NR*8)-1,


        FIX_ACPI_BEGIN,
        FIX_ACPI_END = FIX_ACPI_BEGIN + 4 - 1,


        FIX_PCIE_MCFG,

        __end_of_permanent_fixed_addresses,


        FIX_BTMAP_END = __end_of_permanent_fixed_addresses,
        FIX_BTMAP_BEGIN = FIX_BTMAP_END + 16 - 1,
        FIX_WP_TEST,
        __end_of_fixed_addresses
};

extern void __set_fixmap (enum fixed_addresses idx,
                                        unsigned long phys, pgprot_t flags);
# 121 "include/asm/fixmap.h"
extern void __this_fixmap_does_not_exist(void);






static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned long fix_to_virt(const unsigned int idx)
{
# 139 "include/asm/fixmap.h"
        if (idx >= __end_of_fixed_addresses)
                __this_fixmap_does_not_exist();

        return ((0xfffff000UL) - ((idx) << 12));
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned long virt_to_fix(const unsigned long vaddr)
{
        do { if (__builtin_expect(!!((vaddr >= (0xfffff000UL) || vaddr < ((0xfffff000UL) - (__end_of_permanent_fixed_addresses << 12)))!=0), 0)) __asm__ __volatile__( "ud2\n" "\t.word %c0\n" "\t.long %c1\n" : : "i" (147), "i" ("include/asm/fixmap.h")); } while(0);
        return (((0xfffff000UL) - ((vaddr)&(~((1UL << 12)-1)))) >> 12);
}
# 17 "include/asm/smp.h" 2

# 1 "include/asm/mpspec.h" 1




# 1 "include/asm/mpspec_def.h" 1
# 19 "include/asm/mpspec_def.h"
struct intel_mp_floating
{
        char mpf_signature[4];
        unsigned long mpf_physptr;
        unsigned char mpf_length;
        unsigned char mpf_specification;
        unsigned char mpf_checksum;
        unsigned char mpf_feature1;
        unsigned char mpf_feature2;
        unsigned char mpf_feature3;
        unsigned char mpf_feature4;
        unsigned char mpf_feature5;
};

struct mp_config_table
{
        char mpc_signature[4];

        unsigned short mpc_length;
        char mpc_spec;
        char mpc_checksum;
        char mpc_oem[8];
        char mpc_productid[12];
        unsigned long mpc_oemptr;
        unsigned short mpc_oemsize;
        unsigned short mpc_oemcount;
        unsigned long mpc_lapic;
        unsigned long reserved;
};
# 58 "include/asm/mpspec_def.h"
struct mpc_config_processor
{
        unsigned char mpc_type;
        unsigned char mpc_apicid;
        unsigned char mpc_apicver;
        unsigned char mpc_cpuflag;


        unsigned long mpc_cpufeature;



        unsigned long mpc_featureflag;
        unsigned long mpc_reserved[2];
};

struct mpc_config_bus
{
        unsigned char mpc_type;
        unsigned char mpc_busid;
        unsigned char mpc_bustype[6] __attribute((packed));
};
# 102 "include/asm/mpspec_def.h"
struct mpc_config_ioapic
{
        unsigned char mpc_type;
        unsigned char mpc_apicid;
        unsigned char mpc_apicver;
        unsigned char mpc_flags;

        unsigned long mpc_apicaddr;
};

struct mpc_config_intsrc
{
        unsigned char mpc_type;
        unsigned char mpc_irqtype;
        unsigned short mpc_irqflag;
        unsigned char mpc_srcbus;
        unsigned char mpc_srcbusirq;
        unsigned char mpc_dstapic;
        unsigned char mpc_dstirq;
};

enum mp_irq_source_types {
        mp_INT = 0,
        mp_NMI = 1,
        mp_SMI = 2,
        mp_ExtINT = 3
};






struct mpc_config_lintsrc
{
        unsigned char mpc_type;
        unsigned char mpc_irqtype;
        unsigned short mpc_irqflag;
        unsigned char mpc_srcbusid;
        unsigned char mpc_srcbusirq;
        unsigned char mpc_destapic;

        unsigned char mpc_destapiclint;
};

struct mp_config_oemtable
{
        char oem_signature[4];

        unsigned short oem_length;
        char oem_rev;
        char oem_checksum;
        char mpc_oem[8];
};

struct mpc_config_translation
{
        unsigned char mpc_type;
        unsigned char trans_len;
        unsigned char trans_type;
        unsigned char trans_quad;
        unsigned char trans_global;
        unsigned char trans_local;
        unsigned short trans_reserved;
};
# 180 "include/asm/mpspec_def.h"
enum mp_bustype {
        MP_BUS_ISA = 1,
        MP_BUS_EISA,
        MP_BUS_PCI,
        MP_BUS_MCA,
        MP_BUS_NEC98
};
# 6 "include/asm/mpspec.h" 2
# 1 "include/asm-i386/mach-es7000/mach_mpspec.h" 1
# 7 "include/asm/mpspec.h" 2

extern int mp_bus_id_to_type [32];
extern int mp_bus_id_to_node [32];
extern int mp_bus_id_to_local [32];
extern int quad_local_to_mp_bus_id [8/4][4];
extern int mp_bus_id_to_pci_bus [32];

extern unsigned int boot_cpu_physical_apicid;
extern int smp_found_config;
extern void find_smp_config (void);
extern void get_smp_config (void);
extern int nr_ioapics;
extern int apic_version [256];
extern int mp_bus_id_to_type [32];
extern int mp_irq_entries;
extern struct mpc_config_intsrc mp_irqs [256];
extern int mpc_default_type;
extern int mp_bus_id_to_pci_bus [32];
extern int mp_current_pci_id;
extern unsigned long mp_lapic_addr;
extern int pic_mode;
extern int using_apic_timer;


extern void mp_register_lapic (u8 id, u8 enabled);
extern void mp_register_lapic_address (u64 address);
extern void mp_register_ioapic (u8 id, u32 address, u32 gsi_base);
extern void mp_override_legacy_irq (u8 bus_irq, u8 polarity, u8 trigger, u32 gsi);
extern void mp_config_acpi_legacy_irqs (void);
extern void mp_register_gsi (u32 gsi, int edge_level, int active_high_low);




struct physid_mask
{
        unsigned long mask[(((256)+32 -1)/32)];
};

typedef struct physid_mask physid_mask_t;
# 81 "include/asm/mpspec.h"
extern physid_mask_t phys_cpu_present_map;
# 19 "include/asm/smp.h" 2

# 1 "include/asm/io_apic.h" 1
# 17 "include/asm/io_apic.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int use_pci_vector(void) {return 1;}
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void disable_edge_ioapic_vector(unsigned int vector) { }
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void mask_and_ack_level_ioapic_vector(unsigned int vector) { }
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void end_edge_ioapic_vector (unsigned int vector) { }
# 65 "include/asm/io_apic.h"
union IO_APIC_reg_00 {
        u32 raw;
        struct {
                u32 __reserved_2 : 14,
                        LTS : 1,
                        delivery_type : 1,
                        __reserved_1 : 8,
                        ID : 8;
        } __attribute__ ((packed)) bits;
};

union IO_APIC_reg_01 {
        u32 raw;
        struct {
                u32 version : 8,
                        __reserved_2 : 7,
                        PRQ : 1,
                        entries : 8,
                        __reserved_1 : 8;
        } __attribute__ ((packed)) bits;
};

union IO_APIC_reg_02 {
        u32 raw;
        struct {
                u32 __reserved_2 : 24,
                        arbitration : 4,
                        __reserved_1 : 4;
        } __attribute__ ((packed)) bits;
};

union IO_APIC_reg_03 {
        u32 raw;
        struct {
                u32 boot_DT : 1,
                        __reserved_1 : 31;
        } __attribute__ ((packed)) bits;
};




extern int nr_ioapics;
extern int nr_ioapic_registers[8];

enum ioapic_irq_destination_types {
        dest_Fixed = 0,
        dest_LowestPrio = 1,
        dest_SMI = 2,
        dest__reserved_1 = 3,
        dest_NMI = 4,
        dest_INIT = 5,
        dest__reserved_2 = 6,
        dest_ExtINT = 7
};

struct IO_APIC_route_entry {
        __u32 vector : 8,
                delivery_mode : 3,



                dest_mode : 1,
                delivery_status : 1,
                polarity : 1,
                irr : 1,
                trigger : 1,
                mask : 1,
                __reserved_2 : 15;

        union { struct { __u32
                                        __reserved_1 : 24,
                                        physical_dest : 4,
                                        __reserved_2 : 4;
                        } physical;

                        struct { __u32
                                        __reserved_1 : 24,
                                        logical_dest : 8;
                        } logical;
        } dest;

} __attribute__ ((packed));






extern struct mpc_config_ioapic mp_ioapics[8];


extern int mp_irq_entries;


extern struct mpc_config_intsrc mp_irqs[256];


extern int mpc_default_type;

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned int io_apic_read(unsigned int apic, unsigned int reg)
{
        *((volatile int *)(((0xfffff000UL) - ((FIX_IO_APIC_BASE_0 + apic) << 12)) + (mp_ioapics[apic].mpc_apicaddr & ~(~((1UL << 12)-1))))) = reg;
        return *(((volatile int *)(((0xfffff000UL) - ((FIX_IO_APIC_BASE_0 + apic) << 12)) + (mp_ioapics[apic].mpc_apicaddr & ~(~((1UL << 12)-1)))))+4);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void io_apic_write(unsigned int apic, unsigned int reg, unsigned int value)
{
        *((volatile int *)(((0xfffff000UL) - ((FIX_IO_APIC_BASE_0 + apic) << 12)) + (mp_ioapics[apic].mpc_apicaddr & ~(~((1UL << 12)-1))))) = reg;
        *(((volatile int *)(((0xfffff000UL) - ((FIX_IO_APIC_BASE_0 + apic) << 12)) + (mp_ioapics[apic].mpc_apicaddr & ~(~((1UL << 12)-1)))))+4) = value;
}







extern int sis_apic_bug;
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void io_apic_modify(unsigned int apic, unsigned int reg, unsigned int value)
{
        if (sis_apic_bug)
                *((volatile int *)(((0xfffff000UL) - ((FIX_IO_APIC_BASE_0 + apic) << 12)) + (mp_ioapics[apic].mpc_apicaddr & ~(~((1UL << 12)-1))))) = reg;
        *(((volatile int *)(((0xfffff000UL) - ((FIX_IO_APIC_BASE_0 + apic) << 12)) + (mp_ioapics[apic].mpc_apicaddr & ~(~((1UL << 12)-1)))))+4) = value;
}


extern int skip_ioapic_setup;
# 201 "include/asm/io_apic.h"
extern int io_apic_get_unique_id (int ioapic, int apic_id);
extern int io_apic_get_version (int ioapic);
extern int io_apic_get_redir_entries (int ioapic);
extern int io_apic_set_pci_routing (int ioapic, int pin, int irq, int edge_level, int active_high_low);






extern int assign_irq_vector(int irq);
# 21 "include/asm/smp.h" 2

# 1 "include/asm/apic.h" 1




# 1 "include/linux/pm.h" 1
# 33 "include/linux/pm.h"
enum
{
        PM_SUSPEND,
        PM_RESUME,

        PM_SAVE_STATE,


        PM_SET_WAKEUP,


        PM_GET_RESOURCES,
        PM_SET_RESOURCES,


        PM_EJECT,
        PM_LOCK,
};

typedef int pm_request_t;




enum
{
        PM_UNKNOWN_DEV = 0,
        PM_SYS_DEV,
        PM_PCI_DEV,
        PM_USB_DEV,
        PM_SCSI_DEV,
        PM_ISA_DEV,
        PM_MTD_DEV,
};

typedef int pm_dev_t;




enum
{
        PM_SYS_UNKNOWN = 0x00000000,
        PM_SYS_KBC = 0x41d00303,
        PM_SYS_COM = 0x41d00500,
        PM_SYS_IRDA = 0x41d00510,
        PM_SYS_FDC = 0x41d00700,
        PM_SYS_VGA = 0x41d00900,
        PM_SYS_PCMCIA = 0x41d00e00,
};
# 92 "include/linux/pm.h"
struct pm_dev;

typedef int (*pm_callback)(struct pm_dev *dev, pm_request_t rqst, void *data);




struct pm_dev
{
        pm_dev_t type;
        unsigned long id;
        pm_callback callback;
        void *data;

        unsigned long flags;
        unsigned long state;
        unsigned long prev_state;

        struct list_head entry;
};



extern int pm_active;






struct pm_dev *pm_register(pm_dev_t type,
                           unsigned long id,
                           pm_callback callback);




void pm_unregister(struct pm_dev *dev);




void pm_unregister_all(pm_callback callback);




int pm_send(struct pm_dev *dev, pm_request_t rqst, void *data);




int pm_send_all(pm_request_t rqst, void *data);




struct pm_dev *pm_find(pm_dev_t type, struct pm_dev *from);

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void pm_access(struct pm_dev *dev) {}
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void pm_dev_idle(struct pm_dev *dev) {}
# 193 "include/linux/pm.h"
extern void (*pm_idle)(void);
extern void (*pm_power_off)(void);

enum {
        PM_SUSPEND_ON,
        PM_SUSPEND_STANDBY,
        PM_SUSPEND_MEM,
        PM_SUSPEND_DISK,
        PM_SUSPEND_MAX,
};

enum {
        PM_DISK_FIRMWARE = 1,
        PM_DISK_PLATFORM,
        PM_DISK_SHUTDOWN,
        PM_DISK_REBOOT,
        PM_DISK_MAX,
};


struct pm_ops {
        u32 pm_disk_mode;
        int (*prepare)(u32 state);
        int (*enter)(u32 state);
        int (*finish)(u32 state);
};

extern void pm_set_ops(struct pm_ops *);

extern int pm_suspend(u32 state);






struct device;

struct dev_pm_info {
        u32 power_state;

        u32 prev_state;
        u8 * saved_state;
        atomic_t pm_users;
        struct device * pm_parent;
        struct list_head entry;

};

extern void device_pm_set_parent(struct device * dev, struct device * parent);

extern int device_suspend(u32 state);
extern int device_power_down(u32 state);
extern void device_power_up(void);
extern void device_resume(void);
# 6 "include/asm/apic.h" 2
# 24 "include/asm/apic.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void apic_write(unsigned long reg, unsigned long v)
{
        *((volatile unsigned long *)((fix_to_virt(FIX_APIC_BASE))+reg)) = v;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void apic_write_atomic(unsigned long reg, unsigned long v)
{
        ((__typeof__(*((volatile unsigned long *)((fix_to_virt(FIX_APIC_BASE))+reg))))__xchg((unsigned long)(v),((volatile unsigned long *)((fix_to_virt(FIX_APIC_BASE))+reg)),sizeof(*((volatile unsigned long *)((fix_to_virt(FIX_APIC_BASE))+reg)))));
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned long apic_read(unsigned long reg)
{
        return *((volatile unsigned long *)((fix_to_virt(FIX_APIC_BASE))+reg));
}

static __inline__ __attribute__((always_inline)) void apic_wait_icr_idle(void)
{
        do { } while ( apic_read( 0x300 ) & 0x01000 );
}

int get_physical_broadcast(void);
# 56 "include/asm/apic.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void ack_APIC_irq(void)
{
# 66 "include/asm/apic.h"
        apic_write((0xB0),(0));
}

extern void (*wait_timer_tick)(void);

extern int get_maxlvt(void);
extern void clear_local_APIC(void);
extern void connect_bsp_APIC (void);
extern void disconnect_bsp_APIC (void);
extern void disable_local_APIC (void);
extern int verify_local_APIC (void);
extern void cache_APIC_registers (void);
extern void sync_Arb_IDs (void);
extern void init_bsp_APIC (void);
extern void setup_local_APIC (void);
extern void init_apic_mappings (void);
extern void smp_local_timer_interrupt (struct pt_regs * regs);
extern void setup_boot_APIC_clock (void);
extern void setup_secondary_APIC_clock (void);
extern void setup_apic_nmi_watchdog (void);
extern int reserve_lapic_nmi(void);
extern void release_lapic_nmi(void);
extern void disable_timer_nmi_watchdog(void);
extern void enable_timer_nmi_watchdog(void);
extern void nmi_watchdog_tick (struct pt_regs * regs);
extern int APIC_init_uniprocessor (void);
extern void disable_APIC_timer(void);
extern void enable_APIC_timer(void);

extern int check_nmi_watchdog (void);
extern void enable_NMI_through_LVT0 (void * dummy);

extern unsigned int nmi_watchdog;
# 23 "include/asm/smp.h" 2
# 34 "include/asm/smp.h"
extern void smp_alloc_memory(void);
extern int pic_mode;
extern int smp_num_siblings;
extern cpumask_t cpu_sibling_map[];

extern void smp_flush_tlb(void);
extern void smp_message_irq(int cpl, void *dev_id, struct pt_regs *regs);
extern void smp_invalidate_rcv(void);
extern void (*mtrr_hook) (void);
extern void zap_low_mappings (void);
# 54 "include/asm/smp.h"
extern cpumask_t cpu_callout_map;



static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int num_booting_cpus(void)
{
        return __cpus_weight(&(cpu_callout_map), 8);
}

extern void map_cpu_to_logical_apicid(void);
extern void unmap_cpu_to_logical_apicid(int cpu);






# 1 "include/asm-i386/mach-es7000/mach_apicdef.h" 1





static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned get_apic_id(unsigned long x)
{
        return (((x)>>24)&0xFF);
}
# 72 "include/asm/smp.h" 2
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int hard_smp_processor_id(void)
{

        return get_apic_id(*(unsigned long *)((fix_to_virt(FIX_APIC_BASE))+0x20));
}


static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int logical_smp_processor_id(void)
{

        return (((*(unsigned long *)((fix_to_virt(FIX_APIC_BASE))+0xD0))>>24)&0xFF);
}
# 18 "include/linux/smp.h" 2
# 28 "include/linux/smp.h"
extern void smp_send_stop(void);




extern void smp_send_reschedule(int cpu);





extern void smp_prepare_cpus(unsigned int max_cpus);




extern int __cpu_up(unsigned int cpunum);




extern void smp_cpus_done(unsigned int max_cpus);




extern int smp_call_function (void (*func) (void *info), void *info,
                              int retry, int wait);




static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int on_each_cpu(void (*func) (void *info), void *info,
                              int retry, int wait)
{
        int ret = 0;

        do { do { (current_thread_info()->preempt_count)++; } while (0); __asm__ __volatile__("": : :"memory"); } while (0);
        ret = smp_call_function(func, info, retry, wait);
        func(info);
        do { do { __asm__ __volatile__("": : :"memory"); do { (current_thread_info()->preempt_count)--; } while (0); } while (0); do { if (__builtin_expect(!!(test_thread_flag(3)), 0)) preempt_schedule(); } while (0); } while (0);
        return ret;
}




extern int smp_threads_ready;
# 91 "include/linux/smp.h"
void smp_prepare_boot_cpu(void);
# 24 "include/linux/sched.h" 2
# 1 "include/linux/sem.h" 1



# 1 "include/linux/ipc.h" 1
# 9 "include/linux/ipc.h"
struct ipc_perm
{
        __kernel_key_t key;
        __kernel_uid_t uid;
        __kernel_gid_t gid;
        __kernel_uid_t cuid;
        __kernel_gid_t cgid;
        __kernel_mode_t mode;
        unsigned short seq;
};


# 1 "include/asm/ipcbuf.h" 1
# 14 "include/asm/ipcbuf.h"
struct ipc64_perm
{
        __kernel_key_t key;
        __kernel_uid32_t uid;
        __kernel_gid32_t gid;
        __kernel_uid32_t cuid;
        __kernel_gid32_t cgid;
        __kernel_mode_t mode;
        unsigned short __pad1;
        unsigned short seq;
        unsigned short __pad2;
        unsigned long __unused1;
        unsigned long __unused2;
};
# 22 "include/linux/ipc.h" 2
# 57 "include/linux/ipc.h"
struct kern_ipc_perm
{
        spinlock_t lock;
        int deleted;
        key_t key;
        uid_t uid;
        gid_t gid;
        uid_t cuid;
        gid_t cgid;
        mode_t mode;
        unsigned long seq;
        void *security;
};
# 5 "include/linux/sem.h" 2
# 24 "include/linux/sem.h"
struct semid_ds {
        struct ipc_perm sem_perm;
        __kernel_time_t sem_otime;
        __kernel_time_t sem_ctime;
        struct sem *sem_base;
        struct sem_queue *sem_pending;
        struct sem_queue **sem_pending_last;
        struct sem_undo *undo;
        unsigned short sem_nsems;
};


# 1 "include/asm/sembuf.h" 1
# 14 "include/asm/sembuf.h"
struct semid64_ds {
        struct ipc64_perm sem_perm;
        __kernel_time_t sem_otime;
        unsigned long __unused1;
        __kernel_time_t sem_ctime;
        unsigned long __unused2;
        unsigned long sem_nsems;
        unsigned long __unused3;
        unsigned long __unused4;
};
# 37 "include/linux/sem.h" 2


struct sembuf {
        unsigned short sem_num;
        short sem_op;
        short sem_flg;
};


union semun {
        int val;
        struct semid_ds *buf;
        unsigned short *array;
        struct seminfo *__buf;
        void *__pad;
};

struct seminfo {
        int semmap;
        int semmni;
        int semmns;
        int semmnu;
        int semmsl;
        int semopm;
        int semume;
        int semusz;
        int semvmx;
        int semaem;
};
# 83 "include/linux/sem.h"
struct sem {
        int semval;
        int sempid;
};


struct sem_array {
        struct kern_ipc_perm sem_perm;
        time_t sem_otime;
        time_t sem_ctime;
        struct sem *sem_base;
        struct sem_queue *sem_pending;
        struct sem_queue **sem_pending_last;
        struct sem_undo *undo;
        unsigned long sem_nsems;
};


struct sem_queue {
        struct sem_queue * next;
        struct sem_queue ** prev;
        struct task_struct* sleeper;
        struct sem_undo * undo;
        int pid;
        int status;
        struct sem_array * sma;
        int id;
        struct sembuf * sops;
        int nsops;
};




struct sem_undo {
        struct sem_undo * proc_next;
        struct sem_undo * id_next;
        int semid;
        short * semadj;
};




struct sem_undo_list {
        atomic_t refcnt;
        spinlock_t lock;
        struct sem_undo *proc_list;
};

struct sysv_sem {
        struct sem_undo_list *undo_list;
};



extern int copy_semundo(unsigned long clone_flags, struct task_struct *tsk);
extern void exit_sem(struct task_struct *tsk);
# 25 "include/linux/sched.h" 2
# 1 "include/linux/signal.h" 1





# 1 "include/asm/signal.h" 1
# 10 "include/asm/signal.h"
struct siginfo;
# 20 "include/asm/signal.h"
typedef unsigned long old_sigset_t;

typedef struct {
        unsigned long sig[(64 / 32)];
} sigset_t;
# 132 "include/asm/signal.h"
typedef void __signalfn_t(int);
typedef __signalfn_t *__sighandler_t;

typedef void __restorefn_t(void);
typedef __restorefn_t *__sigrestore_t;






struct old_sigaction {
        __sighandler_t sa_handler;
        old_sigset_t sa_mask;
        unsigned long sa_flags;
        __sigrestore_t sa_restorer;
};

struct sigaction {
        __sighandler_t sa_handler;
        unsigned long sa_flags;
        __sigrestore_t sa_restorer;
        sigset_t sa_mask;
};

struct k_sigaction {
        struct sigaction sa;
};
# 178 "include/asm/signal.h"
typedef struct sigaltstack {
        void *ss_sp;
        int ss_flags;
        size_t ss_size;
} stack_t;






static __inline__ __attribute__((always_inline)) void sigaddset(sigset_t *set, int _sig)
{
        __asm__("btsl %1,%0" : "=m"(*set) : "Ir"(_sig - 1) : "cc");
}

static __inline__ __attribute__((always_inline)) void sigdelset(sigset_t *set, int _sig)
{
        __asm__("btrl %1,%0" : "=m"(*set) : "Ir"(_sig - 1) : "cc");
}

static __inline__ __attribute__((always_inline)) int __const_sigismember(sigset_t *set, int _sig)
{
        unsigned long sig = _sig - 1;
        return 1 & (set->sig[sig / 32] >> (sig % 32));
}

static __inline__ __attribute__((always_inline)) int __gen_sigismember(sigset_t *set, int _sig)
{
        int ret;
        __asm__("btl %2,%1\n\tsbbl %0,%0"
                : "=r"(ret) : "m"(*set), "Ir"(_sig-1) : "cc");
        return ret;
}






static __inline__ __attribute__((always_inline)) int sigfindinword(unsigned long word)
{
        __asm__("bsfl %1,%0" : "=r"(word) : "rm"(word) : "cc");
        return word;
}

struct pt_regs;
extern int do_signal(struct pt_regs *regs, sigset_t *oldset) __attribute__((regparm(3)));
# 7 "include/linux/signal.h" 2
# 1 "include/asm/siginfo.h" 1



# 1 "include/asm-generic/siginfo.h" 1






typedef union sigval {
        int sival_int;
        void *sival_ptr;
} sigval_t;
# 40 "include/asm-generic/siginfo.h"
typedef struct siginfo {
        int si_signo;
        int si_errno;
        int si_code;

        union {
                int _pad[((128 - (3 * sizeof(int))) / sizeof(int))];


                struct {
                        pid_t _pid;
                        uid_t _uid;
                } _kill;


                struct {
                        timer_t _tid;
                        int _overrun;
                        char _pad[sizeof( uid_t) - sizeof(int)];
                        sigval_t _sigval;
                        int _sys_private;
                } _timer;


                struct {
                        pid_t _pid;
                        uid_t _uid;
                        sigval_t _sigval;
                } _rt;


                struct {
                        pid_t _pid;
                        uid_t _uid;
                        int _status;
                        clock_t _utime;
                        clock_t _stime;
                } _sigchld;


                struct {
                        void *_addr;



                } _sigfault;


                struct {
                        long _band;
                        int _fd;
                } _sigpoll;
        } _sifields;
} siginfo_t;
# 249 "include/asm-generic/siginfo.h"
typedef struct sigevent {
        sigval_t sigev_value;
        int sigev_signo;
        int sigev_notify;
        union {
                int _pad[((64/sizeof(int)) - 3)];
                 int _tid;

                struct {
                        void (*_function)(sigval_t);
                        void *_attribute;
                } _sigev_thread;
        } _sigev_un;
} sigevent_t;
# 272 "include/asm-generic/siginfo.h"
struct siginfo;
void do_schedule_next_timer(struct siginfo *info);





static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void copy_siginfo(struct siginfo *to, struct siginfo *from)
{
        if (from->si_code < 0)
                (__builtin_constant_p(sizeof(*to)) ? __constant_memcpy((to),(from),(sizeof(*to))) : __memcpy((to),(from),(sizeof(*to))));
        else

                (__builtin_constant_p((3 * sizeof(int)) + sizeof(from->_sifields._sigchld)) ? __constant_memcpy((to),(from),((3 * sizeof(int)) + sizeof(from->_sifields._sigchld))) : __memcpy((to),(from),((3 * sizeof(int)) + sizeof(from->_sifields._sigchld))));
}



extern int copy_siginfo_to_user(struct siginfo *to, struct siginfo *from);
# 5 "include/asm/siginfo.h" 2
# 8 "include/linux/signal.h" 2
# 17 "include/linux/signal.h"
struct sigqueue {
        struct list_head list;
        spinlock_t *lock;
        int flags;
        siginfo_t info;
        struct user_struct *user;
};




struct sigpending {
        struct list_head list;
        sigset_t signal;
};
# 106 "include/linux/signal.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void sigorsets(sigset_t *r, const sigset_t *a, const sigset_t *b) { extern void _NSIG_WORDS_is_unsupported_size(void); unsigned long a0, a1, a2, a3, b0, b1, b2, b3; switch ((64 / 32)) { case 4: a3 = a->sig[3]; a2 = a->sig[2]; b3 = b->sig[3]; b2 = b->sig[2]; r->sig[3] = ((a3) | (b3)); r->sig[2] = ((a2) | (b2)); case 2: a1 = a->sig[1]; b1 = b->sig[1]; r->sig[1] = ((a1) | (b1)); case 1: a0 = a->sig[0]; b0 = b->sig[0]; r->sig[0] = ((a0) | (b0)); break; default: _NSIG_WORDS_is_unsupported_size(); } }


static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void sigandsets(sigset_t *r, const sigset_t *a, const sigset_t *b) { extern void _NSIG_WORDS_is_unsupported_size(void); unsigned long a0, a1, a2, a3, b0, b1, b2, b3; switch ((64 / 32)) { case 4: a3 = a->sig[3]; a2 = a->sig[2]; b3 = b->sig[3]; b2 = b->sig[2]; r->sig[3] = ((a3) & (b3)); r->sig[2] = ((a2) & (b2)); case 2: a1 = a->sig[1]; b1 = b->sig[1]; r->sig[1] = ((a1) & (b1)); case 1: a0 = a->sig[0]; b0 = b->sig[0]; r->sig[0] = ((a0) & (b0)); break; default: _NSIG_WORDS_is_unsupported_size(); } }


static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void signandsets(sigset_t *r, const sigset_t *a, const sigset_t *b) { extern void _NSIG_WORDS_is_unsupported_size(void); unsigned long a0, a1, a2, a3, b0, b1, b2, b3; switch ((64 / 32)) { case 4: a3 = a->sig[3]; a2 = a->sig[2]; b3 = b->sig[3]; b2 = b->sig[2]; r->sig[3] = ((a3) & ~(b3)); r->sig[2] = ((a2) & ~(b2)); case 2: a1 = a->sig[1]; b1 = b->sig[1]; r->sig[1] = ((a1) & ~(b1)); case 1: a0 = a->sig[0]; b0 = b->sig[0]; r->sig[0] = ((a0) & ~(b0)); break; default: _NSIG_WORDS_is_unsupported_size(); } }
# 136 "include/linux/signal.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void signotset(sigset_t *set) { extern void _NSIG_WORDS_is_unsupported_size(void); switch ((64 / 32)) { case 4: set->sig[3] = (~(set->sig[3])); set->sig[2] = (~(set->sig[2])); case 2: set->sig[1] = (~(set->sig[1])); case 1: set->sig[0] = (~(set->sig[0])); break; default: _NSIG_WORDS_is_unsupported_size(); } }




static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void sigemptyset(sigset_t *set)
{
        switch ((64 / 32)) {
        default:
                (__builtin_constant_p(0) ? (__builtin_constant_p((sizeof(sigset_t))) ? __constant_c_and_count_memset(((set)),((0x01010101UL*(unsigned char)(0))),((sizeof(sigset_t)))) : __constant_c_memset(((set)),((0x01010101UL*(unsigned char)(0))),((sizeof(sigset_t))))) : (__builtin_constant_p((sizeof(sigset_t))) ? __memset_generic((((set))),(((0))),(((sizeof(sigset_t))))) : __memset_generic(((set)),((0)),((sizeof(sigset_t))))));
                break;
        case 2: set->sig[1] = 0;
        case 1: set->sig[0] = 0;
                break;
        }
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void sigfillset(sigset_t *set)
{
        switch ((64 / 32)) {
        default:
                (__builtin_constant_p(-1) ? (__builtin_constant_p((sizeof(sigset_t))) ? __constant_c_and_count_memset(((set)),((0x01010101UL*(unsigned char)(-1))),((sizeof(sigset_t)))) : __constant_c_memset(((set)),((0x01010101UL*(unsigned char)(-1))),((sizeof(sigset_t))))) : (__builtin_constant_p((sizeof(sigset_t))) ? __memset_generic((((set))),(((-1))),(((sizeof(sigset_t))))) : __memset_generic(((set)),((-1)),((sizeof(sigset_t))))));
                break;
        case 2: set->sig[1] = -1;
        case 1: set->sig[0] = -1;
                break;
        }
}



static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void sigaddsetmask(sigset_t *set, unsigned long mask)
{
        set->sig[0] |= mask;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void sigdelsetmask(sigset_t *set, unsigned long mask)
{
        set->sig[0] &= ~mask;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int sigtestsetmask(sigset_t *set, unsigned long mask)
{
        return (set->sig[0] & mask) != 0;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void siginitset(sigset_t *set, unsigned long mask)
{
        set->sig[0] = mask;
        switch ((64 / 32)) {
        default:
                (__builtin_constant_p(0) ? (__builtin_constant_p((sizeof(long)*((64 / 32)-1))) ? __constant_c_and_count_memset(((&set->sig[1])),((0x01010101UL*(unsigned char)(0))),((sizeof(long)*((64 / 32)-1)))) : __constant_c_memset(((&set->sig[1])),((0x01010101UL*(unsigned char)(0))),((sizeof(long)*((64 / 32)-1))))) : (__builtin_constant_p((sizeof(long)*((64 / 32)-1))) ? __memset_generic((((&set->sig[1]))),(((0))),(((sizeof(long)*((64 / 32)-1))))) : __memset_generic(((&set->sig[1])),((0)),((sizeof(long)*((64 / 32)-1))))));
                break;
        case 2: set->sig[1] = 0;
        case 1: ;
        }
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void siginitsetinv(sigset_t *set, unsigned long mask)
{
        set->sig[0] = ~mask;
        switch ((64 / 32)) {
        default:
                (__builtin_constant_p(-1) ? (__builtin_constant_p((sizeof(long)*((64 / 32)-1))) ? __constant_c_and_count_memset(((&set->sig[1])),((0x01010101UL*(unsigned char)(-1))),((sizeof(long)*((64 / 32)-1)))) : __constant_c_memset(((&set->sig[1])),((0x01010101UL*(unsigned char)(-1))),((sizeof(long)*((64 / 32)-1))))) : (__builtin_constant_p((sizeof(long)*((64 / 32)-1))) ? __memset_generic((((&set->sig[1]))),(((-1))),(((sizeof(long)*((64 / 32)-1))))) : __memset_generic(((&set->sig[1])),((-1)),((sizeof(long)*((64 / 32)-1))))));
                break;
        case 2: set->sig[1] = -1;
        case 1: ;
        }
}



static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void init_sigpending(struct sigpending *sig)
{
        sigemptyset(&sig->signal);
        do { (&sig->list)->next = (&sig->list); (&sig->list)->prev = (&sig->list); } while (0);
}

extern int group_send_sig_info(int sig, struct siginfo *info, struct task_struct *p);
extern long do_sigpending(void *, unsigned long);
extern int sigprocmask(int, sigset_t *, sigset_t *);


struct pt_regs;
extern int get_signal_to_deliver(siginfo_t *info, struct pt_regs *regs, void *cookie);
# 26 "include/linux/sched.h" 2
# 1 "include/linux/securebits.h" 1





extern unsigned securebits;
# 27 "include/linux/sched.h" 2
# 1 "include/linux/fs_struct.h" 1



struct dentry;
struct vfsmount;

struct fs_struct {
        atomic_t count;
        rwlock_t lock;
        int umask;
        struct dentry * root, * pwd, * altroot;
        struct vfsmount * rootmnt, * pwdmnt, * altrootmnt;
};







extern void exit_fs(struct task_struct *);
extern void set_fs_altroot(void);
extern void set_fs_root(struct fs_struct *, struct vfsmount *, struct dentry *);
extern void set_fs_pwd(struct fs_struct *, struct vfsmount *, struct dentry *);
extern struct fs_struct *copy_fs_struct(struct fs_struct *);
extern void put_fs_struct(struct fs_struct *);
# 28 "include/linux/sched.h" 2

# 1 "include/linux/completion.h" 1
# 13 "include/linux/completion.h"
struct completion {
        unsigned int done;
        wait_queue_head_t wait;
};







static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void init_completion(struct completion *x)
{
        x->done = 0;
        init_waitqueue_head(&x->wait);
}

extern void wait_for_completion(struct completion *) __attribute__((regparm(3)));
extern void complete(struct completion *) __attribute__((regparm(3)));
extern void complete_all(struct completion *) __attribute__((regparm(3)));
# 30 "include/linux/sched.h" 2
# 1 "include/linux/pid.h" 1



enum pid_type
{
        PIDTYPE_PID,
        PIDTYPE_TGID,
        PIDTYPE_PGID,
        PIDTYPE_SID,
        PIDTYPE_MAX
};

struct pid
{
        int nr;
        atomic_t count;
        struct task_struct *task;
        struct list_head task_list;
        struct list_head hash_chain;
};

struct pid_link
{
        struct list_head pid_chain;
        struct pid *pidptr;
        struct pid pid;
};
# 36 "include/linux/pid.h"
extern int attach_pid(struct task_struct *task, enum pid_type type, int nr) __attribute__((regparm(3)));

extern void link_pid(struct task_struct *task, struct pid_link *link, struct pid *pid) __attribute__((regparm(3)));




extern void detach_pid(struct task_struct *task, enum pid_type) __attribute__((regparm(3)));





extern struct pid *find_pid(enum pid_type, int) __attribute__((regparm(3)));

extern int alloc_pidmap(void);
extern void free_pidmap(int) __attribute__((regparm(3)));
extern void switch_exec_pids(struct task_struct *leader, struct task_struct *thread);
# 31 "include/linux/sched.h" 2
# 1 "include/linux/percpu.h" 1



# 1 "include/linux/slab.h" 1
# 12 "include/linux/slab.h"
typedef struct kmem_cache_s kmem_cache_t;


# 1 "include/linux/gfp.h" 1



# 1 "include/linux/mmzone.h" 1
# 13 "include/linux/mmzone.h"
# 1 "include/linux/numa.h" 1
# 14 "include/linux/mmzone.h" 2
# 35 "include/linux/mmzone.h"
struct free_area {
        struct list_head free_list;
        unsigned long *map;
};

struct pglist_data;
# 49 "include/linux/mmzone.h"
struct zone_padding {
        int x;
} __attribute__((__aligned__(1 << (7))));





struct per_cpu_pages {
        int count;
        int low;
        int high;
        int batch;
        struct list_head list;
};

struct per_cpu_pageset {
        struct per_cpu_pages pcp[2];
# 75 "include/linux/mmzone.h"
} __attribute__((__aligned__((1 << (7)))));
# 122 "include/linux/mmzone.h"
struct zone {



        spinlock_t lock;
        unsigned long free_pages;
        unsigned long pages_min, pages_low, pages_high;
# 141 "include/linux/mmzone.h"
        unsigned long protection[3];

        struct zone_padding _pad1_;

        spinlock_t lru_lock;
        struct list_head active_list;
        struct list_head inactive_list;
        unsigned long nr_scan_active;
        unsigned long nr_scan_inactive;
        unsigned long nr_active;
        unsigned long nr_inactive;
        int all_unreclaimable;
        unsigned long pages_scanned;

        struct zone_padding _pad2_;
# 173 "include/linux/mmzone.h"
        int temp_priority;
        int prev_priority;




        struct free_area free_area[11];
# 205 "include/linux/mmzone.h"
        wait_queue_head_t * wait_table;
        unsigned long wait_table_size;
        unsigned long wait_table_bits;

        struct zone_padding _pad3_;

        struct per_cpu_pageset pageset[8];




        struct pglist_data *zone_pgdat;
        struct page *zone_mem_map;

        unsigned long zone_start_pfn;




        char *name;
        unsigned long spanned_pages;
        unsigned long present_pages;
} __attribute__((__aligned__(1 << (7))));
# 248 "include/linux/mmzone.h"
struct zonelist {
        struct zone *zones[(1 << 0) * 3 + 1];
};
# 264 "include/linux/mmzone.h"
struct bootmem_data;
typedef struct pglist_data {
        struct zone node_zones[3];
        struct zonelist node_zonelists[((0x03 + 1) / 2 + 1)];
        int nr_zones;
        struct page *node_mem_map;
        struct bootmem_data *bdata;
        unsigned long node_start_pfn;
        unsigned long node_present_pages;
        unsigned long node_spanned_pages;

        int node_id;
        struct pglist_data *pgdat_next;
        wait_queue_head_t kswapd_wait;
        struct task_struct *kswapd;
} pg_data_t;




extern int numnodes;
extern struct pglist_data *pgdat_list;

void get_zone_counts(unsigned long *active, unsigned long *inactive,
                        unsigned long *free);
void build_all_zonelists(void);
void wakeup_kswapd(struct zone *zone);
# 315 "include/linux/mmzone.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct zone *next_zone(struct zone *zone)
{
        pg_data_t *pgdat = zone->zone_pgdat;

        if (zone - pgdat->node_zones < 3 - 1)
                zone++;
        else if (pgdat->pgdat_next) {
                pgdat = pgdat->pgdat_next;
                zone = pgdat->node_zones;
        } else
                zone = ((void *)0);

        return zone;
}
# 348 "include/linux/mmzone.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int is_highmem_idx(int idx)
{
        return (idx == 2);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int is_normal_idx(int idx)
{
        return (idx == 1);
}






static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int is_highmem(struct zone *zone)
{
        return (is_highmem_idx(zone - zone->zone_pgdat->node_zones));
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int is_normal(struct zone *zone)
{
        return (is_normal_idx(zone - zone->zone_pgdat->node_zones));
}


struct ctl_table;
struct file;
int min_free_kbytes_sysctl_handler(struct ctl_table *, int, struct file *,
                                        void *, size_t *, loff_t *);
int lower_zone_protection_sysctl_handler(struct ctl_table *, int, struct file *,
                                        void *, size_t *, loff_t *);

# 1 "include/linux/topology.h" 1
# 32 "include/linux/topology.h"
# 1 "include/linux/mmzone.h" 1
# 33 "include/linux/topology.h" 2


# 1 "include/asm/topology.h" 1
# 81 "include/asm/topology.h"
# 1 "include/asm-generic/topology.h" 1
# 82 "include/asm/topology.h" 2
# 36 "include/linux/topology.h" 2
# 46 "include/linux/topology.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int __next_node_with_cpus(int node)
{
        do
                ++node;
        while (node < numnodes && !({ cpumask_t __tmp__; __tmp__ = (cpu_online_map); __cpus_weight(&(__tmp__), 8); }));
        return node;
}
# 382 "include/linux/mmzone.h" 2





extern struct pglist_data contig_page_data;
# 423 "include/linux/mmzone.h"
extern unsigned long node_online_map[((((1 << 0))+32 -1)/32)];
# 5 "include/linux/gfp.h" 2




struct vm_area_struct;
# 76 "include/linux/gfp.h"
extern struct page *
__alloc_pages(unsigned int, unsigned int, struct zonelist *) __attribute__((regparm(3)));

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct page *alloc_pages_node(int nid, unsigned int gfp_mask,
                                                unsigned int order)
{
        if (__builtin_expect(!!(order >= 11), 0))
                return ((void *)0);

        return __alloc_pages(gfp_mask, order,
                (&contig_page_data)->node_zonelists + (gfp_mask & 0x03));
}
# 109 "include/linux/gfp.h"
extern unsigned long __get_free_pages(unsigned int gfp_mask, unsigned int order) __attribute__((regparm(3)));
extern unsigned long get_zeroed_page(unsigned int gfp_mask) __attribute__((regparm(3)));







extern void __free_pages(struct page *page, unsigned int order) __attribute__((regparm(3)));
extern void free_pages(unsigned long addr, unsigned int order) __attribute__((regparm(3)));
extern void free_hot_page(struct page *page) __attribute__((regparm(3)));
extern void free_cold_page(struct page *page) __attribute__((regparm(3)));




void page_alloc_init(void);
# 16 "include/linux/slab.h" 2
# 55 "include/linux/slab.h"
extern void kmem_cache_init(void);

extern kmem_cache_t *kmem_find_general_cachep(size_t, int gfpflags);
extern kmem_cache_t *kmem_cache_create(const char *, size_t, size_t, unsigned long,
                                       void (*)(void *, kmem_cache_t *, unsigned long),
                                       void (*)(void *, kmem_cache_t *, unsigned long));
extern int kmem_cache_destroy(kmem_cache_t *);
extern int kmem_cache_shrink(kmem_cache_t *);
extern void *kmem_cache_alloc(kmem_cache_t *, int);
extern void *kmem_cache_alloc_node(kmem_cache_t *, int);
extern void kmem_cache_free(kmem_cache_t *, void *);
extern unsigned int kmem_cache_size(kmem_cache_t *);


struct cache_sizes {
        size_t cs_size;
        kmem_cache_t *cs_cachep;
        kmem_cache_t *cs_dmacachep;
};
extern struct cache_sizes malloc_sizes[];
extern void *__kmalloc(size_t, int);

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void *kmalloc(size_t size, int flags)
{
        if (__builtin_constant_p(size)) {
                int i = 0;





# 1 "include/linux/kmalloc_sizes.h" 1

        if (size <= 32) goto found; else i++;

        if (size <= 64) goto found; else i++;



        if (size <= 128) goto found; else i++;



        if (size <= 256) goto found; else i++;
        if (size <= 512) goto found; else i++;
        if (size <= 1024) goto found; else i++;
        if (size <= 2048) goto found; else i++;
        if (size <= 4096) goto found; else i++;
        if (size <= 8192) goto found; else i++;
        if (size <= 16384) goto found; else i++;
        if (size <= 32768) goto found; else i++;
        if (size <= 65536) goto found; else i++;
        if (size <= 131072) goto found; else i++;
# 87 "include/linux/slab.h" 2

                {
                        extern void __you_cannot_kmalloc_that_much(void);
                        __you_cannot_kmalloc_that_much();
                }
found:
                return kmem_cache_alloc((flags & 0x01) ?
                        malloc_sizes[i].cs_dmacachep :
                        malloc_sizes[i].cs_cachep, flags);
        }
        return __kmalloc(size, flags);
}

extern void kfree(const void *);
extern unsigned int ksize(const void *);

extern int kmem_cache_reap(int) __attribute__((regparm(3)));
extern int kmem_ptr_validate(kmem_cache_t *cachep, void *ptr) __attribute__((regparm(3)));


extern kmem_cache_t *vm_area_cachep;
extern kmem_cache_t *mm_cachep;
extern kmem_cache_t *names_cachep;
extern kmem_cache_t *files_cachep;
extern kmem_cache_t *filp_cachep;
extern kmem_cache_t *dquot_cachep;
extern kmem_cache_t *fs_cachep;
extern kmem_cache_t *signal_cachep;
extern kmem_cache_t *sighand_cachep;
extern kmem_cache_t *bio_cachep;

void ptrinfo(unsigned long addr);

extern atomic_t slab_reclaim_pages;
# 5 "include/linux/percpu.h" 2


# 1 "include/asm/percpu.h" 1



# 1 "include/asm-generic/percpu.h" 1







extern unsigned long __per_cpu_offset[8];
# 5 "include/asm/percpu.h" 2
# 8 "include/linux/percpu.h" 2
# 20 "include/linux/percpu.h"
struct percpu_data {
        void *ptrs[8];
        void *blkp;
};
# 36 "include/linux/percpu.h"
extern void *__alloc_percpu(size_t size, size_t align);
extern void free_percpu(const void *);
# 32 "include/linux/sched.h" 2

struct exec_domain;
# 74 "include/linux/sched.h"
extern unsigned long avenrun[];
# 91 "include/linux/sched.h"
extern int nr_threads;
extern int last_pid;
extern __typeof__(unsigned long) per_cpu__process_counts;
extern int nr_processes(void);
extern unsigned long nr_running(void);
extern unsigned long nr_uninterruptible(void);
extern unsigned long nr_iowait(void);


# 1 "include/linux/param.h" 1
# 101 "include/linux/sched.h" 2
# 1 "include/linux/resource.h" 1
# 21 "include/linux/resource.h"
struct rusage {
        struct timeval ru_utime;
        struct timeval ru_stime;
        long ru_maxrss;
        long ru_ixrss;
        long ru_idrss;
        long ru_isrss;
        long ru_minflt;
        long ru_majflt;
        long ru_nswap;
        long ru_inblock;
        long ru_oublock;
        long ru_msgsnd;
        long ru_msgrcv;
        long ru_nsignals;
        long ru_nvcsw;
        long ru_nivcsw;
};

struct rlimit {
        unsigned long rlim_cur;
        unsigned long rlim_max;
};
# 62 "include/linux/resource.h"
# 1 "include/asm/resource.h" 1
# 63 "include/linux/resource.h" 2
# 102 "include/linux/sched.h" 2
# 1 "include/linux/timer.h" 1
# 9 "include/linux/timer.h"
struct tvec_t_base_s;

struct timer_list {
        struct list_head entry;
        unsigned long expires;

        spinlock_t lock;
        unsigned long magic;

        void (*function)(unsigned long);
        unsigned long data;

        struct tvec_t_base_s *base;
};
# 42 "include/linux/timer.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void init_timer(struct timer_list * timer)
{
        timer->base = ((void *)0);
        timer->magic = 0x4b87ad6e;
        do { *(&timer->lock) = (spinlock_t) { 1 , 0xdead4ead }; } while(0);
}
# 59 "include/linux/timer.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int timer_pending(const struct timer_list * timer)
{
        return timer->base != ((void *)0);
}

extern void add_timer_on(struct timer_list *timer, int cpu);
extern int del_timer(struct timer_list * timer);
extern int __mod_timer(struct timer_list *timer, unsigned long expires);
extern int mod_timer(struct timer_list *timer, unsigned long expires);

extern unsigned long next_timer_interrupt(void);
# 85 "include/linux/timer.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void add_timer(struct timer_list * timer)
{
        __mod_timer(timer, timer->expires);
}


  extern int del_timer_sync(struct timer_list *timer);
  extern int del_singleshot_timer_sync(struct timer_list *timer);





extern void init_timers(void);
extern void run_local_timers(void);
extern void it_real_fn(unsigned long);
# 103 "include/linux/sched.h" 2
# 130 "include/linux/sched.h"
struct sched_param {
        int sched_priority;
};
# 144 "include/linux/sched.h"
extern rwlock_t tasklist_lock;
extern spinlock_t mmlist_lock;

typedef struct task_struct task_t;

extern void sched_init(void);
extern void sched_init_smp(void);
extern void init_idle(task_t *idle, int cpu);

extern cpumask_t nohz_cpu_mask;

extern void show_state(void);
extern void show_regs(struct pt_regs *);






extern void show_stack(struct task_struct *task, unsigned long *sp);

void io_schedule(void);
long io_schedule_timeout(long timeout);

extern void cpu_init (void);
extern void trap_init(void);
extern void update_process_times(int user);
extern void scheduler_tick(int user_tick, int system);
extern unsigned long cache_decay_ticks;




extern int in_sched_functions(unsigned long addr);


extern signed long schedule_timeout(signed long timeout) __attribute__((regparm(3)));
 __attribute__((regparm(0))) void schedule(void);

struct namespace;




extern int sysctl_max_map_count;

# 1 "include/linux/aio.h" 1




# 1 "include/linux/workqueue.h" 1
# 12 "include/linux/workqueue.h"
struct workqueue_struct;

struct work_struct {
        unsigned long pending;
        struct list_head entry;
        void (*func)(void *);
        void *data;
        void *wq_data;
        struct timer_list timer;
};
# 53 "include/linux/workqueue.h"
extern struct workqueue_struct *__create_workqueue(const char *name,
                                                    int singlethread);



extern void destroy_workqueue(struct workqueue_struct *wq);

extern int queue_work(struct workqueue_struct *wq, struct work_struct *work) __attribute__((regparm(3)));
extern int queue_delayed_work(struct workqueue_struct *wq, struct work_struct *work, unsigned long delay) __attribute__((regparm(3)));
extern void flush_workqueue(struct workqueue_struct *wq) __attribute__((regparm(3)));

extern int schedule_work(struct work_struct *work) __attribute__((regparm(3)));
extern int schedule_delayed_work(struct work_struct *work, unsigned long delay) __attribute__((regparm(3)));
extern void flush_scheduled_work(void);
extern int current_is_keventd(void);
extern int keventd_up(void);

extern void init_workqueues(void);






static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int cancel_delayed_work(struct work_struct *work)
{
        int ret;

        ret = del_timer_sync(&work->timer);
        if (ret)
                clear_bit(0, &work->pending);
        return ret;
}
# 6 "include/linux/aio.h" 2
# 1 "include/linux/aio_abi.h" 1
# 32 "include/linux/aio_abi.h"
typedef unsigned long aio_context_t;

enum {
        IOCB_CMD_PREAD = 0,
        IOCB_CMD_PWRITE = 1,
        IOCB_CMD_FSYNC = 2,
        IOCB_CMD_FDSYNC = 3,




        IOCB_CMD_NOOP = 6,
};


struct io_event {
        __u64 data;
        __u64 obj;
        __s64 res;
        __s64 res2;
};
# 68 "include/linux/aio_abi.h"
struct iocb {

        __u64 aio_data;
        __u32 aio_key, aio_reserved1;



        __u16 aio_lio_opcode;
        __s16 aio_reqprio;
        __u32 aio_fildes;

        __u64 aio_buf;
        __u64 aio_nbytes;
        __s64 aio_offset;


        __u64 aio_reserved2;
        __u64 aio_reserved3;
};
# 7 "include/linux/aio.h" 2






struct kioctx;
# 46 "include/linux/aio.h"
struct kiocb {
        struct list_head ki_run_list;
        long ki_flags;
        int ki_users;
        unsigned ki_key;

        struct file *ki_filp;
        struct kioctx *ki_ctx;
        int (*ki_cancel)(struct kiocb *, struct io_event *);
        long (*ki_retry)(struct kiocb *);
        void (*ki_dtor)(struct kiocb *);

        struct list_head ki_list;


        union {
                void *user;
                struct task_struct *tsk;
        } ki_obj;
        __u64 ki_user_data;
        loff_t ki_pos;
        void *private;
};
# 87 "include/linux/aio.h"
struct aio_ring {
        unsigned id;
        unsigned nr;
        unsigned head;
        unsigned tail;

        unsigned magic;
        unsigned compat_features;
        unsigned incompat_features;
        unsigned header_length;


        struct io_event io_events[0];
};




struct aio_ring_info {
        unsigned long mmap_base;
        unsigned long mmap_size;

        struct page **ring_pages;
        spinlock_t ring_lock;
        long nr_pages;

        unsigned nr, tail;

        struct page *internal_pages[8];
};

struct kioctx {
        atomic_t users;
        int dead;
        struct mm_struct *mm;


        unsigned long user_id;
        struct kioctx *next;

        wait_queue_head_t wait;

        spinlock_t ctx_lock;

        int reqs_active;
        struct list_head active_reqs;
        struct list_head run_list;

        unsigned max_reqs;

        struct aio_ring_info ring_info;

        struct work_struct wq;
};


extern unsigned aio_max_size;

extern ssize_t wait_on_sync_kiocb(struct kiocb *iocb) __attribute__((regparm(3)));
extern int aio_put_req(struct kiocb *iocb) __attribute__((regparm(3)));
extern void kick_iocb(struct kiocb *iocb) __attribute__((regparm(3)));
extern int aio_complete(struct kiocb *iocb, long res, long res2) __attribute__((regparm(3)));
extern void __put_ioctx(struct kioctx *ctx) __attribute__((regparm(3)));
struct mm_struct;
extern void exit_aio(struct mm_struct *mm) __attribute__((regparm(3)));
extern struct kioctx *lookup_ioctx(unsigned long ctx_id);
extern int io_submit_one(struct kioctx *ctx, struct iocb *user_iocb, struct iocb *iocb) __attribute__((regparm(3)));



struct kioctx *lookup_ioctx(unsigned long ctx_id);
int io_submit_one(struct kioctx *ctx, struct iocb *user_iocb, struct iocb *iocb) __attribute__((regparm(3)));







static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct kiocb *list_kiocb(struct list_head *h)
{
        return ({ const typeof( ((struct kiocb *)0)->ki_list ) *__mptr = (h); (struct kiocb *)( (char *)__mptr - ((size_t) &((struct kiocb *)0)->ki_list) );});
}


extern atomic_t aio_nr;
extern unsigned aio_max_nr;
# 191 "include/linux/sched.h" 2

struct mm_struct {
        struct vm_area_struct * mmap;
        struct rb_root mm_rb;
        struct vm_area_struct * mmap_cache;
        unsigned long free_area_cache;
        pgd_t * pgd;
        atomic_t mm_users;
        atomic_t mm_count;
        int map_count;
        struct rw_semaphore mmap_sem;
        spinlock_t page_table_lock;

        struct list_head mmlist;




        unsigned long start_code, end_code, start_data, end_data;
        unsigned long start_brk, brk, start_stack;
        unsigned long arg_start, arg_end, env_start, env_end;
        unsigned long rss, total_vm, locked_vm;
        unsigned long def_flags;

        unsigned long saved_auxv[40];

        unsigned dumpable:1;
        cpumask_t cpu_vm_mask;


        mm_context_t context;


        int core_waiters;
        struct completion *core_startup_done, core_done;


        rwlock_t ioctx_list_lock;
        struct kioctx *ioctx_list;

        struct kioctx default_kioctx;
};

extern int mmlist_nr;

struct sighand_struct {
        atomic_t count;
        struct k_sigaction action[64];
        spinlock_t siglock;
};
# 249 "include/linux/sched.h"
struct signal_struct {
        atomic_t count;


        task_t *curr_target;


        struct sigpending shared_pending;


        int group_exit;
        int group_exit_code;





        struct task_struct *group_exit_task;
        int notify_count;


        int group_stop_count;


        struct list_head posix_timers;


        pid_t pgrp;
        pid_t tty_old_pgrp;
        pid_t session;

        int leader;

        struct tty_struct *tty;
};
# 308 "include/linux/sched.h"
struct user_struct {
        atomic_t __count;
        atomic_t processes;
        atomic_t files;
        atomic_t sigpending;

        unsigned long mq_bytes;


        struct list_head uidhash_list;
        uid_t uid;
};

extern struct user_struct *find_user(uid_t);

extern struct user_struct root_user;


typedef struct prio_array prio_array_t;
struct backing_dev_info;
struct reclaim_state;


struct k_itimer {
        struct list_head list;
        spinlock_t it_lock;
        clockid_t it_clock;
        timer_t it_id;
        int it_overrun;
        int it_overrun_last;
        int it_requeue_pending;
        int it_sigev_notify;
        int it_sigev_signo;
        sigval_t it_sigev_value;
        unsigned long it_incr;
        struct task_struct *it_process;
        struct timer_list it_timer;
        struct sigqueue *sigq;
        struct list_head abs_timer_entry;
        struct timespec wall_to_prev;
};


struct io_context;
void exit_io_context(void);



struct group_info {
        int ngroups;
        atomic_t usage;
        gid_t small_block[32];
        int nblocks;
        gid_t *blocks[0];
};
# 379 "include/linux/sched.h"
struct group_info *groups_alloc(int gidsetsize);
void groups_free(struct group_info *group_info);
int set_current_groups(struct group_info *group_info);





struct audit_context;
struct mempolicy;

struct task_struct {
        volatile long state;
        struct thread_info *thread_info;
        atomic_t usage;
        unsigned long flags;
        unsigned long ptrace;

        int lock_depth;

        int prio, static_prio;
        struct list_head run_list;
        prio_array_t *array;

        unsigned long sleep_avg;
        long interactive_credit;
        unsigned long long timestamp;
        int activated;

        unsigned long policy;
        cpumask_t cpus_allowed;
        unsigned int time_slice, first_time_slice;

        struct list_head tasks;




        struct list_head ptrace_children;
        struct list_head ptrace_list;

        struct mm_struct *mm, *active_mm;


        struct linux_binfmt *binfmt;
        int exit_code, exit_signal;
        int pdeath_signal;

        unsigned long personality;
        int did_exec:1;
        pid_t pid;
        pid_t tgid;





        struct task_struct *real_parent;
        struct task_struct *parent;




        struct list_head children;
        struct list_head sibling;
        struct task_struct *group_leader;


        struct pid_link pids[PIDTYPE_MAX];

        wait_queue_head_t wait_chldexit;
        struct completion *vfork_done;
        int *set_child_tid;
        int *clear_child_tid;

        unsigned long rt_priority;
        unsigned long it_real_value, it_prof_value, it_virt_value;
        unsigned long it_real_incr, it_prof_incr, it_virt_incr;
        struct timer_list real_timer;
        unsigned long utime, stime, cutime, cstime;
        unsigned long nvcsw, nivcsw, cnvcsw, cnivcsw;
        u64 start_time;

        unsigned long min_flt, maj_flt, cmin_flt, cmaj_flt;

        uid_t uid,euid,suid,fsuid;
        gid_t gid,egid,sgid,fsgid;
        struct group_info *group_info;
        kernel_cap_t cap_effective, cap_inheritable, cap_permitted;
        int keep_capabilities:1;
        struct user_struct *user;

        struct rlimit rlim[13];
        unsigned short used_math;
        char comm[16];

        int link_count, total_link_count;

        struct sysv_sem sysvsem;

        struct thread_struct thread;

        struct fs_struct *fs;

        struct files_struct *files;

        struct namespace *namespace;

        struct signal_struct *signal;
        struct sighand_struct *sighand;

        sigset_t blocked, real_blocked;
        struct sigpending pending;

        unsigned long sas_ss_sp;
        size_t sas_ss_size;
        int (*notifier)(void *priv);
        void *notifier_data;
        sigset_t *notifier_mask;

        void *security;
        struct audit_context *audit_context;


        u32 parent_exec_id;
        u32 self_exec_id;

        spinlock_t alloc_lock;

        spinlock_t proc_lock;

        spinlock_t switch_lock;


        void *journal_info;


        struct reclaim_state *reclaim_state;

        struct dentry *proc_dentry;
        struct backing_dev_info *backing_dev_info;

        struct io_context *io_context;

        unsigned long ptrace_message;
        siginfo_t *last_siginfo;





};

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) pid_t process_group(struct task_struct *tsk)
{
        return tsk->signal->pgrp;
}

extern void __put_task_struct(struct task_struct *tsk);
# 578 "include/linux/sched.h"
struct sched_group {
        struct sched_group *next;
        cpumask_t cpumask;







        unsigned long cpu_power;
};

struct sched_domain {

        struct sched_domain *parent;
        struct sched_group *groups;
        cpumask_t span;
        unsigned long min_interval;
        unsigned long max_interval;
        unsigned int busy_factor;
        unsigned int imbalance_pct;
        unsigned long long cache_hot_time;
        unsigned int cache_nice_tries;
        unsigned int per_cpu_gain;
        int flags;


        unsigned long last_balance;
        unsigned int balance_interval;
        unsigned int nr_balance_failed;
};
# 678 "include/linux/sched.h"
extern void cpu_attach_domain(struct sched_domain *sd, int cpu);

extern int set_cpus_allowed(task_t *p, cpumask_t new_mask);







extern unsigned long long sched_clock(void);


extern void sched_balance_exec(void);




extern void sched_idle_next(void);
extern void set_user_nice(task_t *p, long nice);
extern int task_prio(const task_t *p);
extern int task_nice(const task_t *p);
extern int task_curr(const task_t *p);
extern int idle_cpu(int cpu);

void yield(void);




extern struct exec_domain default_exec_domain;

union thread_union {
        struct thread_info thread_info;
        unsigned long stack[(4096)/sizeof(long)];
};


static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int kstack_end(void *addr)
{



        return !(((unsigned long)addr+sizeof(void*)-1) & ((4096)-sizeof(void*)));
}


extern union thread_union init_thread_union;
extern struct task_struct init_task;

extern struct mm_struct init_mm;

extern struct task_struct *find_task_by_pid(int pid);
extern void set_special_pids(pid_t session, pid_t pgrp);
extern void __set_special_pids(pid_t session, pid_t pgrp);


extern struct user_struct * alloc_uid(uid_t);
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct user_struct *get_uid(struct user_struct *u)
{
        atomic_inc(&u->__count);
        return u;
}
extern void free_uid(struct user_struct *);
extern void switch_uid(struct user_struct *);

# 1 "include/asm/current.h" 1





struct task_struct;

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct task_struct * get_current(void)
{
        return current_thread_info()->task;
}
# 745 "include/linux/sched.h" 2

extern unsigned long itimer_ticks;
extern unsigned long itimer_next;
extern void do_timer(struct pt_regs *);

extern int wake_up_state(struct task_struct * tsk, unsigned int state) __attribute__((regparm(3)));
extern int wake_up_process(struct task_struct * tsk) __attribute__((regparm(3)));
extern void wake_up_forked_process(struct task_struct * tsk) __attribute__((regparm(3)));

 extern void kick_process(struct task_struct *tsk);
 extern void wake_up_forked_thread(struct task_struct * tsk) __attribute__((regparm(3)));







extern void sched_fork(task_t * p) __attribute__((regparm(3)));
extern void sched_exit(task_t * p) __attribute__((regparm(3)));

extern int in_group_p(gid_t);
extern int in_egroup_p(gid_t);

extern void proc_caches_init(void);
extern void flush_signals(struct task_struct *);
extern void flush_signal_handlers(struct task_struct *, int force_default);
extern int dequeue_signal(struct task_struct *tsk, sigset_t *mask, siginfo_t *info);

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int dequeue_signal_lock(struct task_struct *tsk, sigset_t *mask, siginfo_t *info)
{
        unsigned long flags;
        int ret;

        do { __asm__ __volatile__("pushfl ; popl %0 ; cli":"=g" (flags): :"memory"); do { do { (current_thread_info()->preempt_count)++; } while (0); __asm__ __volatile__("": : :"memory"); } while (0); _raw_spin_lock_flags(&tsk->sighand->siglock, flags); } while (0);
        ret = dequeue_signal(tsk, mask, info);
        do { _raw_spin_unlock(&tsk->sighand->siglock); do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); __asm__ __volatile__("pushl %0 ; popfl": :"g" (flags):"memory", "cc"); } while (0); do { do { __asm__ __volatile__("": : :"memory"); do { (current_thread_info()->preempt_count)--; } while (0); } while (0); do { if (__builtin_expect(!!(test_thread_flag(3)), 0)) preempt_schedule(); } while (0); } while (0); } while (0);

        return ret;
}

extern void block_all_signals(int (*notifier)(void *priv), void *priv,
                              sigset_t *mask);
extern void unblock_all_signals(void);
extern void release_task(struct task_struct * p);
extern int send_sig_info(int, struct siginfo *, struct task_struct *);
extern int send_group_sig_info(int, struct siginfo *, struct task_struct *);
extern int force_sig_info(int, struct siginfo *, struct task_struct *);
extern int __kill_pg_info(int sig, struct siginfo *info, pid_t pgrp);
extern int kill_pg_info(int, struct siginfo *, pid_t);
extern int kill_sl_info(int, struct siginfo *, pid_t);
extern int kill_proc_info(int, struct siginfo *, pid_t);
extern void notify_parent(struct task_struct *, int);
extern void do_notify_parent(struct task_struct *, int);
extern void force_sig(int, struct task_struct *);
extern void force_sig_specific(int, struct task_struct *);
extern int send_sig(int, struct task_struct *, int);
extern void zap_other_threads(struct task_struct *p);
extern int kill_pg(pid_t, int, int);
extern int kill_sl(pid_t, int, int);
extern int kill_proc(pid_t, int, int);
extern struct sigqueue *sigqueue_alloc(void);
extern void sigqueue_free(struct sigqueue *);
extern int send_sigqueue(int, struct sigqueue *, struct task_struct *);
extern int send_group_sigqueue(int, struct sigqueue *, struct task_struct *);
extern int do_sigaction(int, const struct k_sigaction *, struct k_sigaction *);
extern int do_sigaltstack(const stack_t *, stack_t *, unsigned long);
# 820 "include/linux/sched.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int on_sig_stack(unsigned long sp)
{
        return (sp - get_current()->sas_ss_sp < get_current()->sas_ss_size);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int sas_ss_flags(unsigned long sp)
{
        return (get_current()->sas_ss_size == 0 ? 2
                : on_sig_stack(sp) ? 1 : 0);
}




extern int capable(int cap);
# 849 "include/linux/sched.h"
extern struct mm_struct * mm_alloc(void);


extern void __mmdrop(struct mm_struct *) __attribute__((regparm(3)));
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void mmdrop(struct mm_struct * mm)
{
        if (atomic_dec_and_test(&mm->mm_count))
                __mmdrop(mm);
}


extern void mmput(struct mm_struct *);

extern struct mm_struct *mmgrab(struct mm_struct *);

extern void mm_release(struct task_struct *, struct mm_struct *);

extern int copy_thread(int, unsigned long, unsigned long, unsigned long, struct task_struct *, struct pt_regs *);
extern void flush_thread(void);
extern void exit_thread(void);

extern void exit_mm(struct task_struct *);
extern void exit_files(struct task_struct *);
extern void exit_signal(struct task_struct *);
extern void __exit_signal(struct task_struct *);
extern void exit_sighand(struct task_struct *);
extern void __exit_sighand(struct task_struct *);
extern void exit_itimers(struct signal_struct *);

extern void do_group_exit(int);

extern void reparent_to_init(void);
extern void daemonize(const char *, ...);
extern int allow_signal(int);
extern int disallow_signal(int);
extern task_t *child_reaper;

extern int do_execve(char *, char * *, char * *, struct pt_regs *);
extern long do_fork(unsigned long, unsigned long, struct pt_regs *, unsigned long, int *, int *);
extern struct task_struct * copy_process(unsigned long, unsigned long, struct pt_regs *, unsigned long, int *, int *);


extern void wait_task_inactive(task_t * p);
# 927 "include/linux/sched.h"
extern task_t * next_thread(const task_t *p) __attribute__((regparm(3)));



static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int thread_group_empty(task_t *p)
{
        struct pid *pid = p->pids[PIDTYPE_TGID].pidptr;

        return pid->task_list.next->next == &pid->task_list;
}




extern void unhash_process(struct task_struct *p);
# 951 "include/linux/sched.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void task_lock(struct task_struct *p)
{
        do { do { do { (current_thread_info()->preempt_count)++; } while (0); __asm__ __volatile__("": : :"memory"); } while (0); if (__builtin_expect(!!(!_raw_spin_trylock(&p->alloc_lock)), 0)) __preempt_spin_lock(&p->alloc_lock); } while (0);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void task_unlock(struct task_struct *p)
{
        do { _raw_spin_unlock(&p->alloc_lock); do { do { __asm__ __volatile__("": : :"memory"); do { (current_thread_info()->preempt_count)--; } while (0); } while (0); do { if (__builtin_expect(!!(test_thread_flag(3)), 0)) preempt_schedule(); } while (0); } while (0); } while (0);
}







static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct mm_struct * get_task_mm(struct task_struct * task)
{
        struct mm_struct * mm;

        task_lock(task);
        mm = task->mm;
        if (mm)
                mm = mmgrab(mm);
        task_unlock(task);

        return mm;
}





static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void set_tsk_thread_flag(struct task_struct *tsk, int flag)
{
        set_ti_thread_flag(tsk->thread_info,flag);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void clear_tsk_thread_flag(struct task_struct *tsk, int flag)
{
        clear_ti_thread_flag(tsk->thread_info,flag);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int test_and_set_tsk_thread_flag(struct task_struct *tsk, int flag)
{
        return test_and_set_ti_thread_flag(tsk->thread_info,flag);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int test_and_clear_tsk_thread_flag(struct task_struct *tsk, int flag)
{
        return test_and_clear_ti_thread_flag(tsk->thread_info,flag);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int test_tsk_thread_flag(struct task_struct *tsk, int flag)
{
        return test_ti_thread_flag(tsk->thread_info,flag);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void set_tsk_need_resched(struct task_struct *tsk)
{
        set_tsk_thread_flag(tsk,3);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void clear_tsk_need_resched(struct task_struct *tsk)
{
        clear_tsk_thread_flag(tsk,3);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int signal_pending(struct task_struct *p)
{
        return __builtin_expect(!!(test_tsk_thread_flag(p,2)), 0);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int need_resched(void)
{
        return __builtin_expect(!!(test_thread_flag(3)), 0);
}

extern void __cond_resched(void);
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void cond_resched(void)
{
        if (need_resched())
                __cond_resched();
}
# 1044 "include/linux/sched.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void cond_resched_lock(spinlock_t * lock)
{
        if (need_resched()) {
                _raw_spin_unlock(lock);
                do { __asm__ __volatile__("": : :"memory"); do { (current_thread_info()->preempt_count)--; } while (0); } while (0);
                __cond_resched();
                do { do { do { (current_thread_info()->preempt_count)++; } while (0); __asm__ __volatile__("": : :"memory"); } while (0); if (__builtin_expect(!!(!_raw_spin_trylock(lock)), 0)) __preempt_spin_lock(lock); } while (0);
        }
}





extern void recalc_sigpending_tsk(struct task_struct *t) __attribute__((regparm(3)));
extern void recalc_sigpending(void);

extern void signal_wake_up(struct task_struct *t, int resume_stopped);






static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned int task_cpu(const struct task_struct *p)
{
        return p->thread_info->cpu;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void set_task_cpu(struct task_struct *p, unsigned int cpu)
{
        p->thread_info->cpu = cpu;
}
# 11 "include/linux/module.h" 2


# 1 "include/linux/stat.h" 1





# 1 "include/asm/stat.h" 1



struct __old_kernel_stat {
        unsigned short st_dev;
        unsigned short st_ino;
        unsigned short st_mode;
        unsigned short st_nlink;
        unsigned short st_uid;
        unsigned short st_gid;
        unsigned short st_rdev;
        unsigned long st_size;
        unsigned long st_atime;
        unsigned long st_mtime;
        unsigned long st_ctime;
};

struct stat {
        unsigned long st_dev;
        unsigned long st_ino;
        unsigned short st_mode;
        unsigned short st_nlink;
        unsigned short st_uid;
        unsigned short st_gid;
        unsigned long st_rdev;
        unsigned long st_size;
        unsigned long st_blksize;
        unsigned long st_blocks;
        unsigned long st_atime;
        unsigned long st_atime_nsec;
        unsigned long st_mtime;
        unsigned long st_mtime_nsec;
        unsigned long st_ctime;
        unsigned long st_ctime_nsec;
        unsigned long __unused4;
        unsigned long __unused5;
};




struct stat64 {
        unsigned long long st_dev;
        unsigned char __pad0[4];


        unsigned long __st_ino;

        unsigned int st_mode;
        unsigned int st_nlink;

        unsigned long st_uid;
        unsigned long st_gid;

        unsigned long long st_rdev;
        unsigned char __pad3[4];

        long long st_size;
        unsigned long st_blksize;

        unsigned long st_blocks;
        unsigned long __pad4;

        unsigned long st_atime;
        unsigned long st_atime_nsec;

        unsigned long st_mtime;
        unsigned int st_mtime_nsec;

        unsigned long st_ctime;
        unsigned long st_ctime_nsec;

        unsigned long long st_ino;
};
# 7 "include/linux/stat.h" 2
# 59 "include/linux/stat.h"
struct kstat {
        unsigned long ino;
        dev_t dev;
        umode_t mode;
        unsigned int nlink;
        uid_t uid;
        gid_t gid;
        dev_t rdev;
        loff_t size;
        struct timespec atime;
        struct timespec mtime;
        struct timespec ctime;
        unsigned long blksize;
        unsigned long blocks;
};
# 14 "include/linux/module.h" 2


# 1 "include/linux/kmod.h" 1
# 23 "include/linux/kmod.h"
# 1 "include/linux/errno.h" 1



# 1 "include/asm/errno.h" 1



# 1 "include/asm-generic/errno.h" 1



# 1 "include/asm-generic/errno-base.h" 1
# 5 "include/asm-generic/errno.h" 2
# 5 "include/asm/errno.h" 2
# 5 "include/linux/errno.h" 2
# 24 "include/linux/kmod.h" 2







extern int request_module(const char * name, ...) __attribute__ ((format (printf, 1, 2)));





extern int call_usermodehelper(char *path, char *argv[], char *envp[], int wait);


extern char hotplug_path [];
# 17 "include/linux/module.h" 2
# 1 "include/linux/elf.h" 1




# 1 "include/asm/elf.h" 1
# 9 "include/asm/elf.h"
# 1 "include/asm/user.h" 1
# 44 "include/asm/user.h"
struct user_i387_struct {
        long cwd;
        long swd;
        long twd;
        long fip;
        long fcs;
        long foo;
        long fos;
        long st_space[20];
};

struct user_fxsr_struct {
        unsigned short cwd;
        unsigned short swd;
        unsigned short twd;
        unsigned short fop;
        long fip;
        long fcs;
        long foo;
        long fos;
        long mxcsr;
        long reserved;
        long st_space[32];
        long xmm_space[32];
        long padding[56];
};







struct user_regs_struct {
        long ebx, ecx, edx, esi, edi, ebp, eax;
        unsigned short ds, __ds, es, __es;
        unsigned short fs, __fs, gs, __gs;
        long orig_eax, eip;
        unsigned short cs, __cs;
        long eflags, esp;
        unsigned short ss, __ss;
};




struct user{


  struct user_regs_struct regs;

  int u_fpvalid;

  struct user_i387_struct i387;

  unsigned long int u_tsize;
  unsigned long int u_dsize;
  unsigned long int u_ssize;
  unsigned long start_code;
  unsigned long start_stack;



  long int signal;
  int reserved;
  struct user_pt_regs * u_ar0;

  struct user_i387_struct* u_fpstate;
  unsigned long magic;
  char u_comm[32];
  int u_debugreg[8];
};
# 10 "include/asm/elf.h" 2



# 1 "include/linux/utsname.h" 1





struct oldold_utsname {
        char sysname[9];
        char nodename[9];
        char release[9];
        char version[9];
        char machine[9];
};



struct old_utsname {
        char sysname[65];
        char nodename[65];
        char release[65];
        char version[65];
        char machine[65];
};

struct new_utsname {
        char sysname[65];
        char nodename[65];
        char release[65];
        char version[65];
        char machine[65];
        char domainname[65];
};

extern struct new_utsname system_utsname;

extern struct rw_semaphore uts_sem;
# 14 "include/asm/elf.h" 2
# 28 "include/asm/elf.h"
typedef unsigned long elf_greg_t;


typedef elf_greg_t elf_gregset_t[(sizeof (struct user_regs_struct) / sizeof(elf_greg_t))];

typedef struct user_i387_struct elf_fpregset_t;
typedef struct user_fxsr_struct elf_fpxregset_t;
# 128 "include/asm/elf.h"
extern int dump_task_regs (struct task_struct *, elf_gregset_t *);
extern int dump_task_fpu (struct task_struct *, elf_fpregset_t *);
extern int dump_task_extended_fpu (struct task_struct *, struct user_fxsr_struct *);
# 139 "include/asm/elf.h"
extern void __kernel_vsyscall;
# 6 "include/linux/elf.h" 2
# 15 "include/linux/elf.h"
typedef __u32 Elf32_Addr;
typedef __u16 Elf32_Half;
typedef __u32 Elf32_Off;
typedef __s32 Elf32_Sword;
typedef __u32 Elf32_Word;


typedef __u64 Elf64_Addr;
typedef __u16 Elf64_Half;
typedef __s16 Elf64_SHalf;
typedef __u64 Elf64_Off;
typedef __s32 Elf64_Sword;
typedef __u32 Elf64_Word;
typedef __u64 Elf64_Xword;
typedef __s64 Elf64_Sxword;
# 176 "include/linux/elf.h"
typedef struct dynamic{
  Elf32_Sword d_tag;
  union{
    Elf32_Sword d_val;
    Elf32_Addr d_ptr;
  } d_un;
} Elf32_Dyn;

typedef struct {
  Elf64_Sxword d_tag;
  union {
    Elf64_Xword d_val;
    Elf64_Addr d_ptr;
  } d_un;
} Elf64_Dyn;
# 199 "include/linux/elf.h"
typedef struct elf32_rel {
  Elf32_Addr r_offset;
  Elf32_Word r_info;
} Elf32_Rel;

typedef struct elf64_rel {
  Elf64_Addr r_offset;
  Elf64_Xword r_info;
} Elf64_Rel;

typedef struct elf32_rela{
  Elf32_Addr r_offset;
  Elf32_Word r_info;
  Elf32_Sword r_addend;
} Elf32_Rela;

typedef struct elf64_rela {
  Elf64_Addr r_offset;
  Elf64_Xword r_info;
  Elf64_Sxword r_addend;
} Elf64_Rela;

typedef struct elf32_sym{
  Elf32_Word st_name;
  Elf32_Addr st_value;
  Elf32_Word st_size;
  unsigned char st_info;
  unsigned char st_other;
  Elf32_Half st_shndx;
} Elf32_Sym;

typedef struct elf64_sym {
  Elf64_Word st_name;
  unsigned char st_info;
  unsigned char st_other;
  Elf64_Half st_shndx;
  Elf64_Addr st_value;
  Elf64_Xword st_size;
} Elf64_Sym;




typedef struct elf32_hdr{
  unsigned char e_ident[16];
  Elf32_Half e_type;
  Elf32_Half e_machine;
  Elf32_Word e_version;
  Elf32_Addr e_entry;
  Elf32_Off e_phoff;
  Elf32_Off e_shoff;
  Elf32_Word e_flags;
  Elf32_Half e_ehsize;
  Elf32_Half e_phentsize;
  Elf32_Half e_phnum;
  Elf32_Half e_shentsize;
  Elf32_Half e_shnum;
  Elf32_Half e_shstrndx;
} Elf32_Ehdr;

typedef struct elf64_hdr {
  unsigned char e_ident[16];
  Elf64_Half e_type;
  Elf64_Half e_machine;
  Elf64_Word e_version;
  Elf64_Addr e_entry;
  Elf64_Off e_phoff;
  Elf64_Off e_shoff;
  Elf64_Word e_flags;
  Elf64_Half e_ehsize;
  Elf64_Half e_phentsize;
  Elf64_Half e_phnum;
  Elf64_Half e_shentsize;
  Elf64_Half e_shnum;
  Elf64_Half e_shstrndx;
} Elf64_Ehdr;







typedef struct elf32_phdr{
  Elf32_Word p_type;
  Elf32_Off p_offset;
  Elf32_Addr p_vaddr;
  Elf32_Addr p_paddr;
  Elf32_Word p_filesz;
  Elf32_Word p_memsz;
  Elf32_Word p_flags;
  Elf32_Word p_align;
} Elf32_Phdr;

typedef struct elf64_phdr {
  Elf64_Word p_type;
  Elf64_Word p_flags;
  Elf64_Off p_offset;
  Elf64_Addr p_vaddr;
  Elf64_Addr p_paddr;
  Elf64_Xword p_filesz;
  Elf64_Xword p_memsz;
  Elf64_Xword p_align;
} Elf64_Phdr;
# 338 "include/linux/elf.h"
typedef struct {
  Elf32_Word sh_name;
  Elf32_Word sh_type;
  Elf32_Word sh_flags;
  Elf32_Addr sh_addr;
  Elf32_Off sh_offset;
  Elf32_Word sh_size;
  Elf32_Word sh_link;
  Elf32_Word sh_info;
  Elf32_Word sh_addralign;
  Elf32_Word sh_entsize;
} Elf32_Shdr;

typedef struct elf64_shdr {
  Elf64_Word sh_name;
  Elf64_Word sh_type;
  Elf64_Xword sh_flags;
  Elf64_Addr sh_addr;
  Elf64_Off sh_offset;
  Elf64_Xword sh_size;
  Elf64_Word sh_link;
  Elf64_Word sh_info;
  Elf64_Xword sh_addralign;
  Elf64_Xword sh_entsize;
} Elf64_Shdr;
# 411 "include/linux/elf.h"
typedef struct elf32_note {
  Elf32_Word n_namesz;
  Elf32_Word n_descsz;
  Elf32_Word n_type;
} Elf32_Nhdr;


typedef struct elf64_note {
  Elf64_Word n_namesz;
  Elf64_Word n_descsz;
  Elf64_Word n_type;
} Elf64_Nhdr;



extern Elf32_Dyn _DYNAMIC [];
# 18 "include/linux/module.h" 2

# 1 "include/linux/kobject.h" 1
# 20 "include/linux/kobject.h"
# 1 "include/linux/sysfs.h" 1
# 12 "include/linux/sysfs.h"
struct kobject;
struct module;

struct attribute {
        char * name;
        struct module * owner;
        mode_t mode;
};

struct attribute_group {
        char * name;
        struct attribute ** attrs;
};
# 48 "include/linux/sysfs.h"
struct bin_attribute {
        struct attribute attr;
        size_t size;
        ssize_t (*read)(struct kobject *, char *, loff_t, size_t);
        ssize_t (*write)(struct kobject *, char *, loff_t, size_t);
};

struct sysfs_ops {
        ssize_t (*show)(struct kobject *, struct attribute *,char *);
        ssize_t (*store)(struct kobject *,struct attribute *,const char *, size_t);
};



extern int
sysfs_create_dir(struct kobject *);

extern void
sysfs_remove_dir(struct kobject *);

extern int
sysfs_rename_dir(struct kobject *, const char *new_name);

extern int
sysfs_create_file(struct kobject *, const struct attribute *);

extern int
sysfs_update_file(struct kobject *, const struct attribute *);

extern void
sysfs_remove_file(struct kobject *, const struct attribute *);

extern int
sysfs_create_link(struct kobject * kobj, struct kobject * target, char * name);

extern void
sysfs_remove_link(struct kobject *, char * name);

int sysfs_create_bin_file(struct kobject * kobj, struct bin_attribute * attr);
int sysfs_remove_bin_file(struct kobject * kobj, struct bin_attribute * attr);

int sysfs_create_group(struct kobject *, const struct attribute_group *);
void sysfs_remove_group(struct kobject *, const struct attribute_group *);
# 21 "include/linux/kobject.h" 2





struct kobject {
        char * k_name;
        char name[20];
        atomic_t refcount;
        struct list_head entry;
        struct kobject * parent;
        struct kset * kset;
        struct kobj_type * ktype;
        struct dentry * dentry;
};

extern int kobject_set_name(struct kobject *, const char *, ...)
        __attribute__((format(printf,2,3)));

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) char * kobject_name(struct kobject * kobj)
{
        return kobj->k_name;
}

extern void kobject_init(struct kobject *);
extern void kobject_cleanup(struct kobject *);

extern int kobject_add(struct kobject *);
extern void kobject_del(struct kobject *);

extern int kobject_rename(struct kobject *, char *new_name);

extern int kobject_register(struct kobject *);
extern void kobject_unregister(struct kobject *);

extern struct kobject * kobject_get(struct kobject *);
extern void kobject_put(struct kobject *);

extern void kobject_hotplug(const char *action, struct kobject *);

struct kobj_type {
        void (*release)(struct kobject *);
        struct sysfs_ops * sysfs_ops;
        struct attribute ** default_attrs;
};
# 86 "include/linux/kobject.h"
struct kset_hotplug_ops {
        int (*filter)(struct kset *kset, struct kobject *kobj);
        char *(*name)(struct kset *kset, struct kobject *kobj);
        int (*hotplug)(struct kset *kset, struct kobject *kobj, char **envp,
                        int num_envp, char *buffer, int buffer_size);
};

struct kset {
        struct subsystem * subsys;
        struct kobj_type * ktype;
        struct list_head list;
        struct kobject kobj;
        struct kset_hotplug_ops * hotplug_ops;
};


extern void kset_init(struct kset * k);
extern int kset_add(struct kset * k);
extern int kset_register(struct kset * k);
extern void kset_unregister(struct kset * k);

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct kset * to_kset(struct kobject * kobj)
{
        return kobj ? ({ const typeof( ((struct kset *)0)->kobj ) *__mptr = (kobj); (struct kset *)( (char *)__mptr - ((size_t) &((struct kset *)0)->kobj) );}) : ((void *)0);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct kset * kset_get(struct kset * k)
{
        return k ? to_kset(kobject_get(&k->kobj)) : ((void *)0);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void kset_put(struct kset * k)
{
        kobject_put(&k->kobj);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct kobj_type * get_ktype(struct kobject * k)
{
        if (k->kset && k->kset->ktype)
                return k->kset->ktype;
        else
                return k->ktype;
}

extern struct kobject * kset_find_obj(struct kset *, const char *);
# 141 "include/linux/kobject.h"
struct subsystem {
        struct kset kset;
        struct rw_semaphore rwsem;
};
# 209 "include/linux/kobject.h"
extern void subsystem_init(struct subsystem *);
extern int subsystem_register(struct subsystem *);
extern void subsystem_unregister(struct subsystem *);

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct subsystem * subsys_get(struct subsystem * s)
{
        return s ? ({ const typeof( ((struct subsystem *)0)->kset ) *__mptr = (kset_get(&s->kset)); (struct subsystem *)( (char *)__mptr - ((size_t) &((struct subsystem *)0)->kset) );}) : ((void *)0);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void subsys_put(struct subsystem * s)
{
        kset_put(&s->kset);
}

struct subsys_attribute {
        struct attribute attr;
        ssize_t (*show)(struct subsystem *, char *);
        ssize_t (*store)(struct subsystem *, const char *, size_t);
};

extern int subsys_create_file(struct subsystem * , struct subsys_attribute *);
extern void subsys_remove_file(struct subsystem * , struct subsys_attribute *);
# 20 "include/linux/module.h" 2
# 1 "include/linux/moduleparam.h" 1



# 1 "include/linux/init.h" 1
# 64 "include/linux/init.h"
typedef int (*initcall_t)(void);
typedef void (*exitcall_t)(void);

extern initcall_t __con_initcall_start, __con_initcall_end;
extern initcall_t __security_initcall_start, __security_initcall_end;


extern char saved_command_line[];
# 110 "include/linux/init.h"
struct obs_kernel_param {
        const char *str;
        int (*setup_func)(char *);
        int early;
};
# 145 "include/linux/init.h"
void __attribute__ ((__section__ (".init.text"))) parse_early_param(void);
# 5 "include/linux/moduleparam.h" 2
# 16 "include/linux/moduleparam.h"
struct kernel_param;


typedef int (*param_set_fn)(const char *val, struct kernel_param *kp);

typedef int (*param_get_fn)(char *buffer, struct kernel_param *kp);

struct kernel_param {
        const char *name;
        unsigned int perm;
        param_set_fn set;
        param_get_fn get;
        void *arg;
};


struct kparam_string {
        unsigned int maxlen;
        char *string;
};


struct kparam_array
{
        unsigned int max;
        unsigned int *num;
        param_set_fn set;
        param_get_fn get;
        unsigned int elemsize;
        void *elem;
};
# 80 "include/linux/moduleparam.h"
extern int parse_args(const char *name,
                      char *args,
                      struct kernel_param *params,
                      unsigned num,
                      int (*unknown)(char *param, char *val));







extern int param_set_short(const char *val, struct kernel_param *kp);
extern int param_get_short(char *buffer, struct kernel_param *kp);


extern int param_set_ushort(const char *val, struct kernel_param *kp);
extern int param_get_ushort(char *buffer, struct kernel_param *kp);


extern int param_set_int(const char *val, struct kernel_param *kp);
extern int param_get_int(char *buffer, struct kernel_param *kp);


extern int param_set_uint(const char *val, struct kernel_param *kp);
extern int param_get_uint(char *buffer, struct kernel_param *kp);


extern int param_set_long(const char *val, struct kernel_param *kp);
extern int param_get_long(char *buffer, struct kernel_param *kp);


extern int param_set_ulong(const char *val, struct kernel_param *kp);
extern int param_get_ulong(char *buffer, struct kernel_param *kp);


extern int param_set_charp(const char *val, struct kernel_param *kp);
extern int param_get_charp(char *buffer, struct kernel_param *kp);


extern int param_set_bool(const char *val, struct kernel_param *kp);
extern int param_get_bool(char *buffer, struct kernel_param *kp);


extern int param_set_invbool(const char *val, struct kernel_param *kp);
extern int param_get_invbool(char *buffer, struct kernel_param *kp);
# 139 "include/linux/moduleparam.h"
extern int param_array_set(const char *val, struct kernel_param *kp);
extern int param_array_get(char *buffer, struct kernel_param *kp);

extern int param_set_copystring(const char *val, struct kernel_param *kp);

int param_array(const char *name,
                const char *val,
                unsigned int min, unsigned int max,
                void *elem, int elemsize,
                int (*set)(const char *, struct kernel_param *kp),
                int *num);
# 21 "include/linux/module.h" 2
# 1 "include/asm/local.h" 1





typedef struct
{
        volatile unsigned long counter;
} local_t;






static __inline__ __attribute__((always_inline)) void local_inc(local_t *v)
{
        __asm__ __volatile__(
                "incl %0"
                :"=m" (v->counter)
                :"m" (v->counter));
}

static __inline__ __attribute__((always_inline)) void local_dec(local_t *v)
{
        __asm__ __volatile__(
                "decl %0"
                :"=m" (v->counter)
                :"m" (v->counter));
}

static __inline__ __attribute__((always_inline)) void local_add(unsigned long i, local_t *v)
{
        __asm__ __volatile__(
                "addl %1,%0"
                :"=m" (v->counter)
                :"ir" (i), "m" (v->counter));
}

static __inline__ __attribute__((always_inline)) void local_sub(unsigned long i, local_t *v)
{
        __asm__ __volatile__(
                "subl %1,%0"
                :"=m" (v->counter)
                :"ir" (i), "m" (v->counter));
}
# 22 "include/linux/module.h" 2

# 1 "include/asm/module.h" 1




struct mod_arch_specific
{
};
# 24 "include/linux/module.h" 2
# 35 "include/linux/module.h"
struct kernel_symbol
{
        unsigned long value;
        const char *name;
};

struct modversion_info
{
        unsigned long crc;
        char name[(64 - sizeof(unsigned long))];
};


extern int init_module(void);
extern void cleanup_module(void);


struct exception_table_entry;

const struct exception_table_entry *
search_extable(const struct exception_table_entry *first,
               const struct exception_table_entry *last,
               unsigned long value);
void sort_extable(struct exception_table_entry *start,
                  struct exception_table_entry *finish);
void sort_main_extable(void);
# 151 "include/linux/module.h"
const struct exception_table_entry *search_exception_tables(unsigned long add);

struct notifier_block;




void *__symbol_get(const char *symbol);
void *__symbol_get_gpl(const char *symbol);
# 199 "include/linux/module.h"
struct module_ref
{
        local_t count;
} __attribute__((__aligned__((1 << (7)))));

enum module_state
{
        MODULE_STATE_LIVE,
        MODULE_STATE_COMING,
        MODULE_STATE_GOING,
};


struct module_attribute
{
        struct attribute attr;
        struct kernel_param *param;
};

struct module_kobject
{

        struct kobject kobj;


        unsigned int num_attributes;
        struct module_attribute attr[0];
};



struct module_sect_attr
{
        struct attribute attr;
        char name[32];
        unsigned long address;
};

struct module_sections
{
        struct kobject kobj;
        struct module_sect_attr attrs[0];
};


struct module
{
        enum module_state state;


        struct list_head list;


        char name[(64 - sizeof(unsigned long))];


        struct module_kobject *mkobj;


        const struct kernel_symbol *syms;
        unsigned int num_syms;
        const unsigned long *crcs;


        const struct kernel_symbol *gpl_syms;
        unsigned int num_gpl_syms;
        const unsigned long *gpl_crcs;


        unsigned int num_exentries;
        const struct exception_table_entry *extable;


        int (*init)(void);


        void *module_init;


        void *module_core;


        unsigned long init_size, core_size;


        unsigned long init_text_size, core_text_size;


        struct mod_arch_specific arch;


        int unsafe;


        int license_gplok;



        struct module_ref ref[8];


        struct list_head modules_which_use_me;


        struct task_struct *waiter;


        void (*exit)(void);


        struct kernel_param refcnt_param;




        Elf32_Sym *symtab;
        unsigned long num_symtab;
        char *strtab;


        struct module_sections *sect_attrs;



        void *percpu;



        char *args;
};




static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int module_is_live(struct module *mod)
{
        return mod->state != MODULE_STATE_GOING;
}


struct module *module_text_address(unsigned long addr);
struct module *__module_text_address(unsigned long addr);



struct module *module_get_kallsym(unsigned int symnum,
                                  unsigned long *value,
                                  char *type,
                                  char namebuf[128]);


unsigned long module_kallsyms_lookup_name(const char *name);

int is_exported(const char *name, const struct module *mod);

extern void __module_put_and_exit(struct module *mod, long code)
        __attribute__((noreturn));



unsigned int module_refcount(struct module *mod);
void __symbol_put(const char *symbol);

void symbol_put_addr(void *addr);



static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void __module_get(struct module *module)
{
        if (module) {
                do { if (__builtin_expect(!!((module_refcount(module) == 0)!=0), 0)) __asm__ __volatile__( "ud2\n" "\t.word %c0\n" "\t.long %c1\n" : : "i" (369), "i" ("include/linux/module.h")); } while(0);
                local_inc(&module->ref[({ do { do { (current_thread_info()->preempt_count)++; } while (0); __asm__ __volatile__("": : :"memory"); } while (0); (current_thread_info()->cpu); })].count);
                do { do { __asm__ __volatile__("": : :"memory"); do { (current_thread_info()->preempt_count)--; } while (0); } while (0); do { if (__builtin_expect(!!(test_thread_flag(3)), 0)) preempt_schedule(); } while (0); } while (0);
        }
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int try_module_get(struct module *module)
{
        int ret = 1;

        if (module) {
                unsigned int cpu = ({ do { do { (current_thread_info()->preempt_count)++; } while (0); __asm__ __volatile__("": : :"memory"); } while (0); (current_thread_info()->cpu); });
                if (__builtin_expect(!!(module_is_live(module)), 1))
                        local_inc(&module->ref[cpu].count);
                else
                        ret = 0;
                do { do { __asm__ __volatile__("": : :"memory"); do { (current_thread_info()->preempt_count)--; } while (0); } while (0); do { if (__builtin_expect(!!(test_thread_flag(3)), 0)) preempt_schedule(); } while (0); } while (0);
        }
        return ret;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void module_put(struct module *module)
{
        if (module) {
                unsigned int cpu = ({ do { do { (current_thread_info()->preempt_count)++; } while (0); __asm__ __volatile__("": : :"memory"); } while (0); (current_thread_info()->cpu); });
                local_dec(&module->ref[cpu].count);

                if (__builtin_expect(!!(!module_is_live(module)), 0))
                        wake_up_process(module->waiter);
                do { do { __asm__ __volatile__("": : :"memory"); do { (current_thread_info()->preempt_count)--; } while (0); } while (0); do { if (__builtin_expect(!!(test_thread_flag(3)), 0)) preempt_schedule(); } while (0); } while (0);
        }
}
# 436 "include/linux/module.h"
const char *module_address_lookup(unsigned long addr,
                                  unsigned long *symbolsize,
                                  unsigned long *offset,
                                  char **modname);


const struct exception_table_entry *search_module_extables(unsigned long addr);

int register_module_notifier(struct notifier_block * nb);
int unregister_module_notifier(struct notifier_block * nb);

extern void print_modules(void);
# 543 "include/linux/module.h"
struct obsolete_modparm {
        char name[64];
        char type[64-sizeof(void *)];
        void *addr;
};
# 583 "include/linux/module.h"
extern void inter_module_register(const char *, struct module *, const void *);
extern void inter_module_unregister(const char *);
extern const void *inter_module_get(const char *);
extern const void *inter_module_get_request(const char *, const char *);
extern void inter_module_put(const char *);
# 14 "mm/filemap.c" 2


# 1 "include/linux/fs.h" 1
# 11 "include/linux/fs.h"
# 1 "include/linux/limits.h" 1
# 12 "include/linux/fs.h" 2


# 1 "include/linux/kdev_t.h" 1
# 21 "include/linux/kdev_t.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int old_valid_dev(dev_t dev)
{
        return ((unsigned int) ((dev) >> 20)) < 256 && ((unsigned int) ((dev) & ((1U << 20) - 1))) < 256;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) u16 old_encode_dev(dev_t dev)
{
        return (((unsigned int) ((dev) >> 20)) << 8) | ((unsigned int) ((dev) & ((1U << 20) - 1)));
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) dev_t old_decode_dev(u16 val)
{
        return ((((val >> 8) & 255) << 20) | (val & 255));
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int new_valid_dev(dev_t dev)
{
        return 1;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) u32 new_encode_dev(dev_t dev)
{
        unsigned major = ((unsigned int) ((dev) >> 20));
        unsigned minor = ((unsigned int) ((dev) & ((1U << 20) - 1)));
        return (minor & 0xff) | (major << 8) | ((minor & ~0xff) << 12);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) dev_t new_decode_dev(u32 dev)
{
        unsigned major = (dev & 0xfff00) >> 8;
        unsigned minor = (dev & 0xff) | ((dev >> 12) & 0xfff00);
        return (((major) << 20) | (minor));
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int huge_valid_dev(dev_t dev)
{
        return 1;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) u64 huge_encode_dev(dev_t dev)
{
        return new_encode_dev(dev);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) dev_t huge_decode_dev(u64 dev)
{
        return new_decode_dev(dev);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int sysv_valid_dev(dev_t dev)
{
        return ((unsigned int) ((dev) >> 20)) < (1<<14) && ((unsigned int) ((dev) & ((1U << 20) - 1))) < (1<<18);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) u32 sysv_encode_dev(dev_t dev)
{
        return ((unsigned int) ((dev) & ((1U << 20) - 1))) | (((unsigned int) ((dev) >> 20)) << 18);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned sysv_major(u32 dev)
{
        return (dev >> 18) & 0x3fff;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned sysv_minor(u32 dev)
{
        return dev & 0x3ffff;
}
# 15 "include/linux/fs.h" 2
# 1 "include/linux/ioctl.h" 1



# 1 "include/asm/ioctl.h" 1
# 56 "include/asm/ioctl.h"
extern unsigned int __invalid_size_argument_for_IOC;
# 5 "include/linux/ioctl.h" 2
# 16 "include/linux/fs.h" 2
# 1 "include/linux/dcache.h" 1
# 10 "include/linux/dcache.h"
# 1 "include/linux/rcupdate.h" 1
# 50 "include/linux/rcupdate.h"
struct rcu_head {
        struct rcu_head *next;
        void (*func)(struct rcu_head *head);
};
# 64 "include/linux/rcupdate.h"
struct rcu_ctrlblk {
        long cur;
        long completed;
        int next_pending;
        seqcount_t lock;
} __attribute__((__aligned__(1 << (7))));


static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int rcu_batch_before(long a, long b)
{
        return (a - b) < 0;
}


static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int rcu_batch_after(long a, long b)
{
        return (a - b) > 0;
}






struct rcu_data {

        long quiescbatch;
        long qsctr;
        long last_qsctr;

        int qs_pending;


        long batch;
        struct rcu_head *nxtlist;
        struct rcu_head **nxttail;
        struct rcu_head *curlist;
};

extern __typeof__(struct rcu_data) per_cpu__rcu_data;
extern struct rcu_ctrlblk rcu_ctrlblk;
# 115 "include/linux/rcupdate.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int rcu_pending(int cpu)
{



        if (((*({ unsigned long __ptr; __asm__ ("" : "=g"(__ptr) : "0"(&per_cpu__rcu_data)); (typeof(&per_cpu__rcu_data)) (__ptr + (__per_cpu_offset[(cpu)])); })).curlist) &&
                  !rcu_batch_before(rcu_ctrlblk.completed,((*({ unsigned long __ptr; __asm__ ("" : "=g"(__ptr) : "0"(&per_cpu__rcu_data)); (typeof(&per_cpu__rcu_data)) (__ptr + (__per_cpu_offset[(cpu)])); })).batch)))
                return 1;


        if (!((*({ unsigned long __ptr; __asm__ ("" : "=g"(__ptr) : "0"(&per_cpu__rcu_data)); (typeof(&per_cpu__rcu_data)) (__ptr + (__per_cpu_offset[(cpu)])); })).curlist) && ((*({ unsigned long __ptr; __asm__ ("" : "=g"(__ptr) : "0"(&per_cpu__rcu_data)); (typeof(&per_cpu__rcu_data)) (__ptr + (__per_cpu_offset[(cpu)])); })).nxtlist))
                return 1;


        if (((*({ unsigned long __ptr; __asm__ ("" : "=g"(__ptr) : "0"(&per_cpu__rcu_data)); (typeof(&per_cpu__rcu_data)) (__ptr + (__per_cpu_offset[(cpu)])); })).quiescbatch) != rcu_ctrlblk.cur || ((*({ unsigned long __ptr; __asm__ ("" : "=g"(__ptr) : "0"(&per_cpu__rcu_data)); (typeof(&per_cpu__rcu_data)) (__ptr + (__per_cpu_offset[(cpu)])); })).qs_pending))
                return 1;


        return 0;
}




extern void rcu_init(void);
extern void rcu_check_callbacks(int cpu, int user);
extern void rcu_restart_cpu(int cpu);


extern void call_rcu(struct rcu_head *head, void (*func)(struct rcu_head *head)) __attribute__((regparm(3)));

extern void synchronize_kernel(void);
# 11 "include/linux/dcache.h" 2


struct nameidata;
struct vfsmount;
# 34 "include/linux/dcache.h"
struct qstr {
        unsigned int hash;
        const unsigned char *name;
        unsigned int len;
};

struct dentry_stat_t {
        int nr_dentry;
        int nr_unused;
        int age_limit;
        int want_pages;
        int dummy[2];
};
extern struct dentry_stat_t dentry_stat;






static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned long
partial_name_hash(unsigned long c, unsigned long prevhash)
{
        return (prevhash + (c << 4) + (c >> 4)) * 11;
}





static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned long end_name_hash(unsigned long hash)
{
        return (unsigned int) hash;
}


static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned int
full_name_hash(const unsigned char *name, unsigned int len)
{
        unsigned long hash = 0;
        while (len--)
                hash = partial_name_hash(*name++, hash);
        return end_name_hash(hash);
}

struct dcookie_struct;



struct dentry {
        atomic_t d_count;
        unsigned int d_flags;
        spinlock_t d_lock;
        struct inode *d_inode;





        struct dentry *d_parent;
        struct hlist_head *d_bucket;
        struct qstr d_name;

        struct list_head d_lru;
        struct list_head d_child;
        struct list_head d_subdirs;
        struct list_head d_alias;
        unsigned long d_time;
        struct dentry_operations *d_op;
        struct super_block *d_sb;
        int d_mounted;
        void *d_fsdata;
        struct rcu_head d_rcu;
        struct dcookie_struct *d_cookie;
        struct hlist_node d_hash;
        unsigned char d_iname[36];
};

struct dentry_operations {
        int (*d_revalidate)(struct dentry *, struct nameidata *);
        int (*d_hash) (struct dentry *, struct qstr *);
        int (*d_compare) (struct dentry *, struct qstr *, struct qstr *);
        int (*d_delete)(struct dentry *);
        void (*d_release)(struct dentry *);
        void (*d_iput)(struct dentry *, struct inode *);
};
# 160 "include/linux/dcache.h"
extern spinlock_t dcache_lock;
# 179 "include/linux/dcache.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void __d_drop(struct dentry *dentry)
{
        if (!(dentry->d_flags & 0x0010)) {
                dentry->d_flags |= 0x0010;
                hlist_del_rcu(&dentry->d_hash);
        }
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void d_drop(struct dentry *dentry)
{
        do { do { do { (current_thread_info()->preempt_count)++; } while (0); __asm__ __volatile__("": : :"memory"); } while (0); if (__builtin_expect(!!(!_raw_spin_trylock(&dcache_lock)), 0)) __preempt_spin_lock(&dcache_lock); } while (0);
        __d_drop(dentry);
        do { _raw_spin_unlock(&dcache_lock); do { do { __asm__ __volatile__("": : :"memory"); do { (current_thread_info()->preempt_count)--; } while (0); } while (0); do { if (__builtin_expect(!!(test_thread_flag(3)), 0)) preempt_schedule(); } while (0); } while (0); } while (0);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int dname_external(struct dentry *dentry)
{
        return dentry->d_name.name != dentry->d_iname;
}




extern void d_instantiate(struct dentry *, struct inode *);
extern void d_delete(struct dentry *);


extern struct dentry * d_alloc(struct dentry *, const struct qstr *);
extern struct dentry * d_alloc_anon(struct inode *);
extern struct dentry * d_splice_alias(struct inode *, struct dentry *);
extern void shrink_dcache_sb(struct super_block *);
extern void shrink_dcache_parent(struct dentry *);
extern void shrink_dcache_anon(struct hlist_head *);
extern int d_invalidate(struct dentry *);


extern struct dentry * d_alloc_root(struct inode *);


extern void d_genocide(struct dentry *);

extern struct dentry *d_find_alias(struct inode *);
extern void d_prune_aliases(struct inode *);


extern int have_submounts(struct dentry *);




extern void d_rehash(struct dentry *);
# 240 "include/linux/dcache.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void d_add(struct dentry *entry, struct inode *inode)
{
        d_instantiate(entry, inode);
        d_rehash(entry);
}


extern void d_move(struct dentry *, struct dentry *);


extern struct dentry * d_lookup(struct dentry *, struct qstr *);
extern struct dentry * __d_lookup(struct dentry *, struct qstr *);


extern int d_validate(struct dentry *, struct dentry *);

extern char * d_path(struct dentry *, struct vfsmount *, char *, int);
# 273 "include/linux/dcache.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct dentry *dget(struct dentry *dentry)
{
        if (dentry) {
                do { if (__builtin_expect(!!((!((&dentry->d_count)->counter))!=0), 0)) __asm__ __volatile__( "ud2\n" "\t.word %c0\n" "\t.long %c1\n" : : "i" (276), "i" ("include/linux/dcache.h")); } while(0);
                atomic_inc(&dentry->d_count);
        }
        return dentry;
}

extern struct dentry * dget_locked(struct dentry *);
# 291 "include/linux/dcache.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int d_unhashed(struct dentry *dentry)
{
        return (dentry->d_flags & 0x0010);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct dentry *dget_parent(struct dentry *dentry)
{
        struct dentry *ret;

        do { do { do { (current_thread_info()->preempt_count)++; } while (0); __asm__ __volatile__("": : :"memory"); } while (0); if (__builtin_expect(!!(!_raw_spin_trylock(&dentry->d_lock)), 0)) __preempt_spin_lock(&dentry->d_lock); } while (0);
        ret = dget(dentry->d_parent);
        do { _raw_spin_unlock(&dentry->d_lock); do { do { __asm__ __volatile__("": : :"memory"); do { (current_thread_info()->preempt_count)--; } while (0); } while (0); do { if (__builtin_expect(!!(test_thread_flag(3)), 0)) preempt_schedule(); } while (0); } while (0); } while (0);
        return ret;
}

extern void dput(struct dentry *);

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int d_mountpoint(struct dentry *dentry)
{
        return dentry->d_mounted;
}

extern struct vfsmount *lookup_mnt(struct vfsmount *, struct dentry *);
extern struct dentry *lookup_create(struct nameidata *nd, int is_dir);

extern int sysctl_vfs_cache_pressure;
# 17 "include/linux/fs.h" 2


# 1 "include/linux/prio_tree.h" 1



struct prio_tree_node {
        struct prio_tree_node *left;
        struct prio_tree_node *right;
        struct prio_tree_node *parent;
};

struct prio_tree_root {
        struct prio_tree_node *prio_tree_node;
        unsigned int index_bits;
};

struct prio_tree_iter {
        struct prio_tree_node *cur;
        unsigned long mask;
        unsigned long value;
        int size_level;
};
# 44 "include/linux/prio_tree.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int prio_tree_empty(const struct prio_tree_root *root)
{
        return root->prio_tree_node == ((void *)0);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int prio_tree_root(const struct prio_tree_node *node)
{
        return node->parent == node;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int prio_tree_left_empty(const struct prio_tree_node *node)
{
        return node->left == node;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int prio_tree_right_empty(const struct prio_tree_node *node)
{
        return node->right == node;
}
# 20 "include/linux/fs.h" 2
# 1 "include/linux/kobject.h" 1
# 21 "include/linux/fs.h" 2


struct iovec;
struct nameidata;
struct pipe_inode_info;
struct poll_table_struct;
struct kstatfs;
struct vm_area_struct;
struct vfsmount;
# 50 "include/linux/fs.h"
struct files_stat_struct {
        int nr_files;
        int nr_free_files;
        int max_files;
};
extern struct files_stat_struct files_stat;

struct inodes_stat_t {
        int nr_inodes;
        int nr_unused;
        int dummy[5];
};
extern struct inodes_stat_t inodes_stat;

extern int leases_enable, dir_notify_enable, lease_break_time;
# 220 "include/linux/fs.h"
# 1 "include/linux/radix-tree.h" 1
# 25 "include/linux/radix-tree.h"
struct radix_tree_root {
        unsigned int height;
        int gfp_mask;
        struct radix_tree_node *rnode;
};
# 47 "include/linux/radix-tree.h"
int radix_tree_insert(struct radix_tree_root *, unsigned long, void *);
void *radix_tree_lookup(struct radix_tree_root *, unsigned long);
void *radix_tree_delete(struct radix_tree_root *, unsigned long);
unsigned int
radix_tree_gang_lookup(struct radix_tree_root *root, void **results,
                        unsigned long first_index, unsigned int max_items);
int radix_tree_preload(int gfp_mask);
void radix_tree_init(void);
void *radix_tree_tag_set(struct radix_tree_root *root,
                        unsigned long index, int tag);
void *radix_tree_tag_clear(struct radix_tree_root *root,
                        unsigned long index, int tag);
int radix_tree_tag_get(struct radix_tree_root *root,
                        unsigned long index, int tag);
unsigned int
radix_tree_gang_lookup_tag(struct radix_tree_root *root, void **results,
                unsigned long first_index, unsigned int max_items, int tag);
int radix_tree_tagged(struct radix_tree_root *root, int tag);

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void radix_tree_preload_end(void)
{
        do { do { __asm__ __volatile__("": : :"memory"); do { (current_thread_info()->preempt_count)--; } while (0); } while (0); do { if (__builtin_expect(!!(test_thread_flag(3)), 0)) preempt_schedule(); } while (0); } while (0);
}
# 221 "include/linux/fs.h" 2
# 1 "include/linux/audit.h" 1
# 106 "include/linux/audit.h"
struct audit_status {
        __u32 mask;
        __u32 enabled;
        __u32 failure;
        __u32 pid;
        __u32 rate_limit;
        __u32 backlog_limit;
        __u32 lost;
        __u32 backlog;
};

struct audit_login {
        __u32 loginuid;
        int msglen;
        char msg[1024];
};

struct audit_rule {
        __u32 flags;
        __u32 action;
        __u32 field_count;
        __u32 mask[64];
        __u32 fields[64];
        __u32 values[64];
};




struct audit_buffer;
struct audit_context;





extern int audit_alloc(struct task_struct *task);
extern void audit_free(struct task_struct *task);
extern void audit_syscall_entry(struct task_struct *task,
                                int major, unsigned long a0, unsigned long a1,
                                unsigned long a2, unsigned long a3);
extern void audit_syscall_exit(struct task_struct *task, int return_code);
extern void audit_getname(const char *name);
extern void audit_putname(const char *name);
extern void audit_inode(const char *name, unsigned long ino, dev_t rdev);


extern int audit_receive_filter(int type, int pid, int uid, int seq,
                                 void *data);
extern void audit_get_stamp(struct audit_context *ctx,
                            struct timespec *t, int *serial);
extern int audit_set_loginuid(struct audit_context *ctx, uid_t loginuid);
# 171 "include/linux/audit.h"
extern void audit_log(struct audit_context *ctx,
                                      const char *fmt, ...)
                            __attribute__((format(printf,2,3)));

extern struct audit_buffer *audit_log_start(struct audit_context *ctx);
extern void audit_log_format(struct audit_buffer *ab,
                                             const char *fmt, ...)
                            __attribute__((format(printf,2,3)));
extern void audit_log_end(struct audit_buffer *ab);
extern void audit_log_end_fast(struct audit_buffer *ab);
extern void audit_log_end_irq(struct audit_buffer *ab);
extern void audit_log_d_path(struct audit_buffer *ab,
                                             const char *prefix,
                                             struct dentry *dentry,
                                             struct vfsmount *vfsmnt);
extern int audit_set_rate_limit(int limit);
extern int audit_set_backlog_limit(int limit);
extern int audit_set_enabled(int state);
extern int audit_set_failure(int state);


extern void audit_send_reply(int pid, int seq, int type,
                                             int done, int multi,
                                             void *payload, int size);
extern void audit_log_lost(const char *message);
# 222 "include/linux/fs.h" 2





extern void update_atime (struct inode *);

extern void __attribute__ ((__section__ (".init.text"))) inode_init(unsigned long);
extern void __attribute__ ((__section__ (".init.text"))) inode_init_early(void);
extern void __attribute__ ((__section__ (".init.text"))) mnt_init(unsigned long);
extern void __attribute__ ((__section__ (".init.text"))) files_init(unsigned long);

struct buffer_head;
typedef int (get_block_t)(struct inode *inode, sector_t iblock,
                        struct buffer_head *bh_result, int create);
typedef int (get_blocks_t)(struct inode *inode, sector_t iblock,
                        unsigned long max_blocks,
                        struct buffer_head *bh_result, int create);
typedef void (dio_iodone_t)(struct inode *inode, loff_t offset,
                        ssize_t bytes, void *private);
# 270 "include/linux/fs.h"
struct iattr {
        unsigned int ia_valid;
        umode_t ia_mode;
        uid_t ia_uid;
        gid_t ia_gid;
        loff_t ia_size;
        struct timespec ia_atime;
        struct timespec ia_mtime;
        struct timespec ia_ctime;
        unsigned int ia_attr_flags;
};
# 294 "include/linux/fs.h"
# 1 "include/linux/quota.h" 1
# 45 "include/linux/quota.h"
typedef __kernel_uid32_t qid_t;
typedef __u64 qsize_t;

extern spinlock_t dq_list_lock;
extern spinlock_t dq_data_lock;
# 107 "include/linux/quota.h"
struct if_dqblk {
        __u64 dqb_bhardlimit;
        __u64 dqb_bsoftlimit;
        __u64 dqb_curspace;
        __u64 dqb_ihardlimit;
        __u64 dqb_isoftlimit;
        __u64 dqb_curinodes;
        __u64 dqb_btime;
        __u64 dqb_itime;
        __u32 dqb_valid;
};
# 128 "include/linux/quota.h"
struct if_dqinfo {
        __u64 dqi_bgrace;
        __u64 dqi_igrace;
        __u32 dqi_flags;
        __u32 dqi_valid;
};



# 1 "include/linux/dqblk_xfs.h" 1
# 58 "include/linux/dqblk_xfs.h"
typedef struct fs_disk_quota {
        __s8 d_version;
        __s8 d_flags;
        __u16 d_fieldmask;
        __u32 d_id;
        __u64 d_blk_hardlimit;
        __u64 d_blk_softlimit;
        __u64 d_ino_hardlimit;
        __u64 d_ino_softlimit;
        __u64 d_bcount;
        __u64 d_icount;
        __s32 d_itimer;

        __s32 d_btimer;
        __u16 d_iwarns;
        __u16 d_bwarns;
        __s32 d_padding2;
        __u64 d_rtb_hardlimit;
        __u64 d_rtb_softlimit;
        __u64 d_rtbcount;
        __s32 d_rtbtimer;
        __u16 d_rtbwarns;
        __s16 d_padding3;
        char d_padding4[8];
} fs_disk_quota_t;
# 130 "include/linux/dqblk_xfs.h"
typedef struct fs_qfilestat {
        __u64 qfs_ino;
        __u64 qfs_nblks;
        __u32 qfs_nextents;
} fs_qfilestat_t;

typedef struct fs_quota_stat {
        __s8 qs_version;
        __u16 qs_flags;
        __s8 qs_pad;
        fs_qfilestat_t qs_uquota;
        fs_qfilestat_t qs_gquota;
        __u32 qs_incoredqs;
        __s32 qs_btimelimit;
        __s32 qs_itimelimit;
        __s32 qs_rtbtimelimit;
        __u16 qs_bwarnlimit;
        __u16 qs_iwarnlimit;
} fs_quota_stat_t;
# 138 "include/linux/quota.h" 2
# 1 "include/linux/dqblk_v1.h" 1
# 15 "include/linux/dqblk_v1.h"
struct v1_mem_dqinfo {
};
# 139 "include/linux/quota.h" 2
# 1 "include/linux/dqblk_v2.h" 1
# 14 "include/linux/dqblk_v2.h"
struct v2_mem_dqinfo {
        unsigned int dqi_blocks;
        unsigned int dqi_free_blk;
        unsigned int dqi_free_entry;
};
# 140 "include/linux/quota.h" 2
# 148 "include/linux/quota.h"
struct mem_dqblk {
        __u32 dqb_bhardlimit;
        __u32 dqb_bsoftlimit;
        qsize_t dqb_curspace;
        __u32 dqb_ihardlimit;
        __u32 dqb_isoftlimit;
        __u32 dqb_curinodes;
        time_t dqb_btime;
        time_t dqb_itime;
};




struct quota_format_type;

struct mem_dqinfo {
        struct quota_format_type *dqi_format;
        struct list_head dqi_dirty_list;
        unsigned long dqi_flags;
        unsigned int dqi_bgrace;
        unsigned int dqi_igrace;
        union {
                struct v1_mem_dqinfo v1_i;
                struct v2_mem_dqinfo v2_i;
        } u;
};

struct super_block;





extern void mark_info_dirty(struct super_block *sb, int type);







struct dqstats {
        int lookups;
        int drops;
        int reads;
        int writes;
        int cache_hits;
        int allocated_dquots;
        int free_dquots;
        int syncs;
};

extern struct dqstats dqstats;
# 211 "include/linux/quota.h"
struct dquot {
        struct hlist_node dq_hash;
        struct list_head dq_inuse;
        struct list_head dq_free;
        struct list_head dq_dirty;
        struct semaphore dq_lock;
        atomic_t dq_count;
        wait_queue_head_t dq_wait_unused;
        struct super_block *dq_sb;
        unsigned int dq_id;
        loff_t dq_off;
        unsigned long dq_flags;
        short dq_type;
        struct mem_dqblk dq_dqb;
};







struct quota_format_ops {
        int (*check_quota_file)(struct super_block *sb, int type);
        int (*read_file_info)(struct super_block *sb, int type);
        int (*write_file_info)(struct super_block *sb, int type);
        int (*free_file_info)(struct super_block *sb, int type);
        int (*read_dqblk)(struct dquot *dquot);
        int (*commit_dqblk)(struct dquot *dquot);
        int (*release_dqblk)(struct dquot *dquot);
};


struct dquot_operations {
        int (*initialize) (struct inode *, int);
        int (*drop) (struct inode *);
        int (*alloc_space) (struct inode *, qsize_t, int);
        int (*alloc_inode) (const struct inode *, unsigned long);
        int (*free_space) (struct inode *, qsize_t);
        int (*free_inode) (const struct inode *, unsigned long);
        int (*transfer) (struct inode *, struct iattr *);
        int (*write_dquot) (struct dquot *);
        int (*acquire_dquot) (struct dquot *);
        int (*release_dquot) (struct dquot *);
        int (*mark_dirty) (struct dquot *);
        int (*write_info) (struct super_block *, int);
};


struct quotactl_ops {
        int (*quota_on)(struct super_block *, int, int, char *);
        int (*quota_off)(struct super_block *, int);
        int (*quota_sync)(struct super_block *, int);
        int (*get_info)(struct super_block *, int, struct if_dqinfo *);
        int (*set_info)(struct super_block *, int, struct if_dqinfo *);
        int (*get_dqblk)(struct super_block *, int, qid_t, struct if_dqblk *);
        int (*set_dqblk)(struct super_block *, int, qid_t, struct if_dqblk *);
        int (*get_xstate)(struct super_block *, struct fs_quota_stat *);
        int (*set_xstate)(struct super_block *, unsigned int, int);
        int (*get_xquota)(struct super_block *, int, qid_t, struct fs_disk_quota *);
        int (*set_xquota)(struct super_block *, int, qid_t, struct fs_disk_quota *);
};

struct quota_format_type {
        int qf_fmt_id;
        struct quota_format_ops *qf_ops;
        struct module *qf_owner;
        struct quota_format_type *qf_next;
};




struct quota_info {
        unsigned int flags;
        struct semaphore dqio_sem;
        struct semaphore dqonoff_sem;
        struct rw_semaphore dqptr_sem;
        struct file *files[2];
        struct mem_dqinfo info[2];
        struct quota_format_ops *ops[2];
};


int mark_dquot_dirty(struct dquot *dquot);
# 305 "include/linux/quota.h"
int register_quota_format(struct quota_format_type *fmt);
void unregister_quota_format(struct quota_format_type *fmt);

struct quota_module_name {
        int qm_fmt_id;
        char *qm_mod_name;
};
# 295 "include/linux/fs.h" 2




struct page;
struct address_space;
struct writeback_control;
struct kiocb;

struct address_space_operations {
        int (*writepage)(struct page *page, struct writeback_control *wbc);
        int (*readpage)(struct file *, struct page *);
        int (*sync_page)(struct page *);


        int (*writepages)(struct address_space *, struct writeback_control *);


        int (*set_page_dirty)(struct page *page);

        int (*readpages)(struct file *filp, struct address_space *mapping,
                        struct list_head *pages, unsigned nr_pages);





        int (*prepare_write)(struct file *, struct page *, unsigned, unsigned);
        int (*commit_write)(struct file *, struct page *, unsigned, unsigned);

        sector_t (*bmap)(struct address_space *, sector_t);
        int (*invalidatepage) (struct page *, unsigned long);
        int (*releasepage) (struct page *, int);
        ssize_t (*direct_IO)(int, struct kiocb *, const struct iovec *iov,
                        loff_t offset, unsigned long nr_segs);
};

struct backing_dev_info;
struct address_space {
        struct inode *host;
        struct radix_tree_root page_tree;
        spinlock_t tree_lock;
        unsigned long nrpages;
        unsigned long writeback_index;
        struct address_space_operations *a_ops;
        struct prio_tree_root i_mmap;
        unsigned int i_mmap_writable;
        struct list_head i_mmap_nonlinear;
        spinlock_t i_mmap_lock;
        atomic_t truncate_count;
        unsigned long flags;
        struct backing_dev_info *backing_dev_info;
        spinlock_t private_lock;
        struct list_head private_list;
        struct address_space *assoc_mapping;
};

struct block_device {
        dev_t bd_dev;
        struct inode * bd_inode;
        int bd_openers;
        struct semaphore bd_sem;
        struct semaphore bd_mount_sem;
        struct list_head bd_inodes;
        void * bd_holder;
        int bd_holders;
        struct block_device * bd_contains;
        unsigned bd_block_size;
        struct hd_struct * bd_part;

        unsigned bd_part_count;
        int bd_invalidated;
        struct gendisk * bd_disk;
        struct list_head bd_list;
        struct backing_dev_info *bd_inode_backing_dev_info;






        unsigned long bd_private;
};
# 386 "include/linux/fs.h"
int mapping_tagged(struct address_space *mapping, int tag);




static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int mapping_mapped(struct address_space *mapping)
{
        return !prio_tree_empty(&mapping->i_mmap) ||
                !list_empty(&mapping->i_mmap_nonlinear);
}







static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int mapping_writably_mapped(struct address_space *mapping)
{
        return mapping->i_mmap_writable != 0;
}
# 419 "include/linux/fs.h"
struct inode {
        struct hlist_node i_hash;
        struct list_head i_list;
        struct list_head i_dentry;
        unsigned long i_ino;
        atomic_t i_count;
        umode_t i_mode;
        unsigned int i_nlink;
        uid_t i_uid;
        gid_t i_gid;
        dev_t i_rdev;
        loff_t i_size;
        struct timespec i_atime;
        struct timespec i_mtime;
        struct timespec i_ctime;
        unsigned int i_blkbits;
        unsigned long i_blksize;
        unsigned long i_version;
        unsigned long i_blocks;
        unsigned short i_bytes;
        spinlock_t i_lock;
        struct semaphore i_sem;
        struct rw_semaphore i_alloc_sem;
        struct inode_operations *i_op;
        struct file_operations *i_fop;
        struct super_block *i_sb;
        struct file_lock *i_flock;
        struct address_space *i_mapping;
        struct address_space i_data;

        struct dquot *i_dquot[2];


        struct list_head i_devices;
        struct pipe_inode_info *i_pipe;
        struct block_device *i_bdev;
        struct cdev *i_cdev;
        int i_cindex;

        unsigned long i_dnotify_mask;
        struct dnotify_struct *i_dnotify;

        unsigned long i_state;
        unsigned long dirtied_when;

        unsigned int i_flags;
        unsigned char i_sock;

        atomic_t i_writecount;
        void *i_security;
        __u32 i_generation;
        union {
                void *generic_ip;
        } u;

        seqcount_t i_size_seqcount;

};
# 488 "include/linux/fs.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) loff_t i_size_read(struct inode *inode)
{

        loff_t i_size;
        unsigned int seq;

        do {
                seq = read_seqcount_begin(&inode->i_size_seqcount);
                i_size = inode->i_size;
        } while (read_seqcount_retry(&inode->i_size_seqcount, seq));
        return i_size;
# 509 "include/linux/fs.h"
}


static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void i_size_write(struct inode *inode, loff_t i_size)
{

        write_seqcount_begin(&inode->i_size_seqcount);
        inode->i_size = i_size;
        write_seqcount_end(&inode->i_size_seqcount);







}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned iminor(struct inode *inode)
{
        return ((unsigned int) ((inode->i_rdev) & ((1U << 20) - 1)));
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned imajor(struct inode *inode)
{
        return ((unsigned int) ((inode->i_rdev) >> 20));
}

extern struct block_device *I_BDEV(struct inode *inode);

struct fown_struct {
        rwlock_t lock;
        int pid;
        uid_t uid, euid;
        void *security;
        int signum;
};




struct file_ra_state {
        unsigned long start;
        unsigned long size;
        unsigned long next_size;
        unsigned long prev_page;
        unsigned long ahead_start;
        unsigned long ahead_size;
        unsigned long serial_cnt;
        unsigned long average;
        unsigned long ra_pages;
        unsigned long mmap_hit;
        unsigned long mmap_miss;
};

struct file {
        struct list_head f_list;
        struct dentry *f_dentry;
        struct vfsmount *f_vfsmnt;
        struct file_operations *f_op;
        atomic_t f_count;
        unsigned int f_flags;
        mode_t f_mode;
        int f_error;
        loff_t f_pos;
        struct fown_struct f_owner;
        unsigned int f_uid, f_gid;
        struct file_ra_state f_ra;

        unsigned long f_version;
        void *f_security;


        void *private_data;



        struct list_head f_ep_links;
        spinlock_t f_ep_lock;

        struct address_space *f_mapping;
};
extern spinlock_t files_lock;







extern int open_private_file(struct file *, struct dentry *, int);

extern void close_private_file(struct file *file);
# 627 "include/linux/fs.h"
typedef struct files_struct *fl_owner_t;


# 1 "include/linux/nfs_fs_i.h" 1





# 1 "include/linux/nfs.h" 1
# 10 "include/linux/nfs.h"
# 1 "include/linux/sunrpc/msg_prot.h" 1
# 15 "include/linux/sunrpc/msg_prot.h"
typedef u32 rpc_authflavor_t;

enum rpc_auth_flavors {
        RPC_AUTH_NULL = 0,
        RPC_AUTH_UNIX = 1,
        RPC_AUTH_SHORT = 2,
        RPC_AUTH_DES = 3,
        RPC_AUTH_KRB = 4,
        RPC_AUTH_GSS = 6,
        RPC_AUTH_MAXFLAVOR = 8,

        RPC_AUTH_GSS_KRB5 = 390003,
        RPC_AUTH_GSS_KRB5I = 390004,
        RPC_AUTH_GSS_KRB5P = 390005,
        RPC_AUTH_GSS_LKEY = 390006,
        RPC_AUTH_GSS_LKEYI = 390007,
        RPC_AUTH_GSS_LKEYP = 390008,
        RPC_AUTH_GSS_SPKM = 390009,
        RPC_AUTH_GSS_SPKMI = 390010,
        RPC_AUTH_GSS_SPKMP = 390011,
};

enum rpc_msg_type {
        RPC_CALL = 0,
        RPC_REPLY = 1
};

enum rpc_reply_stat {
        RPC_MSG_ACCEPTED = 0,
        RPC_MSG_DENIED = 1
};

enum rpc_accept_stat {
        RPC_SUCCESS = 0,
        RPC_PROG_UNAVAIL = 1,
        RPC_PROG_MISMATCH = 2,
        RPC_PROC_UNAVAIL = 3,
        RPC_GARBAGE_ARGS = 4,
        RPC_SYSTEM_ERR = 5
};

enum rpc_reject_stat {
        RPC_MISMATCH = 0,
        RPC_AUTH_ERROR = 1
};

enum rpc_auth_stat {
        RPC_AUTH_OK = 0,
        RPC_AUTH_BADCRED = 1,
        RPC_AUTH_REJECTEDCRED = 2,
        RPC_AUTH_BADVERF = 3,
        RPC_AUTH_REJECTEDVERF = 4,
        RPC_AUTH_TOOWEAK = 5,

        RPCSEC_GSS_CREDPROBLEM = 13,
        RPCSEC_GSS_CTXPROBLEM = 14
};
# 11 "include/linux/nfs.h" 2
# 41 "include/linux/nfs.h"
 enum nfs_stat {
        NFS_OK = 0,
        NFSERR_PERM = 1,
        NFSERR_NOENT = 2,
        NFSERR_IO = 5,
        NFSERR_NXIO = 6,
        NFSERR_EAGAIN = 11,
        NFSERR_ACCES = 13,
        NFSERR_EXIST = 17,
        NFSERR_XDEV = 18,
        NFSERR_NODEV = 19,
        NFSERR_NOTDIR = 20,
        NFSERR_ISDIR = 21,
        NFSERR_INVAL = 22,
        NFSERR_FBIG = 27,
        NFSERR_NOSPC = 28,
        NFSERR_ROFS = 30,
        NFSERR_MLINK = 31,
        NFSERR_OPNOTSUPP = 45,
        NFSERR_NAMETOOLONG = 63,
        NFSERR_NOTEMPTY = 66,
        NFSERR_DQUOT = 69,
        NFSERR_STALE = 70,
        NFSERR_REMOTE = 71,
        NFSERR_WFLUSH = 99,
        NFSERR_BADHANDLE = 10001,
        NFSERR_NOT_SYNC = 10002,
        NFSERR_BAD_COOKIE = 10003,
        NFSERR_NOTSUPP = 10004,
        NFSERR_TOOSMALL = 10005,
        NFSERR_SERVERFAULT = 10006,
        NFSERR_BADTYPE = 10007,
        NFSERR_JUKEBOX = 10008,
        NFSERR_SAME = 10009,
        NFSERR_DENIED = 10010,
        NFSERR_EXPIRED = 10011,
        NFSERR_LOCKED = 10012,
        NFSERR_GRACE = 10013,
        NFSERR_FHEXPIRED = 10014,
        NFSERR_SHARE_DENIED = 10015,
        NFSERR_WRONGSEC = 10016,
        NFSERR_CLID_INUSE = 10017,
        NFSERR_RESOURCE = 10018,
        NFSERR_MOVED = 10019,
        NFSERR_NOFILEHANDLE = 10020,
        NFSERR_MINOR_VERS_MISMATCH = 10021,
        NFSERR_STALE_CLIENTID = 10022,
        NFSERR_STALE_STATEID = 10023,
        NFSERR_OLD_STATEID = 10024,
        NFSERR_BAD_STATEID = 10025,
        NFSERR_BAD_SEQID = 10026,
        NFSERR_NOT_SAME = 10027,
        NFSERR_LOCK_RANGE = 10028,
        NFSERR_SYMLINK = 10029,
        NFSERR_RESTOREFH = 10030,
        NFSERR_LEASE_MOVED = 10031,
        NFSERR_ATTRNOTSUPP = 10032,
        NFSERR_NO_GRACE = 10033,
        NFSERR_RECLAIM_BAD = 10034,
        NFSERR_RECLAIM_CONFLICT = 10035,
        NFSERR_BAD_XDR = 10036,
        NFSERR_LOCKS_HELD = 10037,
        NFSERR_OPENMODE = 10038,
        NFSERR_BADOWNER = 10039,
        NFSERR_BADCHAR = 10040,
        NFSERR_BADNAME = 10041,
        NFSERR_BAD_RANGE = 10042,
        NFSERR_LOCK_NOTSUPP = 10043,
        NFSERR_OP_ILLEGAL = 10044,
        NFSERR_DEADLOCK = 10045,
        NFSERR_FILE_OPEN = 10046,
        NFSERR_ADMIN_REVOKED = 10047,
        NFSERR_CB_PATH_DOWN = 10048,
        NFSERR_REPLAY_ME = 10049
};



enum nfs_ftype {
        NFNON = 0,
        NFREG = 1,
        NFDIR = 2,
        NFBLK = 3,
        NFCHR = 4,
        NFLNK = 5,
        NFSOCK = 6,
        NFBAD = 7,
        NFFIFO = 8
};






struct nfs_fh {
        unsigned short size;
        unsigned char data[128];
};
# 148 "include/linux/nfs.h"
enum nfs3_stable_how {
        NFS_UNSTABLE = 0,
        NFS_DATA_SYNC = 1,
        NFS_FILE_SYNC = 2
};
# 7 "include/linux/nfs_fs_i.h" 2




struct nfs_lock_info {
        u32 state;
        u32 flags;
        struct nlm_host *host;
};
# 631 "include/linux/fs.h" 2

struct file_lock {
        struct file_lock *fl_next;
        struct list_head fl_link;
        struct list_head fl_block;
        fl_owner_t fl_owner;
        unsigned int fl_pid;
        wait_queue_head_t fl_wait;
        struct file *fl_file;
        unsigned char fl_flags;
        unsigned char fl_type;
        loff_t fl_start;
        loff_t fl_end;

        void (*fl_notify)(struct file_lock *);
        void (*fl_insert)(struct file_lock *);
        void (*fl_remove)(struct file_lock *);

        struct fasync_struct * fl_fasync;
        unsigned long fl_break_time;

        union {
                struct nfs_lock_info nfs_fl;
        } fl_u;
};
# 664 "include/linux/fs.h"
extern struct list_head file_lock_list;

# 1 "include/linux/fcntl.h" 1



# 1 "include/asm/fcntl.h" 1
# 70 "include/asm/fcntl.h"
struct flock {
        short l_type;
        short l_whence;
        off_t l_start;
        off_t l_len;
        pid_t l_pid;
};

struct flock64 {
        short l_type;
        short l_whence;
        loff_t l_start;
        loff_t l_len;
        pid_t l_pid;
};
# 5 "include/linux/fcntl.h" 2
# 667 "include/linux/fs.h" 2

extern int fcntl_getlk(struct file *, struct flock *);
extern int fcntl_setlk(struct file *, unsigned int, struct flock *);


extern int fcntl_getlk64(struct file *, struct flock64 *);
extern int fcntl_setlk64(struct file *, unsigned int, struct flock64 *);


extern void send_sigio(struct fown_struct *fown, int fd, int band);
extern int fcntl_setlease(unsigned int fd, struct file *filp, long arg);
extern int fcntl_getlease(struct file *filp);


extern void locks_init_lock(struct file_lock *);
extern void locks_copy_lock(struct file_lock *, struct file_lock *);
extern void locks_remove_posix(struct file *, fl_owner_t);
extern void locks_remove_flock(struct file *);
extern struct file_lock *posix_test_lock(struct file *, struct file_lock *);
extern int posix_lock_file(struct file *, struct file_lock *);
extern void posix_block_lock(struct file_lock *, struct file_lock *);
extern void posix_unblock_lock(struct file *, struct file_lock *);
extern int posix_locks_deadlock(struct file_lock *, struct file_lock *);
extern int __break_lease(struct inode *inode, unsigned int flags);
extern void lease_get_mtime(struct inode *, struct timespec *time);
extern int lock_may_read(struct inode *, loff_t start, unsigned long count);
extern int lock_may_write(struct inode *, loff_t start, unsigned long count);
extern void steal_locks(fl_owner_t from);

struct fasync_struct {
        int magic;
        int fa_fd;
        struct fasync_struct *fa_next;
        struct file *fa_file;
};




extern int fasync_helper(int, struct file *, int, struct fasync_struct **);

extern void kill_fasync(struct fasync_struct **, int, int);

extern void __kill_fasync(struct fasync_struct *, int, int);

extern int f_setown(struct file *filp, unsigned long arg, int force);
extern void f_delown(struct file *filp);
extern int send_sigurg(struct fown_struct *fown);
# 724 "include/linux/fs.h"
extern struct list_head super_blocks;
extern spinlock_t sb_lock;



struct super_block {
        struct list_head s_list;
        dev_t s_dev;
        unsigned long s_blocksize;
        unsigned long s_old_blocksize;
        unsigned char s_blocksize_bits;
        unsigned char s_dirt;
        unsigned long long s_maxbytes;
        struct file_system_type *s_type;
        struct super_operations *s_op;
        struct dquot_operations *dq_op;
        struct quotactl_ops *s_qcop;
        struct export_operations *s_export_op;
        unsigned long s_flags;
        unsigned long s_magic;
        struct dentry *s_root;
        struct rw_semaphore s_umount;
        struct semaphore s_lock;
        int s_count;
        int s_syncing;
        int s_need_sync_fs;
        atomic_t s_active;
        void *s_security;

        struct list_head s_dirty;
        struct list_head s_io;
        struct hlist_head s_anon;
        struct list_head s_files;

        struct block_device *s_bdev;
        struct list_head s_instances;
        struct quota_info s_dquot;

        int s_frozen;
        wait_queue_head_t s_wait_unfrozen;

        char s_id[32];

        void *s_fs_info;





        struct semaphore s_vfs_rename_sem;
};




enum {
        SB_UNFROZEN = 0,
        SB_FREEZE_WRITE = 1,
        SB_FREEZE_TRANS = 2,
};







static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void lock_super(struct super_block * sb)
{
        down(&sb->s_lock);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void unlock_super(struct super_block * sb)
{
        up(&sb->s_lock);
}




extern int vfs_create(struct inode *, struct dentry *, int, struct nameidata *);
extern int vfs_mkdir(struct inode *, struct dentry *, int);
extern int vfs_mknod(struct inode *, struct dentry *, int, dev_t);
extern int vfs_symlink(struct inode *, struct dentry *, const char *, int);
extern int vfs_link(struct dentry *, struct inode *, struct dentry *);
extern int vfs_rmdir(struct inode *, struct dentry *);
extern int vfs_unlink(struct inode *, struct dentry *);
extern int vfs_rename(struct inode *, struct dentry *, struct inode *, struct dentry *);
# 835 "include/linux/fs.h"
typedef int (*filldir_t)(void *, const char *, int, loff_t, ino_t, unsigned);

struct block_device_operations {
        int (*open) (struct inode *, struct file *);
        int (*release) (struct inode *, struct file *);
        int (*ioctl) (struct inode *, struct file *, unsigned, unsigned long);
        int (*media_changed) (struct gendisk *);
        int (*revalidate_disk) (struct gendisk *);
        struct module *owner;
};
# 855 "include/linux/fs.h"
typedef struct {
        size_t written;
        size_t count;
        union {
                char * buf;
                void *data;
        } arg;
        int error;
} read_descriptor_t;

typedef int (*read_actor_t)(read_descriptor_t *, struct page *, unsigned long, unsigned long);






struct file_operations {
        struct module *owner;
        loff_t (*llseek) (struct file *, loff_t, int);
        ssize_t (*read) (struct file *, char *, size_t, loff_t *);
        ssize_t (*aio_read) (struct kiocb *, char *, size_t, loff_t);
        ssize_t (*write) (struct file *, const char *, size_t, loff_t *);
        ssize_t (*aio_write) (struct kiocb *, const char *, size_t, loff_t);
        int (*readdir) (struct file *, void *, filldir_t);
        unsigned int (*poll) (struct file *, struct poll_table_struct *);
        int (*ioctl) (struct inode *, struct file *, unsigned int, unsigned long);
        int (*mmap) (struct file *, struct vm_area_struct *);
        int (*open) (struct inode *, struct file *);
        int (*flush) (struct file *);
        int (*release) (struct inode *, struct file *);
        int (*fsync) (struct file *, struct dentry *, int datasync);
        int (*aio_fsync) (struct kiocb *, int datasync);
        int (*fasync) (int, struct file *, int);
        int (*lock) (struct file *, int, struct file_lock *);
        ssize_t (*readv) (struct file *, const struct iovec *, unsigned long, loff_t *);
        ssize_t (*writev) (struct file *, const struct iovec *, unsigned long, loff_t *);
        ssize_t (*sendfile) (struct file *, loff_t *, size_t, read_actor_t, void *);
        ssize_t (*sendpage) (struct file *, struct page *, int, size_t, loff_t *, int);
        unsigned long (*get_unmapped_area)(struct file *, unsigned long, unsigned long, unsigned long, unsigned long);
        int (*check_flags)(int);
        int (*dir_notify)(struct file *filp, unsigned long arg);
};

struct inode_operations {
        int (*create) (struct inode *,struct dentry *,int, struct nameidata *);
        struct dentry * (*lookup) (struct inode *,struct dentry *, struct nameidata *);
        int (*link) (struct dentry *,struct inode *,struct dentry *);
        int (*unlink) (struct inode *,struct dentry *);
        int (*symlink) (struct inode *,struct dentry *,const char *);
        int (*mkdir) (struct inode *,struct dentry *,int);
        int (*rmdir) (struct inode *,struct dentry *);
        int (*mknod) (struct inode *,struct dentry *,int,dev_t);
        int (*rename) (struct inode *, struct dentry *,
                        struct inode *, struct dentry *);
        int (*readlink) (struct dentry *, char *,int);
        int (*follow_link) (struct dentry *, struct nameidata *);
        void (*put_link) (struct dentry *, struct nameidata *);
        void (*truncate) (struct inode *);
        int (*permission) (struct inode *, int, struct nameidata *);
        int (*setattr) (struct dentry *, struct iattr *);
        int (*getattr) (struct vfsmount *mnt, struct dentry *, struct kstat *);
        int (*setxattr) (struct dentry *, const char *,const void *,size_t,int);
        ssize_t (*getxattr) (struct dentry *, const char *, void *, size_t);
        ssize_t (*listxattr) (struct dentry *, char *, size_t);
        int (*removexattr) (struct dentry *, const char *);
};

struct seq_file;

extern ssize_t vfs_read(struct file *, char *, size_t, loff_t *);
extern ssize_t vfs_write(struct file *, const char *, size_t, loff_t *);
extern ssize_t vfs_readv(struct file *, const struct iovec *,
                unsigned long, loff_t *);
extern ssize_t vfs_writev(struct file *, const struct iovec *,
                unsigned long, loff_t *);





struct super_operations {
        struct inode *(*alloc_inode)(struct super_block *sb);
        void (*destroy_inode)(struct inode *);

        void (*read_inode) (struct inode *);

        void (*dirty_inode) (struct inode *);
        void (*write_inode) (struct inode *, int);
        void (*put_inode) (struct inode *);
        void (*drop_inode) (struct inode *);
        void (*delete_inode) (struct inode *);
        void (*put_super) (struct super_block *);
        void (*write_super) (struct super_block *);
        int (*sync_fs)(struct super_block *sb, int wait);
        void (*write_super_lockfs) (struct super_block *);
        void (*unlockfs) (struct super_block *);
        int (*statfs) (struct super_block *, struct kstatfs *);
        int (*remount_fs) (struct super_block *, int *, char *);
        void (*clear_inode) (struct inode *);
        void (*umount_begin) (struct super_block *);

        int (*show_options)(struct seq_file *, struct vfsmount *);
};
# 971 "include/linux/fs.h"
extern void __mark_inode_dirty(struct inode *, int);
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void mark_inode_dirty(struct inode *inode)
{
        __mark_inode_dirty(inode, (1 | 2 | 4));
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void mark_inode_dirty_sync(struct inode *inode)
{
        __mark_inode_dirty(inode, 1);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void touch_atime(struct vfsmount *mnt, struct dentry *dentry)
{

        update_atime(dentry->d_inode);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void file_accessed(struct file *file)
{
        if (!(file->f_flags & 01000000))
                touch_atime(file->f_vfsmnt, file->f_dentry);
}

int sync_inode(struct inode *inode, struct writeback_control *wbc);
# 1076 "include/linux/fs.h"
struct export_operations {
        struct dentry *(*decode_fh)(struct super_block *sb, __u32 *fh, int fh_len, int fh_type,
                         int (*acceptable)(void *context, struct dentry *de),
                         void *context);
        int (*encode_fh)(struct dentry *de, __u32 *fh, int *max_len,
                         int connectable);


        int (*get_name)(struct dentry *parent, char *name,
                        struct dentry *child);
        struct dentry * (*get_parent)(struct dentry *child);
        struct dentry * (*get_dentry)(struct super_block *sb, void *inump);


        struct dentry * (*find_exported_dentry)(
                struct super_block *sb, void *obj, void *parent,
                int (*acceptable)(void *context, struct dentry *de),
                void *context);


};


struct file_system_type {
        const char *name;
        int fs_flags;
        struct super_block *(*get_sb) (struct file_system_type *, int,
                                       const char *, void *);
        void (*kill_sb) (struct super_block *);
        struct module *owner;
        struct file_system_type * next;
        struct list_head fs_supers;
};

struct super_block *get_sb_bdev(struct file_system_type *fs_type,
        int flags, const char *dev_name, void *data,
        int (*fill_super)(struct super_block *, void *, int));
struct super_block *get_sb_single(struct file_system_type *fs_type,
        int flags, void *data,
        int (*fill_super)(struct super_block *, void *, int));
struct super_block *get_sb_nodev(struct file_system_type *fs_type,
        int flags, void *data,
        int (*fill_super)(struct super_block *, void *, int));
void generic_shutdown_super(struct super_block *sb);
void kill_block_super(struct super_block *sb);
void kill_anon_super(struct super_block *sb);
void kill_litter_super(struct super_block *sb);
void deactivate_super(struct super_block *sb);
int set_anon_super(struct super_block *s, void *data);
struct super_block *sget(struct file_system_type *type,
                        int (*test)(struct super_block *,void *),
                        int (*set)(struct super_block *,void *),
                        void *data);
struct super_block *get_sb_pseudo(struct file_system_type *, char *,
                        struct super_operations *ops, unsigned long);
int __put_super(struct super_block *sb);
void unnamed_dev_init(void);







extern int register_filesystem(struct file_system_type *);
extern int unregister_filesystem(struct file_system_type *);
extern struct vfsmount *kern_mount(struct file_system_type *);
extern int may_umount_tree(struct vfsmount *);
extern int may_umount(struct vfsmount *);
extern long do_mount(char *, char *, char *, unsigned long, void *);

extern int vfs_statfs(struct super_block *, struct kstatfs *);
# 1157 "include/linux/fs.h"
extern int locks_mandatory_locked(struct inode *);
extern int locks_mandatory_area(int, struct inode *, struct file *, loff_t, size_t);
# 1167 "include/linux/fs.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int locks_verify_locked(struct inode *inode)
{
        if ((((inode)->i_sb->s_flags & (64)) && ((inode)->i_mode & (0002000 | 00010)) == 0002000))
                return locks_mandatory_locked(inode);
        return 0;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int locks_verify_area(int read_write, struct inode *inode,
                                    struct file *filp, loff_t offset,
                                    size_t count)
{
        if (inode->i_flock && (((inode)->i_sb->s_flags & (64)) && ((inode)->i_mode & (0002000 | 00010)) == 0002000))
                return locks_mandatory_area(read_write, inode, filp, offset, count);
        return 0;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int locks_verify_truncate(struct inode *inode,
                                    struct file *filp,
                                    loff_t size)
{
        if (inode->i_flock && (((inode)->i_sb->s_flags & (64)) && ((inode)->i_mode & (0002000 | 00010)) == 0002000))
                return locks_mandatory_area(
                        2, inode, filp,
                        size < inode->i_size ? size : inode->i_size,
                        (size < inode->i_size ? inode->i_size - size
                         : size - inode->i_size)
                );
        return 0;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int break_lease(struct inode *inode, unsigned int mode)
{
        if (inode->i_flock)
                return __break_lease(inode, mode);
        return 0;
}



extern int do_truncate(struct dentry *, loff_t start);
extern struct file *filp_open(const char *, int, int);
extern struct file * dentry_open(struct dentry *, struct vfsmount *, int);
extern int filp_close(struct file *, fl_owner_t id);
extern char * getname(const char *);


extern void __attribute__ ((__section__ (".init.text"))) vfs_caches_init_early(void);
extern void __attribute__ ((__section__ (".init.text"))) vfs_caches_init(unsigned long);
# 1230 "include/linux/fs.h"
extern int register_blkdev(unsigned int, const char *);
extern int unregister_blkdev(unsigned int, const char *);
extern struct block_device *bdget(dev_t);
extern void bd_set_size(struct block_device *, loff_t size);
extern void bd_forget(struct inode *inode);
extern void bdput(struct block_device *);
extern int blkdev_open(struct inode *, struct file *);
extern struct block_device *open_by_devnum(dev_t, unsigned);
extern struct file_operations def_blk_fops;
extern struct address_space_operations def_blk_aops;
extern struct file_operations def_chr_fops;
extern struct file_operations bad_sock_fops;
extern struct file_operations def_fifo_fops;
extern int ioctl_by_bdev(struct block_device *, unsigned, unsigned long);
extern int blkdev_ioctl(struct inode *, struct file *, unsigned, unsigned long);
extern int blkdev_get(struct block_device *, mode_t, unsigned);
extern int blkdev_put(struct block_device *);
extern int bd_claim(struct block_device *, void *);
extern void bd_release(struct block_device *);


extern int alloc_chrdev_region(dev_t *, unsigned, unsigned, char *);
extern int register_chrdev_region(dev_t, unsigned, char *);
extern int register_chrdev(unsigned int, const char *,
                           struct file_operations *);
extern int unregister_chrdev(unsigned int, const char *);
extern void unregister_chrdev_region(dev_t, unsigned);
extern int chrdev_open(struct inode *, struct file *);



extern const char *__bdevname(dev_t, char *buffer);
extern const char *bdevname(struct block_device *bdev, char *buffer);
extern struct block_device *lookup_bdev(const char *);
extern struct block_device *open_bdev_excl(const char *, int, void *);
extern void close_bdev_excl(struct block_device *);

extern void init_special_inode(struct inode *, umode_t, dev_t);


extern void make_bad_inode(struct inode *);
extern int is_bad_inode(struct inode *);

extern struct file_operations read_fifo_fops;
extern struct file_operations write_fifo_fops;
extern struct file_operations rdwr_fifo_fops;
extern struct file_operations read_pipe_fops;
extern struct file_operations write_pipe_fops;
extern struct file_operations rdwr_pipe_fops;

extern int fs_may_remount_ro(struct super_block *);
# 1292 "include/linux/fs.h"
extern int check_disk_change(struct block_device *);
extern int invalidate_inodes(struct super_block *);
extern int __invalidate_device(struct block_device *, int);
extern int invalidate_partition(struct gendisk *, int);
unsigned long invalidate_mapping_pages(struct address_space *mapping,
                                        unsigned long start, unsigned long end);
unsigned long invalidate_inode_pages(struct address_space *mapping);
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void invalidate_remote_inode(struct inode *inode)
{
        if ((((inode->i_mode) & 00170000) == 0100000) || (((inode->i_mode) & 00170000) == 0040000) ||
            (((inode->i_mode) & 00170000) == 0120000))
                invalidate_inode_pages(inode->i_mapping);
}
extern void invalidate_inode_pages2(struct address_space *mapping);
extern void write_inode_now(struct inode *, int);
extern int filemap_fdatawrite(struct address_space *);
extern int filemap_flush(struct address_space *);
extern int filemap_fdatawait(struct address_space *);
extern int filemap_write_and_wait(struct address_space *mapping);
extern void sync_supers(void);
extern void sync_filesystems(int wait);
extern void emergency_sync(void);
extern void emergency_remount(void);
extern int do_remount_sb(struct super_block *sb, int flags,
                         void *data, int force);
extern sector_t bmap(struct inode *, sector_t);
extern int setattr_mask(unsigned int);
extern int notify_change(struct dentry *, struct iattr *);
extern int permission(struct inode *, int, struct nameidata *);
extern int vfs_permission(struct inode *, int);
extern int get_write_access(struct inode *);
extern int deny_write_access(struct file *);
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void put_write_access(struct inode * inode)
{
        atomic_dec(&inode->i_writecount);
}
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void allow_write_access(struct file *file)
{
        if (file)
                atomic_inc(&file->f_dentry->d_inode->i_writecount);
}
extern int do_pipe(int *);

extern int open_namei(const char *, int, int, struct nameidata *);
extern int may_open(struct nameidata *, int, int);

extern int kernel_read(struct file *, unsigned long, char *, unsigned long);
extern struct file * open_exec(const char *);


extern int is_subdir(struct dentry *, struct dentry *);
extern ino_t find_inode_number(struct dentry *, struct qstr *);

# 1 "include/linux/err.h" 1
# 14 "include/linux/err.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void *ERR_PTR(long error)
{
        return (void *) error;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) long PTR_ERR(const void *ptr)
{
        return (long) ptr;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) long IS_ERR(const void *ptr)
{
        return (unsigned long)ptr > (unsigned long)-1000L;
}
# 1346 "include/linux/fs.h" 2


extern loff_t default_llseek(struct file *file, loff_t offset, int origin);

extern loff_t vfs_llseek(struct file *file, loff_t offset, int origin);

extern void inode_init_once(struct inode *);
extern void iput(struct inode *);
extern struct inode * igrab(struct inode *);
extern ino_t iunique(struct super_block *, ino_t);
extern int inode_needs_sync(struct inode *inode);
extern void generic_delete_inode(struct inode *inode);

extern struct inode *ilookup5(struct super_block *sb, unsigned long hashval,
                int (*test)(struct inode *, void *), void *data);
extern struct inode *ilookup(struct super_block *sb, unsigned long ino);

extern struct inode * iget5_locked(struct super_block *, unsigned long, int (*test)(struct inode *, void *), int (*set)(struct inode *, void *), void *);
extern struct inode * iget_locked(struct super_block *, unsigned long);
extern void unlock_new_inode(struct inode *);

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct inode *iget(struct super_block *sb, unsigned long ino)
{
        struct inode *inode = iget_locked(sb, ino);

        if (inode && (inode->i_state & 64)) {
                sb->s_op->read_inode(inode);
                unlock_new_inode(inode);
        }

        return inode;
}

extern void __iget(struct inode * inode);
extern void clear_inode(struct inode *);
extern void destroy_inode(struct inode *);
extern struct inode *new_inode(struct super_block *);
extern int remove_suid(struct dentry *);
extern void remove_dquot_ref(struct super_block *, int, struct list_head *);
extern struct semaphore iprune_sem;

extern void __insert_inode_hash(struct inode *, unsigned long hashval);
extern void remove_inode_hash(struct inode *);
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void insert_inode_hash(struct inode *inode) {
        __insert_inode_hash(inode, inode->i_ino);
}

extern struct file * get_empty_filp(void);
extern void file_move(struct file *f, struct list_head *list);
extern void file_kill(struct file *f);
struct bio;
extern void submit_bio(int, struct bio *);
extern int bdev_read_only(struct block_device *);
extern int set_blocksize(struct block_device *, int);
extern int sb_set_blocksize(struct super_block *, int);
extern int sb_min_blocksize(struct super_block *, int);

extern int generic_file_mmap(struct file *, struct vm_area_struct *);
extern int generic_file_readonly_mmap(struct file *, struct vm_area_struct *);
extern int file_read_actor(read_descriptor_t * desc, struct page *page, unsigned long offset, unsigned long size);
extern int file_send_actor(read_descriptor_t * desc, struct page *page, unsigned long offset, unsigned long size);
extern ssize_t generic_file_read(struct file *, char *, size_t, loff_t *);
int generic_write_checks(struct file *file, loff_t *pos, size_t *count, int isblk);
extern ssize_t generic_file_write(struct file *, const char *, size_t, loff_t *);
extern ssize_t generic_file_aio_read(struct kiocb *, char *, size_t, loff_t);
extern ssize_t __generic_file_aio_read(struct kiocb *, const struct iovec *, unsigned long, loff_t *);
extern ssize_t generic_file_aio_write(struct kiocb *, const char *, size_t, loff_t);
extern ssize_t generic_file_aio_write_nolock(struct kiocb *, const struct iovec *,
                                unsigned long, loff_t *);
extern ssize_t do_sync_read(struct file *filp, char *buf, size_t len, loff_t *ppos);
extern ssize_t do_sync_write(struct file *filp, const char *buf, size_t len, loff_t *ppos);
ssize_t generic_file_write_nolock(struct file *file, const struct iovec *iov,
                                unsigned long nr_segs, loff_t *ppos);
extern ssize_t generic_file_sendfile(struct file *, loff_t *, size_t, read_actor_t, void *);
extern void do_generic_mapping_read(struct address_space *mapping,
                                    struct file_ra_state *, struct file *,
                                    loff_t *, read_descriptor_t *, read_actor_t);
extern void
file_ra_state_init(struct file_ra_state *ra, struct address_space *mapping);
extern ssize_t generic_file_direct_IO(int rw, struct kiocb *iocb,
        const struct iovec *iov, loff_t offset, unsigned long nr_segs);
extern ssize_t generic_file_readv(struct file *filp, const struct iovec *iov,
        unsigned long nr_segs, loff_t *ppos);
ssize_t generic_file_writev(struct file *filp, const struct iovec *iov,
                        unsigned long nr_segs, loff_t *ppos);
extern loff_t no_llseek(struct file *file, loff_t offset, int origin);
extern loff_t generic_file_llseek(struct file *file, loff_t offset, int origin);
extern loff_t remote_llseek(struct file *file, loff_t offset, int origin);
extern int generic_file_open(struct inode * inode, struct file * filp);
extern int nonseekable_open(struct inode * inode, struct file * filp);

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void do_generic_file_read(struct file * filp, loff_t *ppos,
                                        read_descriptor_t * desc,
                                        read_actor_t actor)
{
        do_generic_mapping_read(filp->f_mapping,
                                &filp->f_ra,
                                filp,
                                ppos,
                                desc,
                                actor);
}

ssize_t __blockdev_direct_IO(int rw, struct kiocb *iocb, struct inode *inode,
        struct block_device *bdev, const struct iovec *iov, loff_t offset,
        unsigned long nr_segs, get_blocks_t get_blocks, dio_iodone_t end_io,
        int needs_special_locking);




static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) ssize_t blockdev_direct_IO(int rw, struct kiocb *iocb,
        struct inode *inode, struct block_device *bdev, const struct iovec *iov,
        loff_t offset, unsigned long nr_segs, get_blocks_t get_blocks,
        dio_iodone_t end_io)
{
        return __blockdev_direct_IO(rw, iocb, inode, bdev, iov, offset,
                                nr_segs, get_blocks, end_io, 1);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) ssize_t blockdev_direct_IO_no_locking(int rw, struct kiocb *iocb,
        struct inode *inode, struct block_device *bdev, const struct iovec *iov,
        loff_t offset, unsigned long nr_segs, get_blocks_t get_blocks,
        dio_iodone_t end_io)
{
        return __blockdev_direct_IO(rw, iocb, inode, bdev, iov, offset,
                                nr_segs, get_blocks, end_io, 0);
}

extern struct file_operations generic_ro_fops;



extern int vfs_readlink(struct dentry *, char *, int, const char *);
extern int vfs_follow_link(struct nameidata *, const char *);
extern int page_readlink(struct dentry *, char *, int);
extern int page_follow_link(struct dentry *, struct nameidata *);
extern int page_follow_link_light(struct dentry *, struct nameidata *);
extern void page_put_link(struct dentry *, struct nameidata *);
extern int page_symlink(struct inode *inode, const char *symname, int len);
extern struct inode_operations page_symlink_inode_operations;
extern int generic_readlink(struct dentry *, char *, int);
extern void generic_fillattr(struct inode *, struct kstat *);
extern int vfs_getattr(struct vfsmount *, struct dentry *, struct kstat *);
void inode_add_bytes(struct inode *inode, loff_t bytes);
void inode_sub_bytes(struct inode *inode, loff_t bytes);
loff_t inode_get_bytes(struct inode *inode);
void inode_set_bytes(struct inode *inode, loff_t bytes);

extern int vfs_readdir(struct file *, filldir_t, void *);

extern int vfs_stat(char *, struct kstat *);
extern int vfs_lstat(char *, struct kstat *);
extern int vfs_fstat(unsigned int, struct kstat *);

extern struct file_system_type *get_fs_type(const char *name);
extern struct super_block *get_super(struct block_device *);
extern struct super_block *user_get_super(dev_t);
extern void drop_super(struct super_block *sb);

extern int dcache_dir_open(struct inode *, struct file *);
extern int dcache_dir_close(struct inode *, struct file *);
extern loff_t dcache_dir_lseek(struct file *, loff_t, int);
extern int dcache_readdir(struct file *, void *, filldir_t);
extern int simple_getattr(struct vfsmount *, struct dentry *, struct kstat *);
extern int simple_statfs(struct super_block *, struct kstatfs *);
extern int simple_link(struct dentry *, struct inode *, struct dentry *);
extern int simple_unlink(struct inode *, struct dentry *);
extern int simple_rmdir(struct inode *, struct dentry *);
extern int simple_rename(struct inode *, struct dentry *, struct inode *, struct dentry *);
extern int simple_sync_file(struct file *, struct dentry *, int);
extern int simple_empty(struct dentry *);
extern int simple_readpage(struct file *file, struct page *page);
extern int simple_prepare_write(struct file *file, struct page *page,
                        unsigned offset, unsigned to);
extern int simple_commit_write(struct file *file, struct page *page,
                                unsigned offset, unsigned to);

extern struct dentry *simple_lookup(struct inode *, struct dentry *, struct nameidata *);
extern ssize_t generic_read_dir(struct file *, char *, size_t, loff_t *);
extern struct file_operations simple_dir_operations;
extern struct inode_operations simple_dir_inode_operations;
struct tree_descr { char *name; struct file_operations *ops; int mode; };
extern int simple_fill_super(struct super_block *, int, struct tree_descr *);
extern int simple_pin_fs(char *name, struct vfsmount **mount, int *count);
extern void simple_release_fs(struct vfsmount **mount, int *count);

extern ssize_t simple_read_from_buffer(void *, size_t, loff_t *, const void *, size_t);

extern int inode_change_ok(struct inode *, struct iattr *);
extern int inode_setattr(struct inode *, struct iattr *);

extern void inode_update_time(struct inode *inode, int ctime_too);

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) ino_t parent_ino(struct dentry *dentry)
{
        ino_t res;

        do { do { do { (current_thread_info()->preempt_count)++; } while (0); __asm__ __volatile__("": : :"memory"); } while (0); if (__builtin_expect(!!(!_raw_spin_trylock(&dentry->d_lock)), 0)) __preempt_spin_lock(&dentry->d_lock); } while (0);
        res = dentry->d_parent->d_inode->i_ino;
        do { _raw_spin_unlock(&dentry->d_lock); do { do { __asm__ __volatile__("": : :"memory"); do { (current_thread_info()->preempt_count)--; } while (0); } while (0); do { if (__builtin_expect(!!(test_thread_flag(3)), 0)) preempt_schedule(); } while (0); } while (0); } while (0);
        return res;
}


extern int unshare_files(void);


static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) char *alloc_secdata(void)
{
        return (char *)get_zeroed_page((0x10 | 0x40 | 0x80));
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void free_secdata(void *secdata)
{
        free_pages(((unsigned long)secdata),0);
}
# 17 "mm/filemap.c" 2

# 1 "include/linux/kernel_stat.h" 1




# 1 "include/asm/irq.h" 1
# 16 "include/asm/irq.h"
# 1 "include/asm-i386/mach-default/irq_vectors.h" 1
# 87 "include/asm-i386/mach-default/irq_vectors.h"
# 1 "include/asm-i386/mach-default/irq_vectors_limits.h" 1
# 88 "include/asm-i386/mach-default/irq_vectors.h" 2
# 17 "include/asm/irq.h" 2


static __inline__ __attribute__((always_inline)) int irq_canonicalize(int irq)
{
        return ((irq == 2) ? 9 : irq);
}

extern void disable_irq(unsigned int);
extern void disable_irq_nosync(unsigned int);
extern void enable_irq(unsigned int);
extern void release_x86_irqs(struct task_struct *);
extern int can_request_irq(unsigned int, unsigned long flags);
# 38 "include/asm/irq.h"
union irq_ctx {
        struct thread_info tinfo;
        u32 stack[(4096)/sizeof(u32)];
};

extern union irq_ctx *hardirq_ctx[8];
extern union irq_ctx *softirq_ctx[8];

extern void irq_ctx_init(int cpu);






struct irqaction;
struct pt_regs;
 __attribute__((regparm(0))) int handle_IRQ_event(unsigned int, struct pt_regs *,
                                struct irqaction *);
# 6 "include/linux/kernel_stat.h" 2
# 16 "include/linux/kernel_stat.h"
struct cpu_usage_stat {
        u64 user;
        u64 nice;
        u64 system;
        u64 softirq;
        u64 irq;
        u64 idle;
        u64 iowait;
};

struct kernel_stat {
        struct cpu_usage_stat cpustat;
        unsigned int irqs[0xef];
};

extern __typeof__(struct kernel_stat) per_cpu__kstat;





extern unsigned long long nr_context_switches(void);




static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int kstat_irqs(int irq)
{
        int i, sum=0;

        for (i = 0; i < 8; i++)
                if ((__builtin_constant_p(((i))) ? constant_test_bit((((i))),((cpu_callout_map).bits)) : variable_test_bit((((i))),((cpu_callout_map).bits))))
                        sum += (*({ unsigned long __ptr; __asm__ ("" : "=g"(__ptr) : "0"(&per_cpu__kstat)); (typeof(&per_cpu__kstat)) (__ptr + (__per_cpu_offset[i])); })).irqs[irq];

        return sum;
}
# 19 "mm/filemap.c" 2
# 1 "include/linux/mm.h" 1
# 17 "include/linux/mm.h"
struct mempolicy;
struct anon_vma;


extern unsigned long max_mapnr;


extern unsigned long num_physpages;
extern void * high_memory;
extern unsigned long vmalloc_earlyreserve;
extern int page_cluster;


# 1 "include/asm/pgtable.h" 1
# 33 "include/asm/pgtable.h"
extern unsigned long empty_zero_page[1024];
extern pgd_t swapper_pg_dir[1024];
extern kmem_cache_t *pgd_cache;
extern kmem_cache_t *pmd_cache;
extern spinlock_t pgd_lock;
extern struct page *pgd_list;

void pmd_ctor(void *, kmem_cache_t *, unsigned long);
void pgd_ctor(void *, kmem_cache_t *, unsigned long);
void pgd_dtor(void *, kmem_cache_t *, unsigned long);
void pgtable_cache_init(void);
void paging_init(void);







# 1 "include/asm/pgtable-3level-defs.h" 1
# 53 "include/asm/pgtable.h" 2
# 157 "include/asm/pgtable.h"
extern unsigned long long __PAGE_KERNEL, __PAGE_KERNEL_EXEC;
# 201 "include/asm/pgtable.h"
extern unsigned long pg0[];
# 218 "include/asm/pgtable.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int pte_user(pte_t pte) { return (pte).pte_low & 0x004; }
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int pte_read(pte_t pte) { return (pte).pte_low & 0x004; }
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int pte_dirty(pte_t pte) { return (pte).pte_low & 0x040; }
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int pte_young(pte_t pte) { return (pte).pte_low & 0x020; }
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int pte_write(pte_t pte) { return (pte).pte_low & 0x002; }




static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int pte_file(pte_t pte) { return (pte).pte_low & 0x040; }

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) pte_t pte_rdprotect(pte_t pte) { (pte).pte_low &= ~0x004; return pte; }
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) pte_t pte_exprotect(pte_t pte) { (pte).pte_low &= ~0x004; return pte; }
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) pte_t pte_mkclean(pte_t pte) { (pte).pte_low &= ~0x040; return pte; }
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) pte_t pte_mkold(pte_t pte) { (pte).pte_low &= ~0x020; return pte; }
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) pte_t pte_wrprotect(pte_t pte) { (pte).pte_low &= ~0x002; return pte; }
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) pte_t pte_mkread(pte_t pte) { (pte).pte_low |= 0x004; return pte; }
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) pte_t pte_mkexec(pte_t pte) { (pte).pte_low |= 0x004; return pte; }
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) pte_t pte_mkdirty(pte_t pte) { (pte).pte_low |= 0x040; return pte; }
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) pte_t pte_mkyoung(pte_t pte) { (pte).pte_low |= 0x020; return pte; }
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) pte_t pte_mkwrite(pte_t pte) { (pte).pte_low |= 0x002; return pte; }


# 1 "include/asm/pgtable-3level.h" 1
# 18 "include/asm/pgtable-3level.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int pgd_none(pgd_t pgd) { return 0; }
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int pgd_bad(pgd_t pgd) { return 0; }
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int pgd_present(pgd_t pgd) { return 1; }




static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int pte_x(pte_t pte)
{
        return !(((pte).pte_low | ((unsigned long long)(pte).pte_high << 32)) & (1ULL<<63));
}




static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int pte_exec(pte_t pte)
{
        return pte_user(pte) && pte_x(pte);
}



static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int pte_exec_kernel(pte_t pte)
{
        return pte_x(pte);
}







static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void set_pte(pte_t *ptep, pte_t pte)
{
        ptep->pte_high = pte.pte_high;
        __asm__ __volatile__ ("": : :"memory");
        ptep->pte_low = pte.pte_low;
}
# 70 "include/asm/pgtable-3level.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void pgd_clear (pgd_t * pgd) { }
# 79 "include/asm/pgtable-3level.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) pte_t ptep_get_and_clear(pte_t *ptep)
{
        pte_t res;


        res.pte_low = ((__typeof__(*(&ptep->pte_low)))__xchg((unsigned long)(0),(&ptep->pte_low),sizeof(*(&ptep->pte_low))));
        res.pte_high = ptep->pte_high;
        ptep->pte_high = 0;

        return res;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int pte_same(pte_t a, pte_t b)
{
        return a.pte_low == b.pte_low && a.pte_high == b.pte_high;
}



static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int pte_none(pte_t pte)
{
        return !pte.pte_low && !pte.pte_high;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned long pte_pfn(pte_t pte)
{
        return (pte.pte_low >> 12) |
                (pte.pte_high << (32 - 12));
}

extern unsigned long long __supported_pte_mask;

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) pte_t pfn_pte(unsigned long page_nr, pgprot_t pgprot)
{
        pte_t pte;

        pte.pte_high = (page_nr >> (32 - 12)) | (((pgprot).pgprot) >> 32);

        pte.pte_high &= (__supported_pte_mask >> 32);
        pte.pte_low = ((page_nr << 12) | ((pgprot).pgprot)) & __supported_pte_mask;

        return pte;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) pmd_t pfn_pmd(unsigned long page_nr, pgprot_t pgprot)
{
        return ((pmd_t) { ((((unsigned long long)page_nr << 12) | ((pgprot).pgprot)) & __supported_pte_mask) } );

}
# 242 "include/asm/pgtable.h" 2




static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int ptep_test_and_clear_dirty(pte_t *ptep)
{
        if (!pte_dirty(*ptep))
                return 0;
        return test_and_clear_bit(6, &ptep->pte_low);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int ptep_test_and_clear_young(pte_t *ptep)
{
        if (!pte_young(*ptep))
                return 0;
        return test_and_clear_bit(5, &ptep->pte_low);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void ptep_set_wrprotect(pte_t *ptep) { clear_bit(1, &ptep->pte_low); }
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void ptep_mkdirty(pte_t *ptep) { set_bit(6, &ptep->pte_low); }
# 278 "include/asm/pgtable.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) pte_t pte_modify(pte_t pte, pgprot_t newprot)
{
        pte.pte_low &= ((~((1UL << 12)-1)) | 0x020 | 0x040);
        pte.pte_low |= ((newprot).pgprot);





        pte.pte_high &= ~(1 << (63 - 32));
        pte.pte_high |= (((newprot).pgprot) >> 32) & (__supported_pte_mask >> 32);


        return pte;
}
# 352 "include/asm/pgtable.h"
extern pte_t *lookup_address(unsigned long address);
# 361 "include/asm/pgtable.h"
 extern int set_kernel_exec(unsigned long vaddr, int enable);
# 422 "include/asm/pgtable.h"
# 1 "include/asm-generic/pgtable.h" 1
# 423 "include/asm/pgtable.h" 2
# 31 "include/linux/mm.h" 2
# 53 "include/linux/mm.h"
struct vm_area_struct {
        struct mm_struct * vm_mm;
        unsigned long vm_start;
        unsigned long vm_end;



        struct vm_area_struct *vm_next;

        pgprot_t vm_page_prot;
        unsigned long vm_flags;

        struct rb_node vm_rb;







        union {
                struct {
                        struct list_head list;
                        void *parent;
                        struct vm_area_struct *head;
                } vm_set;

                struct prio_tree_node prio_tree_node;
        } shared;







        struct list_head anon_vma_node;
        struct anon_vma *anon_vma;


        struct vm_operations_struct * vm_ops;


        unsigned long vm_pgoff;

        struct file * vm_file;
        void * vm_private_data;




};
# 159 "include/linux/mm.h"
extern pgprot_t protection_map[16];







struct vm_operations_struct {
        void (*open)(struct vm_area_struct * area);
        void (*close)(struct vm_area_struct * area);
        struct page * (*nopage)(struct vm_area_struct * area, unsigned long address, int *type);
        int (*populate)(struct vm_area_struct * area, unsigned long address, unsigned long len, pgprot_t prot, unsigned long pgoff, int nonblock);





};

struct mmu_gather;
struct inode;




typedef unsigned long page_flags_t;
# 194 "include/linux/mm.h"
struct page {
        page_flags_t flags;

        atomic_t _count;
        unsigned int mapcount;




        unsigned long private;




        struct address_space *mapping;





        unsigned long index;
        struct list_head lru;
# 232 "include/linux/mm.h"
};





# 1 "include/linux/page-flags.h" 1
# 86 "include/linux/page-flags.h"
struct page_state {
        unsigned long nr_dirty;
        unsigned long nr_writeback;
        unsigned long nr_unstable;
        unsigned long nr_page_table_pages;
        unsigned long nr_mapped;
        unsigned long nr_slab;






        unsigned long pgpgin;
        unsigned long pgpgout;
        unsigned long pswpin;
        unsigned long pswpout;
        unsigned long pgalloc_high;

        unsigned long pgalloc_normal;
        unsigned long pgalloc_dma;
        unsigned long pgfree;
        unsigned long pgactivate;
        unsigned long pgdeactivate;

        unsigned long pgfault;
        unsigned long pgmajfault;
        unsigned long pgrefill_high;
        unsigned long pgrefill_normal;
        unsigned long pgrefill_dma;

        unsigned long pgsteal_high;
        unsigned long pgsteal_normal;
        unsigned long pgsteal_dma;
        unsigned long pgscan_kswapd_high;
        unsigned long pgscan_kswapd_normal;

        unsigned long pgscan_kswapd_dma;
        unsigned long pgscan_direct_high;
        unsigned long pgscan_direct_normal;
        unsigned long pgscan_direct_dma;
        unsigned long pginodesteal;

        unsigned long slabs_scanned;
        unsigned long kswapd_steal;
        unsigned long kswapd_inodesteal;
        unsigned long pageoutrun;
        unsigned long allocstall;

        unsigned long pgrotated;
};

extern __typeof__(struct page_state) per_cpu__page_states;

extern void get_page_state(struct page_state *ret);
extern void get_full_page_state(struct page_state *ret);
extern unsigned long __read_page_state(unsigned offset);
# 307 "include/linux/page-flags.h"
struct page;

int test_clear_page_dirty(struct page *page);
int __clear_page_dirty(struct page *page);
int test_clear_page_writeback(struct page *page);
int test_set_page_writeback(struct page *page);

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void clear_page_dirty(struct page *page)
{
        test_clear_page_dirty(page);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void set_page_writeback(struct page *page)
{
        test_set_page_writeback(page);
}
# 239 "include/linux/mm.h" 2
# 281 "include/linux/mm.h"
extern void __page_cache_release(struct page *) __attribute__((regparm(3)));



static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int page_count(struct page *p)
{
        if ((__builtin_constant_p(19) ? constant_test_bit((19),(&(p)->flags)) : variable_test_bit((19),(&(p)->flags))))
                p = (struct page *)p->private;
        return ((&(p)->_count)->counter) + 1;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void get_page(struct page *page)
{
        if (__builtin_expect(!!((__builtin_constant_p(19) ? constant_test_bit((19),(&(page)->flags)) : variable_test_bit((19),(&(page)->flags)))), 0))
                page = (struct page *)page->private;
        atomic_inc(&page->_count);
}

void put_page(struct page *page);
# 376 "include/linux/mm.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned long page_zonenum(struct page *page)
{
        return (page->flags >> (sizeof(page_flags_t)*8 - 1 - 2)) & (~(~0UL << 2));
}
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned long page_to_nid(struct page *page)
{
        return (page->flags >> ((sizeof(page_flags_t)*8 - 1 - 2) + 2));
}

struct zone;
extern struct zone *zone_table[];

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct zone *page_zone(struct page *page)
{
        return zone_table[page->flags >> (sizeof(page_flags_t)*8 - 1 - 2)];
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void set_page_zone(struct page *page, unsigned long nodezone_num)
{
        page->flags &= ~(~0UL << (sizeof(page_flags_t)*8 - 1 - 2));
        page->flags |= nodezone_num << (sizeof(page_flags_t)*8 - 1 - 2);
}



extern struct page *mem_map;


static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void *lowmem_page_address(struct page *page)
{
        return ((void *)((unsigned long)(((unsigned long)((page) - mem_map)) << 12)+((unsigned long)(0xC0000000UL))));
}
# 423 "include/linux/mm.h"
void *page_address(struct page *page);
void set_page_address(struct page *page, void *virtual);
void page_address_init(void);
# 442 "include/linux/mm.h"
extern struct address_space swapper_space;
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct address_space *page_mapping(struct page *page)
{
        struct address_space *mapping = ((void *)0);

        if (__builtin_expect(!!((__builtin_constant_p(16) ? constant_test_bit((16),(&(page)->flags)) : variable_test_bit((16),(&(page)->flags)))), 0))
                mapping = &swapper_space;
        else if (__builtin_expect(!!(!(__builtin_constant_p(20) ? constant_test_bit((20),(&(page)->flags)) : variable_test_bit((20),(&(page)->flags)))), 1))
                mapping = page->mapping;
        return mapping;
}





static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned long page_index(struct page *page)
{
        if (__builtin_expect(!!((__builtin_constant_p(16) ? constant_test_bit((16),(&(page)->flags)) : variable_test_bit((16),(&(page)->flags)))), 0))
                return page->private;
        return page->index;
}




static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int page_mapped(struct page *page)
{
        return page->mapcount != 0;
}
# 491 "include/linux/mm.h"
extern void show_free_areas(void);

struct page *shmem_nopage(struct vm_area_struct * vma,
                        unsigned long address, int *type);
int shmem_set_policy(struct vm_area_struct *vma, struct mempolicy *new);
struct mempolicy *shmem_get_policy(struct vm_area_struct *vma,
                                        unsigned long addr);
struct file *shmem_file_setup(char * name, loff_t size, unsigned long flags);
void shmem_lock(struct file * file, int lock);
int shmem_zero_setup(struct vm_area_struct *);




struct zap_details {
        struct vm_area_struct *nonlinear_vma;
        struct address_space *check_mapping;
        unsigned long first_index;
        unsigned long last_index;
        int atomic;
};

void zap_page_range(struct vm_area_struct *vma, unsigned long address,
                unsigned long size, struct zap_details *);
int unmap_vmas(struct mmu_gather **tlbp, struct mm_struct *mm,
                struct vm_area_struct *start_vma, unsigned long start_addr,
                unsigned long end_addr, unsigned long *nr_accounted,
                struct zap_details *);
void clear_page_tables(struct mmu_gather *tlb, unsigned long first, int nr);
int copy_page_range(struct mm_struct *dst, struct mm_struct *src,
                        struct vm_area_struct *vma);
int zeromap_page_range(struct vm_area_struct *vma, unsigned long from,
                        unsigned long size, pgprot_t prot);
void unmap_mapping_range(struct address_space *mapping,
                loff_t const holebegin, loff_t const holelen, int even_cows);

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void unmap_shared_mapping_range(struct address_space *mapping,
                loff_t const holebegin, loff_t const holelen)
{
        unmap_mapping_range(mapping, holebegin, holelen, 0);
}

extern int vmtruncate(struct inode * inode, loff_t offset);
extern pmd_t *__pmd_alloc(struct mm_struct *mm, pgd_t *pgd, unsigned long address) __attribute__((regparm(3)));
extern pte_t *pte_alloc_kernel(struct mm_struct *mm, pmd_t *pmd, unsigned long address) __attribute__((regparm(3)));
extern pte_t *pte_alloc_map(struct mm_struct *mm, pmd_t *pmd, unsigned long address) __attribute__((regparm(3)));
extern int install_page(struct mm_struct *mm, struct vm_area_struct *vma, unsigned long addr, struct page *page, pgprot_t prot);
extern int install_file_pte(struct mm_struct *mm, struct vm_area_struct *vma, unsigned long addr, unsigned long pgoff, pgprot_t prot);
extern int handle_mm_fault(struct mm_struct *mm,struct vm_area_struct *vma, unsigned long address, int write_access);
extern int make_pages_present(unsigned long addr, unsigned long end);
extern int access_process_vm(struct task_struct *tsk, unsigned long addr, void *buf, int len, int write);
void install_arg_page(struct vm_area_struct *, struct page *, unsigned long);

int get_user_pages(struct task_struct *tsk, struct mm_struct *mm, unsigned long start,
                int len, int write, int force, struct page **pages, struct vm_area_struct **vmas);

int __set_page_dirty_buffers(struct page *page);
int __set_page_dirty_nobuffers(struct page *page);
int redirty_page_for_writepage(struct writeback_control *wbc,
                                struct page *page);
int set_page_dirty(struct page *page) __attribute__((regparm(3)));
int set_page_dirty_lock(struct page *page);
int clear_page_dirty_for_io(struct page *page);
# 566 "include/linux/mm.h"
typedef int (*shrinker_t)(int nr_to_scan, unsigned int gfp_mask);







struct shrinker;
extern struct shrinker *set_shrinker(int, shrinker_t);
extern void remove_shrinker(struct shrinker *shrinker);






static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) pmd_t *pmd_alloc(struct mm_struct *mm, pgd_t *pgd, unsigned long address)
{
        if (pgd_none(*pgd))
                return __pmd_alloc(mm, pgd, address);
        return ((pmd_t *) ((unsigned long) ((void *)((unsigned long)(((*(pgd)).pgd) & (~((1UL << 12)-1)))+((unsigned long)(0xC0000000UL))))) + (((address) >> 21) & (512 -1)));
}

extern void free_area_init(unsigned long * zones_size);
extern void free_area_init_node(int nid, pg_data_t *pgdat, struct page *pmap,
        unsigned long * zones_size, unsigned long zone_start_pfn,
        unsigned long *zholes_size);
extern void memmap_init_zone(struct page *, unsigned long, int,
        unsigned long, unsigned long);
extern void mem_init(void);
extern void show_mem(void);
extern void si_meminfo(struct sysinfo * val);
extern void si_meminfo_node(struct sysinfo *val, int nid);

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void vma_prio_tree_init(struct vm_area_struct *vma)
{
        vma->shared.vm_set.list.next = ((void *)0);
        vma->shared.vm_set.list.prev = ((void *)0);
        vma->shared.vm_set.parent = ((void *)0);
        vma->shared.vm_set.head = ((void *)0);
}


void vma_prio_tree_add(struct vm_area_struct *, struct vm_area_struct *old);
void vma_prio_tree_insert(struct vm_area_struct *, struct prio_tree_root *);
void vma_prio_tree_remove(struct vm_area_struct *, struct prio_tree_root *);
struct vm_area_struct *vma_prio_tree_next(
        struct vm_area_struct *, struct prio_tree_root *,
        struct prio_tree_iter *, unsigned long begin, unsigned long end);


extern void vma_adjust(struct vm_area_struct *vma, unsigned long start,
        unsigned long end, unsigned long pgoff, struct vm_area_struct *insert);
extern struct vm_area_struct *vma_merge(struct mm_struct *,
        struct vm_area_struct *prev, unsigned long addr, unsigned long end,
        unsigned long vm_flags, struct anon_vma *, struct file *, unsigned long,
        struct mempolicy *);
extern struct anon_vma *find_mergeable_anon_vma(struct vm_area_struct *);
extern int split_vma(struct mm_struct *,
        struct vm_area_struct *, unsigned long addr, int new_below);
extern void insert_vm_struct(struct mm_struct *, struct vm_area_struct *);
extern void __vma_link_rb(struct mm_struct *, struct vm_area_struct *,
        struct rb_node **, struct rb_node *);
extern struct vm_area_struct *copy_vma(struct vm_area_struct **,
        unsigned long addr, unsigned long len, unsigned long pgoff);
extern void exit_mmap(struct mm_struct *);

extern unsigned long get_unmapped_area(struct file *, unsigned long, unsigned long, unsigned long, unsigned long);

extern unsigned long do_mmap_pgoff(struct file *file, unsigned long addr,
        unsigned long len, unsigned long prot,
        unsigned long flag, unsigned long pgoff);

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned long do_mmap(struct file *file, unsigned long addr,
        unsigned long len, unsigned long prot,
        unsigned long flag, unsigned long offset)
{
        unsigned long ret = -22;
        if ((offset + (((len)+(1UL << 12)-1)&(~((1UL << 12)-1)))) < offset)
                goto out;
        if (!(offset & ~(~((1UL << 12)-1))))
                ret = do_mmap_pgoff(file, addr, len, prot, flag, offset >> 12);
out:
        return ret;
}

extern int do_munmap(struct mm_struct *, unsigned long, size_t);

extern unsigned long do_brk(unsigned long, unsigned long);


extern unsigned long page_unuse(struct page *);
extern void truncate_inode_pages(struct address_space *, loff_t);


struct page *filemap_nopage(struct vm_area_struct *, unsigned long, int *);


int write_one_page(struct page *page, int wait);





int do_page_cache_readahead(struct address_space *mapping, struct file *filp,
                        unsigned long offset, unsigned long nr_to_read);
int force_page_cache_readahead(struct address_space *mapping, struct file *filp,
                        unsigned long offset, unsigned long nr_to_read);
void page_cache_readahead(struct address_space *mapping,
                          struct file_ra_state *ra,
                          struct file *filp,
                          unsigned long offset);
void handle_ra_miss(struct address_space *mapping,
                    struct file_ra_state *ra, unsigned long offset);
unsigned long max_sane_readahead(unsigned long nr);


extern int expand_stack(struct vm_area_struct * vma, unsigned long address);


extern struct vm_area_struct * find_vma(struct mm_struct * mm, unsigned long addr);
extern struct vm_area_struct * find_vma_prev(struct mm_struct * mm, unsigned long addr,
                                             struct vm_area_struct **pprev);



static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct vm_area_struct * find_vma_intersection(struct mm_struct * mm, unsigned long start_addr, unsigned long end_addr)
{
        struct vm_area_struct * vma = find_vma(mm,start_addr);

        if (vma && end_addr <= vma->vm_start)
                vma = ((void *)0);
        return vma;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned long vma_pages(struct vm_area_struct *vma)
{
        return (vma->vm_end - vma->vm_start) >> 12;
}

extern struct vm_area_struct *find_extend_vma(struct mm_struct *mm, unsigned long addr);

extern struct page * vmalloc_to_page(void *addr);
extern struct page * follow_page(struct mm_struct *mm, unsigned long address,
                int write);
extern int remap_page_range(struct vm_area_struct *vma, unsigned long from,
                unsigned long to, unsigned long size, pgprot_t prot);
# 723 "include/linux/mm.h"
extern struct vm_area_struct *get_gate_vma(struct task_struct *tsk);
int in_gate_area(struct task_struct *task, unsigned long addr);
# 20 "mm/filemap.c" 2
# 1 "include/linux/swap.h" 1
# 17 "include/linux/swap.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int current_is_kswapd(void)
{
        return get_current()->flags & 0x00040000;
}
# 45 "include/linux/swap.h"
union swap_header {
        struct {
                char reserved[(1UL << 12) - 10];
                char magic[10];
        } magic;
        struct {
                char bootbits[1024];
                unsigned int version;
                unsigned int last_page;
                unsigned int nr_badpages;
                unsigned int padding[125];
                unsigned int badpages[1];
        } info;
};





typedef struct {
        unsigned long val;
} swp_entry_t;





struct reclaim_state {
        unsigned long reclaimed_slab;
};



struct address_space;
struct sysinfo;
struct writeback_control;
struct zone;
# 91 "include/linux/swap.h"
struct swap_extent {
        struct list_head list;
        unsigned long start_page;
        unsigned long nr_pages;
        sector_t start_block;
};
# 105 "include/linux/swap.h"
enum {
        SWP_USED = (1 << 0),
        SWP_WRITEOK = (1 << 1),
        SWP_ACTIVE = (SWP_USED | SWP_WRITEOK),
};
# 121 "include/linux/swap.h"
struct swap_info_struct {
        unsigned int flags;
        spinlock_t sdev_lock;
        struct file *swap_file;
        struct block_device *bdev;
        struct list_head extent_list;
        int nr_extents;
        struct swap_extent *curr_swap_extent;
        unsigned old_block_size;
        unsigned short * swap_map;
        unsigned int lowest_bit;
        unsigned int highest_bit;
        unsigned int cluster_next;
        unsigned int cluster_nr;
        int prio;
        int pages;
        unsigned long max;
        unsigned long inuse_pages;
        int next;
};

struct swap_list_t {
        int head;
        int next;
};





extern void out_of_memory(int gfp_mask);


extern void swapin_readahead(swp_entry_t, unsigned long, struct vm_area_struct *);


extern unsigned long totalram_pages;
extern unsigned long totalhigh_pages;
extern long nr_swap_pages;
extern unsigned int nr_free_pages(void);
extern unsigned int nr_free_pages_pgdat(pg_data_t *pgdat);
extern unsigned int nr_free_buffer_pages(void);
extern unsigned int nr_free_pagecache_pages(void);


extern void lru_cache_add(struct page *) __attribute__((regparm(3)));
extern void lru_cache_add_active(struct page *) __attribute__((regparm(3)));
extern void activate_page(struct page *) __attribute__((regparm(3)));
extern void mark_page_accessed(struct page *) __attribute__((regparm(3)));
extern void lru_add_drain(void);
extern int rotate_reclaimable_page(struct page *page);
extern void swap_setup(void);


extern int try_to_free_pages(struct zone **, unsigned int, unsigned int);
extern int shrink_all_memory(int);
extern int vm_swappiness;



extern int shmem_unuse(swp_entry_t entry, struct page *page);


extern void swap_unplug_io_fn(struct backing_dev_info *, struct page *);



extern int swap_readpage(struct file *, struct page *);
extern int swap_writepage(struct page *page, struct writeback_control *wbc);
extern int rw_swap_page_sync(int, swp_entry_t, struct page *);


extern struct address_space swapper_space;

extern void show_swap_cache_info(void);
extern int add_to_swap(struct page *);
extern void __delete_from_swap_cache(struct page *);
extern void delete_from_swap_cache(struct page *);
extern int move_to_swap_cache(struct page *, swp_entry_t);
extern int move_from_swap_cache(struct page *, unsigned long,
                struct address_space *);
extern void free_page_and_swap_cache(struct page *);
extern void free_pages_and_swap_cache(struct page **, int);
extern struct page * lookup_swap_cache(swp_entry_t);
extern struct page * read_swap_cache_async(swp_entry_t, struct vm_area_struct *vma,
                                           unsigned long addr);


extern long total_swap_pages;
extern unsigned int nr_swapfiles;
extern struct swap_info_struct swap_info[];
extern void si_swapinfo(struct sysinfo *);
extern swp_entry_t get_swap_page(void);
extern int swap_duplicate(swp_entry_t);
extern int valid_swaphandles(swp_entry_t, unsigned long *);
extern void swap_free(swp_entry_t);
extern void free_swap_and_cache(swp_entry_t);
extern sector_t map_swap_page(struct swap_info_struct *, unsigned long);
extern struct swap_info_struct *get_swap_info_struct(unsigned);
extern int can_share_swap_page(struct page *);
extern int remove_exclusive_swap_page(struct page *);
struct backing_dev_info;

extern struct swap_list_t swap_list;
extern spinlock_t swaplock;
# 21 "mm/filemap.c" 2
# 1 "include/linux/mman.h" 1







# 1 "include/asm/mman.h" 1
# 9 "include/linux/mman.h" 2




extern int sysctl_overcommit_memory;
extern int sysctl_overcommit_ratio;
extern atomic_t vm_committed_space;


extern void vm_acct_memory(long pages);







static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void vm_unacct_memory(long pages)
{
        vm_acct_memory(-pages);
}
# 44 "include/linux/mman.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned long
calc_vm_prot_bits(unsigned long prot)
{
        return ((0x1) <= (0x00000001) ? ((prot) & (0x1)) * ((0x00000001) / (0x1)) : ((prot) & (0x1)) / ((0x1) / (0x00000001))) |
               ((0x2) <= (0x00000002) ? ((prot) & (0x2)) * ((0x00000002) / (0x2)) : ((prot) & (0x2)) / ((0x2) / (0x00000002))) |
               ((0x4) <= (0x00000004) ? ((prot) & (0x4)) * ((0x00000004) / (0x4)) : ((prot) & (0x4)) / ((0x4) / (0x00000004)));
}




static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned long
calc_vm_flag_bits(unsigned long flags)
{
        return ((0x0100) <= (0x00000100) ? ((flags) & (0x0100)) * ((0x00000100) / (0x0100)) : ((flags) & (0x0100)) / ((0x0100) / (0x00000100))) |
               ((0x0800) <= (0x00000800) ? ((flags) & (0x0800)) * ((0x00000800) / (0x0800)) : ((flags) & (0x0800)) / ((0x0800) / (0x00000800))) |
               ((0x1000) <= (0x00001000) ? ((flags) & (0x1000)) * ((0x00001000) / (0x1000)) : ((flags) & (0x1000)) / ((0x1000) / (0x00001000))) |
               ((0x2000) <= (0x00002000) ? ((flags) & (0x2000)) * ((0x00002000) / (0x2000)) : ((flags) & (0x2000)) / ((0x2000) / (0x00002000)));
}
# 22 "mm/filemap.c" 2
# 1 "include/linux/pagemap.h" 1
# 10 "include/linux/pagemap.h"
# 1 "include/linux/highmem.h" 1







# 1 "include/asm/cacheflush.h" 1
# 26 "include/asm/cacheflush.h"
void global_flush_tlb(void);
int change_page_attr(struct page *page, int numpages, pgprot_t prot);



void kernel_map_pages(struct page *page, int numpages, int enable);
# 9 "include/linux/highmem.h" 2



extern struct page *highmem_start_page;

# 1 "include/asm/highmem.h" 1
# 24 "include/asm/highmem.h"
# 1 "include/linux/interrupt.h" 1
# 12 "include/linux/interrupt.h"
# 1 "include/asm/hardirq.h" 1





# 1 "include/linux/irq.h" 1
# 40 "include/linux/irq.h"
struct hw_interrupt_type {
        const char * typename;
        unsigned int (*startup)(unsigned int irq);
        void (*shutdown)(unsigned int irq);
        void (*enable)(unsigned int irq);
        void (*disable)(unsigned int irq);
        void (*ack)(unsigned int irq);
        void (*end)(unsigned int irq);
        void (*set_affinity)(unsigned int irq, cpumask_t dest);
};

typedef struct hw_interrupt_type hw_irq_controller;
# 60 "include/linux/irq.h"
typedef struct irq_desc {
        unsigned int status;
        hw_irq_controller *handler;
        struct irqaction *action;
        unsigned int depth;
        unsigned int irq_count;
        unsigned int irqs_unhandled;
        spinlock_t lock;
} __attribute__((__aligned__((1 << (7))))) irq_desc_t;

extern irq_desc_t irq_desc [0xef];

# 1 "include/asm/hw_irq.h" 1
# 16 "include/asm/hw_irq.h"
# 1 "include/linux/profile.h" 1
# 12 "include/linux/profile.h"
int __attribute__ ((__section__ (".init.text"))) profile_setup(char * str);


void __attribute__ ((__section__ (".init.text"))) profile_init(void);

extern unsigned int * prof_buffer;
extern unsigned long prof_len;
extern unsigned long prof_shift;
extern int prof_on;


enum profile_type {
        EXIT_TASK,
        EXIT_MMAP,
        EXEC_UNMAP
};



struct notifier_block;
struct task_struct;
struct mm_struct;


void profile_exit_task(struct task_struct * task);


void profile_exec_unmap(struct mm_struct * mm);


void profile_exit_mmap(struct mm_struct * mm);

int profile_event_register(enum profile_type, struct notifier_block * n);

int profile_event_unregister(enum profile_type, struct notifier_block * n);

int register_profile_notifier(struct notifier_block * nb);
int unregister_profile_notifier(struct notifier_block * nb);

struct pt_regs;


void profile_hook(struct pt_regs * regs);
# 17 "include/asm/hw_irq.h" 2


# 1 "include/asm/sections.h" 1




# 1 "include/asm-generic/sections.h" 1





extern char _text[], _stext[], _etext[];
extern char _data[], _sdata[], _edata[];
extern char __bss_start[], __bss_stop[];
extern char __init_begin[], __init_end[];
extern char _sinittext[], _einittext[];
# 6 "include/asm/sections.h" 2
# 20 "include/asm/hw_irq.h" 2
# 28 "include/asm/hw_irq.h"
extern u8 irq_vector[0xef];



extern void (*interrupt[0xef])(void);


 __attribute__((regparm(0))) void reschedule_interrupt(void);
 __attribute__((regparm(0))) void invalidate_interrupt(void);
 __attribute__((regparm(0))) void call_function_interrupt(void);



 __attribute__((regparm(0))) void apic_timer_interrupt(void);
 __attribute__((regparm(0))) void error_interrupt(void);
 __attribute__((regparm(0))) void spurious_interrupt(void);
 __attribute__((regparm(0))) void thermal_interrupt(struct pt_regs);



void mask_irq(unsigned int irq);
void unmask_irq(unsigned int irq);
void disable_8259A_irq(unsigned int irq);
void enable_8259A_irq(unsigned int irq);
int i8259A_irq_pending(unsigned int irq);
void make_8259A_irq(unsigned int irq);
void init_8259A(int aeoi);
void send_IPI_self(int vector) __attribute__((regparm(3)));
void init_VISWS_APIC_irqs(void);
void setup_IO_APIC(void);
void disable_IO_APIC(void);
void print_IO_APIC(void);
int IO_APIC_get_PCI_irq_vector(int bus, int slot, int fn);
void send_IPI(int dest, int vector);
void setup_ioapic_dest(void);

extern unsigned long io_apic_irqs;

extern atomic_t irq_err_count;
extern atomic_t irq_mis_count;
# 77 "include/asm/hw_irq.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void x86_do_profile(struct pt_regs * regs)
{
        unsigned long eip;
        extern unsigned long prof_cpu_mask;

        profile_hook(regs);

        if (((0x00020000 & (regs)->eflags) || (3 & (regs)->xcs)))
                return;

        if (!prof_buffer)
                return;

        eip = regs->eip;





        if (!((1<<(current_thread_info()->cpu)) & prof_cpu_mask))
                return;

        eip -= (unsigned long)_stext;
        eip >>= prof_shift;





        if (eip > prof_len-1)
                eip = prof_len-1;
        atomic_inc((atomic_t *)&prof_buffer[eip]);
}


static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void hw_resend_irq(struct hw_interrupt_type *h, unsigned int i)
{
        if ((((i) >= 16) || ((1<<(i)) & io_apic_irqs)))
                send_IPI_self((irq_vector[i]));
}
# 73 "include/linux/irq.h" 2

extern int setup_irq(unsigned int , struct irqaction * );

extern hw_irq_controller no_irq_type;
# 7 "include/asm/hardirq.h" 2

typedef struct {
        unsigned int __softirq_pending;
        unsigned long idle_timestamp;
        unsigned int __nmi_count;
        unsigned int apic_timer_irqs;
} __attribute__((__aligned__((1 << (7))))) irq_cpustat_t;

# 1 "include/linux/irq_cpustat.h" 1
# 21 "include/linux/irq_cpustat.h"
extern irq_cpustat_t irq_stat[];
# 16 "include/asm/hardirq.h" 2
# 80 "include/asm/hardirq.h"
# 1 "include/linux/smp_lock.h" 1
# 10 "include/linux/smp_lock.h"
extern spinlock_t kernel_flag;
# 20 "include/linux/smp_lock.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void release_kernel_lock(struct task_struct *task)
{
        if (__builtin_expect(!!(task->lock_depth >= 0), 0))
                do { _raw_spin_unlock(&kernel_flag); do { do { __asm__ __volatile__("": : :"memory"); do { (current_thread_info()->preempt_count)--; } while (0); } while (0); do { if (__builtin_expect(!!(test_thread_flag(3)), 0)) preempt_schedule(); } while (0); } while (0); } while (0);
}




static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void reacquire_kernel_lock(struct task_struct *task)
{
        if (__builtin_expect(!!(task->lock_depth >= 0), 0))
                do { do { do { (current_thread_info()->preempt_count)++; } while (0); __asm__ __volatile__("": : :"memory"); } while (0); if (__builtin_expect(!!(!_raw_spin_trylock(&kernel_flag)), 0)) __preempt_spin_lock(&kernel_flag); } while (0);
}
# 42 "include/linux/smp_lock.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void lock_kernel(void)
{
        int depth = get_current()->lock_depth+1;
        if (__builtin_expect(!!(!depth), 1))
                do { do { do { (current_thread_info()->preempt_count)++; } while (0); __asm__ __volatile__("": : :"memory"); } while (0); if (__builtin_expect(!!(!_raw_spin_trylock(&kernel_flag)), 0)) __preempt_spin_lock(&kernel_flag); } while (0);
        get_current()->lock_depth = depth;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void unlock_kernel(void)
{
        do { if (__builtin_expect(!!((get_current()->lock_depth < 0)!=0), 0)) __asm__ __volatile__( "ud2\n" "\t.word %c0\n" "\t.long %c1\n" : : "i" (52), "i" ("include/linux/smp_lock.h")); } while(0);
        if (__builtin_expect(!!(--get_current()->lock_depth < 0), 1))
                do { _raw_spin_unlock(&kernel_flag); do { do { __asm__ __volatile__("": : :"memory"); do { (current_thread_info()->preempt_count)--; } while (0); } while (0); do { if (__builtin_expect(!!(test_thread_flag(3)), 0)) preempt_schedule(); } while (0); } while (0); } while (0);
}
# 81 "include/asm/hardirq.h" 2
# 98 "include/asm/hardirq.h"
  extern void synchronize_irq(unsigned int irq);
# 13 "include/linux/interrupt.h" 2
# 30 "include/linux/interrupt.h"
typedef int irqreturn_t;





struct irqaction {
        irqreturn_t (*handler)(int, void *, struct pt_regs *);
        unsigned long flags;
        cpumask_t mask;
        const char *name;
        void *dev_id;
        struct irqaction *next;
};

extern irqreturn_t no_action(int cpl, void *dev_id, struct pt_regs *regs);
extern int request_irq(unsigned int,
                       irqreturn_t (*handler)(int, void *, struct pt_regs *),
                       unsigned long, const char *, void *);
extern void free_irq(unsigned int, void *);
# 68 "include/linux/interrupt.h"
extern void local_bh_enable(void);







enum
{
        HI_SOFTIRQ=0,
        TIMER_SOFTIRQ,
        NET_TX_SOFTIRQ,
        NET_RX_SOFTIRQ,
        SCSI_SOFTIRQ,
        TASKLET_SOFTIRQ
};





struct softirq_action
{
        void (*action)(struct softirq_action *);
        void *data;
};

 __attribute__((regparm(0))) void do_softirq(void);
extern void open_softirq(int nr, void (*action)(struct softirq_action*), void *data);
extern void softirq_init(void);

extern void raise_softirq_irqoff(unsigned int nr) __attribute__((regparm(3)));
extern void raise_softirq(unsigned int nr) __attribute__((regparm(3)));
# 128 "include/linux/interrupt.h"
struct tasklet_struct
{
        struct tasklet_struct *next;
        unsigned long state;
        atomic_t count;
        void (*func)(unsigned long);
        unsigned long data;
};
# 144 "include/linux/interrupt.h"
enum
{
        TASKLET_STATE_SCHED,
        TASKLET_STATE_RUN
};


static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int tasklet_trylock(struct tasklet_struct *t)
{
        return !test_and_set_bit(TASKLET_STATE_RUN, &(t)->state);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void tasklet_unlock(struct tasklet_struct *t)
{
        __asm__ __volatile__("": : :"memory");
        clear_bit(TASKLET_STATE_RUN, &(t)->state);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void tasklet_unlock_wait(struct tasklet_struct *t)
{
        while ((__builtin_constant_p(TASKLET_STATE_RUN) ? constant_test_bit((TASKLET_STATE_RUN),(&(t)->state)) : variable_test_bit((TASKLET_STATE_RUN),(&(t)->state)))) { __asm__ __volatile__("": : :"memory"); }
}






extern void __tasklet_schedule(struct tasklet_struct *t) __attribute__((regparm(3)));

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void tasklet_schedule(struct tasklet_struct *t)
{
        if (!test_and_set_bit(TASKLET_STATE_SCHED, &t->state))
                __tasklet_schedule(t);
}

extern void __tasklet_hi_schedule(struct tasklet_struct *t) __attribute__((regparm(3)));

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void tasklet_hi_schedule(struct tasklet_struct *t)
{
        if (!test_and_set_bit(TASKLET_STATE_SCHED, &t->state))
                __tasklet_hi_schedule(t);
}


static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void tasklet_disable_nosync(struct tasklet_struct *t)
{
        atomic_inc(&t->count);
        __asm__ __volatile__("": : :"memory");
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void tasklet_disable(struct tasklet_struct *t)
{
        tasklet_disable_nosync(t);
        tasklet_unlock_wait(t);
        asm volatile ("661:\n\t" "lock; addl $0,0(%%esp)" "\n662:\n" ".section .altinstructions,\"a\"\n" "  .align 4\n" "  .long 661b\n" "  .long 663f\n" "  .byte %c0\n" "  .byte 662b-661b\n" "  .byte 664f-663f\n" ".previous\n" ".section .altinstr_replacement,\"ax\"\n" "663:\n\t" "mfence" "\n664:\n" ".previous" :: "i" ((0*32+26)) : "memory");
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void tasklet_enable(struct tasklet_struct *t)
{
        __asm__ __volatile__("": : :"memory");
        atomic_dec(&t->count);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void tasklet_hi_enable(struct tasklet_struct *t)
{
        __asm__ __volatile__("": : :"memory");
        atomic_dec(&t->count);
}

extern void tasklet_kill(struct tasklet_struct *t);
extern void tasklet_kill_immediate(struct tasklet_struct *t, unsigned int cpu);
extern void tasklet_init(struct tasklet_struct *t,
                         void (*func)(unsigned long), unsigned long data);
# 246 "include/linux/interrupt.h"
extern unsigned long probe_irq_on(void);
extern int probe_irq_off(unsigned long);
extern unsigned int probe_irq_mask(unsigned long);
# 25 "include/asm/highmem.h" 2


# 1 "include/asm/tlbflush.h" 1
# 38 "include/asm/tlbflush.h"
extern unsigned long pgkern_mask;
# 113 "include/asm/tlbflush.h"
extern void flush_tlb_all(void);
extern void flush_tlb_current_task(void);
extern void flush_tlb_mm(struct mm_struct *);
extern void flush_tlb_page(struct vm_area_struct *, unsigned long);



static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void flush_tlb_range(struct vm_area_struct * vma, unsigned long start, unsigned long end)
{
        flush_tlb_mm(vma->vm_mm);
}




struct tlb_state
{
        struct mm_struct *active_mm;
        int state;
        char __cacheline_padding[(1 << (7))-8];
};
extern struct tlb_state cpu_tlbstate[8];






static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void flush_tlb_pgtables(struct mm_struct *mm,
                                      unsigned long start, unsigned long end)
{

}
# 28 "include/asm/highmem.h" 2


extern unsigned long highstart_pfn, highend_pfn;

extern pte_t *kmap_pte;
extern pgprot_t kmap_prot;
extern pte_t *pkmap_page_table;

extern void kmap_init(void);
# 57 "include/asm/highmem.h"
extern void * kmap_high(struct page *page) __attribute__((regparm(3)));
extern void kunmap_high(struct page *page) __attribute__((regparm(3)));

void *kmap(struct page *page);
void kunmap(struct page *page);
void *kmap_atomic(struct page *page, enum km_type type);
void kunmap_atomic(void *kvaddr, enum km_type type);
struct page *kmap_atomic_to_page(void *ptr);
# 15 "include/linux/highmem.h" 2


unsigned int nr_free_highpages(void);
# 38 "include/linux/highmem.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void clear_user_highpage(struct page *page, unsigned long vaddr)
{
        void *addr = kmap_atomic(page, KM_USER0);
        (__builtin_constant_p(0) ? (__builtin_constant_p(((1UL << 12))) ? __constant_c_and_count_memset((((void *)(addr))),((0x01010101UL*(unsigned char)(0))),(((1UL << 12)))) : __constant_c_memset((((void *)(addr))),((0x01010101UL*(unsigned char)(0))),(((1UL << 12))))) : (__builtin_constant_p(((1UL << 12))) ? __memset_generic(((((void *)(addr)))),(((0))),((((1UL << 12))))) : __memset_generic((((void *)(addr))),((0)),(((1UL << 12))))));
        kunmap_atomic(addr, KM_USER0);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void clear_highpage(struct page *page)
{
        void *kaddr = kmap_atomic(page, KM_USER0);
        (__builtin_constant_p(0) ? (__builtin_constant_p(((1UL << 12))) ? __constant_c_and_count_memset((((void *)(kaddr))),((0x01010101UL*(unsigned char)(0))),(((1UL << 12)))) : __constant_c_memset((((void *)(kaddr))),((0x01010101UL*(unsigned char)(0))),(((1UL << 12))))) : (__builtin_constant_p(((1UL << 12))) ? __memset_generic(((((void *)(kaddr)))),(((0))),((((1UL << 12))))) : __memset_generic((((void *)(kaddr))),((0)),(((1UL << 12))))));
        kunmap_atomic(kaddr, KM_USER0);
}




static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void memclear_highpage_flush(struct page *page, unsigned int offset, unsigned int size)
{
        void *kaddr;

        do { if (__builtin_expect(!!((offset + size > (1UL << 12))!=0), 0)) __asm__ __volatile__( "ud2\n" "\t.word %c0\n" "\t.long %c1\n" : : "i" (59), "i" ("include/linux/highmem.h")); } while(0);

        kaddr = kmap_atomic(page, KM_USER0);
        (__builtin_constant_p(0) ? (__builtin_constant_p((size)) ? __constant_c_and_count_memset((((char *)kaddr + offset)),((0x01010101UL*(unsigned char)(0))),((size))) : __constant_c_memset((((char *)kaddr + offset)),((0x01010101UL*(unsigned char)(0))),((size)))) : (__builtin_constant_p((size)) ? __memset_generic(((((char *)kaddr + offset))),(((0))),(((size)))) : __memset_generic((((char *)kaddr + offset)),((0)),((size)))));
        do { } while (0);
        kunmap_atomic(kaddr, KM_USER0);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void copy_user_highpage(struct page *to, struct page *from, unsigned long vaddr)
{
        char *vfrom, *vto;

        vfrom = kmap_atomic(from, KM_USER0);
        vto = kmap_atomic(to, KM_USER1);
        (__builtin_constant_p((1UL << 12)) ? __constant_memcpy(((void *)(vto)),((void *)(vfrom)),((1UL << 12))) : __memcpy(((void *)(vto)),((void *)(vfrom)),((1UL << 12))));
        kunmap_atomic(vfrom, KM_USER0);
        kunmap_atomic(vto, KM_USER1);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void copy_highpage(struct page *to, struct page *from)
{
        char *vfrom, *vto;

        vfrom = kmap_atomic(from, KM_USER0);
        vto = kmap_atomic(to, KM_USER1);
        (__builtin_constant_p((1UL << 12)) ? __constant_memcpy(((void *)(vto)),((void *)(vfrom)),((1UL << 12))) : __memcpy(((void *)(vto)),((void *)(vfrom)),((1UL << 12))));
        kunmap_atomic(vfrom, KM_USER0);
        kunmap_atomic(vto, KM_USER1);
}
# 11 "include/linux/pagemap.h" 2

# 1 "include/asm/uaccess.h" 1
# 41 "include/asm/uaccess.h"
extern struct movsl_mask {
        int mask;
} __attribute__((__aligned__((1 << (7))))) movsl_mask;
# 103 "include/asm/uaccess.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int verify_area(int type, const void * addr, unsigned long size)
{
        return (__builtin_expect(!!(({ unsigned long flag,sum; (void)0; asm("addl %3,%1 ; sbbl %0,%0; cmpl %1,%4; sbbl $0,%0" :"=&r" (flag), "=r" (sum) :"1" (addr),"g" ((int)(size)),"g" (current_thread_info()->addr_limit.seg)); flag; }) == 0), 1)) ? 0 : -14;
}
# 122 "include/asm/uaccess.h"
struct exception_table_entry
{
        unsigned long insn, fixup;
};

extern int fixup_exception(struct pt_regs *regs);
# 144 "include/asm/uaccess.h"
extern void __get_user_1(void);
extern void __get_user_2(void);
extern void __get_user_4(void);
# 185 "include/asm/uaccess.h"
extern void __put_user_bad(void);
# 315 "include/asm/uaccess.h"
struct __large_struct { unsigned long buf[100]; };
# 347 "include/asm/uaccess.h"
extern long __get_user_bad(void);
# 378 "include/asm/uaccess.h"
unsigned long __copy_to_user_ll(void *to, const void *from, unsigned long n);
unsigned long __copy_from_user_ll(void *to, const void *from, unsigned long n);
# 402 "include/asm/uaccess.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned long
__copy_to_user(void *to, const void *from, unsigned long n)
{
        if (__builtin_constant_p(n)) {
                unsigned long ret;

                switch (n) {
                case 1:
                        do { ret = 0; (void)0; switch (1) { case 1: __asm__ __volatile__( "1:	mov""b"" %""b""1,%2\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(ret) : "iq" (*(u8 *)from), "m"((*(struct __large_struct *)((u8 *)to))), "i"(1), "0"(ret));break; case 2: __asm__ __volatile__( "1:	mov""w"" %""w""1,%2\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(ret) : "ir" (*(u8 *)from), "m"((*(struct __large_struct *)((u8 *)to))), "i"(1), "0"(ret));break; case 4: __asm__ __volatile__( "1:	mov""l"" %""""1,%2\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(ret) : "ir" (*(u8 *)from), "m"((*(struct __large_struct *)((u8 *)to))), "i"(1), "0"(ret)); break; case 8: __asm__ __volatile__( "1:	movl %%eax,0(%2)\n" "2:	movl %%edx,4(%2)\n" "3:\n" ".section .fixup,\"ax\"\n" "4:	movl %3,%0\n" "	jmp 3b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,4b\n" "	.long 2b,4b\n" ".previous" : "=r"(ret) : "A" ((__typeof__(*(u8 *)to))(*(u8 *)from)), "r" ((u8 *)to), "i"(-14), "0"(ret)); break; default: __put_user_bad(); } } while (0);
                        return ret;
                case 2:
                        do { ret = 0; (void)0; switch (2) { case 1: __asm__ __volatile__( "1:	mov""b"" %""b""1,%2\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(ret) : "iq" (*(u16 *)from), "m"((*(struct __large_struct *)((u16 *)to))), "i"(2), "0"(ret));break; case 2: __asm__ __volatile__( "1:	mov""w"" %""w""1,%2\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(ret) : "ir" (*(u16 *)from), "m"((*(struct __large_struct *)((u16 *)to))), "i"(2), "0"(ret));break; case 4: __asm__ __volatile__( "1:	mov""l"" %""""1,%2\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(ret) : "ir" (*(u16 *)from), "m"((*(struct __large_struct *)((u16 *)to))), "i"(2), "0"(ret)); break; case 8: __asm__ __volatile__( "1:	movl %%eax,0(%2)\n" "2:	movl %%edx,4(%2)\n" "3:\n" ".section .fixup,\"ax\"\n" "4:	movl %3,%0\n" "	jmp 3b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,4b\n" "	.long 2b,4b\n" ".previous" : "=r"(ret) : "A" ((__typeof__(*(u16 *)to))(*(u16 *)from)), "r" ((u16 *)to), "i"(-14), "0"(ret)); break; default: __put_user_bad(); } } while (0);
                        return ret;
                case 4:
                        do { ret = 0; (void)0; switch (4) { case 1: __asm__ __volatile__( "1:	mov""b"" %""b""1,%2\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(ret) : "iq" (*(u32 *)from), "m"((*(struct __large_struct *)((u32 *)to))), "i"(4), "0"(ret));break; case 2: __asm__ __volatile__( "1:	mov""w"" %""w""1,%2\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(ret) : "ir" (*(u32 *)from), "m"((*(struct __large_struct *)((u32 *)to))), "i"(4), "0"(ret));break; case 4: __asm__ __volatile__( "1:	mov""l"" %""""1,%2\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(ret) : "ir" (*(u32 *)from), "m"((*(struct __large_struct *)((u32 *)to))), "i"(4), "0"(ret)); break; case 8: __asm__ __volatile__( "1:	movl %%eax,0(%2)\n" "2:	movl %%edx,4(%2)\n" "3:\n" ".section .fixup,\"ax\"\n" "4:	movl %3,%0\n" "	jmp 3b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,4b\n" "	.long 2b,4b\n" ".previous" : "=r"(ret) : "A" ((__typeof__(*(u32 *)to))(*(u32 *)from)), "r" ((u32 *)to), "i"(-14), "0"(ret)); break; default: __put_user_bad(); } } while (0);
                        return ret;
                }
        }
        return __copy_to_user_ll(to, from, n);
}
# 440 "include/asm/uaccess.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned long
__copy_from_user(void *to, const void *from, unsigned long n)
{
        if (__builtin_constant_p(n)) {
                unsigned long ret;

                switch (n) {
                case 1:
                        do { ret = 0; (void)0; switch (1) { case 1: __asm__ __volatile__( "1:	mov""b"" %2,%""b""1\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	xor""b"" %""b""1,%""b""1\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(ret), "=q" (*(u8 *)to) : "m"((*(struct __large_struct *)(from))), "i"(1), "0"(ret));break; case 2: __asm__ __volatile__( "1:	mov""w"" %2,%""w""1\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	xor""w"" %""w""1,%""w""1\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(ret), "=r" (*(u8 *)to) : "m"((*(struct __large_struct *)(from))), "i"(1), "0"(ret));break; case 4: __asm__ __volatile__( "1:	mov""l"" %2,%""""1\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	xor""l"" %""""1,%""""1\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(ret), "=r" (*(u8 *)to) : "m"((*(struct __large_struct *)(from))), "i"(1), "0"(ret));break; default: (*(u8 *)to) = __get_user_bad(); } } while (0);
                        return ret;
                case 2:
                        do { ret = 0; (void)0; switch (2) { case 1: __asm__ __volatile__( "1:	mov""b"" %2,%""b""1\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	xor""b"" %""b""1,%""b""1\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(ret), "=q" (*(u16 *)to) : "m"((*(struct __large_struct *)(from))), "i"(2), "0"(ret));break; case 2: __asm__ __volatile__( "1:	mov""w"" %2,%""w""1\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	xor""w"" %""w""1,%""w""1\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(ret), "=r" (*(u16 *)to) : "m"((*(struct __large_struct *)(from))), "i"(2), "0"(ret));break; case 4: __asm__ __volatile__( "1:	mov""l"" %2,%""""1\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	xor""l"" %""""1,%""""1\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(ret), "=r" (*(u16 *)to) : "m"((*(struct __large_struct *)(from))), "i"(2), "0"(ret));break; default: (*(u16 *)to) = __get_user_bad(); } } while (0);
                        return ret;
                case 4:
                        do { ret = 0; (void)0; switch (4) { case 1: __asm__ __volatile__( "1:	mov""b"" %2,%""b""1\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	xor""b"" %""b""1,%""b""1\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(ret), "=q" (*(u32 *)to) : "m"((*(struct __large_struct *)(from))), "i"(4), "0"(ret));break; case 2: __asm__ __volatile__( "1:	mov""w"" %2,%""w""1\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	xor""w"" %""w""1,%""w""1\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(ret), "=r" (*(u32 *)to) : "m"((*(struct __large_struct *)(from))), "i"(4), "0"(ret));break; case 4: __asm__ __volatile__( "1:	mov""l"" %2,%""""1\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	xor""l"" %""""1,%""""1\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(ret), "=r" (*(u32 *)to) : "m"((*(struct __large_struct *)(from))), "i"(4), "0"(ret));break; default: (*(u32 *)to) = __get_user_bad(); } } while (0);
                        return ret;
                }
        }
        return __copy_from_user_ll(to, from, n);
}

unsigned long copy_to_user(void *to, const void *from, unsigned long n);
unsigned long copy_from_user(void *to,
                        const void *from, unsigned long n);
long strncpy_from_user(char *dst, const char *src, long count);
long __strncpy_from_user(char *dst, const char *src, long count);
# 483 "include/asm/uaccess.h"
long strnlen_user(const char *str, long n);
unsigned long clear_user(void *mem, unsigned long len);
unsigned long __clear_user(void *mem, unsigned long len);
# 13 "include/linux/pagemap.h" 2
# 22 "include/linux/pagemap.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int mapping_gfp_mask(struct address_space * mapping)
{
        return mapping->flags & ((1 << 16) - 1);
}





static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void mapping_set_gfp_mask(struct address_space *m, int mask)
{
        m->flags = (m->flags & ~((1 << 16) - 1)) | mask;
}
# 51 "include/linux/pagemap.h"
void release_pages(struct page **pages, int nr, int cold);

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct page *page_cache_alloc(struct address_space *x)
{
        return alloc_pages_node(((0)), mapping_gfp_mask(x), 0);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct page *page_cache_alloc_cold(struct address_space *x)
{
        return alloc_pages_node(((0)), mapping_gfp_mask(x)|0x100, 0);
}

typedef int filler_t(void *, struct page *);

extern struct page * find_get_page(struct address_space *mapping,
                                unsigned long index);
extern struct page * find_lock_page(struct address_space *mapping,
                                unsigned long index);
extern struct page * find_trylock_page(struct address_space *mapping,
                                unsigned long index);
extern struct page * find_or_create_page(struct address_space *mapping,
                                unsigned long index, unsigned int gfp_mask);
unsigned find_get_pages(struct address_space *mapping, unsigned long start,
                        unsigned int nr_pages, struct page **pages);
unsigned find_get_pages_tag(struct address_space *mapping, unsigned long *index,
                        int tag, unsigned int nr_pages, struct page **pages);




static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct page *grab_cache_page(struct address_space *mapping, unsigned long index)
{
        return find_or_create_page(mapping, index, mapping_gfp_mask(mapping));
}

extern struct page * grab_cache_page_nowait(struct address_space *mapping,
                                unsigned long index);
extern struct page * read_cache_page(struct address_space *mapping,
                                unsigned long index, filler_t *filler,
                                void *data);
extern int read_cache_pages(struct address_space *mapping,
                struct list_head *pages, filler_t *filler, void *data);

int add_to_page_cache(struct page *page, struct address_space *mapping,
                                unsigned long index, int gfp_mask);
int add_to_page_cache_lru(struct page *page, struct address_space *mapping,
                                unsigned long index, int gfp_mask);
extern void remove_from_page_cache(struct page *page);
extern void __remove_from_page_cache(struct page *page);

extern atomic_t nr_pagecache;




extern __typeof__(long) per_cpu__nr_pagecache_local;
# 118 "include/linux/pagemap.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void pagecache_acct(int count)
{
        long *local;

        local = &(*({ unsigned long __ptr; __asm__ ("" : "=g"(__ptr) : "0"(&per_cpu__nr_pagecache_local)); (typeof(&per_cpu__nr_pagecache_local)) (__ptr + (__per_cpu_offset[(current_thread_info()->cpu)])); }));
        *local += count;
        if (*local > ({ typeof(16) _x = (16); typeof(8 * 2) _y = (8 * 2); (void) (&_x == &_y); _x > _y ? _x : _y; }) || *local < -({ typeof(16) _x = (16); typeof(8 * 2) _y = (8 * 2); (void) (&_x == &_y); _x > _y ? _x : _y; })) {
                atomic_add(*local, &nr_pagecache);
                *local = 0;
        }
}
# 138 "include/linux/pagemap.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned long get_page_cache_size(void)
{
        int ret = ((&nr_pagecache)->counter);
        if (__builtin_expect(!!(ret < 0), 0))
                ret = 0;
        return ret;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned long linear_page_index(struct vm_area_struct *vma,
                                        unsigned long address)
{
        unsigned long pgoff = (address - vma->vm_start) >> 12;
        pgoff += vma->vm_pgoff;
        return pgoff >> (12 - 12);
}

extern void __lock_page(struct page *page) __attribute__((regparm(3)));
extern void unlock_page(struct page *page) __attribute__((regparm(3)));

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void lock_page(struct page *page)
{
        if (test_and_set_bit(0, &(page)->flags))
                __lock_page(page);
}





extern void wait_on_page_bit(struct page *page, int bit_nr) __attribute__((regparm(3)));
# 176 "include/linux/pagemap.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void wait_on_page_locked(struct page *page)
{
        if ((__builtin_constant_p(0) ? constant_test_bit((0),(&(page)->flags)) : variable_test_bit((0),(&(page)->flags))))
                wait_on_page_bit(page, 0);
}




static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void wait_on_page_writeback(struct page *page)
{
        if ((__builtin_constant_p(13) ? constant_test_bit((13),(&(page)->flags)) : variable_test_bit((13),(&(page)->flags))))
                wait_on_page_bit(page, 13);
}

extern void end_page_writeback(struct page *page);







static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int fault_in_pages_writeable(char *uaddr, int size)
{
        int ret;





        ret = ({ long __pu_err; do { __pu_err = 0; (void)0; switch ((sizeof(*(uaddr)))) { case 1: __asm__ __volatile__( "1:	mov""b"" %""b""1,%2\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(__pu_err) : "iq" (((__typeof__(*(uaddr)))(0))), "m"((*(struct __large_struct *)(((uaddr))))), "i"(-14), "0"(__pu_err));break; case 2: __asm__ __volatile__( "1:	mov""w"" %""w""1,%2\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(__pu_err) : "ir" (((__typeof__(*(uaddr)))(0))), "m"((*(struct __large_struct *)(((uaddr))))), "i"(-14), "0"(__pu_err));break; case 4: __asm__ __volatile__( "1:	mov""l"" %""""1,%2\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(__pu_err) : "ir" (((__typeof__(*(uaddr)))(0))), "m"((*(struct __large_struct *)(((uaddr))))), "i"(-14), "0"(__pu_err)); break; case 8: __asm__ __volatile__( "1:	movl %%eax,0(%2)\n" "2:	movl %%edx,4(%2)\n" "3:\n" ".section .fixup,\"ax\"\n" "4:	movl %3,%0\n" "	jmp 3b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,4b\n" "	.long 2b,4b\n" ".previous" : "=r"(__pu_err) : "A" ((__typeof__(*((uaddr))))(((__typeof__(*(uaddr)))(0)))), "r" (((uaddr))), "i"(-14), "0"(__pu_err)); break; default: __put_user_bad(); } } while (0); __pu_err; });
        if (ret == 0) {
                char *end = uaddr + size - 1;





                if (((unsigned long)uaddr & (~((1UL << 12)-1))) !=
                                ((unsigned long)end & (~((1UL << 12)-1))))
                        ret = ({ long __pu_err; do { __pu_err = 0; (void)0; switch ((sizeof(*(end)))) { case 1: __asm__ __volatile__( "1:	mov""b"" %""b""1,%2\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(__pu_err) : "iq" (((__typeof__(*(end)))(0))), "m"((*(struct __large_struct *)(((end))))), "i"(-14), "0"(__pu_err));break; case 2: __asm__ __volatile__( "1:	mov""w"" %""w""1,%2\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(__pu_err) : "ir" (((__typeof__(*(end)))(0))), "m"((*(struct __large_struct *)(((end))))), "i"(-14), "0"(__pu_err));break; case 4: __asm__ __volatile__( "1:	mov""l"" %""""1,%2\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(__pu_err) : "ir" (((__typeof__(*(end)))(0))), "m"((*(struct __large_struct *)(((end))))), "i"(-14), "0"(__pu_err)); break; case 8: __asm__ __volatile__( "1:	movl %%eax,0(%2)\n" "2:	movl %%edx,4(%2)\n" "3:\n" ".section .fixup,\"ax\"\n" "4:	movl %3,%0\n" "	jmp 3b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,4b\n" "	.long 2b,4b\n" ".previous" : "=r"(__pu_err) : "A" ((__typeof__(*((end))))(((__typeof__(*(end)))(0)))), "r" (((end))), "i"(-14), "0"(__pu_err)); break; default: __put_user_bad(); } } while (0); __pu_err; });
        }
        return ret;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void fault_in_pages_readable(const char *uaddr, int size)
{
        volatile char c;
        int ret;

        ret = ({ long __gu_err, __gu_val; do { __gu_err = 0; (void)0; switch ((sizeof(*(uaddr)))) { case 1: __asm__ __volatile__( "1:	mov""b"" %2,%""b""1\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	xor""b"" %""b""1,%""b""1\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(__gu_err), "=q" (__gu_val) : "m"((*(struct __large_struct *)(((uaddr))))), "i"(-14), "0"(__gu_err));break; case 2: __asm__ __volatile__( "1:	mov""w"" %2,%""w""1\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	xor""w"" %""w""1,%""w""1\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(__gu_err), "=r" (__gu_val) : "m"((*(struct __large_struct *)(((uaddr))))), "i"(-14), "0"(__gu_err));break; case 4: __asm__ __volatile__( "1:	mov""l"" %2,%""""1\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	xor""l"" %""""1,%""""1\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(__gu_err), "=r" (__gu_val) : "m"((*(struct __large_struct *)(((uaddr))))), "i"(-14), "0"(__gu_err));break; default: (__gu_val) = __get_user_bad(); } } while (0); ((c)) = (__typeof__(*((uaddr))))__gu_val; __gu_err; });
        if (ret == 0) {
                const char *end = uaddr + size - 1;

                if (((unsigned long)uaddr & (~((1UL << 12)-1))) !=
                                ((unsigned long)end & (~((1UL << 12)-1))))
                        ({ long __gu_err, __gu_val; do { __gu_err = 0; (void)0; switch ((sizeof(*(end)))) { case 1: __asm__ __volatile__( "1:	mov""b"" %2,%""b""1\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	xor""b"" %""b""1,%""b""1\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(__gu_err), "=q" (__gu_val) : "m"((*(struct __large_struct *)(((end))))), "i"(-14), "0"(__gu_err));break; case 2: __asm__ __volatile__( "1:	mov""w"" %2,%""w""1\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	xor""w"" %""w""1,%""w""1\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(__gu_err), "=r" (__gu_val) : "m"((*(struct __large_struct *)(((end))))), "i"(-14), "0"(__gu_err));break; case 4: __asm__ __volatile__( "1:	mov""l"" %2,%""""1\n" "2:\n" ".section .fixup,\"ax\"\n" "3:	movl %3,%0\n" "	xor""l"" %""""1,%""""1\n" "	jmp 2b\n" ".previous\n" ".section __ex_table,\"a\"\n" "	.align 4\n" "	.long 1b,3b\n" ".previous" : "=r"(__gu_err), "=r" (__gu_val) : "m"((*(struct __large_struct *)(((end))))), "i"(-14), "0"(__gu_err));break; default: (__gu_val) = __get_user_bad(); } } while (0); ((c)) = (__typeof__(*((end))))__gu_val; __gu_err; });
        }
}
# 23 "mm/filemap.c" 2
# 1 "include/linux/file.h" 1
# 22 "include/linux/file.h"
struct files_struct {
        atomic_t count;
        spinlock_t file_lock;
        int max_fds;
        int max_fdset;
        int next_fd;
        struct file ** fd;
        fd_set *close_on_exec;
        fd_set *open_fds;
        fd_set close_on_exec_init;
        fd_set open_fds_init;
        struct file * fd_array[32];
};

extern void __fput(struct file *) __attribute__((regparm(3)));
extern void fput(struct file *) __attribute__((regparm(3)));

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void fput_light(struct file *file, int fput_needed)
{
        if (__builtin_expect(!!(fput_needed), 0))
                fput(file);
}

extern struct file * fget(unsigned int fd) __attribute__((regparm(3)));
extern struct file * fget_light(unsigned int fd, int *fput_needed) __attribute__((regparm(3)));
extern void set_close_on_exec(unsigned int fd, int flag) __attribute__((regparm(3)));
extern void put_filp(struct file *);
extern int get_unused_fd(void);
extern void put_unused_fd(unsigned int fd) __attribute__((regparm(3)));
struct kmem_cache_s;
extern void filp_ctor(void * objp, struct kmem_cache_s *cachep, unsigned long cflags);
extern void filp_dtor(void * objp, struct kmem_cache_s *cachep, unsigned long dflags);

extern struct file ** alloc_fd_array(int);
extern int expand_fd_array(struct files_struct *, int nr);
extern void free_fd_array(struct file **, int);

extern fd_set *alloc_fdset(int);
extern int expand_fdset(struct files_struct *, int nr);
extern void free_fdset(fd_set *, int);

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct file * fcheck_files(struct files_struct *files, unsigned int fd)
{
        struct file * file = ((void *)0);

        if (fd < files->max_fds)
                file = files->fd[fd];
        return file;
}






extern void fd_install(unsigned int fd, struct file * file) __attribute__((regparm(3)));

struct task_struct;

struct files_struct *get_files_struct(struct task_struct *);
void put_files_struct(struct files_struct *fs) __attribute__((regparm(3)));
# 24 "mm/filemap.c" 2
# 1 "include/linux/uio.h" 1
# 20 "include/linux/uio.h"
struct iovec
{
        void *iov_base;
        __kernel_size_t iov_len;
};



struct kvec {
        void *iov_base;
        size_t iov_len;
};
# 54 "include/linux/uio.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) size_t iov_length(const struct iovec *iov, unsigned long nr_segs)
{
        unsigned long seg;
        size_t ret = 0;

        for (seg = 0; seg < nr_segs; seg++)
                ret += iov[seg].iov_len;
        return ret;
}

unsigned long iov_shorten(struct iovec *iov, unsigned long nr_segs, size_t to);
# 25 "mm/filemap.c" 2
# 1 "include/linux/hash.h" 1
# 26 "include/linux/hash.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned long hash_long(unsigned long val, unsigned int bits)
{
        unsigned long hash = val;
# 47 "include/linux/hash.h"
        hash *= 0x9e370001UL;



        return hash >> (32 - bits);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned long hash_ptr(void *ptr, unsigned int bits)
{
        return hash_long((unsigned long)ptr, bits);
}
# 26 "mm/filemap.c" 2
# 1 "include/linux/writeback.h" 1






struct backing_dev_info;

extern spinlock_t inode_lock;
extern struct list_head inode_in_use;
extern struct list_head inode_unused;





static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int current_is_pdflush(void)
{
        return get_current()->flags & 0x00002000;
}




enum writeback_sync_modes {
        WB_SYNC_NONE,
        WB_SYNC_ALL,
        WB_SYNC_HOLD,
};




struct writeback_control {
        struct backing_dev_info *bdi;

        enum writeback_sync_modes sync_mode;
        unsigned long *older_than_this;

        long nr_to_write;

        long pages_skipped;
        int nonblocking;
        int encountered_congestion;
        int for_kupdate;
        int for_reclaim;
};
# 58 "include/linux/writeback.h"
void writeback_inodes(struct writeback_control *wbc);
void wake_up_inode(struct inode *inode);
void __wait_on_inode(struct inode * inode);
void sync_inodes_sb(struct super_block *, int wait);
void sync_inodes(int wait);


static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void wait_on_inode(struct inode *inode)
{
        if (inode->i_state & 8)
                __wait_on_inode(inode);
}




int wakeup_bdflush(long nr_pages);
void laptop_io_completion(void);
void laptop_sync_completion(void);


extern int dirty_background_ratio;
extern int vm_dirty_ratio;
extern int dirty_writeback_centisecs;
extern int dirty_expire_centisecs;
extern int block_dump;
extern int laptop_mode;

struct ctl_table;
struct file;
int dirty_writeback_centisecs_handler(struct ctl_table *, int, struct file *,
                                      void *, size_t *, loff_t *);

void page_writeback_init(void);
void balance_dirty_pages_ratelimited(struct address_space *mapping);
int pdflush_operation(void (*fn)(unsigned long), unsigned long arg0);
int do_writepages(struct address_space *mapping, struct writeback_control *wbc);


extern int nr_pdflush_threads;
# 27 "mm/filemap.c" 2
# 1 "include/linux/pagevec.h" 1
# 10 "include/linux/pagevec.h"
struct page;
struct address_space;

struct pagevec {
        unsigned nr;
        int cold;
        struct page *pages[16];
};

void __pagevec_release(struct pagevec *pvec);
void __pagevec_release_nonlru(struct pagevec *pvec);
void __pagevec_free(struct pagevec *pvec);
void __pagevec_lru_add(struct pagevec *pvec);
void __pagevec_lru_add_active(struct pagevec *pvec);
void pagevec_strip(struct pagevec *pvec);
unsigned pagevec_lookup(struct pagevec *pvec, struct address_space *mapping,
                unsigned long start, unsigned nr_pages);
unsigned pagevec_lookup_tag(struct pagevec *pvec,
                struct address_space *mapping, unsigned long *index, int tag,
                unsigned nr_pages);

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void pagevec_init(struct pagevec *pvec, int cold)
{
        pvec->nr = 0;
        pvec->cold = cold;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void pagevec_reinit(struct pagevec *pvec)
{
        pvec->nr = 0;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned pagevec_count(struct pagevec *pvec)
{
        return pvec->nr;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned pagevec_space(struct pagevec *pvec)
{
        return 16 - pvec->nr;
}




static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned pagevec_add(struct pagevec *pvec, struct page *page)
{
        pvec->pages[pvec->nr++] = page;
        return pagevec_space(pvec);
}


static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void pagevec_release(struct pagevec *pvec)
{
        if (pagevec_count(pvec))
                __pagevec_release(pvec);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void pagevec_release_nonlru(struct pagevec *pvec)
{
        if (pagevec_count(pvec))
                __pagevec_release_nonlru(pvec);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void pagevec_free(struct pagevec *pvec)
{
        if (pagevec_count(pvec))
                __pagevec_free(pvec);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void pagevec_lru_add(struct pagevec *pvec)
{
        if (pagevec_count(pvec))
                __pagevec_lru_add(pvec);
}
# 28 "mm/filemap.c" 2
# 1 "include/linux/blkdev.h" 1




# 1 "include/linux/major.h" 1
# 6 "include/linux/blkdev.h" 2
# 1 "include/linux/genhd.h" 1
# 15 "include/linux/genhd.h"
# 1 "include/linux/device.h" 1
# 15 "include/linux/device.h"
# 1 "include/linux/ioport.h" 1
# 16 "include/linux/ioport.h"
struct resource {
        const char *name;
        unsigned long start, end;
        unsigned long flags;
        struct resource *parent, *sibling, *child;
};

struct resource_list {
        struct resource_list *next;
        struct resource *res;
        struct pci_dev *dev;
};
# 86 "include/linux/ioport.h"
extern struct resource ioport_resource;
extern struct resource iomem_resource;

extern int get_resource_list(struct resource *, char *buf, int size);

extern int request_resource(struct resource *root, struct resource *new);
extern struct resource * ____request_resource(struct resource *root, struct resource *new);
extern int release_resource(struct resource *new);
extern int insert_resource(struct resource *parent, struct resource *new);
extern int allocate_resource(struct resource *root, struct resource *new,
                             unsigned long size,
                             unsigned long min, unsigned long max,
                             unsigned long align,
                             void (*alignf)(void *, struct resource *,
                                            unsigned long, unsigned long),
                             void *alignf_data);
int adjust_resource(struct resource *res, unsigned long start,
                    unsigned long size);






extern struct resource * __request_region(struct resource *, unsigned long start, unsigned long n, const char *name);






extern int __check_region(struct resource *, unsigned long, unsigned long);
extern void __release_region(struct resource *, unsigned long, unsigned long);

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int __attribute__((deprecated)) check_region(unsigned long s, unsigned long n)
{
        return __check_region(&ioport_resource, s, n);
}
# 16 "include/linux/device.h" 2
# 1 "include/linux/kobject.h" 1
# 17 "include/linux/device.h" 2
# 31 "include/linux/device.h"
enum {
        SUSPEND_NOTIFY,
        SUSPEND_SAVE_STATE,
        SUSPEND_DISABLE,
        SUSPEND_POWER_DOWN,
};

enum {
        RESUME_POWER_ON,
        RESUME_RESTORE_STATE,
        RESUME_ENABLE,
};

struct device;
struct device_driver;
struct class;
struct class_device;
struct class_simple;

struct bus_type {
        char * name;

        struct subsystem subsys;
        struct kset drivers;
        struct kset devices;

        struct bus_attribute * bus_attrs;
        struct device_attribute * dev_attrs;
        struct driver_attribute * drv_attrs;

        int (*match)(struct device * dev, struct device_driver * drv);
        struct device * (*add) (struct device * parent, char * bus_id);
        int (*hotplug) (struct device *dev, char **envp,
                                    int num_envp, char *buffer, int buffer_size);
        int (*suspend)(struct device * dev, u32 state);
        int (*resume)(struct device * dev);
};

extern int bus_register(struct bus_type * bus);
extern void bus_unregister(struct bus_type * bus);

extern int bus_rescan_devices(struct bus_type * bus);

extern struct bus_type * get_bus(struct bus_type * bus);
extern void put_bus(struct bus_type * bus);

extern struct bus_type * find_bus(char * name);



int bus_for_each_dev(struct bus_type * bus, struct device * start, void * data,
                     int (*fn)(struct device *, void *));

int bus_for_each_drv(struct bus_type * bus, struct device_driver * start,
                     void * data, int (*fn)(struct device_driver *, void *));




struct bus_attribute {
        struct attribute attr;
        ssize_t (*show)(struct bus_type *, char * buf);
        ssize_t (*store)(struct bus_type *, const char * buf, size_t count);
};




extern int bus_create_file(struct bus_type *, struct bus_attribute *);
extern void bus_remove_file(struct bus_type *, struct bus_attribute *);

struct device_driver {
        char * name;
        struct bus_type * bus;

        struct semaphore unload_sem;
        struct kobject kobj;
        struct list_head devices;

        int (*probe) (struct device * dev);
        int (*remove) (struct device * dev);
        void (*shutdown) (struct device * dev);
        int (*suspend) (struct device * dev, u32 state, u32 level);
        int (*resume) (struct device * dev, u32 level);
};


extern int driver_register(struct device_driver * drv);
extern void driver_unregister(struct device_driver * drv);

extern struct device_driver * get_driver(struct device_driver * drv);
extern void put_driver(struct device_driver * drv);
extern struct device_driver *driver_find(const char *name, struct bus_type *bus);




struct driver_attribute {
        struct attribute attr;
        ssize_t (*show)(struct device_driver *, char * buf);
        ssize_t (*store)(struct device_driver *, const char * buf, size_t count);
};




extern int driver_create_file(struct device_driver *, struct driver_attribute *);
extern void driver_remove_file(struct device_driver *, struct driver_attribute *);





struct class {
        char * name;

        struct subsystem subsys;
        struct list_head children;
        struct list_head interfaces;

        struct class_attribute * class_attrs;
        struct class_device_attribute * class_dev_attrs;

        int (*hotplug)(struct class_device *dev, char **envp,
                           int num_envp, char *buffer, int buffer_size);

        void (*release)(struct class_device *dev);
        void (*class_release)(struct class *class);
};

extern int class_register(struct class *);
extern void class_unregister(struct class *);

extern struct class * class_get(struct class *);
extern void class_put(struct class *);


struct class_attribute {
        struct attribute attr;
        ssize_t (*show)(struct class *, char * buf);
        ssize_t (*store)(struct class *, const char * buf, size_t count);
};




extern int class_create_file(struct class *, const struct class_attribute *);
extern void class_remove_file(struct class *, const struct class_attribute *);


struct class_device {
        struct list_head node;

        struct kobject kobj;
        struct class * class;
        struct device * dev;
        void * class_data;

        char class_id[20];
};

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void *
class_get_devdata (struct class_device *dev)
{
        return dev->class_data;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void
class_set_devdata (struct class_device *dev, void *data)
{
        dev->class_data = data;
}


extern int class_device_register(struct class_device *);
extern void class_device_unregister(struct class_device *);
extern void class_device_initialize(struct class_device *);
extern int class_device_add(struct class_device *);
extern void class_device_del(struct class_device *);

extern int class_device_rename(struct class_device *, char *);

extern struct class_device * class_device_get(struct class_device *);
extern void class_device_put(struct class_device *);

struct class_device_attribute {
        struct attribute attr;
        ssize_t (*show)(struct class_device *, char * buf);
        ssize_t (*store)(struct class_device *, const char * buf, size_t count);
};





extern int class_device_create_file(struct class_device *,
                                    const struct class_device_attribute *);
extern void class_device_remove_file(struct class_device *,
                                     const struct class_device_attribute *);


struct class_interface {
        struct list_head node;
        struct class *class;

        int (*add) (struct class_device *);
        void (*remove) (struct class_device *);
};

extern int class_interface_register(struct class_interface *);
extern void class_interface_unregister(struct class_interface *);


extern struct class_simple *class_simple_create(struct module *owner, char *name);
extern void class_simple_destroy(struct class_simple *cs);
extern struct class_device *class_simple_device_add(struct class_simple *cs, dev_t dev, struct device *device, const char *fmt, ...)
        __attribute__((format(printf,4,5)));
extern int class_simple_set_hotplug(struct class_simple *,
        int (*hotplug)(struct class_device *dev, char **envp, int num_envp, char *buffer, int buffer_size));
extern void class_simple_device_remove(dev_t dev);


struct device {
        struct list_head node;
        struct list_head bus_list;
        struct list_head driver_list;
        struct list_head children;
        struct device * parent;

        struct kobject kobj;
        char bus_id[20];

        struct bus_type * bus;
        struct device_driver *driver;

        void *driver_data;
        void *platform_data;

        struct dev_pm_info power;
        u32 power_state;




        unsigned char *saved_state;
        u32 detach_state;


        u64 *dma_mask;
        u64 coherent_dma_mask;





        struct list_head dma_pools;

        void (*release)(struct device * dev);
};

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct device *
list_to_dev(struct list_head *node)
{
        return ({ const typeof( ((struct device *)0)->node ) *__mptr = (node); (struct device *)( (char *)__mptr - ((size_t) &((struct device *)0)->node) );});
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void *
dev_get_drvdata (struct device *dev)
{
        return dev->driver_data;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void
dev_set_drvdata (struct device *dev, void *data)
{
        dev->driver_data = data;
}




extern int device_register(struct device * dev);
extern void device_unregister(struct device * dev);
extern void device_initialize(struct device * dev);
extern int device_add(struct device * dev);
extern void device_del(struct device * dev);
extern int device_for_each_child(struct device *, void *,
                     int (*fn)(struct device *, void *));





extern void device_bind_driver(struct device * dev);
extern void device_release_driver(struct device * dev);
extern void driver_attach(struct device_driver * drv);




struct device_attribute {
        struct attribute attr;
        ssize_t (*show)(struct device * dev, char * buf);
        ssize_t (*store)(struct device * dev, const char * buf, size_t count);
};





extern int device_create_file(struct device *device, struct device_attribute * entry);
extern void device_remove_file(struct device * dev, struct device_attribute * attr);







extern int (*platform_notify)(struct device * dev);

extern int (*platform_notify_remove)(struct device * dev);






extern struct device * get_device(struct device * dev);
extern void put_device(struct device * dev);
extern struct device *device_find(const char *name, struct bus_type *bus);




struct platform_device {
        char * name;
        u32 id;
        struct device dev;
        u32 num_resources;
        struct resource * resource;
};



extern int platform_device_register(struct platform_device *);
extern void platform_device_unregister(struct platform_device *);

extern struct bus_type platform_bus_type;
extern struct device platform_bus;

extern struct resource *platform_get_resource(struct platform_device *, unsigned int, unsigned int);
extern int platform_get_irq(struct platform_device *, unsigned int);
extern int platform_add_devices(struct platform_device **, int);

extern struct platform_device *platform_device_register_simple(char *, unsigned int, struct resource *, unsigned int);


extern void device_shutdown(void);



extern int firmware_register(struct subsystem *);
extern void firmware_unregister(struct subsystem *);
# 16 "include/linux/genhd.h" 2




enum {


        DOS_EXTENDED_PARTITION = 5,
        LINUX_EXTENDED_PARTITION = 0x85,
        WIN98_EXTENDED_PARTITION = 0x0f,

        LINUX_SWAP_PARTITION = 0x82,
        LINUX_RAID_PARTITION = 0xfd,

        SOLARIS_X86_PARTITION = LINUX_SWAP_PARTITION,

        DM6_AUX1PARTITION = 0x51,
        DM6_AUX3PARTITION = 0x53,
        DM6_PARTITION = 0x54,
        EZD_PARTITION = 0x55,

        FREEBSD_PARTITION = 0xa5,
        OPENBSD_PARTITION = 0xa6,
        NETBSD_PARTITION = 0xa9,
        BSDI_PARTITION = 0xb7,
        MINIX_PARTITION = 0x81,
        UNIXWARE_PARTITION = 0x63,
};

struct partition {
        unsigned char boot_ind;
        unsigned char head;
        unsigned char sector;
        unsigned char cyl;
        unsigned char sys_ind;
        unsigned char end_head;
        unsigned char end_sector;
        unsigned char end_cyl;
        unsigned int start_sect;
        unsigned int nr_sects;
} __attribute__((packed));


struct hd_struct {
        sector_t start_sect;
        sector_t nr_sects;
        struct kobject kobj;
        unsigned reads, read_sectors, writes, write_sectors;
        int policy, partno;
};







struct disk_stats {
        unsigned read_sectors, write_sectors;
        unsigned reads, writes;
        unsigned read_merges, write_merges;
        unsigned read_ticks, write_ticks;
        unsigned io_ticks;
        unsigned time_in_queue;
};

struct gendisk {
        int major;
        int first_minor;
        int minors;

        char disk_name[32];
        struct hd_struct **part;
        struct block_device_operations *fops;
        struct request_queue *queue;
        void *private_data;
        sector_t capacity;

        int flags;
        char devfs_name[64];
        int number;
        struct device *driverfs_dev;
        struct kobject kobj;

        struct timer_rand_state *random;
        int policy;

        unsigned sync_io;
        unsigned long stamp, stamp_idle;
        int in_flight;

        struct disk_stats *dkstats;



};
# 134 "include/linux/genhd.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void disk_stat_set_all(struct gendisk *gendiskp, int value) {
        int i;
        for (i=0; i < 8; i++) {
                if ((__builtin_constant_p(((i))) ? constant_test_bit((((i))),((cpu_callout_map).bits)) : variable_test_bit((((i))),((cpu_callout_map).bits)))) {
                        (__builtin_constant_p(value) ? (__builtin_constant_p((sizeof (struct disk_stats))) ? __constant_c_and_count_memset(((({ struct percpu_data *__p = (struct percpu_data *)~(unsigned long)(gendiskp->dkstats); (__typeof__(gendiskp->dkstats))__p->ptrs[(i)]; }))),((0x01010101UL*(unsigned char)(value))),((sizeof (struct disk_stats)))) : __constant_c_memset(((({ struct percpu_data *__p = (struct percpu_data *)~(unsigned long)(gendiskp->dkstats); (__typeof__(gendiskp->dkstats))__p->ptrs[(i)]; }))),((0x01010101UL*(unsigned char)(value))),((sizeof (struct disk_stats))))) : (__builtin_constant_p((sizeof (struct disk_stats))) ? __memset_generic((((({ struct percpu_data *__p = (struct percpu_data *)~(unsigned long)(gendiskp->dkstats); (__typeof__(gendiskp->dkstats))__p->ptrs[(i)]; })))),(((value))),(((sizeof (struct disk_stats))))) : __memset_generic(((({ struct percpu_data *__p = (struct percpu_data *)~(unsigned long)(gendiskp->dkstats); (__typeof__(gendiskp->dkstats))__p->ptrs[(i)]; }))),((value)),((sizeof (struct disk_stats))))));

                }
        }
}
# 161 "include/linux/genhd.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int init_disk_stats(struct gendisk *disk)
{
        disk->dkstats = ((struct disk_stats *)(__alloc_percpu(sizeof(struct disk_stats), __alignof__(struct disk_stats))));
        if (!disk->dkstats)
                return 0;
        return 1;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void free_disk_stats(struct gendisk *disk)
{
        free_percpu(disk->dkstats);
}
# 185 "include/linux/genhd.h"
extern void disk_round_stats(struct gendisk *disk);


extern void add_disk(struct gendisk *disk);
extern void del_gendisk(struct gendisk *gp);
extern void unlink_gendisk(struct gendisk *gp);
extern struct gendisk *get_gendisk(dev_t dev, int *part);

extern void set_device_ro(struct block_device *bdev, int flag);
extern void set_disk_ro(struct gendisk *disk, int flag);


extern void add_disk_randomness(struct gendisk *disk);
extern void rand_initialize_disk(struct gendisk *disk);

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) sector_t get_start_sect(struct block_device *bdev)
{
        return bdev->bd_contains == bdev ? 0 : bdev->bd_part->start_sect;
}
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) sector_t get_capacity(struct gendisk *disk)
{
        return disk->capacity;
}
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void set_capacity(struct gendisk *disk, sector_t size)
{
        disk->capacity = size;
}
# 220 "include/linux/genhd.h"
struct solaris_x86_slice {
        ushort s_tag;
        ushort s_flag;
        unsigned int s_start;
        unsigned int s_size;
};

struct solaris_x86_vtoc {
        unsigned int v_bootinfo[3];
        unsigned int v_sanity;
        unsigned int v_version;
        char v_volume[8];
        ushort v_sectorsz;
        ushort v_nparts;
        unsigned int v_reserved[10];
        struct solaris_x86_slice
                v_slice[8];
        unsigned int timestamp[8];
        char v_asciilabel[128];
};
# 255 "include/linux/genhd.h"
struct bsd_disklabel {
        __u32 d_magic;
        __s16 d_type;
        __s16 d_subtype;
        char d_typename[16];
        char d_packname[16];
        __u32 d_secsize;
        __u32 d_nsectors;
        __u32 d_ntracks;
        __u32 d_ncylinders;
        __u32 d_secpercyl;
        __u32 d_secperunit;
        __u16 d_sparespertrack;
        __u16 d_sparespercyl;
        __u32 d_acylinders;
        __u16 d_rpm;
        __u16 d_interleave;
        __u16 d_trackskew;
        __u16 d_cylskew;
        __u32 d_headswitch;
        __u32 d_trkseek;
        __u32 d_flags;

        __u32 d_drivedata[5];

        __u32 d_spare[5];
        __u32 d_magic2;
        __u16 d_checksum;


        __u16 d_npartitions;
        __u32 d_bbsize;
        __u32 d_sbsize;
        struct bsd_partition {
                __u32 p_size;
                __u32 p_offset;
                __u32 p_fsize;
                __u8 p_fstype;
                __u8 p_frag;
                __u16 p_cpg;
        } d_partitions[8];
};
# 311 "include/linux/genhd.h"
struct unixware_slice {
        __u16 s_label;
        __u16 s_flags;
        __u32 start_sect;
        __u32 nr_sects;
};

struct unixware_disklabel {
        __u32 d_type;
        __u32 d_magic;
        __u32 d_version;
        char d_serial[12];
        __u32 d_ncylinders;
        __u32 d_ntracks;
        __u32 d_nsectors;
        __u32 d_secsize;
        __u32 d_part_start;
        __u32 d_unknown1[12];
        __u32 d_alt_tbl;
        __u32 d_alt_len;
        __u32 d_phys_cyl;
        __u32 d_phys_trk;
        __u32 d_phys_sec;
        __u32 d_phys_bytes;
        __u32 d_unknown2;
        __u32 d_unknown3;
        __u32 d_pad[8];

        struct unixware_vtoc {
                __u32 v_magic;
                __u32 v_version;
                char v_name[8];
                __u16 v_nslices;
                __u16 v_unknown1;
                __u32 v_reserved[10];
                struct unixware_slice
                        v_slice[16];
        } vtoc;

};
# 360 "include/linux/genhd.h"
char *disk_name (struct gendisk *hd, int part, char *buf);

extern int rescan_partitions(struct gendisk *disk, struct block_device *bdev);
extern void add_partition(struct gendisk *, int, sector_t, sector_t);
extern void delete_partition(struct gendisk *, int);

extern struct gendisk *alloc_disk(int minors);
extern struct kobject *get_disk(struct gendisk *disk);
extern void put_disk(struct gendisk *disk);

extern void blk_register_region(dev_t dev, unsigned long range,
                        struct module *module,
                        struct kobject *(*probe)(dev_t, int *, void *),
                        int (*lock)(dev_t, void *),
                        void *data);
extern void blk_unregister_region(dev_t dev, unsigned long range);

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct block_device *bdget_disk(struct gendisk *disk, int index)
{
        return bdget((((disk->major) << 20) | (disk->first_minor)) + index);
}
# 7 "include/linux/blkdev.h" 2




# 1 "include/linux/backing-dev.h" 1
# 16 "include/linux/backing-dev.h"
enum bdi_state {
        BDI_pdflush,
        BDI_write_congested,
        BDI_read_congested,
        BDI_unused,
};

typedef int (congested_fn)(void *, int);

struct backing_dev_info {
        unsigned long ra_pages;
        unsigned long state;
        int memory_backed;
        congested_fn *congested_fn;
        void *congested_data;
        void (*unplug_io_fn)(struct backing_dev_info *, struct page *);
        void *unplug_io_data;
};

extern struct backing_dev_info default_backing_dev_info;
void default_unplug_io_fn(struct backing_dev_info *bdi, struct page *page);

int writeback_acquire(struct backing_dev_info *bdi);
int writeback_in_progress(struct backing_dev_info *bdi);
void writeback_release(struct backing_dev_info *bdi);

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int bdi_congested(struct backing_dev_info *bdi, int bdi_bits)
{
        if (bdi->congested_fn)
                return bdi->congested_fn(bdi->congested_data, bdi_bits);
        return (bdi->state & bdi_bits);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int bdi_read_congested(struct backing_dev_info *bdi)
{
        return bdi_congested(bdi, 1 << BDI_read_congested);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int bdi_write_congested(struct backing_dev_info *bdi)
{
        return bdi_congested(bdi, 1 << BDI_write_congested);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int bdi_rw_congested(struct backing_dev_info *bdi)
{
        return bdi_congested(bdi, (1 << BDI_read_congested)|
                                  (1 << BDI_write_congested));
}
# 12 "include/linux/blkdev.h" 2

# 1 "include/linux/mempool.h" 1
# 9 "include/linux/mempool.h"
typedef void * (mempool_alloc_t)(int gfp_mask, void *pool_data);
typedef void (mempool_free_t)(void *element, void *pool_data);

typedef struct mempool_s {
        spinlock_t lock;
        int min_nr;
        int curr_nr;
        void **elements;

        void *pool_data;
        mempool_alloc_t *alloc;
        mempool_free_t *free;
        wait_queue_head_t wait;
} mempool_t;
extern mempool_t * mempool_create(int min_nr, mempool_alloc_t *alloc_fn,
                                 mempool_free_t *free_fn, void *pool_data);
extern int mempool_resize(mempool_t *pool, int new_min_nr, int gfp_mask);
extern void mempool_destroy(mempool_t *pool);
extern void * mempool_alloc(mempool_t *pool, int gfp_mask);
extern void mempool_free(void *element, mempool_t *pool);





void *mempool_alloc_slab(int gfp_mask, void *pool_data);
void mempool_free_slab(void *element, void *pool_data);
# 14 "include/linux/blkdev.h" 2
# 1 "include/linux/bio.h" 1
# 27 "include/linux/bio.h"
# 1 "include/asm/io.h" 1
# 46 "include/asm/io.h"
# 1 "include/linux/vmalloc.h" 1
# 12 "include/linux/vmalloc.h"
struct vm_struct {
        void *addr;
        unsigned long size;
        unsigned long flags;
        struct page **pages;
        unsigned int nr_pages;
        unsigned long phys_addr;
        struct vm_struct *next;
};




extern void *vmalloc(unsigned long size);
extern void *vmalloc_exec(unsigned long size);
extern void *vmalloc_32(unsigned long size);
extern void *__vmalloc(unsigned long size, int gfp_mask, pgprot_t prot);
extern void vfree(void *addr);

extern void *vmap(struct page **pages, unsigned int count,
                        unsigned long flags, pgprot_t prot);
extern void vunmap(void *addr);




extern struct vm_struct *get_vm_area(unsigned long size, unsigned long flags);
extern struct vm_struct *__get_vm_area(unsigned long size, unsigned long flags,
                                        unsigned long start, unsigned long end);
extern struct vm_struct *remove_vm_area(void *addr);
extern int map_vm_area(struct vm_struct *area, pgprot_t prot,
                        struct page ***pages);
extern void unmap_vm_area(struct vm_struct *area);




extern rwlock_t vmlist_lock;
extern struct vm_struct *vmlist;
# 47 "include/asm/io.h" 2
# 61 "include/asm/io.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned long virt_to_phys(volatile void * address)
{
        return ((unsigned long)(address)-((unsigned long)(0xC0000000UL)));
}
# 79 "include/asm/io.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void * phys_to_virt(unsigned long address)
{
        return ((void *)((unsigned long)(address)+((unsigned long)(0xC0000000UL))));
}






extern void * __ioremap(unsigned long offset, unsigned long size, unsigned long flags);
# 103 "include/asm/io.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void * ioremap (unsigned long offset, unsigned long size)
{
        return __ioremap(offset, size, 0);
}

extern void * ioremap_nocache (unsigned long offset, unsigned long size);
extern void iounmap(void *addr);






extern void *bt_ioremap(unsigned long offset, unsigned long size);
extern void bt_iounmap(void *addr, unsigned long size);
# 202 "include/asm/io.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int check_signature(unsigned long io_addr,
        const unsigned char *signature, int length)
{
        int retval = 0;
        do {
                if ((*(volatile unsigned char *) (io_addr)) != *signature)
                        goto out;
                io_addr++;
                signature++;
                length--;
        } while (length);
        retval = 1;
out:
        return retval;
}
# 232 "include/asm/io.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int isa_check_signature(unsigned long io_addr,
        const unsigned char *signature, int length)
{
        int retval = 0;
        do {
                if ((*(volatile unsigned char *) (((char *)(((unsigned long)(0xC0000000UL)))) + (io_addr))) != *signature)
                        goto out;
                io_addr++;
                signature++;
                length--;
        } while (length);
        retval = 1;
out:
        return retval;
}
# 286 "include/asm/io.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void slow_down_io(void) {
        __asm__ __volatile__(
                "outb %%al,$0x80;"



                : : );
}
# 363 "include/asm/io.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void outb_local(unsigned char value, int port) { __asm__ __volatile__("out" "b" " %" "b" "0, %w1" : : "a"(value), "Nd"(port)); } static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned char inb_local(int port) { unsigned char value; __asm__ __volatile__("in" "b" " %w1, %" "b" "0" : "=a"(value) : "Nd"(port)); return value; } static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void outb_local_p(unsigned char value, int port) { outb_local(value, port); slow_down_io(); } static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned char inb_local_p(int port) { unsigned char value = inb_local(port); slow_down_io(); return value; } static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void outb(unsigned char value, int port) { outb_local(value, port); } static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned char inb(int port) { return inb_local(port); } static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void outb_p(unsigned char value, int port) { outb(value, port); slow_down_io(); } static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned char inb_p(int port) { unsigned char value = inb(port); slow_down_io(); return value; } static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void outsb(int port, const void *addr, unsigned long count) { __asm__ __volatile__("rep; outs" "b" : "+S"(addr), "+c"(count) : "d"(port)); } static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void insb(int port, void *addr, unsigned long count) { __asm__ __volatile__("rep; ins" "b" : "+D"(addr), "+c"(count) : "d"(port)); }
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void outw_local(unsigned short value, int port) { __asm__ __volatile__("out" "w" " %" "w" "0, %w1" : : "a"(value), "Nd"(port)); } static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned short inw_local(int port) { unsigned short value; __asm__ __volatile__("in" "w" " %w1, %" "w" "0" : "=a"(value) : "Nd"(port)); return value; } static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void outw_local_p(unsigned short value, int port) { outw_local(value, port); slow_down_io(); } static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned short inw_local_p(int port) { unsigned short value = inw_local(port); slow_down_io(); return value; } static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void outw(unsigned short value, int port) { outw_local(value, port); } static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned short inw(int port) { return inw_local(port); } static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void outw_p(unsigned short value, int port) { outw(value, port); slow_down_io(); } static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned short inw_p(int port) { unsigned short value = inw(port); slow_down_io(); return value; } static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void outsw(int port, const void *addr, unsigned long count) { __asm__ __volatile__("rep; outs" "w" : "+S"(addr), "+c"(count) : "d"(port)); } static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void insw(int port, void *addr, unsigned long count) { __asm__ __volatile__("rep; ins" "w" : "+D"(addr), "+c"(count) : "d"(port)); }
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void outl_local(unsigned int value, int port) { __asm__ __volatile__("out" "l" " %" "" "0, %w1" : : "a"(value), "Nd"(port)); } static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned int inl_local(int port) { unsigned int value; __asm__ __volatile__("in" "l" " %w1, %" "" "0" : "=a"(value) : "Nd"(port)); return value; } static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void outl_local_p(unsigned int value, int port) { outl_local(value, port); slow_down_io(); } static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned int inl_local_p(int port) { unsigned int value = inl_local(port); slow_down_io(); return value; } static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void outl(unsigned int value, int port) { outl_local(value, port); } static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned int inl(int port) { return inl_local(port); } static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void outl_p(unsigned int value, int port) { outl(value, port); slow_down_io(); } static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned int inl_p(int port) { unsigned int value = inl(port); slow_down_io(); return value; } static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void outsl(int port, const void *addr, unsigned long count) { __asm__ __volatile__("rep; outs" "l" : "+S"(addr), "+c"(count) : "d"(port)); } static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void insl(int port, void *addr, unsigned long count) { __asm__ __volatile__("rep; ins" "l" : "+D"(addr), "+c"(count) : "d"(port)); }
# 28 "include/linux/bio.h" 2
# 56 "include/linux/bio.h"
struct bio_vec {
        struct page *bv_page;
        unsigned int bv_len;
        unsigned int bv_offset;
};

struct bio;
typedef int (bio_end_io_t) (struct bio *, unsigned int, int);
typedef void (bio_destructor_t) (struct bio *);





struct bio {
        sector_t bi_sector;
        struct bio *bi_next;
        struct block_device *bi_bdev;
        unsigned long bi_flags;
        unsigned long bi_rw;



        unsigned short bi_vcnt;
        unsigned short bi_idx;




        unsigned short bi_phys_segments;




        unsigned short bi_hw_segments;

        unsigned int bi_size;






        unsigned int bi_hw_front_size;
        unsigned int bi_hw_back_size;

        unsigned int bi_max_vecs;

        struct bio_vec *bi_io_vec;

        bio_end_io_t *bi_end_io;
        atomic_t bi_cnt;

        void *bi_private;

        bio_destructor_t *bi_destructor;
};
# 240 "include/linux/bio.h"
struct bio_pair {
        struct bio bio1, bio2;
        struct bio_vec bv1, bv2;
        atomic_t cnt;
        int error;
};
extern struct bio_pair *bio_split(struct bio *bi, mempool_t *pool,
                                  int first_sectors);
extern mempool_t *bio_split_pool;
extern void bio_pair_release(struct bio_pair *dbio);

extern struct bio *bio_alloc(int, int);
extern void bio_put(struct bio *);

extern void bio_endio(struct bio *, unsigned int, int);
struct request_queue;
extern int bio_phys_segments(struct request_queue *, struct bio *);
extern int bio_hw_segments(struct request_queue *, struct bio *);

extern void __bio_clone(struct bio *, struct bio *);
extern struct bio *bio_clone(struct bio *, int);

extern void bio_init(struct bio *);

extern int bio_add_page(struct bio *, struct page *, unsigned int,unsigned int);
extern int bio_get_nr_vecs(struct block_device *);
extern struct bio *bio_map_user(struct request_queue *, struct block_device *,
                                unsigned long, unsigned int, int);
extern void bio_unmap_user(struct bio *);
extern void bio_set_pages_dirty(struct bio *bio);
extern void bio_check_pages_dirty(struct bio *bio);
extern struct bio *bio_copy_user(struct request_queue *, unsigned long, unsigned int, int);
extern int bio_uncopy_user(struct bio *);
# 282 "include/linux/bio.h"
extern __inline__ __attribute__((always_inline)) __attribute__((always_inline)) char *bvec_kmap_irq(struct bio_vec *bvec, unsigned long *flags)
{
        unsigned long addr;





        __asm__ __volatile__("pushfl ; popl %0 ; cli":"=g" (*flags): :"memory");
        addr = (unsigned long) kmap_atomic(bvec->bv_page, KM_BIO_SRC_IRQ);

        do { if (__builtin_expect(!!((addr & ~(~((1UL << 12)-1)))!=0), 0)) __asm__ __volatile__( "ud2\n" "\t.word %c0\n" "\t.long %c1\n" : : "i" (293), "i" ("include/linux/bio.h")); } while(0);

        return (char *) addr + bvec->bv_offset;
}

extern __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void bvec_kunmap_irq(char *buffer, unsigned long *flags)
{
        unsigned long ptr = (unsigned long) buffer & (~((1UL << 12)-1));

        kunmap_atomic((void *) ptr, KM_BIO_SRC_IRQ);
        do { ({ unsigned long __dummy; typeof(*flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); __asm__ __volatile__("pushl %0 ; popfl": :"g" (*flags):"memory", "cc"); } while (0);
}






extern __inline__ __attribute__((always_inline)) __attribute__((always_inline)) char *__bio_kmap_irq(struct bio *bio, unsigned short idx,
                                   unsigned long *flags)
{
        return bvec_kmap_irq((&((bio)->bi_io_vec[(idx)])), flags);
}
# 15 "include/linux/blkdev.h" 2



# 1 "include/asm/scatterlist.h" 1



struct scatterlist {
    struct page *page;
    unsigned int offset;
    dma_addr_t dma_address;
    unsigned int length;
};
# 19 "include/linux/blkdev.h" 2

struct request_queue;
typedef struct request_queue request_queue_t;
struct elevator_s;
typedef struct elevator_s elevator_t;
struct request_pm_state;







struct as_io_context {
        spinlock_t lock;

        void (*dtor)(struct as_io_context *aic);
        void (*exit)(struct as_io_context *aic);

        unsigned long state;
        atomic_t nr_queued;
        atomic_t nr_dispatched;



        unsigned long last_end_request;
        unsigned long ttime_total;
        unsigned long ttime_samples;
        unsigned long ttime_mean;

        unsigned int seek_samples;
        sector_t last_request_pos;
        u64 seek_total;
        sector_t seek_mean;
};






struct io_context {
        atomic_t refcount;
        pid_t pid;




        unsigned long last_waited;
        int nr_batch_requests;

        struct as_io_context *aic;
};

void put_io_context(struct io_context *ioc);
void exit_io_context(void);
struct io_context *get_io_context(int gfp_flags);
void copy_io_context(struct io_context **pdst, struct io_context **psrc);
void swap_io_context(struct io_context **ioc1, struct io_context **ioc2);

struct request_list {
        int count[2];
        mempool_t *rq_pool;
        wait_queue_head_t wait[2];
};






struct request {
        struct list_head queuelist;


        unsigned long flags;





        sector_t sector;
        unsigned long nr_sectors;

        unsigned int current_nr_sectors;

        sector_t hard_sector;
        unsigned long hard_nr_sectors;

        unsigned int hard_cur_sectors;


        unsigned short nr_cbio_segments;

        unsigned long nr_cbio_sectors;

        struct bio *cbio;
        struct bio *bio;
        struct bio *biotail;

        void *elevator_private;

        int rq_status;
        struct gendisk *rq_disk;
        int errors;
        unsigned long start_time;




        unsigned short nr_phys_segments;






        unsigned short nr_hw_segments;

        int tag;
        char *buffer;

        int ref_count;
        request_queue_t *q;
        struct request_list *rl;

        struct completion *waiting;
        void *special;




        unsigned int cmd_len;
        unsigned char cmd[16];

        unsigned int data_len;
        void *data;

        unsigned int sense_len;
        void *sense;

        unsigned int timeout;




        struct request_pm_state *pm;
};




enum rq_flag_bits {
        __REQ_RW,
        __REQ_FAILFAST,
        __REQ_SOFTBARRIER,
        __REQ_HARDBARRIER,
        __REQ_CMD,
        __REQ_NOMERGE,
        __REQ_STARTED,
        __REQ_DONTPREP,
        __REQ_QUEUED,



        __REQ_PC,
        __REQ_BLOCK_PC,
        __REQ_SENSE,

        __REQ_FAILED,
        __REQ_QUIET,
        __REQ_SPECIAL,
        __REQ_DRIVE_CMD,
        __REQ_DRIVE_TASK,
        __REQ_DRIVE_TASKFILE,
        __REQ_PREEMPT,
        __REQ_PM_SUSPEND,
        __REQ_PM_RESUME,
        __REQ_PM_SHUTDOWN,
        __REQ_NR_BITS,
};
# 228 "include/linux/blkdev.h"
struct request_pm_state
{

        int pm_step;

        u32 pm_state;
        void* data;
};

# 1 "include/linux/elevator.h" 1



typedef int (elevator_merge_fn) (request_queue_t *, struct request **,
                                 struct bio *);

typedef void (elevator_merge_req_fn) (request_queue_t *, struct request *, struct request *);

typedef void (elevator_merged_fn) (request_queue_t *, struct request *);

typedef struct request *(elevator_next_req_fn) (request_queue_t *);

typedef void (elevator_add_req_fn) (request_queue_t *, struct request *, int);
typedef int (elevator_queue_empty_fn) (request_queue_t *);
typedef void (elevator_remove_req_fn) (request_queue_t *, struct request *);
typedef void (elevator_requeue_req_fn) (request_queue_t *, struct request *);
typedef struct request *(elevator_request_list_fn) (request_queue_t *, struct request *);
typedef void (elevator_completed_req_fn) (request_queue_t *, struct request *);
typedef int (elevator_may_queue_fn) (request_queue_t *, int);

typedef int (elevator_set_req_fn) (request_queue_t *, struct request *, int);
typedef void (elevator_put_req_fn) (request_queue_t *, struct request *);

typedef int (elevator_init_fn) (request_queue_t *, elevator_t *);
typedef void (elevator_exit_fn) (request_queue_t *, elevator_t *);

struct elevator_s
{
        elevator_merge_fn *elevator_merge_fn;
        elevator_merged_fn *elevator_merged_fn;
        elevator_merge_req_fn *elevator_merge_req_fn;

        elevator_next_req_fn *elevator_next_req_fn;
        elevator_add_req_fn *elevator_add_req_fn;
        elevator_remove_req_fn *elevator_remove_req_fn;
        elevator_requeue_req_fn *elevator_requeue_req_fn;

        elevator_queue_empty_fn *elevator_queue_empty_fn;
        elevator_completed_req_fn *elevator_completed_req_fn;

        elevator_request_list_fn *elevator_former_req_fn;
        elevator_request_list_fn *elevator_latter_req_fn;

        elevator_set_req_fn *elevator_set_req_fn;
        elevator_put_req_fn *elevator_put_req_fn;

        elevator_may_queue_fn *elevator_may_queue_fn;

        elevator_init_fn *elevator_init_fn;
        elevator_exit_fn *elevator_exit_fn;

        void *elevator_data;

        struct kobject kobj;
        struct kobj_type *elevator_ktype;
        const char *elevator_name;
};




extern void elv_add_request(request_queue_t *, struct request *, int, int);
extern void __elv_add_request(request_queue_t *, struct request *, int, int);
extern int elv_merge(request_queue_t *, struct request **, struct bio *);
extern void elv_merge_requests(request_queue_t *, struct request *,
                               struct request *);
extern void elv_merged_request(request_queue_t *, struct request *);
extern void elv_remove_request(request_queue_t *, struct request *);
extern void elv_requeue_request(request_queue_t *, struct request *);
extern int elv_queue_empty(request_queue_t *);
extern struct request *elv_next_request(struct request_queue *q);
extern struct request *elv_former_request(request_queue_t *, struct request *);
extern struct request *elv_latter_request(request_queue_t *, struct request *);
extern int elv_register_queue(request_queue_t *q);
extern void elv_unregister_queue(request_queue_t *q);
extern int elv_may_queue(request_queue_t *, int);
extern void elv_completed_request(request_queue_t *, struct request *);
extern int elv_set_request(request_queue_t *, struct request *, int);
extern void elv_put_request(request_queue_t *, struct request *);




extern elevator_t elevator_noop;





extern elevator_t iosched_deadline;




extern elevator_t iosched_as;




extern elevator_t iosched_cfq;

extern int elevator_init(request_queue_t *, elevator_t *);
extern void elevator_exit(request_queue_t *);
extern int elv_rq_merge_ok(struct request *, struct bio *);
extern int elv_try_merge(struct request *, struct bio *);
extern int elv_try_last_merge(request_queue_t *, struct bio *);
# 238 "include/linux/blkdev.h" 2

typedef int (merge_request_fn) (request_queue_t *, struct request *,
                                struct bio *);
typedef int (merge_requests_fn) (request_queue_t *, struct request *,
                                 struct request *);
typedef void (request_fn_proc) (request_queue_t *q);
typedef int (make_request_fn) (request_queue_t *q, struct bio *bio);
typedef int (prep_rq_fn) (request_queue_t *, struct request *);
typedef void (unplug_fn) (request_queue_t *);

struct bio_vec;
typedef int (merge_bvec_fn) (request_queue_t *, struct bio *, struct bio_vec *);
typedef void (activity_fn) (void *data, int rw);

enum blk_queue_state {
        Queue_down,
        Queue_up,
};




struct blk_queue_tag {
        struct request **tag_index;
        unsigned long *tag_map;
        struct list_head busy_list;
        int busy;
        int max_depth;
        int real_max_depth;
        atomic_t refcnt;
};

struct request_queue
{



        struct list_head queue_head;
        struct request *last_merge;
        elevator_t elevator;




        struct request_list rq;

        request_fn_proc *request_fn;
        merge_request_fn *back_merge_fn;
        merge_request_fn *front_merge_fn;
        merge_requests_fn *merge_requests_fn;
        make_request_fn *make_request_fn;
        prep_rq_fn *prep_rq_fn;
        unplug_fn *unplug_fn;
        merge_bvec_fn *merge_bvec_fn;
        activity_fn *activity_fn;




        struct timer_list unplug_timer;
        int unplug_thresh;
        unsigned long unplug_delay;
        struct work_struct unplug_work;

        struct backing_dev_info backing_dev_info;





        void *queuedata;

        void *activity_data;




        unsigned long bounce_pfn;
        int bounce_gfp;




        unsigned long queue_flags;




        spinlock_t *queue_lock;




        struct kobject kobj;




        unsigned long nr_requests;
        unsigned int nr_congestion_on;
        unsigned int nr_congestion_off;

        unsigned short max_sectors;
        unsigned short max_phys_segments;
        unsigned short max_hw_segments;
        unsigned short hardsect_size;
        unsigned int max_segment_size;

        unsigned long seg_boundary_mask;
        unsigned int dma_alignment;

        struct blk_queue_tag *queue_tags;

        atomic_t refcnt;

        unsigned int in_flight;




        unsigned int sg_timeout;
        unsigned int sg_reserved_size;
};
# 397 "include/linux/blkdev.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int blk_queue_full(struct request_queue *q, int rw)
{
        if (rw == 0)
                return (__builtin_constant_p(3) ? constant_test_bit((3),(&q->queue_flags)) : variable_test_bit((3),(&q->queue_flags)));
        return (__builtin_constant_p(4) ? constant_test_bit((4),(&q->queue_flags)) : variable_test_bit((4),(&q->queue_flags)));
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void blk_set_queue_full(struct request_queue *q, int rw)
{
        if (rw == 0)
                set_bit(3, &q->queue_flags);
        else
                set_bit(4, &q->queue_flags);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void blk_clear_queue_full(struct request_queue *q, int rw)
{
        if (rw == 0)
                clear_bit(3, &q->queue_flags);
        else
                clear_bit(4, &q->queue_flags);
}
# 451 "include/linux/blkdev.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) char * rq_map_buffer(struct request *rq, unsigned long *flags)
{
        return (__bio_kmap_irq(rq->cbio, ((rq)->cbio->bi_vcnt - (rq)->nr_cbio_segments), flags)
                + (((rq)->hard_cur_sectors - (rq)->current_nr_sectors) << 9));
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void rq_unmap_buffer(char *buffer, unsigned long *flags)
{
        bvec_kunmap_irq(buffer, flags);
}
# 469 "include/linux/blkdev.h"
extern unsigned long blk_max_low_pfn, blk_max_pfn;
# 483 "include/linux/blkdev.h"
extern int init_emergency_isa_pool(void);
extern void blk_queue_bounce(request_queue_t *q, struct bio **bio);
# 499 "include/linux/blkdev.h"
struct sec_size {
        unsigned block_size;
        unsigned block_size_bits;
};

extern int blk_register_queue(struct gendisk *disk);
extern void blk_unregister_queue(struct gendisk *disk);
extern void register_disk(struct gendisk *dev);
extern void generic_make_request(struct bio *bio);
extern void blk_put_request(struct request *);
extern void blk_attempt_remerge(request_queue_t *, struct request *);
extern void __blk_attempt_remerge(request_queue_t *, struct request *);
extern struct request *blk_get_request(request_queue_t *, int, int);
extern void blk_put_request(struct request *);
extern void blk_insert_request(request_queue_t *, struct request *, int, void *, int);
extern void blk_requeue_request(request_queue_t *, struct request *);
extern void blk_plug_device(request_queue_t *);
extern int blk_remove_plug(request_queue_t *);
extern void blk_recount_segments(request_queue_t *, struct bio *);
extern int blk_phys_contig_segment(request_queue_t *q, struct bio *, struct bio *);
extern int blk_hw_contig_segment(request_queue_t *q, struct bio *, struct bio *);
extern int scsi_cmd_ioctl(struct file *, struct gendisk *, unsigned int, void *);
extern void blk_start_queue(request_queue_t *q);
extern void blk_stop_queue(request_queue_t *q);
extern void __blk_stop_queue(request_queue_t *q);
extern void blk_run_queue(request_queue_t *);
extern void blk_queue_activity_fn(request_queue_t *, activity_fn *, void *);
extern struct request *blk_rq_map_user(request_queue_t *, int, void *, unsigned int);
extern int blk_rq_unmap_user(struct request *, struct bio *, unsigned int);
extern int blk_execute_rq(request_queue_t *, struct gendisk *, struct request *);

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) request_queue_t *bdev_get_queue(struct block_device *bdev)
{
        return bdev->bd_disk->queue;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void blk_run_backing_dev(struct backing_dev_info *bdi,
                                       struct page *page)
{
        if (bdi && bdi->unplug_io_fn)
                bdi->unplug_io_fn(bdi, page);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void blk_run_address_space(struct address_space *mapping)
{
        if (mapping)
                blk_run_backing_dev(mapping->backing_dev_info, ((void *)0));
}
# 557 "include/linux/blkdev.h"
extern int end_that_request_first(struct request *, int, int);
extern int end_that_request_chunk(struct request *, int, int);
extern void end_that_request_last(struct request *);
extern int process_that_request_first(struct request *, unsigned int);
extern void end_request(struct request *req, int uptodate);

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void blkdev_dequeue_request(struct request *req)
{
        do { if (__builtin_expect(!!((list_empty(&req->queuelist))!=0), 0)) __asm__ __volatile__( "ud2\n" "\t.word %c0\n" "\t.long %c1\n" : : "i" (565), "i" ("include/linux/blkdev.h")); } while(0);

        list_del_init(&req->queuelist);

        if (req->rl)
                elv_remove_request(req->q, req);
}




extern request_queue_t *blk_init_queue(request_fn_proc *, spinlock_t *);
extern void blk_cleanup_queue(request_queue_t *);
extern void blk_queue_make_request(request_queue_t *, make_request_fn *);
extern void blk_queue_bounce_limit(request_queue_t *, u64);
extern void blk_queue_max_sectors(request_queue_t *, unsigned short);
extern void blk_queue_max_phys_segments(request_queue_t *, unsigned short);
extern void blk_queue_max_hw_segments(request_queue_t *, unsigned short);
extern void blk_queue_max_segment_size(request_queue_t *, unsigned int);
extern void blk_queue_hardsect_size(request_queue_t *, unsigned short);
extern void blk_queue_stack_limits(request_queue_t *t, request_queue_t *b);
extern void blk_queue_segment_boundary(request_queue_t *, unsigned long);
extern void blk_queue_prep_rq(request_queue_t *, prep_rq_fn *pfn);
extern void blk_queue_merge_bvec(request_queue_t *, merge_bvec_fn *);
extern void blk_queue_dma_alignment(request_queue_t *, int);
extern struct backing_dev_info *blk_get_backing_dev_info(struct block_device *bdev);

extern int blk_rq_map_sg(request_queue_t *, struct request *, struct scatterlist *);
extern void blk_dump_rq_flags(struct request *, char *);
extern void generic_unplug_device(request_queue_t *);
extern void __generic_unplug_device(request_queue_t *);
extern long nr_blockdev_pages(void);

int blk_get_queue(request_queue_t *);
request_queue_t *blk_alloc_queue(int);
# 608 "include/linux/blkdev.h"
extern int blk_queue_start_tag(request_queue_t *, struct request *);
extern struct request *blk_queue_find_tag(request_queue_t *, int);
extern void blk_queue_end_tag(request_queue_t *, struct request *);
extern int blk_queue_init_tags(request_queue_t *, int, struct blk_queue_tag *);
extern void blk_queue_free_tags(request_queue_t *);
extern int blk_queue_resize_tags(request_queue_t *, int);
extern void blk_queue_invalidate_tags(request_queue_t *);
extern long blk_congestion_wait(int rw, long timeout);

extern void blk_rq_bio_prep(request_queue_t *, struct request *, struct bio *);
extern void blk_rq_prep_restart(struct request *);
# 628 "include/linux/blkdev.h"
extern void drive_stat_acct(struct request *, int, int);

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int queue_hardsect_size(request_queue_t *q)
{
        int retval = 512;

        if (q && q->hardsect_size)
                retval = q->hardsect_size;

        return retval;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int bdev_hardsect_size(struct block_device *bdev)
{
        return queue_hardsect_size(bdev_get_queue(bdev));
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int queue_dma_alignment(request_queue_t *q)
{
        int retval = 511;

        if (q && q->dma_alignment)
                retval = q->dma_alignment;

        return retval;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int bdev_dma_aligment(struct block_device *bdev)
{
        return queue_dma_alignment(bdev_get_queue(bdev));
}





static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned int blksize_bits(unsigned int size)
{
        unsigned int bits = 8;
        do {
                bits++;
                size >>= 1;
        } while (size > 256);
        return bits;
}

extern __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned int block_size(struct block_device *bdev)
{
        return bdev->bd_block_size;
}

typedef struct {struct page *v;} Sector;

unsigned char *read_dev_sector(struct block_device *, sector_t, Sector *);

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void put_dev_sector(Sector p)
{
        put_page(p.v);
}

struct work_struct;
int kblockd_schedule_work(struct work_struct *work);
void kblockd_flush(void);
# 29 "mm/filemap.c" 2
# 1 "include/linux/security.h" 1
# 26 "include/linux/security.h"
# 1 "include/linux/binfmts.h" 1





struct pt_regs;
# 23 "include/linux/binfmts.h"
struct linux_binprm{
        char buf[128];
        struct page *page[32];
        struct mm_struct *mm;
        unsigned long p;
        int sh_bang;
        struct file * file;
        int e_uid, e_gid;
        kernel_cap_t cap_inheritable, cap_permitted, cap_effective;
        void *security;
        int argc, envc;
        char * filename;
        char * interp;


        unsigned interp_flags;
        unsigned interp_data;
        unsigned long loader, exec;
};
# 55 "include/linux/binfmts.h"
struct linux_binfmt {
        struct linux_binfmt * next;
        struct module *module;
        int (*load_binary)(struct linux_binprm *, struct pt_regs * regs);
        int (*load_shlib)(struct file *);
        int (*core_dump)(long signr, struct pt_regs * regs, struct file * file);
        unsigned long min_coredump;
};

extern int register_binfmt(struct linux_binfmt *);
extern int unregister_binfmt(struct linux_binfmt *);

extern int prepare_binprm(struct linux_binprm *);
extern void remove_arg_zero(struct linux_binprm *);
extern int search_binary_handler(struct linux_binprm *,struct pt_regs *);
extern int flush_old_exec(struct linux_binprm * bprm);






extern int setup_arg_pages(struct linux_binprm * bprm, int executable_stack);
extern int copy_strings(int argc,char * * argv,struct linux_binprm *bprm);
extern int copy_strings_kernel(int argc,char ** argv,struct linux_binprm *bprm);
extern void compute_creds(struct linux_binprm *binprm);
extern int do_coredump(long signr, int exit_code, struct pt_regs * regs);
extern int set_binfmt(struct linux_binfmt *new);
# 27 "include/linux/security.h" 2



# 1 "include/linux/sysctl.h" 1
# 26 "include/linux/sysctl.h"
struct file;






struct __sysctl_args {
        int *name;
        int nlen;
        void *oldval;
        size_t *oldlenp;
        void *newval;
        size_t newlen;
        unsigned long __unused[4];
};
# 53 "include/linux/sysctl.h"
enum
{
        CTL_KERN=1,
        CTL_VM=2,
        CTL_NET=3,
        CTL_PROC=4,
        CTL_FS=5,
        CTL_DEBUG=6,
        CTL_DEV=7,
        CTL_BUS=8,
        CTL_ABI=9,
        CTL_CPU=10
};


enum
{
        CTL_BUS_ISA=1
};


enum
{
        KERN_OSTYPE=1,
        KERN_OSRELEASE=2,
        KERN_OSREV=3,
        KERN_VERSION=4,
        KERN_SECUREMASK=5,
        KERN_PROF=6,
        KERN_NODENAME=7,
        KERN_DOMAINNAME=8,

        KERN_CAP_BSET=14,
        KERN_PANIC=15,
        KERN_REALROOTDEV=16,

        KERN_SPARC_REBOOT=21,
        KERN_CTLALTDEL=22,
        KERN_PRINTK=23,
        KERN_NAMETRANS=24,
        KERN_PPC_HTABRECLAIM=25,
        KERN_PPC_ZEROPAGED=26,
        KERN_PPC_POWERSAVE_NAP=27,
        KERN_MODPROBE=28,
        KERN_SG_BIG_BUFF=29,
        KERN_ACCT=30,
        KERN_PPC_L2CR=31,

        KERN_RTSIGNR=32,
        KERN_RTSIGMAX=33,

        KERN_SHMMAX=34,
        KERN_MSGMAX=35,
        KERN_MSGMNB=36,
        KERN_MSGPOOL=37,
        KERN_SYSRQ=38,
        KERN_MAX_THREADS=39,
        KERN_RANDOM=40,
        KERN_SHMALL=41,
        KERN_MSGMNI=42,
        KERN_SEM=43,
        KERN_SPARC_STOP_A=44,
        KERN_SHMMNI=45,
        KERN_OVERFLOWUID=46,
        KERN_OVERFLOWGID=47,
        KERN_SHMPATH=48,
        KERN_HOTPLUG=49,
        KERN_IEEE_EMULATION_WARNINGS=50,
        KERN_S390_USER_DEBUG_LOGGING=51,
        KERN_CORE_USES_PID=52,
        KERN_TAINTED=53,
        KERN_CADPID=54,
        KERN_PIDMAX=55,
        KERN_CORE_PATTERN=56,
        KERN_PANIC_ON_OOPS=57,
        KERN_HPPA_PWRSW=58,
        KERN_HPPA_UNALIGNED=59,
        KERN_PRINTK_RATELIMIT=60,
        KERN_PRINTK_RATELIMIT_BURST=61,
        KERN_PTY=62,
        KERN_NGROUPS_MAX=63,
        KERN_SPARC_SCONS_PWROFF=64,
        KERN_HZ_TIMER=65,
};



enum
{
        VM_UNUSED1=1,
        VM_UNUSED2=2,
        VM_UNUSED3=3,
        VM_UNUSED4=4,
        VM_OVERCOMMIT_MEMORY=5,
        VM_UNUSED5=6,
        VM_UNUSED7=7,
        VM_UNUSED8=8,
        VM_UNUSED9=9,
        VM_PAGE_CLUSTER=10,
        VM_DIRTY_BACKGROUND=11,
        VM_DIRTY_RATIO=12,
        VM_DIRTY_WB_CS=13,
        VM_DIRTY_EXPIRE_CS=14,
        VM_NR_PDFLUSH_THREADS=15,
        VM_OVERCOMMIT_RATIO=16,
        VM_PAGEBUF=17,
        VM_HUGETLB_PAGES=18,
        VM_SWAPPINESS=19,
        VM_LOWER_ZONE_PROTECTION=20,
        VM_MIN_FREE_KBYTES=21,
        VM_MAX_MAP_COUNT=22,
        VM_LAPTOP_MODE=23,
        VM_BLOCK_DUMP=24,
        VM_HUGETLB_GROUP=25,
        VM_VFS_CACHE_PRESSURE=26,
};



enum
{
        NET_CORE=1,
        NET_ETHER=2,
        NET_802=3,
        NET_UNIX=4,
        NET_IPV4=5,
        NET_IPX=6,
        NET_ATALK=7,
        NET_NETROM=8,
        NET_AX25=9,
        NET_BRIDGE=10,
        NET_ROSE=11,
        NET_IPV6=12,
        NET_X25=13,
        NET_TR=14,
        NET_DECNET=15,
        NET_ECONET=16,
        NET_SCTP=17,
};


enum
{
        RANDOM_POOLSIZE=1,
        RANDOM_ENTROPY_COUNT=2,
        RANDOM_READ_THRESH=3,
        RANDOM_WRITE_THRESH=4,
        RANDOM_BOOT_ID=5,
        RANDOM_UUID=6
};


enum
{
        PTY_MAX=1,
        PTY_NR=2
};


enum
{
        BUS_ISA_MEM_BASE=1,
        BUS_ISA_PORT_BASE=2,
        BUS_ISA_PORT_SHIFT=3
};


enum
{
        NET_CORE_WMEM_MAX=1,
        NET_CORE_RMEM_MAX=2,
        NET_CORE_WMEM_DEFAULT=3,
        NET_CORE_RMEM_DEFAULT=4,

        NET_CORE_MAX_BACKLOG=6,
        NET_CORE_FASTROUTE=7,
        NET_CORE_MSG_COST=8,
        NET_CORE_MSG_BURST=9,
        NET_CORE_OPTMEM_MAX=10,
        NET_CORE_HOT_LIST_LENGTH=11,
        NET_CORE_DIVERT_VERSION=12,
        NET_CORE_NO_CONG_THRESH=13,
        NET_CORE_NO_CONG=14,
        NET_CORE_LO_CONG=15,
        NET_CORE_MOD_CONG=16,
        NET_CORE_DEV_WEIGHT=17,
        NET_CORE_SOMAXCONN=18,
};







enum
{
        NET_UNIX_DESTROY_DELAY=1,
        NET_UNIX_DELETE_DELAY=2,
        NET_UNIX_MAX_DGRAM_QLEN=3,
};


enum
{

        NET_IPV4_FORWARD=8,
        NET_IPV4_DYNADDR=9,

        NET_IPV4_CONF=16,
        NET_IPV4_NEIGH=17,
        NET_IPV4_ROUTE=18,
        NET_IPV4_FIB_HASH=19,
        NET_IPV4_NETFILTER=20,

        NET_IPV4_TCP_TIMESTAMPS=33,
        NET_IPV4_TCP_WINDOW_SCALING=34,
        NET_IPV4_TCP_SACK=35,
        NET_IPV4_TCP_RETRANS_COLLAPSE=36,
        NET_IPV4_DEFAULT_TTL=37,
        NET_IPV4_AUTOCONFIG=38,
        NET_IPV4_NO_PMTU_DISC=39,
        NET_IPV4_TCP_SYN_RETRIES=40,
        NET_IPV4_IPFRAG_HIGH_THRESH=41,
        NET_IPV4_IPFRAG_LOW_THRESH=42,
        NET_IPV4_IPFRAG_TIME=43,
        NET_IPV4_TCP_MAX_KA_PROBES=44,
        NET_IPV4_TCP_KEEPALIVE_TIME=45,
        NET_IPV4_TCP_KEEPALIVE_PROBES=46,
        NET_IPV4_TCP_RETRIES1=47,
        NET_IPV4_TCP_RETRIES2=48,
        NET_IPV4_TCP_FIN_TIMEOUT=49,
        NET_IPV4_IP_MASQ_DEBUG=50,
        NET_TCP_SYNCOOKIES=51,
        NET_TCP_STDURG=52,
        NET_TCP_RFC1337=53,
        NET_TCP_SYN_TAILDROP=54,
        NET_TCP_MAX_SYN_BACKLOG=55,
        NET_IPV4_LOCAL_PORT_RANGE=56,
        NET_IPV4_ICMP_ECHO_IGNORE_ALL=57,
        NET_IPV4_ICMP_ECHO_IGNORE_BROADCASTS=58,
        NET_IPV4_ICMP_SOURCEQUENCH_RATE=59,
        NET_IPV4_ICMP_DESTUNREACH_RATE=60,
        NET_IPV4_ICMP_TIMEEXCEED_RATE=61,
        NET_IPV4_ICMP_PARAMPROB_RATE=62,
        NET_IPV4_ICMP_ECHOREPLY_RATE=63,
        NET_IPV4_ICMP_IGNORE_BOGUS_ERROR_RESPONSES=64,
        NET_IPV4_IGMP_MAX_MEMBERSHIPS=65,
        NET_TCP_TW_RECYCLE=66,
        NET_IPV4_ALWAYS_DEFRAG=67,
        NET_IPV4_TCP_KEEPALIVE_INTVL=68,
        NET_IPV4_INET_PEER_THRESHOLD=69,
        NET_IPV4_INET_PEER_MINTTL=70,
        NET_IPV4_INET_PEER_MAXTTL=71,
        NET_IPV4_INET_PEER_GC_MINTIME=72,
        NET_IPV4_INET_PEER_GC_MAXTIME=73,
        NET_TCP_ORPHAN_RETRIES=74,
        NET_TCP_ABORT_ON_OVERFLOW=75,
        NET_TCP_SYNACK_RETRIES=76,
        NET_TCP_MAX_ORPHANS=77,
        NET_TCP_MAX_TW_BUCKETS=78,
        NET_TCP_FACK=79,
        NET_TCP_REORDERING=80,
        NET_TCP_ECN=81,
        NET_TCP_DSACK=82,
        NET_TCP_MEM=83,
        NET_TCP_WMEM=84,
        NET_TCP_RMEM=85,
        NET_TCP_APP_WIN=86,
        NET_TCP_ADV_WIN_SCALE=87,
        NET_IPV4_NONLOCAL_BIND=88,
        NET_IPV4_ICMP_RATELIMIT=89,
        NET_IPV4_ICMP_RATEMASK=90,
        NET_TCP_TW_REUSE=91,
        NET_TCP_FRTO=92,
        NET_TCP_LOW_LATENCY=93,
        NET_IPV4_IPFRAG_SECRET_INTERVAL=94,
        NET_TCP_WESTWOOD=95,
        NET_IPV4_IGMP_MAX_MSF=96,
        NET_TCP_NO_METRICS_SAVE=97,
        NET_TCP_VEGAS=98,
        NET_TCP_VEGAS_ALPHA=99,
        NET_TCP_VEGAS_BETA=100,
        NET_TCP_VEGAS_GAMMA=101,
        NET_TCP_BIC=102,
        NET_TCP_BIC_FAST_CONVERGENCE=103,
        NET_TCP_BIC_LOW_WINDOW=104,
        NET_TCP_DEFAULT_WIN_SCALE=105,
        NET_TCP_MODERATE_RCVBUF=106,
};

enum {
        NET_IPV4_ROUTE_FLUSH=1,
        NET_IPV4_ROUTE_MIN_DELAY=2,
        NET_IPV4_ROUTE_MAX_DELAY=3,
        NET_IPV4_ROUTE_GC_THRESH=4,
        NET_IPV4_ROUTE_MAX_SIZE=5,
        NET_IPV4_ROUTE_GC_MIN_INTERVAL=6,
        NET_IPV4_ROUTE_GC_TIMEOUT=7,
        NET_IPV4_ROUTE_GC_INTERVAL=8,
        NET_IPV4_ROUTE_REDIRECT_LOAD=9,
        NET_IPV4_ROUTE_REDIRECT_NUMBER=10,
        NET_IPV4_ROUTE_REDIRECT_SILENCE=11,
        NET_IPV4_ROUTE_ERROR_COST=12,
        NET_IPV4_ROUTE_ERROR_BURST=13,
        NET_IPV4_ROUTE_GC_ELASTICITY=14,
        NET_IPV4_ROUTE_MTU_EXPIRES=15,
        NET_IPV4_ROUTE_MIN_PMTU=16,
        NET_IPV4_ROUTE_MIN_ADVMSS=17,
        NET_IPV4_ROUTE_SECRET_INTERVAL=18,
};

enum
{
        NET_PROTO_CONF_ALL=-2,
        NET_PROTO_CONF_DEFAULT=-3


};

enum
{
        NET_IPV4_CONF_FORWARDING=1,
        NET_IPV4_CONF_MC_FORWARDING=2,
        NET_IPV4_CONF_PROXY_ARP=3,
        NET_IPV4_CONF_ACCEPT_REDIRECTS=4,
        NET_IPV4_CONF_SECURE_REDIRECTS=5,
        NET_IPV4_CONF_SEND_REDIRECTS=6,
        NET_IPV4_CONF_SHARED_MEDIA=7,
        NET_IPV4_CONF_RP_FILTER=8,
        NET_IPV4_CONF_ACCEPT_SOURCE_ROUTE=9,
        NET_IPV4_CONF_BOOTP_RELAY=10,
        NET_IPV4_CONF_LOG_MARTIANS=11,
        NET_IPV4_CONF_TAG=12,
        NET_IPV4_CONF_ARPFILTER=13,
        NET_IPV4_CONF_MEDIUM_ID=14,
        NET_IPV4_CONF_NOXFRM=15,
        NET_IPV4_CONF_NOPOLICY=16,
        NET_IPV4_CONF_FORCE_IGMP_VERSION=17,
        NET_IPV4_CONF_ARP_ANNOUNCE=18,
        NET_IPV4_CONF_ARP_IGNORE=19,
};


enum
{
        NET_IPV4_NF_CONNTRACK_MAX=1,
        NET_IPV4_NF_CONNTRACK_TCP_TIMEOUT_SYN_SENT=2,
        NET_IPV4_NF_CONNTRACK_TCP_TIMEOUT_SYN_RECV=3,
        NET_IPV4_NF_CONNTRACK_TCP_TIMEOUT_ESTABLISHED=4,
        NET_IPV4_NF_CONNTRACK_TCP_TIMEOUT_FIN_WAIT=5,
        NET_IPV4_NF_CONNTRACK_TCP_TIMEOUT_CLOSE_WAIT=6,
        NET_IPV4_NF_CONNTRACK_TCP_TIMEOUT_LAST_ACK=7,
        NET_IPV4_NF_CONNTRACK_TCP_TIMEOUT_TIME_WAIT=8,
        NET_IPV4_NF_CONNTRACK_TCP_TIMEOUT_CLOSE=9,
        NET_IPV4_NF_CONNTRACK_UDP_TIMEOUT=10,
        NET_IPV4_NF_CONNTRACK_UDP_TIMEOUT_STREAM=11,
        NET_IPV4_NF_CONNTRACK_ICMP_TIMEOUT=12,
        NET_IPV4_NF_CONNTRACK_GENERIC_TIMEOUT=13,
        NET_IPV4_NF_CONNTRACK_BUCKETS=14,
};


enum {
        NET_IPV6_CONF=16,
        NET_IPV6_NEIGH=17,
        NET_IPV6_ROUTE=18,
        NET_IPV6_ICMP=19,
        NET_IPV6_BINDV6ONLY=20,
        NET_IPV6_IP6FRAG_HIGH_THRESH=21,
        NET_IPV6_IP6FRAG_LOW_THRESH=22,
        NET_IPV6_IP6FRAG_TIME=23,
        NET_IPV6_IP6FRAG_SECRET_INTERVAL=24,
        NET_IPV6_MLD_MAX_MSF=25,
};

enum {
        NET_IPV6_ROUTE_FLUSH=1,
        NET_IPV6_ROUTE_GC_THRESH=2,
        NET_IPV6_ROUTE_MAX_SIZE=3,
        NET_IPV6_ROUTE_GC_MIN_INTERVAL=4,
        NET_IPV6_ROUTE_GC_TIMEOUT=5,
        NET_IPV6_ROUTE_GC_INTERVAL=6,
        NET_IPV6_ROUTE_GC_ELASTICITY=7,
        NET_IPV6_ROUTE_MTU_EXPIRES=8,
        NET_IPV6_ROUTE_MIN_ADVMSS=9
};

enum {
        NET_IPV6_FORWARDING=1,
        NET_IPV6_HOP_LIMIT=2,
        NET_IPV6_MTU=3,
        NET_IPV6_ACCEPT_RA=4,
        NET_IPV6_ACCEPT_REDIRECTS=5,
        NET_IPV6_AUTOCONF=6,
        NET_IPV6_DAD_TRANSMITS=7,
        NET_IPV6_RTR_SOLICITS=8,
        NET_IPV6_RTR_SOLICIT_INTERVAL=9,
        NET_IPV6_RTR_SOLICIT_DELAY=10,
        NET_IPV6_USE_TEMPADDR=11,
        NET_IPV6_TEMP_VALID_LFT=12,
        NET_IPV6_TEMP_PREFERED_LFT=13,
        NET_IPV6_REGEN_MAX_RETRY=14,
        NET_IPV6_MAX_DESYNC_FACTOR=15,
        NET_IPV6_MAX_ADDRESSES=16,
        NET_IPV6_FORCE_MLD_VERSION=17
};


enum {
        NET_IPV6_ICMP_RATELIMIT=1
};


enum {
        NET_NEIGH_MCAST_SOLICIT=1,
        NET_NEIGH_UCAST_SOLICIT=2,
        NET_NEIGH_APP_SOLICIT=3,
        NET_NEIGH_RETRANS_TIME=4,
        NET_NEIGH_REACHABLE_TIME=5,
        NET_NEIGH_DELAY_PROBE_TIME=6,
        NET_NEIGH_GC_STALE_TIME=7,
        NET_NEIGH_UNRES_QLEN=8,
        NET_NEIGH_PROXY_QLEN=9,
        NET_NEIGH_ANYCAST_DELAY=10,
        NET_NEIGH_PROXY_DELAY=11,
        NET_NEIGH_LOCKTIME=12,
        NET_NEIGH_GC_INTERVAL=13,
        NET_NEIGH_GC_THRESH1=14,
        NET_NEIGH_GC_THRESH2=15,
        NET_NEIGH_GC_THRESH3=16
};


enum {
        NET_IPX_PPROP_BROADCASTING=1,
        NET_IPX_FORWARDING=2
};



enum {
        NET_ATALK_AARP_EXPIRY_TIME=1,
        NET_ATALK_AARP_TICK_TIME=2,
        NET_ATALK_AARP_RETRANSMIT_LIMIT=3,
        NET_ATALK_AARP_RESOLVE_TIME=4
};



enum {
        NET_NETROM_DEFAULT_PATH_QUALITY=1,
        NET_NETROM_OBSOLESCENCE_COUNT_INITIALISER=2,
        NET_NETROM_NETWORK_TTL_INITIALISER=3,
        NET_NETROM_TRANSPORT_TIMEOUT=4,
        NET_NETROM_TRANSPORT_MAXIMUM_TRIES=5,
        NET_NETROM_TRANSPORT_ACKNOWLEDGE_DELAY=6,
        NET_NETROM_TRANSPORT_BUSY_DELAY=7,
        NET_NETROM_TRANSPORT_REQUESTED_WINDOW_SIZE=8,
        NET_NETROM_TRANSPORT_NO_ACTIVITY_TIMEOUT=9,
        NET_NETROM_ROUTING_CONTROL=10,
        NET_NETROM_LINK_FAILS_COUNT=11
};


enum {
        NET_AX25_IP_DEFAULT_MODE=1,
        NET_AX25_DEFAULT_MODE=2,
        NET_AX25_BACKOFF_TYPE=3,
        NET_AX25_CONNECT_MODE=4,
        NET_AX25_STANDARD_WINDOW=5,
        NET_AX25_EXTENDED_WINDOW=6,
        NET_AX25_T1_TIMEOUT=7,
        NET_AX25_T2_TIMEOUT=8,
        NET_AX25_T3_TIMEOUT=9,
        NET_AX25_IDLE_TIMEOUT=10,
        NET_AX25_N2=11,
        NET_AX25_PACLEN=12,
        NET_AX25_PROTOCOL=13,
        NET_AX25_DAMA_SLAVE_TIMEOUT=14
};


enum {
        NET_ROSE_RESTART_REQUEST_TIMEOUT=1,
        NET_ROSE_CALL_REQUEST_TIMEOUT=2,
        NET_ROSE_RESET_REQUEST_TIMEOUT=3,
        NET_ROSE_CLEAR_REQUEST_TIMEOUT=4,
        NET_ROSE_ACK_HOLD_BACK_TIMEOUT=5,
        NET_ROSE_ROUTING_CONTROL=6,
        NET_ROSE_LINK_FAIL_TIMEOUT=7,
        NET_ROSE_MAX_VCS=8,
        NET_ROSE_WINDOW_SIZE=9,
        NET_ROSE_NO_ACTIVITY_TIMEOUT=10
};


enum {
        NET_X25_RESTART_REQUEST_TIMEOUT=1,
        NET_X25_CALL_REQUEST_TIMEOUT=2,
        NET_X25_RESET_REQUEST_TIMEOUT=3,
        NET_X25_CLEAR_REQUEST_TIMEOUT=4,
        NET_X25_ACK_HOLD_BACK_TIMEOUT=5
};


enum
{
        NET_TR_RIF_TIMEOUT=1
};


enum {
        NET_DECNET_NODE_TYPE = 1,
        NET_DECNET_NODE_ADDRESS = 2,
        NET_DECNET_NODE_NAME = 3,
        NET_DECNET_DEFAULT_DEVICE = 4,
        NET_DECNET_TIME_WAIT = 5,
        NET_DECNET_DN_COUNT = 6,
        NET_DECNET_DI_COUNT = 7,
        NET_DECNET_DR_COUNT = 8,
        NET_DECNET_DST_GC_INTERVAL = 9,
        NET_DECNET_CONF = 10,
        NET_DECNET_NO_FC_MAX_CWND = 11,
        NET_DECNET_DEBUG_LEVEL = 255
};


enum {
        NET_DECNET_CONF_LOOPBACK = -2,
        NET_DECNET_CONF_DDCMP = -3,
        NET_DECNET_CONF_PPP = -4,
        NET_DECNET_CONF_X25 = -5,
        NET_DECNET_CONF_GRE = -6,
        NET_DECNET_CONF_ETHER = -7


};


enum {
        NET_DECNET_CONF_DEV_PRIORITY = 1,
        NET_DECNET_CONF_DEV_T1 = 2,
        NET_DECNET_CONF_DEV_T2 = 3,
        NET_DECNET_CONF_DEV_T3 = 4,
        NET_DECNET_CONF_DEV_FORWARDING = 5,
        NET_DECNET_CONF_DEV_BLKSIZE = 6,
        NET_DECNET_CONF_DEV_STATE = 7
};


enum {
        NET_SCTP_RTO_INITIAL = 1,
        NET_SCTP_RTO_MIN = 2,
        NET_SCTP_RTO_MAX = 3,
        NET_SCTP_RTO_ALPHA = 4,
        NET_SCTP_RTO_BETA = 5,
        NET_SCTP_VALID_COOKIE_LIFE = 6,
        NET_SCTP_ASSOCIATION_MAX_RETRANS = 7,
        NET_SCTP_PATH_MAX_RETRANS = 8,
        NET_SCTP_MAX_INIT_RETRANSMITS = 9,
        NET_SCTP_HB_INTERVAL = 10,
        NET_SCTP_PRESERVE_ENABLE = 11,
        NET_SCTP_MAX_BURST = 12,
        NET_SCTP_ADDIP_ENABLE = 13,
        NET_SCTP_PRSCTP_ENABLE = 14,
};


enum {
        NET_BRIDGE_NF_CALL_ARPTABLES = 1,
        NET_BRIDGE_NF_CALL_IPTABLES = 2,
        NET_BRIDGE_NF_CALL_IP6TABLES = 3,
        NET_BRIDGE_NF_FILTER_VLAN_TAGGED = 4,
};




enum
{
        FS_NRINODE=1,
        FS_STATINODE=2,
        FS_MAXINODE=3,
        FS_NRDQUOT=4,
        FS_MAXDQUOT=5,
        FS_NRFILE=6,
        FS_MAXFILE=7,
        FS_DENTRY=8,
        FS_NRSUPER=9,
        FS_MAXSUPER=10,
        FS_OVERFLOWUID=11,
        FS_OVERFLOWGID=12,
        FS_LEASES=13,
        FS_DIR_NOTIFY=14,
        FS_LEASE_TIME=15,
        FS_DQSTATS=16,
        FS_XFS=17,
        FS_AIO_NR=18,
        FS_AIO_MAX_NR=19,
};


enum {
        FS_DQ_LOOKUPS = 1,
        FS_DQ_DROPS = 2,
        FS_DQ_READS = 3,
        FS_DQ_WRITES = 4,
        FS_DQ_CACHE_HITS = 5,
        FS_DQ_ALLOCATED = 6,
        FS_DQ_FREE = 7,
        FS_DQ_SYNCS = 8,
};




enum {
        DEV_CDROM=1,
        DEV_HWMON=2,
        DEV_PARPORT=3,
        DEV_RAID=4,
        DEV_MAC_HID=5,
        DEV_SCSI=6,
};


enum {
        DEV_CDROM_INFO=1,
        DEV_CDROM_AUTOCLOSE=2,
        DEV_CDROM_AUTOEJECT=3,
        DEV_CDROM_DEBUG=4,
        DEV_CDROM_LOCK=5,
        DEV_CDROM_CHECK_MEDIA=6
};


enum {
        DEV_PARPORT_DEFAULT=-3
};


enum {
        DEV_RAID_SPEED_LIMIT_MIN=1,
        DEV_RAID_SPEED_LIMIT_MAX=2
};


enum {
        DEV_PARPORT_DEFAULT_TIMESLICE=1,
        DEV_PARPORT_DEFAULT_SPINTIME=2
};


enum {
        DEV_PARPORT_SPINTIME=1,
        DEV_PARPORT_BASE_ADDR=2,
        DEV_PARPORT_IRQ=3,
        DEV_PARPORT_DMA=4,
        DEV_PARPORT_MODES=5,
        DEV_PARPORT_DEVICES=6,
        DEV_PARPORT_AUTOPROBE=16
};


enum {
        DEV_PARPORT_DEVICES_ACTIVE=-3,
};


enum {
        DEV_PARPORT_DEVICE_TIMESLICE=1,
};


enum {
        DEV_MAC_HID_KEYBOARD_SENDS_LINUX_KEYCODES=1,
        DEV_MAC_HID_KEYBOARD_LOCK_KEYCODES=2,
        DEV_MAC_HID_MOUSE_BUTTON_EMULATION=3,
        DEV_MAC_HID_MOUSE_BUTTON2_KEYCODE=4,
        DEV_MAC_HID_MOUSE_BUTTON3_KEYCODE=5,
        DEV_MAC_HID_ADB_MOUSE_SENDS_KEYCODES=6
};


enum {
        DEV_SCSI_LOGGING_LEVEL=1,
};


enum
{
        ABI_DEFHANDLER_COFF=1,
        ABI_DEFHANDLER_ELF=2,
        ABI_DEFHANDLER_LCALL7=3,
        ABI_DEFHANDLER_LIBCSO=4,
        ABI_TRACE=5,
        ABI_FAKE_UTSNAME=6,
};



extern void sysctl_init(void);

typedef struct ctl_table ctl_table;

typedef int ctl_handler (ctl_table *table, int *name, int nlen,
                         void *oldval, size_t *oldlenp,
                         void *newval, size_t newlen,
                         void **context);

typedef int proc_handler (ctl_table *ctl, int write, struct file * filp,
                          void *buffer, size_t *lenp, loff_t *ppos);

extern int proc_dostring(ctl_table *, int, struct file *,
                         void *, size_t *, loff_t *);
extern int proc_dointvec(ctl_table *, int, struct file *,
                         void *, size_t *, loff_t *);
extern int proc_dointvec_bset(ctl_table *, int, struct file *,
                              void *, size_t *, loff_t *);
extern int proc_dointvec_minmax(ctl_table *, int, struct file *,
                                void *, size_t *, loff_t *);
extern int proc_dointvec_jiffies(ctl_table *, int, struct file *,
                                 void *, size_t *, loff_t *);
extern int proc_dointvec_userhz_jiffies(ctl_table *, int, struct file *,
                                        void *, size_t *, loff_t *);
extern int proc_doulongvec_minmax(ctl_table *, int, struct file *,
                                  void *, size_t *, loff_t *);
extern int proc_doulongvec_ms_jiffies_minmax(ctl_table *table, int,
                                      struct file *, void *, size_t *, loff_t *);

extern int do_sysctl (int *name, int nlen,
                      void *oldval, size_t *oldlenp,
                      void *newval, size_t newlen);

extern int do_sysctl_strategy (ctl_table *table,
                               int *name, int nlen,
                               void *oldval, size_t *oldlenp,
                               void *newval, size_t newlen, void ** context);

extern ctl_handler sysctl_string;
extern ctl_handler sysctl_intvec;
extern ctl_handler sysctl_jiffies;
# 836 "include/linux/sysctl.h"
struct ctl_table
{
        int ctl_name;
        const char *procname;
        void *data;
        int maxlen;
        mode_t mode;
        ctl_table *child;
        proc_handler *proc_handler;
        ctl_handler *strategy;
        struct proc_dir_entry *de;
        void *extra1;
        void *extra2;
};



struct ctl_table_header
{
        ctl_table *ctl_table;
        struct list_head ctl_entry;
};

struct ctl_table_header * register_sysctl_table(ctl_table * table,
                                                int insert_at_head);
void unregister_sysctl_table(struct ctl_table_header * table);
# 31 "include/linux/security.h" 2
# 1 "include/linux/shm.h" 1
# 19 "include/linux/shm.h"
# 1 "include/asm/shmparam.h" 1
# 20 "include/linux/shm.h" 2


struct shmid_ds {
        struct ipc_perm shm_perm;
        int shm_segsz;
        __kernel_time_t shm_atime;
        __kernel_time_t shm_dtime;
        __kernel_time_t shm_ctime;
        __kernel_ipc_pid_t shm_cpid;
        __kernel_ipc_pid_t shm_lpid;
        unsigned short shm_nattch;
        unsigned short shm_unused;
        void *shm_unused2;
        void *shm_unused3;
};


# 1 "include/asm/shmbuf.h" 1
# 14 "include/asm/shmbuf.h"
struct shmid64_ds {
        struct ipc64_perm shm_perm;
        size_t shm_segsz;
        __kernel_time_t shm_atime;
        unsigned long __unused1;
        __kernel_time_t shm_dtime;
        unsigned long __unused2;
        __kernel_time_t shm_ctime;
        unsigned long __unused3;
        __kernel_pid_t shm_cpid;
        __kernel_pid_t shm_lpid;
        unsigned long shm_nattch;
        unsigned long __unused4;
        unsigned long __unused5;
};

struct shminfo64 {
        unsigned long shmmax;
        unsigned long shmmin;
        unsigned long shmmni;
        unsigned long shmseg;
        unsigned long shmall;
        unsigned long __unused1;
        unsigned long __unused2;
        unsigned long __unused3;
        unsigned long __unused4;
};
# 38 "include/linux/shm.h" 2
# 57 "include/linux/shm.h"
struct shminfo {
        int shmmax;
        int shmmin;
        int shmmni;
        int shmseg;
        int shmall;
};

struct shm_info {
        int used_ids;
        unsigned long shm_tot;
        unsigned long shm_rss;
        unsigned long shm_swp;
        unsigned long swap_attempts;
        unsigned long swap_successes;
};


struct shmid_kernel
{
        struct kern_ipc_perm shm_perm;
        struct file * shm_file;
        int id;
        unsigned long shm_nattch;
        unsigned long shm_segsz;
        time_t shm_atim;
        time_t shm_dtim;
        time_t shm_ctim;
        pid_t shm_cprid;
        pid_t shm_lprid;
};







long do_shmat(int shmid, char *shmaddr, int shmflg, unsigned long *addr);
# 32 "include/linux/security.h" 2
# 1 "include/linux/msg.h" 1
# 16 "include/linux/msg.h"
struct msqid_ds {
        struct ipc_perm msg_perm;
        struct msg *msg_first;
        struct msg *msg_last;
        __kernel_time_t msg_stime;
        __kernel_time_t msg_rtime;
        __kernel_time_t msg_ctime;
        unsigned long msg_lcbytes;
        unsigned long msg_lqbytes;
        unsigned short msg_cbytes;
        unsigned short msg_qnum;
        unsigned short msg_qbytes;
        __kernel_ipc_pid_t msg_lspid;
        __kernel_ipc_pid_t msg_lrpid;
};


# 1 "include/asm/msgbuf.h" 1
# 14 "include/asm/msgbuf.h"
struct msqid64_ds {
        struct ipc64_perm msg_perm;
        __kernel_time_t msg_stime;
        unsigned long __unused1;
        __kernel_time_t msg_rtime;
        unsigned long __unused2;
        __kernel_time_t msg_ctime;
        unsigned long __unused3;
        unsigned long msg_cbytes;
        unsigned long msg_qnum;
        unsigned long msg_qbytes;
        __kernel_pid_t msg_lspid;
        __kernel_pid_t msg_lrpid;
        unsigned long __unused4;
        unsigned long __unused5;
};
# 34 "include/linux/msg.h" 2


struct msgbuf {
        long mtype;
        char mtext[1];
};


struct msginfo {
        int msgpool;
        int msgmap;
        int msgmax;
        int msgmnb;
        int msgmni;
        int msgssz;
        int msgtql;
        unsigned short msgseg;
};
# 68 "include/linux/msg.h"
struct msg_msg {
        struct list_head m_list;
        long m_type;
        int m_ts;
        struct msg_msgseg* next;
        void *security;

};


struct msg_queue {
        struct kern_ipc_perm q_perm;
        time_t q_stime;
        time_t q_rtime;
        time_t q_ctime;
        unsigned long q_cbytes;
        unsigned long q_qnum;
        unsigned long q_qbytes;
        pid_t q_lspid;
        pid_t q_lrpid;

        struct list_head q_messages;
        struct list_head q_receivers;
        struct list_head q_senders;
};
# 33 "include/linux/security.h" 2

# 1 "include/linux/skbuff.h" 1
# 28 "include/linux/skbuff.h"
# 1 "include/linux/poll.h" 1



# 1 "include/asm/poll.h" 1
# 20 "include/asm/poll.h"
struct pollfd {
        int fd;
        short events;
        short revents;
};
# 5 "include/linux/poll.h" 2
# 13 "include/linux/poll.h"
struct poll_table_struct;




typedef void (*poll_queue_proc)(struct file *, wait_queue_head_t *, struct poll_table_struct *);

typedef struct poll_table_struct {
        poll_queue_proc qproc;
} poll_table;

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void poll_wait(struct file * filp, wait_queue_head_t * wait_address, poll_table *p)
{
        if (p && wait_address)
                p->qproc(filp, wait_address, p);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void init_poll_funcptr(poll_table *pt, poll_queue_proc qproc)
{
        pt->qproc = qproc;
}




struct poll_wqueues {
        poll_table pt;
        struct poll_table_page * table;
        int error;
};

extern void poll_initwait(struct poll_wqueues *pwq);
extern void poll_freewait(struct poll_wqueues *pwq);





typedef struct {
        unsigned long *in, *out, *ex;
        unsigned long *res_in, *res_out, *res_ex;
} fd_set_bits;
# 69 "include/linux/poll.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline))
int get_fd_set(unsigned long nr, void *ufdset, unsigned long *fdset)
{
        nr = ((((nr)+(8*sizeof(long))-1)/(8*sizeof(long)))*sizeof(long));
        if (ufdset) {
                int error;
                error = verify_area(1, ufdset, nr);
                if (!error && __copy_from_user(fdset, ufdset, nr))
                        error = -14;
                return error;
        }
        (__builtin_constant_p(0) ? (__builtin_constant_p((nr)) ? __constant_c_and_count_memset(((fdset)),((0x01010101UL*(unsigned char)(0))),((nr))) : __constant_c_memset(((fdset)),((0x01010101UL*(unsigned char)(0))),((nr)))) : (__builtin_constant_p((nr)) ? __memset_generic((((fdset))),(((0))),(((nr)))) : __memset_generic(((fdset)),((0)),((nr)))));
        return 0;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline))
void set_fd_set(unsigned long nr, void *ufdset, unsigned long *fdset)
{
        if (ufdset)
                __copy_to_user(ufdset, fdset, ((((nr)+(8*sizeof(long))-1)/(8*sizeof(long)))*sizeof(long)));
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline))
void zero_fd_set(unsigned long nr, unsigned long *fdset)
{
        (__builtin_constant_p(0) ? (__builtin_constant_p((((((nr)+(8*sizeof(long))-1)/(8*sizeof(long)))*sizeof(long)))) ? __constant_c_and_count_memset(((fdset)),((0x01010101UL*(unsigned char)(0))),((((((nr)+(8*sizeof(long))-1)/(8*sizeof(long)))*sizeof(long))))) : __constant_c_memset(((fdset)),((0x01010101UL*(unsigned char)(0))),((((((nr)+(8*sizeof(long))-1)/(8*sizeof(long)))*sizeof(long)))))) : (__builtin_constant_p((((((nr)+(8*sizeof(long))-1)/(8*sizeof(long)))*sizeof(long)))) ? __memset_generic((((fdset))),(((0))),(((((((nr)+(8*sizeof(long))-1)/(8*sizeof(long)))*sizeof(long)))))) : __memset_generic(((fdset)),((0)),((((((nr)+(8*sizeof(long))-1)/(8*sizeof(long)))*sizeof(long)))))));
}

extern int do_select(int n, fd_set_bits *fds, long *timeout);
# 29 "include/linux/skbuff.h" 2
# 1 "include/linux/net.h" 1
# 25 "include/linux/net.h"
struct poll_table_struct;
struct inode;
# 48 "include/linux/net.h"
typedef enum {
        SS_FREE = 0,
        SS_UNCONNECTED,
        SS_CONNECTING,
        SS_CONNECTED,
        SS_DISCONNECTING
} socket_state;
# 76 "include/linux/net.h"
struct socket {
        socket_state state;
        unsigned long flags;
        struct proto_ops *ops;
        struct fasync_struct *fasync_list;
        struct file *file;
        struct sock *sk;
        wait_queue_head_t wait;
        short type;
        unsigned char passcred;
};

struct vm_area_struct;
struct page;
struct kiocb;
struct sockaddr;
struct msghdr;
struct module;

struct proto_ops {
        int family;
        struct module *owner;
        int (*release) (struct socket *sock);
        int (*bind) (struct socket *sock,
                                      struct sockaddr *myaddr,
                                      int sockaddr_len);
        int (*connect) (struct socket *sock,
                                      struct sockaddr *vaddr,
                                      int sockaddr_len, int flags);
        int (*socketpair)(struct socket *sock1,
                                      struct socket *sock2);
        int (*accept) (struct socket *sock,
                                      struct socket *newsock, int flags);
        int (*getname) (struct socket *sock,
                                      struct sockaddr *addr,
                                      int *sockaddr_len, int peer);
        unsigned int (*poll) (struct file *file, struct socket *sock,
                                      struct poll_table_struct *wait);
        int (*ioctl) (struct socket *sock, unsigned int cmd,
                                      unsigned long arg);
        int (*listen) (struct socket *sock, int len);
        int (*shutdown) (struct socket *sock, int flags);
        int (*setsockopt)(struct socket *sock, int level,
                                      int optname, char *optval, int optlen);
        int (*getsockopt)(struct socket *sock, int level,
                                      int optname, char *optval, int *optlen);
        int (*sendmsg) (struct kiocb *iocb, struct socket *sock,
                                      struct msghdr *m, size_t total_len);
        int (*recvmsg) (struct kiocb *iocb, struct socket *sock,
                                      struct msghdr *m, size_t total_len,
                                      int flags);
        int (*mmap) (struct file *file, struct socket *sock,
                                      struct vm_area_struct * vma);
        ssize_t (*sendpage) (struct socket *sock, struct page *page,
                                      int offset, size_t size, int flags);
};

struct net_proto_family {
        int family;
        int (*create)(struct socket *sock, int protocol);


        short authentication;
        short encryption;
        short encrypt_net;
        struct module *owner;
};

struct iovec;
struct kvec;

extern int sock_wake_async(struct socket *sk, int how, int band);
extern int sock_register(struct net_proto_family *fam);
extern int sock_unregister(int family);
extern struct socket *sock_alloc(void);
extern int sock_create(int family, int type, int proto,
                                 struct socket **res);
extern int sock_create_kern(int family, int type, int proto,
                                      struct socket **res);
extern int sock_create_lite(int family, int type, int proto,
                                      struct socket **res);
extern void sock_release(struct socket *sock);
extern int sock_sendmsg(struct socket *sock, struct msghdr *msg,
                                  size_t len);
extern int sock_recvmsg(struct socket *sock, struct msghdr *msg,
                                  size_t size, int flags);
extern int sock_readv_writev(int type, struct inode *inode,
                                       struct file *file,
                                       const struct iovec *iov, long count,
                                       size_t size);
extern int sock_map_fd(struct socket *sock);
extern struct socket *sockfd_lookup(int fd, int *err);

extern int net_ratelimit(void);
extern unsigned long net_random(void);
extern void net_srandom(unsigned long);

extern int kernel_sendmsg(struct socket *sock, struct msghdr *msg,
                                    struct kvec *vec, size_t num, size_t len);
extern int kernel_recvmsg(struct socket *sock, struct msghdr *msg,
                                    struct kvec *vec, size_t num,
                                    size_t len, int flags);
# 30 "include/linux/skbuff.h" 2
# 1 "include/net/checksum.h" 1
# 26 "include/net/checksum.h"
# 1 "include/asm/checksum.h" 1



# 1 "include/linux/in6.h" 1
# 30 "include/linux/in6.h"
struct in6_addr
{
        union
        {
                __u8 u6_addr8[16];
                __u16 u6_addr16[8];
                __u32 u6_addr32[4];
        } in6_u;



};





extern const struct in6_addr in6addr_any;

extern const struct in6_addr in6addr_loopback;


struct sockaddr_in6 {
        unsigned short int sin6_family;
        __u16 sin6_port;
        __u32 sin6_flowinfo;
        struct in6_addr sin6_addr;
        __u32 sin6_scope_id;
};

struct ipv6_mreq {

        struct in6_addr ipv6mr_multiaddr;


        int ipv6mr_ifindex;
};



struct in6_flowlabel_req
{
        struct in6_addr flr_dst;
        __u32 flr_label;
        __u8 flr_action;
        __u8 flr_share;
        __u16 flr_flags;
        __u16 flr_expires;
        __u16 flr_linger;
        __u32 __flr_pad;

};
# 5 "include/asm/checksum.h" 2
# 18 "include/asm/checksum.h"
 __attribute__((regparm(0))) unsigned int csum_partial(const unsigned char * buff, int len, unsigned int sum);
# 28 "include/asm/checksum.h"
 __attribute__((regparm(0))) unsigned int csum_partial_copy_generic( const char *src, char *dst, int len, int sum,
                                                   int *src_err_ptr, int *dst_err_ptr);
# 38 "include/asm/checksum.h"
static __inline__ __attribute__((always_inline))
unsigned int csum_partial_copy_nocheck ( const char *src, char *dst,
                                        int len, int sum)
{
        return csum_partial_copy_generic ( src, dst, len, sum, ((void *)0), ((void *)0));
}

static __inline__ __attribute__((always_inline))
unsigned int csum_partial_copy_from_user ( const char *src, char *dst,
                                                int len, int sum, int *err_ptr)
{
        return csum_partial_copy_generic ( ( char *)src, dst, len, sum, err_ptr, ((void *)0));
}
# 59 "include/asm/checksum.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned short ip_fast_csum(unsigned char * iph,
                                          unsigned int ihl)
{
        unsigned int sum;

        __asm__ __volatile__(
            "movl (%1), %0	;\n"
            "subl $4, %2	;\n"
            "jbe 2f		;\n"
            "addl 4(%1), %0	;\n"
            "adcl 8(%1), %0	;\n"
            "adcl 12(%1), %0	;\n"
"1:	    adcl 16(%1), %0	;\n"
            "lea 4(%1), %1	;\n"
            "decl %2		;\n"
            "jne 1b		;\n"
            "adcl $0, %0	;\n"
            "movl %0, %2	;\n"
            "shrl $16, %0	;\n"
            "addw %w2, %w0	;\n"
            "adcl $0, %0	;\n"
            "notl %0		;\n"
"2:				;\n"



        : "=r" (sum), "=r" (iph), "=r" (ihl)
        : "1" (iph), "2" (ihl)
        : "memory");
        return(sum);
}





static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned int csum_fold(unsigned int sum)
{
        __asm__(
                "addl %1, %0		;\n"
                "adcl $0xffff, %0	;\n"
                : "=r" (sum)
                : "r" (sum << 16), "0" (sum & 0xffff0000)
        );
        return (~sum) >> 16;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned long csum_tcpudp_nofold(unsigned long saddr,
                                                   unsigned long daddr,
                                                   unsigned short len,
                                                   unsigned short proto,
                                                   unsigned int sum)
{
    __asm__(
        "addl %1, %0	;\n"
        "adcl %2, %0	;\n"
        "adcl %3, %0	;\n"
        "adcl $0, %0	;\n"
        : "=r" (sum)
        : "g" (daddr), "g"(saddr), "g"(((__builtin_constant_p((__u16)((len))) ? ({ __u16 __x = (((len))); ((__u16)( (((__u16)(__x) & (__u16)0x00ffU) << 8) | (((__u16)(__x) & (__u16)0xff00U) >> 8) )); }) : __fswab16(((len))))<<16)+proto*256), "0"(sum));
    return sum;
}





static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned short int csum_tcpudp_magic(unsigned long saddr,
                                                   unsigned long daddr,
                                                   unsigned short len,
                                                   unsigned short proto,
                                                   unsigned int sum)
{
        return csum_fold(csum_tcpudp_nofold(saddr,daddr,len,proto,sum));
}






static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned short ip_compute_csum(unsigned char * buff, int len)
{
    return csum_fold (csum_partial(buff, len, 0));
}


static __inline__ __attribute__((always_inline)) unsigned short int csum_ipv6_magic(struct in6_addr *saddr,
                                                     struct in6_addr *daddr,
                                                     __u32 len,
                                                     unsigned short proto,
                                                     unsigned int sum)
{
        __asm__(
                "addl 0(%1), %0		;\n"
                "adcl 4(%1), %0		;\n"
                "adcl 8(%1), %0		;\n"
                "adcl 12(%1), %0	;\n"
                "adcl 0(%2), %0		;\n"
                "adcl 4(%2), %0		;\n"
                "adcl 8(%2), %0		;\n"
                "adcl 12(%2), %0	;\n"
                "adcl %3, %0		;\n"
                "adcl %4, %0		;\n"
                "adcl $0, %0		;\n"
                : "=&r" (sum)
                : "r" (saddr), "r" (daddr),
                  "r"((__builtin_constant_p((__u32)((len))) ? ({ __u32 __x = (((len))); ((__u32)( (((__u32)(__x) & (__u32)0x000000ffUL) << 24) | (((__u32)(__x) & (__u32)0x0000ff00UL) << 8) | (((__u32)(__x) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(__x) & (__u32)0xff000000UL) >> 24) )); }) : __fswab32(((len))))), "r"((__builtin_constant_p((__u32)((proto))) ? ({ __u32 __x = (((proto))); ((__u32)( (((__u32)(__x) & (__u32)0x000000ffUL) << 24) | (((__u32)(__x) & (__u32)0x0000ff00UL) << 8) | (((__u32)(__x) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(__x) & (__u32)0xff000000UL) >> 24) )); }) : __fswab32(((proto))))), "0"(sum));

        return csum_fold(sum);
}





static __inline__ __attribute__((always_inline)) unsigned int csum_and_copy_to_user(const char *src,
                                                     char *dst,
                                                     int len, int sum,
                                                     int *err_ptr)
{
        if ((__builtin_expect(!!(({ unsigned long flag,sum; (void)0; asm("addl %3,%1 ; sbbl %0,%0; cmpl %1,%4; sbbl $0,%0" :"=&r" (flag), "=r" (sum) :"1" (dst),"g" ((int)(len)),"g" (current_thread_info()->addr_limit.seg)); flag; }) == 0), 1)))
                return csum_partial_copy_generic(src, ( char *)dst, len, sum, ((void *)0), err_ptr);

        if (len)
                *err_ptr = -14;

        return -1;
}
# 27 "include/net/checksum.h" 2


static __inline__ __attribute__((always_inline)) __attribute__((always_inline))
unsigned int csum_and_copy_from_user (const char *src, char *dst,
                                      int len, int sum, int *err_ptr)
{
        if (verify_area(0, src, len) == 0)
                return csum_partial_copy_from_user(src, dst, len, sum, err_ptr);

        if (len)
                *err_ptr = -14;

        return sum;
}
# 60 "include/net/checksum.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned int csum_add(unsigned int csum, unsigned int addend)
{
        csum += addend;
        return csum + (csum < addend);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned int csum_sub(unsigned int csum, unsigned int addend)
{
        return csum_add(csum, ~addend);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned int
csum_block_add(unsigned int csum, unsigned int csum2, int offset)
{
        if (offset&1)
                csum2 = ((csum2&0xFF00FF)<<8)+((csum2>>8)&0xFF00FF);
        return csum_add(csum, csum2);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned int
csum_block_sub(unsigned int csum, unsigned int csum2, int offset)
{
        if (offset&1)
                csum2 = ((csum2&0xFF00FF)<<8)+((csum2>>8)&0xFF00FF);
        return csum_sub(csum, csum2);
}
# 31 "include/linux/skbuff.h" 2
# 93 "include/linux/skbuff.h"
struct nf_conntrack {
        atomic_t use;
        void (*destroy)(struct nf_conntrack *);
};

struct nf_ct_info {
        struct nf_conntrack *master;
};


struct nf_bridge_info {
        atomic_t use;
        struct net_device *physindev;
        struct net_device *physoutdev;

        struct net_device *netoutdev;

        unsigned int mask;
        unsigned long data[32 / sizeof(unsigned long)];
};




struct sk_buff_head {

        struct sk_buff *next;
        struct sk_buff *prev;

        __u32 qlen;
        spinlock_t lock;
};

struct sk_buff;




typedef struct skb_frag_struct skb_frag_t;

struct skb_frag_struct {
        struct page *page;
        __u16 page_offset;
        __u16 size;
};




struct skb_shared_info {
        atomic_t dataref;
        unsigned int nr_frags;
        unsigned short tso_size;
        unsigned short tso_segs;
        struct sk_buff *frag_list;
        skb_frag_t frags[(65536/(1UL << 12) + 2)];
};
# 193 "include/linux/skbuff.h"
struct sk_buff {

        struct sk_buff *next;
        struct sk_buff *prev;

        struct sk_buff_head *list;
        struct sock *sk;
        struct timeval stamp;
        struct net_device *dev;
        struct net_device *input_dev;
        struct net_device *real_dev;

        union {
                struct tcphdr *th;
                struct udphdr *uh;
                struct icmphdr *icmph;
                struct igmphdr *igmph;
                struct iphdr *ipiph;
                struct ipv6hdr *ipv6h;
                unsigned char *raw;
        } h;

        union {
                struct iphdr *iph;
                struct ipv6hdr *ipv6h;
                struct arphdr *arph;
                unsigned char *raw;
        } nh;

        union {
                struct ethhdr *ethernet;
                unsigned char *raw;
        } mac;

        struct dst_entry *dst;
        struct sec_path *sp;







        char cb[40];

        unsigned int len,
                                data_len,
                                mac_len,
                                csum;
        unsigned char local_df,
                                cloned,
                                pkt_type,
                                ip_summed;
        __u32 priority;
        unsigned short protocol,
                                security;

        void (*destructor)(struct sk_buff *skb);

        unsigned long nfmark;
        __u32 nfcache;
        struct nf_ct_info *nfct;

        unsigned int nf_debug;


        struct nf_bridge_info *nf_bridge;



        union {
                __u32 ifield;
        } private;


       __u32 tc_index;

        __u32 tc_verd;
        __u32 tc_classid;






        unsigned int truesize;
        atomic_t users;
        unsigned char *head,
                                *data,
                                *tail,
                                *end;
};
# 294 "include/linux/skbuff.h"
extern void __kfree_skb(struct sk_buff *skb);
extern struct sk_buff *alloc_skb(unsigned int size, int priority);
extern void kfree_skbmem(struct sk_buff *skb);
extern struct sk_buff *skb_clone(struct sk_buff *skb, int priority);
extern struct sk_buff *skb_copy(const struct sk_buff *skb, int priority);
extern struct sk_buff *pskb_copy(struct sk_buff *skb, int gfp_mask);
extern int pskb_expand_head(struct sk_buff *skb,
                                        int nhead, int ntail, int gfp_mask);
extern struct sk_buff *skb_realloc_headroom(struct sk_buff *skb,
                                            unsigned int headroom);
extern struct sk_buff *skb_copy_expand(const struct sk_buff *skb,
                                       int newheadroom, int newtailroom,
                                       int priority);
extern struct sk_buff * skb_pad(struct sk_buff *skb, int pad);

extern void skb_over_panic(struct sk_buff *skb, int len,
                                     void *here);
extern void skb_under_panic(struct sk_buff *skb, int len,
                                      void *here);
# 323 "include/linux/skbuff.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int skb_queue_empty(const struct sk_buff_head *list)
{
        return list->next == (struct sk_buff *)list;
}
# 335 "include/linux/skbuff.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct sk_buff *skb_get(struct sk_buff *skb)
{
        atomic_inc(&skb->users);
        return skb;
}
# 353 "include/linux/skbuff.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void kfree_skb(struct sk_buff *skb)
{
        if (((&skb->users)->counter) == 1 || atomic_dec_and_test(&skb->users))
                __kfree_skb(skb);
}


static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void kfree_skb_fast(struct sk_buff *skb)
{
        if (((&skb->users)->counter) == 1 || atomic_dec_and_test(&skb->users))
                kfree_skbmem(skb);
}
# 374 "include/linux/skbuff.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int skb_cloned(const struct sk_buff *skb)
{
        return skb->cloned && ((&((struct skb_shared_info *)((skb)->end))->dataref)->counter) != 1;
}
# 386 "include/linux/skbuff.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int skb_shared(const struct sk_buff *skb)
{
        return ((&skb->users)->counter) != 1;
}
# 404 "include/linux/skbuff.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct sk_buff *skb_share_check(struct sk_buff *skb, int pri)
{
        do { if (__builtin_expect(!!(pri & 0x10), 0)) __might_sleep("include/linux/skbuff.h", 406); } while (0);
        if (skb_shared(skb)) {
                struct sk_buff *nskb = skb_clone(skb, pri);
                kfree_skb(skb);
                skb = nskb;
        }
        return skb;
}
# 435 "include/linux/skbuff.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct sk_buff *skb_unshare(struct sk_buff *skb, int pri)
{
        do { if (__builtin_expect(!!(pri & 0x10), 0)) __might_sleep("include/linux/skbuff.h", 437); } while (0);
        if (skb_cloned(skb)) {
                struct sk_buff *nskb = skb_copy(skb, pri);
                kfree_skb(skb);
                skb = nskb;
        }
        return skb;
}
# 459 "include/linux/skbuff.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct sk_buff *skb_peek(struct sk_buff_head *list_)
{
        struct sk_buff *list = ((struct sk_buff *)list_)->next;
        if (list == (struct sk_buff *)list_)
                list = ((void *)0);
        return list;
}
# 480 "include/linux/skbuff.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct sk_buff *skb_peek_tail(struct sk_buff_head *list_)
{
        struct sk_buff *list = ((struct sk_buff *)list_)->prev;
        if (list == (struct sk_buff *)list_)
                list = ((void *)0);
        return list;
}







static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) __u32 skb_queue_len(const struct sk_buff_head *list_)
{
        return list_->qlen;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void skb_queue_head_init(struct sk_buff_head *list)
{
        do { *(&list->lock) = (spinlock_t) { 1 , 0xdead4ead }; } while(0);
        list->prev = list->next = (struct sk_buff *)list;
        list->qlen = 0;
}
# 523 "include/linux/skbuff.h"
extern void skb_queue_head(struct sk_buff_head *list, struct sk_buff *newsk);
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void __skb_queue_head(struct sk_buff_head *list,
                                    struct sk_buff *newsk)
{
        struct sk_buff *prev, *next;

        newsk->list = list;
        list->qlen++;
        prev = (struct sk_buff *)list;
        next = prev->next;
        newsk->next = next;
        newsk->prev = prev;
        next->prev = prev->next = newsk;
}
# 548 "include/linux/skbuff.h"
extern void skb_queue_tail(struct sk_buff_head *list, struct sk_buff *newsk);
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void __skb_queue_tail(struct sk_buff_head *list,
                                   struct sk_buff *newsk)
{
        struct sk_buff *prev, *next;

        newsk->list = list;
        list->qlen++;
        next = (struct sk_buff *)list;
        prev = next->prev;
        newsk->next = next;
        newsk->prev = prev;
        next->prev = prev->next = newsk;
}
# 572 "include/linux/skbuff.h"
extern struct sk_buff *skb_dequeue(struct sk_buff_head *list);
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct sk_buff *__skb_dequeue(struct sk_buff_head *list)
{
        struct sk_buff *next, *prev, *result;

        prev = (struct sk_buff *) list;
        next = prev->next;
        result = ((void *)0);
        if (next != prev) {
                result = next;
                next = next->next;
                list->qlen--;
                next->prev = prev;
                prev->next = next;
                result->next = result->prev = ((void *)0);
                result->list = ((void *)0);
        }
        return result;
}





extern void skb_insert(struct sk_buff *old, struct sk_buff *newsk);
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void __skb_insert(struct sk_buff *newsk,
                                struct sk_buff *prev, struct sk_buff *next,
                                struct sk_buff_head *list)
{
        newsk->next = next;
        newsk->prev = prev;
        next->prev = prev->next = newsk;
        newsk->list = list;
        list->qlen++;
}




extern void skb_append(struct sk_buff *old, struct sk_buff *newsk);
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void __skb_append(struct sk_buff *old, struct sk_buff *newsk)
{
        __skb_insert(newsk, old, old->next, old->list);
}





extern void skb_unlink(struct sk_buff *skb);
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void __skb_unlink(struct sk_buff *skb, struct sk_buff_head *list)
{
        struct sk_buff *next, *prev;

        list->qlen--;
        next = skb->next;
        prev = skb->prev;
        skb->next = skb->prev = ((void *)0);
        skb->list = ((void *)0);
        next->prev = prev;
        prev->next = next;
}
# 646 "include/linux/skbuff.h"
extern struct sk_buff *skb_dequeue_tail(struct sk_buff_head *list);
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct sk_buff *__skb_dequeue_tail(struct sk_buff_head *list)
{
        struct sk_buff *skb = skb_peek_tail(list);
        if (skb)
                __skb_unlink(skb, list);
        return skb;
}


static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int skb_is_nonlinear(const struct sk_buff *skb)
{
        return skb->data_len;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned int skb_headlen(const struct sk_buff *skb)
{
        return skb->len - skb->data_len;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int skb_pagelen(const struct sk_buff *skb)
{
        int i, len = 0;

        for (i = (int)((struct skb_shared_info *)((skb)->end))->nr_frags - 1; i >= 0; i--)
                len += ((struct skb_shared_info *)((skb)->end))->frags[i].size;
        return len + skb_headlen(skb);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void skb_fill_page_desc(struct sk_buff *skb, int i,
                                      struct page *page, int off, int size)
{
        skb_frag_t *frag = &((struct skb_shared_info *)((skb)->end))->frags[i];

        frag->page = page;
        frag->page_offset = off;
        frag->size = size;
        ((struct skb_shared_info *)((skb)->end))->nr_frags = i + 1;
}
# 693 "include/linux/skbuff.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned char *__skb_put(struct sk_buff *skb, unsigned int len)
{
        unsigned char *tmp = skb->tail;
        do { if (__builtin_expect(!!((skb_is_nonlinear(skb))!=0), 0)) __asm__ __volatile__( "ud2\n" "\t.word %c0\n" "\t.long %c1\n" : : "i" (696), "i" ("include/linux/skbuff.h")); } while(0);
        skb->tail += len;
        skb->len += len;
        return tmp;
}
# 711 "include/linux/skbuff.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned char *skb_put(struct sk_buff *skb, unsigned int len)
{
        unsigned char *tmp = skb->tail;
        do { if (__builtin_expect(!!((skb_is_nonlinear(skb))!=0), 0)) __asm__ __volatile__( "ud2\n" "\t.word %c0\n" "\t.long %c1\n" : : "i" (714), "i" ("include/linux/skbuff.h")); } while(0);
        skb->tail += len;
        skb->len += len;
        if (__builtin_expect(!!(skb->tail>skb->end), 0))
                skb_over_panic(skb, len, ({ void *pc; __asm__("movl $1f,%0\n1:":"=g" (pc)); pc; }));
        return tmp;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned char *__skb_push(struct sk_buff *skb, unsigned int len)
{
        skb->data -= len;
        skb->len += len;
        return skb->data;
}
# 738 "include/linux/skbuff.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned char *skb_push(struct sk_buff *skb, unsigned int len)
{
        skb->data -= len;
        skb->len += len;
        if (__builtin_expect(!!(skb->data<skb->head), 0))
                skb_under_panic(skb, len, ({ void *pc; __asm__("movl $1f,%0\n1:":"=g" (pc)); pc; }));
        return skb->data;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned char *__skb_pull(struct sk_buff *skb, unsigned int len)
{
        skb->len -= len;
        do { if (__builtin_expect(!!((skb->len < skb->data_len)!=0), 0)) __asm__ __volatile__( "ud2\n" "\t.word %c0\n" "\t.long %c1\n" : : "i" (750), "i" ("include/linux/skbuff.h")); } while(0);
        return skb->data += len;
}
# 764 "include/linux/skbuff.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned char *skb_pull(struct sk_buff *skb, unsigned int len)
{
        return __builtin_expect(!!(len > skb->len), 0) ? ((void *)0) : __skb_pull(skb, len);
}

extern unsigned char *__pskb_pull_tail(struct sk_buff *skb, int delta);

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned char *__pskb_pull(struct sk_buff *skb, unsigned int len)
{
        if (len > skb_headlen(skb) &&
            !__pskb_pull_tail(skb, len-skb_headlen(skb)))
                return ((void *)0);
        skb->len -= len;
        return skb->data += len;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned char *pskb_pull(struct sk_buff *skb, unsigned int len)
{
        return __builtin_expect(!!(len > skb->len), 0) ? ((void *)0) : __pskb_pull(skb, len);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int pskb_may_pull(struct sk_buff *skb, unsigned int len)
{
        if (__builtin_expect(!!(len <= skb_headlen(skb)), 1))
                return 1;
        if (__builtin_expect(!!(len > skb->len), 0))
                return 0;
        return __pskb_pull_tail(skb, len-skb_headlen(skb)) != ((void *)0);
}







static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int skb_headroom(const struct sk_buff *skb)
{
        return skb->data - skb->head;
}







static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int skb_tailroom(const struct sk_buff *skb)
{
        return skb_is_nonlinear(skb) ? 0 : skb->end - skb->tail;
}
# 824 "include/linux/skbuff.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void skb_reserve(struct sk_buff *skb, unsigned int len)
{
        skb->data += len;
        skb->tail += len;
}
# 854 "include/linux/skbuff.h"
extern int ___pskb_trim(struct sk_buff *skb, unsigned int len, int realloc);

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void __skb_trim(struct sk_buff *skb, unsigned int len)
{
        if (!skb->data_len) {
                skb->len = len;
                skb->tail = skb->data + len;
        } else
                ___pskb_trim(skb, len, 0);
}
# 873 "include/linux/skbuff.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void skb_trim(struct sk_buff *skb, unsigned int len)
{
        if (skb->len > len)
                __skb_trim(skb, len);
}


static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int __pskb_trim(struct sk_buff *skb, unsigned int len)
{
        if (!skb->data_len) {
                skb->len = len;
                skb->tail = skb->data+len;
                return 0;
        }
        return ___pskb_trim(skb, len, 1);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int pskb_trim(struct sk_buff *skb, unsigned int len)
{
        return (len < skb->len) ? __pskb_trim(skb, len) : 0;
}
# 903 "include/linux/skbuff.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void skb_orphan(struct sk_buff *skb)
{
        if (skb->destructor)
                skb->destructor(skb);
        skb->destructor = ((void *)0);
        skb->sk = ((void *)0);
}
# 919 "include/linux/skbuff.h"
extern void skb_queue_purge(struct sk_buff_head *list);
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void __skb_queue_purge(struct sk_buff_head *list)
{
        struct sk_buff *skb;
        while ((skb = __skb_dequeue(list)) != ((void *)0))
                kfree_skb(skb);
}
# 939 "include/linux/skbuff.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct sk_buff *__dev_alloc_skb(unsigned int length,
                                              int gfp_mask)
{
        struct sk_buff *skb = alloc_skb(length + 16, gfp_mask);
        if (__builtin_expect(!!(skb), 1))
                skb_reserve(skb, 16);
        return skb;
}
# 960 "include/linux/skbuff.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct sk_buff *dev_alloc_skb(unsigned int length)
{
        return __dev_alloc_skb(length, (0x20));
}
# 977 "include/linux/skbuff.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int skb_cow(struct sk_buff *skb, unsigned int headroom)
{
        int delta = (headroom > 16 ? headroom : 16) - skb_headroom(skb);

        if (delta < 0)
                delta = 0;

        if (delta || skb_cloned(skb))
                return pskb_expand_head(skb, (delta + 15) & ~15, 0, (0x20));
        return 0;
}
# 1001 "include/linux/skbuff.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct sk_buff *skb_padto(struct sk_buff *skb, unsigned int len)
{
        unsigned int size = skb->len;
        if (__builtin_expect(!!(size >= len), 1))
                return skb;
        return skb_pad(skb, len-size);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int skb_add_data(struct sk_buff *skb,
                               char *from, int copy)
{
        const int off = skb->len;

        if (skb->ip_summed == 0) {
                int err = 0;
                unsigned int csum = csum_and_copy_from_user(from,
                                                            skb_put(skb, copy),
                                                            copy, 0, &err);
                if (!err) {
                        skb->csum = csum_block_add(skb->csum, csum, off);
                        return 0;
                }
        } else if (!copy_from_user(skb_put(skb, copy), from, copy))
                return 0;

        __skb_trim(skb, off);
        return -14;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int skb_can_coalesce(struct sk_buff *skb, int i,
                                   struct page *page, int off)
{
        if (i) {
                struct skb_frag_struct *frag = &((struct skb_shared_info *)((skb)->end))->frags[i - 1];

                return page == frag->page &&
                       off == frag->page_offset + frag->size;
        }
        return 0;
}
# 1050 "include/linux/skbuff.h"
extern int __skb_linearize(struct sk_buff *skb, int gfp);
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int skb_linearize(struct sk_buff *skb, int gfp)
{
        return __skb_linearize(skb, gfp);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void *kmap_skb_frag(const skb_frag_t *frag)
{

        do { if (__builtin_expect(!!(((((current_thread_info()->preempt_count) & (((1UL << (8))-1) << ((0 + 8) + 8)))))!=0), 0)) __asm__ __volatile__( "ud2\n" "\t.word %c0\n" "\t.long %c1\n" : : "i" (1059), "i" ("include/linux/skbuff.h")); } while(0);

        do { (current_thread_info()->preempt_count) += (1UL << (0 + 8)); __asm__ __volatile__("": : :"memory"); } while (0);

        return kmap_atomic(frag->page, KM_SKB_DATA_SOFTIRQ);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void kunmap_skb_frag(void *vaddr)
{
        kunmap_atomic(vaddr, KM_SKB_DATA_SOFTIRQ);

        local_bh_enable();

}







extern struct sk_buff *skb_recv_datagram(struct sock *sk, unsigned flags,
                                         int noblock, int *err);
extern unsigned int datagram_poll(struct file *file, struct socket *sock,
                                     struct poll_table_struct *wait);
extern int skb_copy_datagram(const struct sk_buff *from,
                                         int offset, char *to, int size);
extern int skb_copy_datagram_iovec(const struct sk_buff *from,
                                               int offset, struct iovec *to,
                                               int size);
extern int skb_copy_and_csum_datagram(const struct sk_buff *skb,
                                                  int offset, u8 *to,
                                                  int len, unsigned int *csump);
extern int skb_copy_and_csum_datagram_iovec(const
                                                        struct sk_buff *skb,
                                                        int hlen,
                                                        struct iovec *iov);
extern void skb_free_datagram(struct sock *sk, struct sk_buff *skb);
extern unsigned int skb_checksum(const struct sk_buff *skb, int offset,
                                    int len, unsigned int csum);
extern int skb_copy_bits(const struct sk_buff *skb, int offset,
                                     void *to, int len);
extern unsigned int skb_copy_and_csum_bits(const struct sk_buff *skb,
                                              int offset, u8 *to, int len,
                                              unsigned int csum);
extern void skb_copy_and_csum_dev(const struct sk_buff *skb, u8 *to);
extern void skb_split(struct sk_buff *skb,
                                 struct sk_buff *skb1, const u32 len);

extern void skb_init(void);
extern void skb_add_mtu(int mtu);

struct skb_iter {

        unsigned char *data;
        unsigned int len;


        unsigned int nextfrag;
        struct sk_buff *fraglist;
};


extern void skb_iter_first(const struct sk_buff *skb, struct skb_iter *i);
extern int skb_iter_next(const struct sk_buff *skb, struct skb_iter *i);

extern void skb_iter_abort(const struct sk_buff *skb, struct skb_iter *i);


static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void nf_conntrack_put(struct nf_ct_info *nfct)
{
        if (nfct && atomic_dec_and_test(&nfct->master->use))
                nfct->master->destroy(nfct->master);
}
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void nf_conntrack_get(struct nf_ct_info *nfct)
{
        if (nfct)
                atomic_inc(&nfct->master->use);
}
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void nf_reset(struct sk_buff *skb)
{
        nf_conntrack_put(skb->nfct);
        skb->nfct = ((void *)0);

        skb->nf_debug = 0;

}


static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void nf_bridge_put(struct nf_bridge_info *nf_bridge)
{
        if (nf_bridge && atomic_dec_and_test(&nf_bridge->use))
                kfree(nf_bridge);
}
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void nf_bridge_get(struct nf_bridge_info *nf_bridge)
{
        if (nf_bridge)
                atomic_inc(&nf_bridge->use);
}
# 35 "include/linux/security.h" 2
# 1 "include/linux/netlink.h" 1



# 1 "include/linux/socket.h" 1
# 11 "include/linux/socket.h"
struct __kernel_sockaddr_storage {
        unsigned short ss_family;

        char __data[128 - sizeof(unsigned short)];


} __attribute__ ((aligned((__alignof__ (struct sockaddr *)))));





# 1 "include/asm/socket.h" 1



# 1 "include/asm/sockios.h" 1
# 5 "include/asm/socket.h" 2
# 24 "include/linux/socket.h" 2
# 1 "include/linux/sockios.h" 1
# 25 "include/linux/socket.h" 2




typedef unsigned short sa_family_t;





struct sockaddr {
        sa_family_t sa_family;
        char sa_data[14];
};

struct linger {
        int l_onoff;
        int l_linger;
};
# 53 "include/linux/socket.h"
struct msghdr {
        void * msg_name;
        int msg_namelen;
        struct iovec * msg_iov;
        __kernel_size_t msg_iovlen;
        void * msg_control;
        __kernel_size_t msg_controllen;
        unsigned msg_flags;
};







struct cmsghdr {
        __kernel_size_t cmsg_len;
        int cmsg_level;
        int cmsg_type;
};
# 122 "include/linux/socket.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct cmsghdr * __cmsg_nxthdr(void *__ctl, __kernel_size_t __size,
                                               struct cmsghdr *__cmsg)
{
        struct cmsghdr * __ptr;

        __ptr = (struct cmsghdr*)(((unsigned char *) __cmsg) + ( ((__cmsg->cmsg_len)+sizeof(long)-1) & ~(sizeof(long)-1) ));
        if ((unsigned long)((char*)(__ptr+1) - (char *) __ctl) > __size)
                return (struct cmsghdr *)0;

        return __ptr;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct cmsghdr * cmsg_nxthdr (struct msghdr *__msg, struct cmsghdr *__cmsg)
{
        return __cmsg_nxthdr(__msg->msg_control, __msg->msg_controllen, __cmsg);
}







struct ucred {
        __u32 pid;
        __u32 uid;
        __u32 gid;
};
# 276 "include/linux/socket.h"
extern int memcpy_fromiovec(unsigned char *kdata, struct iovec *iov, int len);
extern int memcpy_fromiovecend(unsigned char *kdata, struct iovec *iov,
                                int offset, int len);
extern int csum_partial_copy_fromiovecend(unsigned char *kdata,
                                          struct iovec *iov,
                                          int offset,
                                          unsigned int len, int *csump);

extern int verify_iovec(struct msghdr *m, struct iovec *iov, char *address, int mode);
extern int memcpy_toiovec(struct iovec *v, unsigned char *kdata, int len);
extern void memcpy_tokerneliovec(struct iovec *iov, unsigned char *kdata, int len);
extern int move_addr_to_user(void *kaddr, int klen, void *uaddr, int *ulen);
extern int move_addr_to_kernel(void *uaddr, int ulen, void *kaddr);
extern int put_cmsg(struct msghdr*, int level, int type, int len, void *data);
# 5 "include/linux/netlink.h" 2
# 24 "include/linux/netlink.h"
struct sockaddr_nl
{
        sa_family_t nl_family;
        unsigned short nl_pad;
        __u32 nl_pid;
        __u32 nl_groups;
};

struct nlmsghdr
{
        __u32 nlmsg_len;
        __u16 nlmsg_type;
        __u16 nlmsg_flags;
        __u32 nlmsg_seq;
        __u32 nlmsg_pid;
};
# 86 "include/linux/netlink.h"
struct nlmsgerr
{
        int error;
        struct nlmsghdr msg;
};



enum {
        NETLINK_UNCONNECTED = 0,
        NETLINK_CONNECTED,
};





struct netlink_skb_parms
{
        struct ucred creds;
        __u32 pid;
        __u32 groups;
        __u32 dst_pid;
        __u32 dst_groups;
        kernel_cap_t eff_cap;
};





extern int netlink_attach(int unit, int (*function)(int,struct sk_buff *skb));
extern void netlink_detach(int unit);
extern int netlink_post(int unit, struct sk_buff *skb);
extern struct sock *netlink_kernel_create(int unit, void (*input)(struct sock *sk, int len));
extern void netlink_ack(struct sk_buff *in_skb, struct nlmsghdr *nlh, int err);
extern int netlink_unicast(struct sock *ssk, struct sk_buff *skb, __u32 pid, int nonblock);
extern int netlink_broadcast(struct sock *ssk, struct sk_buff *skb, __u32 pid,
                             __u32 group, int allocation);
extern void netlink_set_err(struct sock *ssk, __u32 pid, __u32 group, int code);
extern int netlink_register_notifier(struct notifier_block *nb);
extern int netlink_unregister_notifier(struct notifier_block *nb);


struct sock *netlink_getsockbypid(struct sock *ssk, u32 pid);
struct sock *netlink_getsockbyfilp(struct file *filp);
int netlink_attachskb(struct sock *sk, struct sk_buff *skb, int nonblock, long timeo);
void netlink_detachskb(struct sock *sk, struct sk_buff *skb);
int netlink_sendskb(struct sock *sk, struct sk_buff *skb, int protocol);


struct sock *netlink_getsockbypid(struct sock *ssk, u32 pid);
struct sock *netlink_getsockbyfilp(struct file *filp);
int netlink_attachskb(struct sock *sk, struct sk_buff *skb, int nonblock, long timeo);
void netlink_detachskb(struct sock *sk, struct sk_buff *skb);
int netlink_sendskb(struct sock *sk, struct sk_buff *skb, int protocol);
# 151 "include/linux/netlink.h"
struct netlink_callback
{
        struct sk_buff *skb;
        struct nlmsghdr *nlh;
        int (*dump)(struct sk_buff * skb, struct netlink_callback *cb);
        int (*done)(struct netlink_callback *cb);
        int family;
        long args[4];
};

struct netlink_notify
{
        int pid;
        int protocol;
};

static __inline__ __attribute__((always_inline)) struct nlmsghdr *
__nlmsg_put(struct sk_buff *skb, u32 pid, u32 seq, int type, int len)
{
        struct nlmsghdr *nlh;
        int size = ((len)+( ((sizeof(struct nlmsghdr))+4 -1) & ~(4 -1) ));

        nlh = (struct nlmsghdr*)skb_put(skb, ( ((size)+4 -1) & ~(4 -1) ));
        nlh->nlmsg_type = type;
        nlh->nlmsg_len = size;
        nlh->nlmsg_flags = 0;
        nlh->nlmsg_pid = pid;
        nlh->nlmsg_seq = seq;
        return nlh;
}





extern int netlink_dump_start(struct sock *ssk, struct sk_buff *skb,
                              struct nlmsghdr *nlh,
                              int (*dump)(struct sk_buff *skb, struct netlink_callback*),
                              int (*done)(struct netlink_callback*));




extern void netlink_set_nonroot(int protocol, unsigned flag);
# 36 "include/linux/security.h" 2





extern int cap_capable (struct task_struct *tsk, int cap);
extern int cap_ptrace (struct task_struct *parent, struct task_struct *child);
extern int cap_capget (struct task_struct *target, kernel_cap_t *effective, kernel_cap_t *inheritable, kernel_cap_t *permitted);
extern int cap_capset_check (struct task_struct *target, kernel_cap_t *effective, kernel_cap_t *inheritable, kernel_cap_t *permitted);
extern void cap_capset_set (struct task_struct *target, kernel_cap_t *effective, kernel_cap_t *inheritable, kernel_cap_t *permitted);
extern int cap_bprm_set_security (struct linux_binprm *bprm);
extern void cap_bprm_apply_creds (struct linux_binprm *bprm, int unsafe);
extern int cap_bprm_secureexec(struct linux_binprm *bprm);
extern int cap_inode_setxattr(struct dentry *dentry, char *name, void *value, size_t size, int flags);
extern int cap_inode_removexattr(struct dentry *dentry, char *name);
extern int cap_task_post_setuid (uid_t old_ruid, uid_t old_euid, uid_t old_suid, int flags);
extern void cap_task_reparent_to_init (struct task_struct *p);
extern int cap_syslog (int type);
extern int cap_vm_enough_memory (long pages);

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int cap_netlink_send (struct sock *sk, struct sk_buff *skb)
{
        (*(struct netlink_skb_parms*)&((skb)->cb)).eff_cap = get_current()->cap_effective;
        return 0;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int cap_netlink_recv (struct sk_buff *skb)
{
        if (!(((*(struct netlink_skb_parms*)&((skb)->cb)).eff_cap) & (1 << (12))))
                return -1;
        return 0;
}
# 85 "include/linux/security.h"
struct nfsctl_arg;
struct sched_param;
struct swap_info_struct;
# 1018 "include/linux/security.h"
struct security_operations {
        int (*ptrace) (struct task_struct * parent, struct task_struct * child);
        int (*capget) (struct task_struct * target,
                       kernel_cap_t * effective,
                       kernel_cap_t * inheritable, kernel_cap_t * permitted);
        int (*capset_check) (struct task_struct * target,
                             kernel_cap_t * effective,
                             kernel_cap_t * inheritable,
                             kernel_cap_t * permitted);
        void (*capset_set) (struct task_struct * target,
                            kernel_cap_t * effective,
                            kernel_cap_t * inheritable,
                            kernel_cap_t * permitted);
        int (*acct) (struct file * file);
        int (*sysctl) (ctl_table * table, int op);
        int (*capable) (struct task_struct * tsk, int cap);
        int (*quotactl) (int cmds, int type, int id, struct super_block * sb);
        int (*quota_on) (struct file * f);
        int (*syslog) (int type);
        int (*vm_enough_memory) (long pages);

        int (*bprm_alloc_security) (struct linux_binprm * bprm);
        void (*bprm_free_security) (struct linux_binprm * bprm);
        void (*bprm_apply_creds) (struct linux_binprm * bprm, int unsafe);
        int (*bprm_set_security) (struct linux_binprm * bprm);
        int (*bprm_check_security) (struct linux_binprm * bprm);
        int (*bprm_secureexec) (struct linux_binprm * bprm);

        int (*sb_alloc_security) (struct super_block * sb);
        void (*sb_free_security) (struct super_block * sb);
        int (*sb_copy_data)(struct file_system_type *type,
                            void *orig, void *copy);
        int (*sb_kern_mount) (struct super_block *sb, void *data);
        int (*sb_statfs) (struct super_block * sb);
        int (*sb_mount) (char *dev_name, struct nameidata * nd,
                         char *type, unsigned long flags, void *data);
        int (*sb_check_sb) (struct vfsmount * mnt, struct nameidata * nd);
        int (*sb_umount) (struct vfsmount * mnt, int flags);
        void (*sb_umount_close) (struct vfsmount * mnt);
        void (*sb_umount_busy) (struct vfsmount * mnt);
        void (*sb_post_remount) (struct vfsmount * mnt,
                                 unsigned long flags, void *data);
        void (*sb_post_mountroot) (void);
        void (*sb_post_addmount) (struct vfsmount * mnt,
                                  struct nameidata * mountpoint_nd);
        int (*sb_pivotroot) (struct nameidata * old_nd,
                             struct nameidata * new_nd);
        void (*sb_post_pivotroot) (struct nameidata * old_nd,
                                   struct nameidata * new_nd);

        int (*inode_alloc_security) (struct inode *inode);
        void (*inode_free_security) (struct inode *inode);
        int (*inode_create) (struct inode *dir,
                             struct dentry *dentry, int mode);
        void (*inode_post_create) (struct inode *dir,
                                   struct dentry *dentry, int mode);
        int (*inode_link) (struct dentry *old_dentry,
                           struct inode *dir, struct dentry *new_dentry);
        void (*inode_post_link) (struct dentry *old_dentry,
                                 struct inode *dir, struct dentry *new_dentry);
        int (*inode_unlink) (struct inode *dir, struct dentry *dentry);
        int (*inode_symlink) (struct inode *dir,
                              struct dentry *dentry, const char *old_name);
        void (*inode_post_symlink) (struct inode *dir,
                                    struct dentry *dentry,
                                    const char *old_name);
        int (*inode_mkdir) (struct inode *dir, struct dentry *dentry, int mode);
        void (*inode_post_mkdir) (struct inode *dir, struct dentry *dentry,
                            int mode);
        int (*inode_rmdir) (struct inode *dir, struct dentry *dentry);
        int (*inode_mknod) (struct inode *dir, struct dentry *dentry,
                            int mode, dev_t dev);
        void (*inode_post_mknod) (struct inode *dir, struct dentry *dentry,
                                  int mode, dev_t dev);
        int (*inode_rename) (struct inode *old_dir, struct dentry *old_dentry,
                             struct inode *new_dir, struct dentry *new_dentry);
        void (*inode_post_rename) (struct inode *old_dir,
                                   struct dentry *old_dentry,
                                   struct inode *new_dir,
                                   struct dentry *new_dentry);
        int (*inode_readlink) (struct dentry *dentry);
        int (*inode_follow_link) (struct dentry *dentry, struct nameidata *nd);
        int (*inode_permission) (struct inode *inode, int mask, struct nameidata *nd);
        int (*inode_setattr) (struct dentry *dentry, struct iattr *attr);
        int (*inode_getattr) (struct vfsmount *mnt, struct dentry *dentry);
        void (*inode_delete) (struct inode *inode);
        int (*inode_setxattr) (struct dentry *dentry, char *name, void *value,
                               size_t size, int flags);
        void (*inode_post_setxattr) (struct dentry *dentry, char *name, void *value,
                                     size_t size, int flags);
        int (*inode_getxattr) (struct dentry *dentry, char *name);
        int (*inode_listxattr) (struct dentry *dentry);
        int (*inode_removexattr) (struct dentry *dentry, char *name);
        int (*inode_getsecurity)(struct dentry *dentry, const char *name, void *buffer, size_t size);
        int (*inode_setsecurity)(struct dentry *dentry, const char *name, const void *value, size_t size, int flags);
        int (*inode_listsecurity)(struct dentry *dentry, char *buffer);

        int (*file_permission) (struct file * file, int mask);
        int (*file_alloc_security) (struct file * file);
        void (*file_free_security) (struct file * file);
        int (*file_ioctl) (struct file * file, unsigned int cmd,
                           unsigned long arg);
        int (*file_mmap) (struct file * file,
                          unsigned long prot, unsigned long flags);
        int (*file_mprotect) (struct vm_area_struct * vma, unsigned long prot);
        int (*file_lock) (struct file * file, unsigned int cmd);
        int (*file_fcntl) (struct file * file, unsigned int cmd,
                           unsigned long arg);
        int (*file_set_fowner) (struct file * file);
        int (*file_send_sigiotask) (struct task_struct * tsk,
                                    struct fown_struct * fown,
                                    int fd, int reason);
        int (*file_receive) (struct file * file);

        int (*task_create) (unsigned long clone_flags);
        int (*task_alloc_security) (struct task_struct * p);
        void (*task_free_security) (struct task_struct * p);
        int (*task_setuid) (uid_t id0, uid_t id1, uid_t id2, int flags);
        int (*task_post_setuid) (uid_t old_ruid ,
                                 uid_t old_euid, uid_t old_suid, int flags);
        int (*task_setgid) (gid_t id0, gid_t id1, gid_t id2, int flags);
        int (*task_setpgid) (struct task_struct * p, pid_t pgid);
        int (*task_getpgid) (struct task_struct * p);
        int (*task_getsid) (struct task_struct * p);
        int (*task_setgroups) (struct group_info *group_info);
        int (*task_setnice) (struct task_struct * p, int nice);
        int (*task_setrlimit) (unsigned int resource, struct rlimit * new_rlim);
        int (*task_setscheduler) (struct task_struct * p, int policy,
                                  struct sched_param * lp);
        int (*task_getscheduler) (struct task_struct * p);
        int (*task_kill) (struct task_struct * p,
                          struct siginfo * info, int sig);
        int (*task_wait) (struct task_struct * p);
        int (*task_prctl) (int option, unsigned long arg2,
                           unsigned long arg3, unsigned long arg4,
                           unsigned long arg5);
        void (*task_reparent_to_init) (struct task_struct * p);
        void (*task_to_inode)(struct task_struct *p, struct inode *inode);

        int (*ipc_permission) (struct kern_ipc_perm * ipcp, short flag);

        int (*msg_msg_alloc_security) (struct msg_msg * msg);
        void (*msg_msg_free_security) (struct msg_msg * msg);

        int (*msg_queue_alloc_security) (struct msg_queue * msq);
        void (*msg_queue_free_security) (struct msg_queue * msq);
        int (*msg_queue_associate) (struct msg_queue * msq, int msqflg);
        int (*msg_queue_msgctl) (struct msg_queue * msq, int cmd);
        int (*msg_queue_msgsnd) (struct msg_queue * msq,
                                 struct msg_msg * msg, int msqflg);
        int (*msg_queue_msgrcv) (struct msg_queue * msq,
                                 struct msg_msg * msg,
                                 struct task_struct * target,
                                 long type, int mode);

        int (*shm_alloc_security) (struct shmid_kernel * shp);
        void (*shm_free_security) (struct shmid_kernel * shp);
        int (*shm_associate) (struct shmid_kernel * shp, int shmflg);
        int (*shm_shmctl) (struct shmid_kernel * shp, int cmd);
        int (*shm_shmat) (struct shmid_kernel * shp,
                          char *shmaddr, int shmflg);

        int (*sem_alloc_security) (struct sem_array * sma);
        void (*sem_free_security) (struct sem_array * sma);
        int (*sem_associate) (struct sem_array * sma, int semflg);
        int (*sem_semctl) (struct sem_array * sma, int cmd);
        int (*sem_semop) (struct sem_array * sma,
                          struct sembuf * sops, unsigned nsops, int alter);

        int (*netlink_send) (struct sock * sk, struct sk_buff * skb);
        int (*netlink_recv) (struct sk_buff * skb);


        int (*register_security) (const char *name,
                                  struct security_operations *ops);
        int (*unregister_security) (const char *name,
                                    struct security_operations *ops);

        void (*d_instantiate) (struct dentry *dentry, struct inode *inode);

        int (*getprocattr)(struct task_struct *p, char *name, void *value, size_t size);
        int (*setprocattr)(struct task_struct *p, char *name, void *value, size_t size);


        int (*unix_stream_connect) (struct socket * sock,
                                    struct socket * other, struct sock * newsk);
        int (*unix_may_send) (struct socket * sock, struct socket * other);

        int (*socket_create) (int family, int type, int protocol, int kern);
        void (*socket_post_create) (struct socket * sock, int family,
                                    int type, int protocol, int kern);
        int (*socket_bind) (struct socket * sock,
                            struct sockaddr * address, int addrlen);
        int (*socket_connect) (struct socket * sock,
                               struct sockaddr * address, int addrlen);
        int (*socket_listen) (struct socket * sock, int backlog);
        int (*socket_accept) (struct socket * sock, struct socket * newsock);
        void (*socket_post_accept) (struct socket * sock,
                                    struct socket * newsock);
        int (*socket_sendmsg) (struct socket * sock,
                               struct msghdr * msg, int size);
        int (*socket_recvmsg) (struct socket * sock,
                               struct msghdr * msg, int size, int flags);
        int (*socket_getsockname) (struct socket * sock);
        int (*socket_getpeername) (struct socket * sock);
        int (*socket_getsockopt) (struct socket * sock, int level, int optname);
        int (*socket_setsockopt) (struct socket * sock, int level, int optname);
        int (*socket_shutdown) (struct socket * sock, int how);
        int (*socket_sock_rcv_skb) (struct sock * sk, struct sk_buff * skb);
        int (*socket_getpeersec) (struct socket *sock, char *optval, int *optlen, unsigned len);
        int (*sk_alloc_security) (struct sock *sk, int family, int priority);
        void (*sk_free_security) (struct sock *sk);

};


extern struct security_operations *security_ops;


static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_ptrace (struct task_struct * parent, struct task_struct * child)
{
        return security_ops->ptrace (parent, child);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_capget (struct task_struct *target,
                                   kernel_cap_t *effective,
                                   kernel_cap_t *inheritable,
                                   kernel_cap_t *permitted)
{
        return security_ops->capget (target, effective, inheritable, permitted);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_capset_check (struct task_struct *target,
                                         kernel_cap_t *effective,
                                         kernel_cap_t *inheritable,
                                         kernel_cap_t *permitted)
{
        return security_ops->capset_check (target, effective, inheritable, permitted);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void security_capset_set (struct task_struct *target,
                                        kernel_cap_t *effective,
                                        kernel_cap_t *inheritable,
                                        kernel_cap_t *permitted)
{
        security_ops->capset_set (target, effective, inheritable, permitted);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_acct (struct file *file)
{
        return security_ops->acct (file);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_sysctl(ctl_table * table, int op)
{
        return security_ops->sysctl(table, op);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_quotactl (int cmds, int type, int id,
                                     struct super_block *sb)
{
        return security_ops->quotactl (cmds, type, id, sb);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_quota_on (struct file * file)
{
        return security_ops->quota_on (file);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_syslog(int type)
{
        return security_ops->syslog(type);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_vm_enough_memory(long pages)
{
        return security_ops->vm_enough_memory(pages);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_bprm_alloc (struct linux_binprm *bprm)
{
        return security_ops->bprm_alloc_security (bprm);
}
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void security_bprm_free (struct linux_binprm *bprm)
{
        security_ops->bprm_free_security (bprm);
}
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void security_bprm_apply_creds (struct linux_binprm *bprm, int unsafe)
{
        security_ops->bprm_apply_creds (bprm, unsafe);
}
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_bprm_set (struct linux_binprm *bprm)
{
        return security_ops->bprm_set_security (bprm);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_bprm_check (struct linux_binprm *bprm)
{
        return security_ops->bprm_check_security (bprm);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_bprm_secureexec (struct linux_binprm *bprm)
{
        return security_ops->bprm_secureexec (bprm);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_sb_alloc (struct super_block *sb)
{
        return security_ops->sb_alloc_security (sb);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void security_sb_free (struct super_block *sb)
{
        security_ops->sb_free_security (sb);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_sb_copy_data (struct file_system_type *type,
                                         void *orig, void *copy)
{
        return security_ops->sb_copy_data (type, orig, copy);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_sb_kern_mount (struct super_block *sb, void *data)
{
        return security_ops->sb_kern_mount (sb, data);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_sb_statfs (struct super_block *sb)
{
        return security_ops->sb_statfs (sb);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_sb_mount (char *dev_name, struct nameidata *nd,
                                    char *type, unsigned long flags,
                                    void *data)
{
        return security_ops->sb_mount (dev_name, nd, type, flags, data);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_sb_check_sb (struct vfsmount *mnt,
                                        struct nameidata *nd)
{
        return security_ops->sb_check_sb (mnt, nd);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_sb_umount (struct vfsmount *mnt, int flags)
{
        return security_ops->sb_umount (mnt, flags);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void security_sb_umount_close (struct vfsmount *mnt)
{
        security_ops->sb_umount_close (mnt);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void security_sb_umount_busy (struct vfsmount *mnt)
{
        security_ops->sb_umount_busy (mnt);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void security_sb_post_remount (struct vfsmount *mnt,
                                             unsigned long flags, void *data)
{
        security_ops->sb_post_remount (mnt, flags, data);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void security_sb_post_mountroot (void)
{
        security_ops->sb_post_mountroot ();
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void security_sb_post_addmount (struct vfsmount *mnt,
                                              struct nameidata *mountpoint_nd)
{
        security_ops->sb_post_addmount (mnt, mountpoint_nd);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_sb_pivotroot (struct nameidata *old_nd,
                                         struct nameidata *new_nd)
{
        return security_ops->sb_pivotroot (old_nd, new_nd);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void security_sb_post_pivotroot (struct nameidata *old_nd,
                                               struct nameidata *new_nd)
{
        security_ops->sb_post_pivotroot (old_nd, new_nd);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_inode_alloc (struct inode *inode)
{
        return security_ops->inode_alloc_security (inode);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void security_inode_free (struct inode *inode)
{
        security_ops->inode_free_security (inode);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_inode_create (struct inode *dir,
                                         struct dentry *dentry,
                                         int mode)
{
        return security_ops->inode_create (dir, dentry, mode);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void security_inode_post_create (struct inode *dir,
                                               struct dentry *dentry,
                                               int mode)
{
        security_ops->inode_post_create (dir, dentry, mode);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_inode_link (struct dentry *old_dentry,
                                       struct inode *dir,
                                       struct dentry *new_dentry)
{
        return security_ops->inode_link (old_dentry, dir, new_dentry);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void security_inode_post_link (struct dentry *old_dentry,
                                             struct inode *dir,
                                             struct dentry *new_dentry)
{
        security_ops->inode_post_link (old_dentry, dir, new_dentry);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_inode_unlink (struct inode *dir,
                                         struct dentry *dentry)
{
        return security_ops->inode_unlink (dir, dentry);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_inode_symlink (struct inode *dir,
                                          struct dentry *dentry,
                                          const char *old_name)
{
        return security_ops->inode_symlink (dir, dentry, old_name);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void security_inode_post_symlink (struct inode *dir,
                                                struct dentry *dentry,
                                                const char *old_name)
{
        security_ops->inode_post_symlink (dir, dentry, old_name);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_inode_mkdir (struct inode *dir,
                                        struct dentry *dentry,
                                        int mode)
{
        return security_ops->inode_mkdir (dir, dentry, mode);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void security_inode_post_mkdir (struct inode *dir,
                                              struct dentry *dentry,
                                              int mode)
{
        security_ops->inode_post_mkdir (dir, dentry, mode);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_inode_rmdir (struct inode *dir,
                                        struct dentry *dentry)
{
        return security_ops->inode_rmdir (dir, dentry);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_inode_mknod (struct inode *dir,
                                        struct dentry *dentry,
                                        int mode, dev_t dev)
{
        return security_ops->inode_mknod (dir, dentry, mode, dev);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void security_inode_post_mknod (struct inode *dir,
                                              struct dentry *dentry,
                                              int mode, dev_t dev)
{
        security_ops->inode_post_mknod (dir, dentry, mode, dev);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_inode_rename (struct inode *old_dir,
                                         struct dentry *old_dentry,
                                         struct inode *new_dir,
                                         struct dentry *new_dentry)
{
        return security_ops->inode_rename (old_dir, old_dentry,
                                           new_dir, new_dentry);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void security_inode_post_rename (struct inode *old_dir,
                                               struct dentry *old_dentry,
                                               struct inode *new_dir,
                                               struct dentry *new_dentry)
{
        security_ops->inode_post_rename (old_dir, old_dentry,
                                                new_dir, new_dentry);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_inode_readlink (struct dentry *dentry)
{
        return security_ops->inode_readlink (dentry);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_inode_follow_link (struct dentry *dentry,
                                              struct nameidata *nd)
{
        return security_ops->inode_follow_link (dentry, nd);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_inode_permission (struct inode *inode, int mask,
                                             struct nameidata *nd)
{
        return security_ops->inode_permission (inode, mask, nd);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_inode_setattr (struct dentry *dentry,
                                          struct iattr *attr)
{
        return security_ops->inode_setattr (dentry, attr);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_inode_getattr (struct vfsmount *mnt,
                                          struct dentry *dentry)
{
        return security_ops->inode_getattr (mnt, dentry);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void security_inode_delete (struct inode *inode)
{
        security_ops->inode_delete (inode);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_inode_setxattr (struct dentry *dentry, char *name,
                                           void *value, size_t size, int flags)
{
        return security_ops->inode_setxattr (dentry, name, value, size, flags);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void security_inode_post_setxattr (struct dentry *dentry, char *name,
                                                void *value, size_t size, int flags)
{
        security_ops->inode_post_setxattr (dentry, name, value, size, flags);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_inode_getxattr (struct dentry *dentry, char *name)
{
        return security_ops->inode_getxattr (dentry, name);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_inode_listxattr (struct dentry *dentry)
{
        return security_ops->inode_listxattr (dentry);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_inode_removexattr (struct dentry *dentry, char *name)
{
        return security_ops->inode_removexattr (dentry, name);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_inode_getsecurity(struct dentry *dentry, const char *name, void *buffer, size_t size)
{
        return security_ops->inode_getsecurity(dentry, name, buffer, size);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_inode_setsecurity(struct dentry *dentry, const char *name, const void *value, size_t size, int flags)
{
        return security_ops->inode_setsecurity(dentry, name, value, size, flags);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_inode_listsecurity(struct dentry *dentry, char *buffer)
{
        return security_ops->inode_listsecurity(dentry, buffer);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_file_permission (struct file *file, int mask)
{
        return security_ops->file_permission (file, mask);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_file_alloc (struct file *file)
{
        return security_ops->file_alloc_security (file);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void security_file_free (struct file *file)
{
        security_ops->file_free_security (file);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_file_ioctl (struct file *file, unsigned int cmd,
                                       unsigned long arg)
{
        return security_ops->file_ioctl (file, cmd, arg);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_file_mmap (struct file *file, unsigned long prot,
                                      unsigned long flags)
{
        return security_ops->file_mmap (file, prot, flags);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_file_mprotect (struct vm_area_struct *vma,
                                          unsigned long prot)
{
        return security_ops->file_mprotect (vma, prot);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_file_lock (struct file *file, unsigned int cmd)
{
        return security_ops->file_lock (file, cmd);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_file_fcntl (struct file *file, unsigned int cmd,
                                       unsigned long arg)
{
        return security_ops->file_fcntl (file, cmd, arg);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_file_set_fowner (struct file *file)
{
        return security_ops->file_set_fowner (file);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_file_send_sigiotask (struct task_struct *tsk,
                                                struct fown_struct *fown,
                                                int fd, int reason)
{
        return security_ops->file_send_sigiotask (tsk, fown, fd, reason);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_file_receive (struct file *file)
{
        return security_ops->file_receive (file);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_task_create (unsigned long clone_flags)
{
        return security_ops->task_create (clone_flags);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_task_alloc (struct task_struct *p)
{
        return security_ops->task_alloc_security (p);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void security_task_free (struct task_struct *p)
{
        security_ops->task_free_security (p);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_task_setuid (uid_t id0, uid_t id1, uid_t id2,
                                        int flags)
{
        return security_ops->task_setuid (id0, id1, id2, flags);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_task_post_setuid (uid_t old_ruid, uid_t old_euid,
                                             uid_t old_suid, int flags)
{
        return security_ops->task_post_setuid (old_ruid, old_euid, old_suid, flags);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_task_setgid (gid_t id0, gid_t id1, gid_t id2,
                                        int flags)
{
        return security_ops->task_setgid (id0, id1, id2, flags);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_task_setpgid (struct task_struct *p, pid_t pgid)
{
        return security_ops->task_setpgid (p, pgid);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_task_getpgid (struct task_struct *p)
{
        return security_ops->task_getpgid (p);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_task_getsid (struct task_struct *p)
{
        return security_ops->task_getsid (p);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_task_setgroups (struct group_info *group_info)
{
        return security_ops->task_setgroups (group_info);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_task_setnice (struct task_struct *p, int nice)
{
        return security_ops->task_setnice (p, nice);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_task_setrlimit (unsigned int resource,
                                           struct rlimit *new_rlim)
{
        return security_ops->task_setrlimit (resource, new_rlim);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_task_setscheduler (struct task_struct *p,
                                              int policy,
                                              struct sched_param *lp)
{
        return security_ops->task_setscheduler (p, policy, lp);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_task_getscheduler (struct task_struct *p)
{
        return security_ops->task_getscheduler (p);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_task_kill (struct task_struct *p,
                                      struct siginfo *info, int sig)
{
        return security_ops->task_kill (p, info, sig);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_task_wait (struct task_struct *p)
{
        return security_ops->task_wait (p);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_task_prctl (int option, unsigned long arg2,
                                       unsigned long arg3,
                                       unsigned long arg4,
                                       unsigned long arg5)
{
        return security_ops->task_prctl (option, arg2, arg3, arg4, arg5);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void security_task_reparent_to_init (struct task_struct *p)
{
        security_ops->task_reparent_to_init (p);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void security_task_to_inode(struct task_struct *p, struct inode *inode)
{
        security_ops->task_to_inode(p, inode);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_ipc_permission (struct kern_ipc_perm *ipcp,
                                           short flag)
{
        return security_ops->ipc_permission (ipcp, flag);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_msg_msg_alloc (struct msg_msg * msg)
{
        return security_ops->msg_msg_alloc_security (msg);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void security_msg_msg_free (struct msg_msg * msg)
{
        security_ops->msg_msg_free_security(msg);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_msg_queue_alloc (struct msg_queue *msq)
{
        return security_ops->msg_queue_alloc_security (msq);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void security_msg_queue_free (struct msg_queue *msq)
{
        security_ops->msg_queue_free_security (msq);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_msg_queue_associate (struct msg_queue * msq,
                                                int msqflg)
{
        return security_ops->msg_queue_associate (msq, msqflg);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_msg_queue_msgctl (struct msg_queue * msq, int cmd)
{
        return security_ops->msg_queue_msgctl (msq, cmd);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_msg_queue_msgsnd (struct msg_queue * msq,
                                             struct msg_msg * msg, int msqflg)
{
        return security_ops->msg_queue_msgsnd (msq, msg, msqflg);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_msg_queue_msgrcv (struct msg_queue * msq,
                                             struct msg_msg * msg,
                                             struct task_struct * target,
                                             long type, int mode)
{
        return security_ops->msg_queue_msgrcv (msq, msg, target, type, mode);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_shm_alloc (struct shmid_kernel *shp)
{
        return security_ops->shm_alloc_security (shp);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void security_shm_free (struct shmid_kernel *shp)
{
        security_ops->shm_free_security (shp);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_shm_associate (struct shmid_kernel * shp,
                                          int shmflg)
{
        return security_ops->shm_associate(shp, shmflg);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_shm_shmctl (struct shmid_kernel * shp, int cmd)
{
        return security_ops->shm_shmctl (shp, cmd);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_shm_shmat (struct shmid_kernel * shp,
                                      char *shmaddr, int shmflg)
{
        return security_ops->shm_shmat(shp, shmaddr, shmflg);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_sem_alloc (struct sem_array *sma)
{
        return security_ops->sem_alloc_security (sma);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void security_sem_free (struct sem_array *sma)
{
        security_ops->sem_free_security (sma);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_sem_associate (struct sem_array * sma, int semflg)
{
        return security_ops->sem_associate (sma, semflg);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_sem_semctl (struct sem_array * sma, int cmd)
{
        return security_ops->sem_semctl(sma, cmd);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_sem_semop (struct sem_array * sma,
                                      struct sembuf * sops, unsigned nsops,
                                      int alter)
{
        return security_ops->sem_semop(sma, sops, nsops, alter);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void security_d_instantiate (struct dentry *dentry, struct inode *inode)
{
        security_ops->d_instantiate (dentry, inode);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_getprocattr(struct task_struct *p, char *name, void *value, size_t size)
{
        return security_ops->getprocattr(p, name, value, size);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_setprocattr(struct task_struct *p, char *name, void *value, size_t size)
{
        return security_ops->setprocattr(p, name, value, size);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_netlink_send(struct sock *sk, struct sk_buff * skb)
{
        return security_ops->netlink_send(sk, skb);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_netlink_recv(struct sk_buff * skb)
{
        return security_ops->netlink_recv(skb);
}


extern int security_scaffolding_startup (void);
extern int register_security (struct security_operations *ops);
extern int unregister_security (struct security_operations *ops);
extern int mod_reg_security (const char *name, struct security_operations *ops);
extern int mod_unreg_security (const char *name, struct security_operations *ops);
# 2520 "include/linux/security.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_unix_stream_connect(struct socket * sock,
                                               struct socket * other,
                                               struct sock * newsk)
{
        return security_ops->unix_stream_connect(sock, other, newsk);
}


static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_unix_may_send(struct socket * sock,
                                         struct socket * other)
{
        return security_ops->unix_may_send(sock, other);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_socket_create (int family, int type,
                                          int protocol, int kern)
{
        return security_ops->socket_create(family, type, protocol, kern);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void security_socket_post_create(struct socket * sock,
                                               int family,
                                               int type,
                                               int protocol, int kern)
{
        security_ops->socket_post_create(sock, family, type,
                                         protocol, kern);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_socket_bind(struct socket * sock,
                                       struct sockaddr * address,
                                       int addrlen)
{
        return security_ops->socket_bind(sock, address, addrlen);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_socket_connect(struct socket * sock,
                                          struct sockaddr * address,
                                          int addrlen)
{
        return security_ops->socket_connect(sock, address, addrlen);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_socket_listen(struct socket * sock, int backlog)
{
        return security_ops->socket_listen(sock, backlog);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_socket_accept(struct socket * sock,
                                         struct socket * newsock)
{
        return security_ops->socket_accept(sock, newsock);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void security_socket_post_accept(struct socket * sock,
                                               struct socket * newsock)
{
        security_ops->socket_post_accept(sock, newsock);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_socket_sendmsg(struct socket * sock,
                                          struct msghdr * msg, int size)
{
        return security_ops->socket_sendmsg(sock, msg, size);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_socket_recvmsg(struct socket * sock,
                                          struct msghdr * msg, int size,
                                          int flags)
{
        return security_ops->socket_recvmsg(sock, msg, size, flags);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_socket_getsockname(struct socket * sock)
{
        return security_ops->socket_getsockname(sock);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_socket_getpeername(struct socket * sock)
{
        return security_ops->socket_getpeername(sock);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_socket_getsockopt(struct socket * sock,
                                             int level, int optname)
{
        return security_ops->socket_getsockopt(sock, level, optname);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_socket_setsockopt(struct socket * sock,
                                             int level, int optname)
{
        return security_ops->socket_setsockopt(sock, level, optname);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_socket_shutdown(struct socket * sock, int how)
{
        return security_ops->socket_shutdown(sock, how);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_sock_rcv_skb (struct sock * sk,
                                         struct sk_buff * skb)
{
        return security_ops->socket_sock_rcv_skb (sk, skb);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_socket_getpeersec(struct socket *sock, char *optval,
                                             int *optlen, unsigned len)
{
        return security_ops->socket_getpeersec(sock, optval, optlen, len);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int security_sk_alloc(struct sock *sk, int family, int priority)
{
        return security_ops->sk_alloc_security(sk, family, priority);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void security_sk_free(struct sock *sk)
{
        return security_ops->sk_free_security(sk);
}
# 30 "mm/filemap.c" 2
# 38 "mm/filemap.c"
# 1 "include/linux/buffer_head.h" 1
# 16 "include/linux/buffer_head.h"
enum bh_state_bits {
        BH_Uptodate,
        BH_Dirty,
        BH_Lock,
        BH_Req,

        BH_Mapped,
        BH_New,
        BH_Async_Read,
        BH_Async_Write,
        BH_Delay,
        BH_Boundary,
        BH_Write_EIO,

        BH_PrivateStart,


};



struct page;
struct buffer_head;
struct address_space;
typedef void (bh_end_io_t)(struct buffer_head *bh, int uptodate);






struct buffer_head {

        unsigned long b_state;
        atomic_t b_count;
        struct buffer_head *b_this_page;
        struct page *b_page;

        sector_t b_blocknr;
        u32 b_size;
        char *b_data;

        struct block_device *b_bdev;
        bh_end_io_t *b_end_io;
        void *b_private;
        struct list_head b_assoc_buffers;
};
# 100 "include/linux/buffer_head.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void set_buffer_uptodate(struct buffer_head *bh) { set_bit(BH_Uptodate, &(bh)->b_state); } static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void clear_buffer_uptodate(struct buffer_head *bh) { clear_bit(BH_Uptodate, &(bh)->b_state); } static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int buffer_uptodate(struct buffer_head *bh) { return (__builtin_constant_p(BH_Uptodate) ? constant_test_bit((BH_Uptodate),(&(bh)->b_state)) : variable_test_bit((BH_Uptodate),(&(bh)->b_state))); }
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void set_buffer_dirty(struct buffer_head *bh) { set_bit(BH_Dirty, &(bh)->b_state); } static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void clear_buffer_dirty(struct buffer_head *bh) { clear_bit(BH_Dirty, &(bh)->b_state); } static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int buffer_dirty(struct buffer_head *bh) { return (__builtin_constant_p(BH_Dirty) ? constant_test_bit((BH_Dirty),(&(bh)->b_state)) : variable_test_bit((BH_Dirty),(&(bh)->b_state))); }
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int test_set_buffer_dirty(struct buffer_head *bh) { return test_and_set_bit(BH_Dirty, &(bh)->b_state); } static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int test_clear_buffer_dirty(struct buffer_head *bh) { return test_and_clear_bit(BH_Dirty, &(bh)->b_state); }
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void set_buffer_locked(struct buffer_head *bh) { set_bit(BH_Lock, &(bh)->b_state); } static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void clear_buffer_locked(struct buffer_head *bh) { clear_bit(BH_Lock, &(bh)->b_state); } static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int buffer_locked(struct buffer_head *bh) { return (__builtin_constant_p(BH_Lock) ? constant_test_bit((BH_Lock),(&(bh)->b_state)) : variable_test_bit((BH_Lock),(&(bh)->b_state))); }
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int test_set_buffer_locked(struct buffer_head *bh) { return test_and_set_bit(BH_Lock, &(bh)->b_state); } static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int test_clear_buffer_locked(struct buffer_head *bh) { return test_and_clear_bit(BH_Lock, &(bh)->b_state); }
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void set_buffer_req(struct buffer_head *bh) { set_bit(BH_Req, &(bh)->b_state); } static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void clear_buffer_req(struct buffer_head *bh) { clear_bit(BH_Req, &(bh)->b_state); } static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int buffer_req(struct buffer_head *bh) { return (__builtin_constant_p(BH_Req) ? constant_test_bit((BH_Req),(&(bh)->b_state)) : variable_test_bit((BH_Req),(&(bh)->b_state))); }
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int test_set_buffer_req(struct buffer_head *bh) { return test_and_set_bit(BH_Req, &(bh)->b_state); } static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int test_clear_buffer_req(struct buffer_head *bh) { return test_and_clear_bit(BH_Req, &(bh)->b_state); }
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void set_buffer_mapped(struct buffer_head *bh) { set_bit(BH_Mapped, &(bh)->b_state); } static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void clear_buffer_mapped(struct buffer_head *bh) { clear_bit(BH_Mapped, &(bh)->b_state); } static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int buffer_mapped(struct buffer_head *bh) { return (__builtin_constant_p(BH_Mapped) ? constant_test_bit((BH_Mapped),(&(bh)->b_state)) : variable_test_bit((BH_Mapped),(&(bh)->b_state))); }
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void set_buffer_new(struct buffer_head *bh) { set_bit(BH_New, &(bh)->b_state); } static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void clear_buffer_new(struct buffer_head *bh) { clear_bit(BH_New, &(bh)->b_state); } static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int buffer_new(struct buffer_head *bh) { return (__builtin_constant_p(BH_New) ? constant_test_bit((BH_New),(&(bh)->b_state)) : variable_test_bit((BH_New),(&(bh)->b_state))); }
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void set_buffer_async_read(struct buffer_head *bh) { set_bit(BH_Async_Read, &(bh)->b_state); } static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void clear_buffer_async_read(struct buffer_head *bh) { clear_bit(BH_Async_Read, &(bh)->b_state); } static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int buffer_async_read(struct buffer_head *bh) { return (__builtin_constant_p(BH_Async_Read) ? constant_test_bit((BH_Async_Read),(&(bh)->b_state)) : variable_test_bit((BH_Async_Read),(&(bh)->b_state))); }
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void set_buffer_async_write(struct buffer_head *bh) { set_bit(BH_Async_Write, &(bh)->b_state); } static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void clear_buffer_async_write(struct buffer_head *bh) { clear_bit(BH_Async_Write, &(bh)->b_state); } static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int buffer_async_write(struct buffer_head *bh) { return (__builtin_constant_p(BH_Async_Write) ? constant_test_bit((BH_Async_Write),(&(bh)->b_state)) : variable_test_bit((BH_Async_Write),(&(bh)->b_state))); }
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void set_buffer_delay(struct buffer_head *bh) { set_bit(BH_Delay, &(bh)->b_state); } static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void clear_buffer_delay(struct buffer_head *bh) { clear_bit(BH_Delay, &(bh)->b_state); } static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int buffer_delay(struct buffer_head *bh) { return (__builtin_constant_p(BH_Delay) ? constant_test_bit((BH_Delay),(&(bh)->b_state)) : variable_test_bit((BH_Delay),(&(bh)->b_state))); }
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void set_buffer_boundary(struct buffer_head *bh) { set_bit(BH_Boundary, &(bh)->b_state); } static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void clear_buffer_boundary(struct buffer_head *bh) { clear_bit(BH_Boundary, &(bh)->b_state); } static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int buffer_boundary(struct buffer_head *bh) { return (__builtin_constant_p(BH_Boundary) ? constant_test_bit((BH_Boundary),(&(bh)->b_state)) : variable_test_bit((BH_Boundary),(&(bh)->b_state))); }
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void set_buffer_write_io_error(struct buffer_head *bh) { set_bit(BH_Write_EIO, &(bh)->b_state); } static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void clear_buffer_write_io_error(struct buffer_head *bh) { clear_bit(BH_Write_EIO, &(bh)->b_state); } static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int buffer_write_io_error(struct buffer_head *bh) { return (__builtin_constant_p(BH_Write_EIO) ? constant_test_bit((BH_Write_EIO),(&(bh)->b_state)) : variable_test_bit((BH_Write_EIO),(&(bh)->b_state))); }
# 130 "include/linux/buffer_head.h"
void mark_buffer_dirty(struct buffer_head *bh) __attribute__((regparm(3)));
void init_buffer(struct buffer_head *, bh_end_io_t *, void *);
void set_bh_page(struct buffer_head *bh,
                struct page *page, unsigned long offset);
int try_to_free_buffers(struct page *);
void create_empty_buffers(struct page *, unsigned long,
                        unsigned long b_state);
void end_buffer_read_sync(struct buffer_head *bh, int uptodate);
void end_buffer_write_sync(struct buffer_head *bh, int uptodate);
void end_buffer_async_write(struct buffer_head *bh, int uptodate);


void buffer_insert_list(spinlock_t *lock,
                        struct buffer_head *, struct list_head *);
void mark_buffer_dirty_inode(struct buffer_head *bh, struct inode *inode);
int inode_has_buffers(struct inode *);
void invalidate_inode_buffers(struct inode *);
int remove_inode_buffers(struct inode *inode);
int fsync_buffers_list(spinlock_t *lock, struct list_head *);
int sync_mapping_buffers(struct address_space *mapping);
void unmap_underlying_metadata(struct block_device *bdev, sector_t block);

void mark_buffer_async_read(struct buffer_head *bh);
void mark_buffer_async_write(struct buffer_head *bh);
void invalidate_bdev(struct block_device *, int);
int sync_blockdev(struct block_device *bdev);
void __wait_on_buffer(struct buffer_head *);
wait_queue_head_t *bh_waitq_head(struct buffer_head *bh);
void wake_up_buffer(struct buffer_head *bh);
int fsync_bdev(struct block_device *);
struct super_block *freeze_bdev(struct block_device *);
void thaw_bdev(struct block_device *, struct super_block *);
int fsync_super(struct super_block *);
int fsync_no_super(struct block_device *);
struct buffer_head *__find_get_block(struct block_device *, sector_t, int);
struct buffer_head * __getblk(struct block_device *, sector_t, int);
void __brelse(struct buffer_head *);
void __bforget(struct buffer_head *);
void __breadahead(struct block_device *, sector_t block, int size);
struct buffer_head *__bread(struct block_device *, sector_t block, int size);
struct buffer_head *alloc_buffer_head(int gfp_flags);
void free_buffer_head(struct buffer_head * bh);
void unlock_buffer(struct buffer_head *bh) __attribute__((regparm(3)));
void __lock_buffer(struct buffer_head *bh) __attribute__((regparm(3)));
void ll_rw_block(int, int, struct buffer_head * bh[]);
void sync_dirty_buffer(struct buffer_head *bh);
void submit_bh(int, struct buffer_head *);
void write_boundary_block(struct block_device *bdev,
                        sector_t bblock, unsigned blocksize);

extern int buffer_heads_over_limit;





int try_to_release_page(struct page * page, int gfp_mask);
int block_invalidatepage(struct page *page, unsigned long offset);
int block_write_full_page(struct page *page, get_block_t *get_block,
                                struct writeback_control *wbc);
int block_read_full_page(struct page*, get_block_t*);
int block_prepare_write(struct page*, unsigned, unsigned, get_block_t*);
int cont_prepare_write(struct page*, unsigned, unsigned, get_block_t*,
                                loff_t *);
int generic_cont_expand(struct inode *inode, loff_t size) ;
int block_commit_write(struct page *page, unsigned from, unsigned to);
int block_sync_page(struct page *);
sector_t generic_block_bmap(struct address_space *, sector_t, get_block_t *);
int generic_commit_write(struct file *, struct page *, unsigned, unsigned);
int block_truncate_page(struct address_space *, loff_t, get_block_t *);
int file_fsync(struct file *, struct dentry *, int);
int nobh_prepare_write(struct page*, unsigned, unsigned, get_block_t*);
int nobh_commit_write(struct file *, struct page *, unsigned, unsigned);
int nobh_truncate_page(struct address_space *, loff_t);




int generic_osync_inode(struct inode *, struct address_space *, int);






static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void get_bh(struct buffer_head *bh)
{
        atomic_inc(&bh->b_count);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void put_bh(struct buffer_head *bh)
{
        __asm__ __volatile__("": : :"memory");
        atomic_dec(&bh->b_count);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void brelse(struct buffer_head *bh)
{
        if (bh)
                __brelse(bh);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void bforget(struct buffer_head *bh)
{
        if (bh)
                __bforget(bh);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct buffer_head *
sb_bread(struct super_block *sb, sector_t block)
{
        return __bread(sb->s_bdev, block, sb->s_blocksize);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void
sb_breadahead(struct super_block *sb, sector_t block)
{
        __breadahead(sb->s_bdev, block, sb->s_blocksize);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct buffer_head *
sb_getblk(struct super_block *sb, sector_t block)
{
        return __getblk(sb->s_bdev, block, sb->s_blocksize);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct buffer_head *
sb_find_get_block(struct super_block *sb, sector_t block)
{
        return __find_get_block(sb->s_bdev, block, sb->s_blocksize);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void
map_bh(struct buffer_head *bh, struct super_block *sb, sector_t block)
{
        set_buffer_mapped(bh);
        bh->b_bdev = sb->s_bdev;
        bh->b_blocknr = block;
}






static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void wait_on_buffer(struct buffer_head *bh)
{
        if (buffer_locked(bh) || ((&bh->b_count)->counter) == 0)
                __wait_on_buffer(bh);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void lock_buffer(struct buffer_head *bh)
{
        if (test_set_buffer_locked(bh))
                __lock_buffer(bh);
}
# 39 "mm/filemap.c" 2
# 108 "mm/filemap.c"
void __remove_from_page_cache(struct page *page)
{
        struct address_space *mapping = page->mapping;

        radix_tree_delete(&mapping->page_tree, page->index);
        page->mapping = ((void *)0);
        mapping->nrpages--;
        pagecache_acct(-1);
}

void remove_from_page_cache(struct page *page)
{
        struct address_space *mapping = page->mapping;

        if (__builtin_expect(!!(!(__builtin_constant_p(0) ? constant_test_bit((0),(&(page)->flags)) : variable_test_bit((0),(&(page)->flags)))), 0))
                do { __asm__ __volatile__( "ud2\n" "\t.word %c0\n" "\t.long %c1\n" : : "i" (123), "i" ("mm/filemap.c")); } while (0);

        do { __asm__ __volatile__("cli": : :"memory"); do { do { (current_thread_info()->preempt_count)++; } while (0); __asm__ __volatile__("": : :"memory"); } while (0); _raw_spin_lock(&mapping->tree_lock); } while (0);
        __remove_from_page_cache(page);
        do { _raw_spin_unlock(&mapping->tree_lock); __asm__ __volatile__("sti": : :"memory"); do { do { __asm__ __volatile__("": : :"memory"); do { (current_thread_info()->preempt_count)--; } while (0); } while (0); do { if (__builtin_expect(!!(test_thread_flag(3)), 0)) preempt_schedule(); } while (0); } while (0); } while (0);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int sync_page(struct page *page)
{
        struct address_space *mapping;




        asm volatile ("661:\n\t" "lock; addl $0,0(%%esp)" "\n662:\n" ".section .altinstructions,\"a\"\n" "  .align 4\n" "  .long 661b\n" "  .long 663f\n" "  .byte %c0\n" "  .byte 662b-661b\n" "  .byte 664f-663f\n" ".previous\n" ".section .altinstr_replacement,\"ax\"\n" "663:\n\t" "mfence" "\n664:\n" ".previous" :: "i" ((0*32+26)) : "memory");
        mapping = page_mapping(page);
        if (mapping && mapping->a_ops && mapping->a_ops->sync_page)
                return mapping->a_ops->sync_page(page);
        return 0;
}
# 153 "mm/filemap.c"
static int __filemap_fdatawrite(struct address_space *mapping, int sync_mode)
{
        int ret;
        struct writeback_control wbc = {
                .sync_mode = sync_mode,
                .nr_to_write = mapping->nrpages * 2,
        };

        if (mapping->backing_dev_info->memory_backed)
                return 0;

        ret = do_writepages(mapping, &wbc);
        return ret;
}

int filemap_fdatawrite(struct address_space *mapping)
{
        return __filemap_fdatawrite(mapping, WB_SYNC_ALL);
}
extern void *__crc_filemap_fdatawrite __attribute__((weak)); static const unsigned long __kcrctab_filemap_fdatawrite __attribute__((__used__)) __attribute__((section("__kcrctab" ""), unused)) = (unsigned long) &__crc_filemap_fdatawrite; static const char __kstrtab_filemap_fdatawrite[] __attribute__((section("__ksymtab_strings"))) = "" "filemap_fdatawrite"; static const struct kernel_symbol __ksymtab_filemap_fdatawrite __attribute__((__used__)) __attribute__((section("__ksymtab" ""), unused)) = { (unsigned long)&filemap_fdatawrite, __kstrtab_filemap_fdatawrite };





int filemap_flush(struct address_space *mapping)
{
        return __filemap_fdatawrite(mapping, WB_SYNC_NONE);
}
extern void *__crc_filemap_flush __attribute__((weak)); static const unsigned long __kcrctab_filemap_flush __attribute__((__used__)) __attribute__((section("__kcrctab" ""), unused)) = (unsigned long) &__crc_filemap_flush; static const char __kstrtab_filemap_flush[] __attribute__((section("__ksymtab_strings"))) = "" "filemap_flush"; static const struct kernel_symbol __ksymtab_filemap_flush __attribute__((__used__)) __attribute__((section("__ksymtab" ""), unused)) = { (unsigned long)&filemap_flush, __kstrtab_filemap_flush };





static int wait_on_page_writeback_range(struct address_space *mapping,
                                unsigned long start, unsigned long end)
{
        struct pagevec pvec;
        int nr_pages;
        int ret = 0;
        unsigned long index;

        if (end < start)
                return 0;

        pagevec_init(&pvec, 0);
        index = start;
        while ((nr_pages = pagevec_lookup_tag(&pvec, mapping, &index,
                        1,
                        ({ typeof(end - index) _x = (end - index); typeof((unsigned long)16 -1) _y = ((unsigned long)16 -1); (void) (&_x == &_y); _x < _y ? _x : _y; }) + 1)) != 0) {
                unsigned i;

                for (i = 0; i < nr_pages; i++) {
                        struct page *page = pvec.pages[i];

                        wait_on_page_writeback(page);
                        if ((__builtin_constant_p(1) ? constant_test_bit((1),(&(page)->flags)) : variable_test_bit((1),(&(page)->flags))))
                                ret = -5;
                }
                pagevec_release(&pvec);
                cond_resched();
        }


        if (test_and_clear_bit((16 + 1), &mapping->flags))
                ret = -28;
        if (test_and_clear_bit((16 + 0), &mapping->flags))
                ret = -5;

        return ret;
}







int filemap_fdatawait(struct address_space *mapping)
{
        return wait_on_page_writeback_range(mapping, 0, -1);
}

extern void *__crc_filemap_fdatawait __attribute__((weak)); static const unsigned long __kcrctab_filemap_fdatawait __attribute__((__used__)) __attribute__((section("__kcrctab" ""), unused)) = (unsigned long) &__crc_filemap_fdatawait; static const char __kstrtab_filemap_fdatawait[] __attribute__((section("__ksymtab_strings"))) = "" "filemap_fdatawait"; static const struct kernel_symbol __ksymtab_filemap_fdatawait __attribute__((__used__)) __attribute__((section("__ksymtab" ""), unused)) = { (unsigned long)&filemap_fdatawait, __kstrtab_filemap_fdatawait };

int filemap_write_and_wait(struct address_space *mapping)
{
        int retval = 0;

        if (mapping->nrpages) {
                retval = filemap_fdatawrite(mapping);
                if (retval == 0)
                        retval = filemap_fdatawait(mapping);
        }
        return retval;
}
# 258 "mm/filemap.c"
int add_to_page_cache(struct page *page, struct address_space *mapping,
                unsigned long offset, int gfp_mask)
{
        int error = radix_tree_preload(gfp_mask & ~0x02);

        if (error == 0) {
                do { __asm__ __volatile__("cli": : :"memory"); do { do { (current_thread_info()->preempt_count)++; } while (0); __asm__ __volatile__("": : :"memory"); } while (0); _raw_spin_lock(&mapping->tree_lock); } while (0);
                error = radix_tree_insert(&mapping->page_tree, offset, page);
                if (!error) {
                        get_page(page);
                        set_bit(0, &(page)->flags);
                        page->mapping = mapping;
                        page->index = offset;
                        mapping->nrpages++;
                        pagecache_acct(1);
                }
                do { _raw_spin_unlock(&mapping->tree_lock); __asm__ __volatile__("sti": : :"memory"); do { do { __asm__ __volatile__("": : :"memory"); do { (current_thread_info()->preempt_count)--; } while (0); } while (0); do { if (__builtin_expect(!!(test_thread_flag(3)), 0)) preempt_schedule(); } while (0); } while (0); } while (0);
                radix_tree_preload_end();
        }
        return error;
}

extern void *__crc_add_to_page_cache __attribute__((weak)); static const unsigned long __kcrctab_add_to_page_cache __attribute__((__used__)) __attribute__((section("__kcrctab" ""), unused)) = (unsigned long) &__crc_add_to_page_cache; static const char __kstrtab_add_to_page_cache[] __attribute__((section("__ksymtab_strings"))) = "" "add_to_page_cache"; static const struct kernel_symbol __ksymtab_add_to_page_cache __attribute__((__used__)) __attribute__((section("__ksymtab" ""), unused)) = { (unsigned long)&add_to_page_cache, __kstrtab_add_to_page_cache };

int add_to_page_cache_lru(struct page *page, struct address_space *mapping,
                                unsigned long offset, int gfp_mask)
{
        int ret = add_to_page_cache(page, mapping, offset, gfp_mask);
        if (ret == 0)
                lru_cache_add(page);
        return ret;
}
# 301 "mm/filemap.c"
struct page_wait_queue {
        struct page *page;
        int bit;
        wait_queue_t wait;
};

static int page_wake_function(wait_queue_t *wait, unsigned mode, int sync, void *key)
{
        struct page *page = key;
        struct page_wait_queue *wq;

        wq = ({ const typeof( ((struct page_wait_queue *)0)->wait ) *__mptr = (wait); (struct page_wait_queue *)( (char *)__mptr - ((size_t) &((struct page_wait_queue *)0)->wait) );});
        if (wq->page != page || (__builtin_constant_p(wq->bit) ? constant_test_bit((wq->bit),(&page->flags)) : variable_test_bit((wq->bit),(&page->flags))))
                return 0;
        else
                return autoremove_wake_function(wait, mode, sync, ((void *)0));
}
# 335 "mm/filemap.c"
static wait_queue_head_t *page_waitqueue(struct page *page)
{
        const struct zone *zone = page_zone(page);

        return &zone->wait_table[hash_ptr(page, zone->wait_table_bits)];
}

static void wake_up_page(struct page *page)
{
        const unsigned int mode = 2 | 1;
        wait_queue_head_t *waitqueue = page_waitqueue(page);

        if (waitqueue_active(waitqueue))
                __wake_up(waitqueue, mode, 1, page);
}

void __attribute__((regparm(3))) wait_on_page_bit(struct page *page, int bit_nr)
{
        wait_queue_head_t *waitqueue = page_waitqueue(page);
        struct page_wait_queue wait = { .page = page, .bit = bit_nr, .wait = { .task = get_current(), .func = page_wake_function, .flags = 0, .task_list = { &(wait.wait.task_list), &(wait.wait.task_list) }, }, };

        do {
                prepare_to_wait(waitqueue, &wait.wait, 2);
                if ((__builtin_constant_p(bit_nr) ? constant_test_bit((bit_nr),(&page->flags)) : variable_test_bit((bit_nr),(&page->flags)))) {
                        sync_page(page);
                        io_schedule();
                }
        } while ((__builtin_constant_p(bit_nr) ? constant_test_bit((bit_nr),(&page->flags)) : variable_test_bit((bit_nr),(&page->flags))));
        finish_wait(waitqueue, &wait.wait);
}

extern void *__crc_wait_on_page_bit __attribute__((weak)); static const unsigned long __kcrctab_wait_on_page_bit __attribute__((__used__)) __attribute__((section("__kcrctab" ""), unused)) = (unsigned long) &__crc_wait_on_page_bit; static const char __kstrtab_wait_on_page_bit[] __attribute__((section("__ksymtab_strings"))) = "" "wait_on_page_bit"; static const struct kernel_symbol __ksymtab_wait_on_page_bit __attribute__((__used__)) __attribute__((section("__ksymtab" ""), unused)) = { (unsigned long)&wait_on_page_bit, __kstrtab_wait_on_page_bit };
# 383 "mm/filemap.c"
void __attribute__((regparm(3))) unlock_page(struct page *page)
{
        __asm__ __volatile__("": : :"memory");
        if (!test_and_clear_bit(0, &(page)->flags))
                __asm__ __volatile__( "ud2\n" "\t.word %c0\n" "\t.long %c1\n" : : "i" (387), "i" ("mm/filemap.c"));
        __asm__ __volatile__("": : :"memory");
        wake_up_page(page);
}

extern void *__crc_unlock_page __attribute__((weak)); static const unsigned long __kcrctab_unlock_page __attribute__((__used__)) __attribute__((section("__kcrctab" ""), unused)) = (unsigned long) &__crc_unlock_page; static const char __kstrtab_unlock_page[] __attribute__((section("__ksymtab_strings"))) = "" "unlock_page"; static const struct kernel_symbol __ksymtab_unlock_page __attribute__((__used__)) __attribute__((section("__ksymtab" ""), unused)) = { (unsigned long)&unlock_page, __kstrtab_unlock_page };
extern void *__crc_lock_page __attribute__((weak)); static const unsigned long __kcrctab_lock_page __attribute__((__used__)) __attribute__((section("__kcrctab" ""), unused)) = (unsigned long) &__crc_lock_page; static const char __kstrtab_lock_page[] __attribute__((section("__ksymtab_strings"))) = "" "lock_page"; static const struct kernel_symbol __ksymtab_lock_page __attribute__((__used__)) __attribute__((section("__ksymtab" ""), unused)) = { (unsigned long)&lock_page, __kstrtab_lock_page };




void end_page_writeback(struct page *page)
{
        if (!test_and_clear_bit(18, &(page)->flags) || rotate_reclaimable_page(page)) {
                if (!test_clear_page_writeback(page))
                        __asm__ __volatile__( "ud2\n" "\t.word %c0\n" "\t.long %c1\n" : : "i" (402), "i" ("mm/filemap.c"));
                __asm__ __volatile__("": : :"memory");
        }
        wake_up_page(page);
}

extern void *__crc_end_page_writeback __attribute__((weak)); static const unsigned long __kcrctab_end_page_writeback __attribute__((__used__)) __attribute__((section("__kcrctab" ""), unused)) = (unsigned long) &__crc_end_page_writeback; static const char __kstrtab_end_page_writeback[] __attribute__((section("__ksymtab_strings"))) = "" "end_page_writeback"; static const struct kernel_symbol __ksymtab_end_page_writeback __attribute__((__used__)) __attribute__((section("__ksymtab" ""), unused)) = { (unsigned long)&end_page_writeback, __kstrtab_end_page_writeback };
# 418 "mm/filemap.c"
void __attribute__((regparm(3))) __lock_page(struct page *page)
{
        wait_queue_head_t *wqh = page_waitqueue(page);
        struct page_wait_queue wait = { .page = page, .bit = 0, .wait = { .task = get_current(), .func = page_wake_function, .flags = 0x01, .task_list = { &(wait.wait.task_list), &(wait.wait.task_list) }, }, };

        while (test_and_set_bit(0, &(page)->flags)) {
                prepare_to_wait_exclusive(wqh, &wait.wait, 2);
                if ((__builtin_constant_p(0) ? constant_test_bit((0),(&(page)->flags)) : variable_test_bit((0),(&(page)->flags)))) {
                        sync_page(page);
                        io_schedule();
                }
        }
        finish_wait(wqh, &wait.wait);
}

extern void *__crc___lock_page __attribute__((weak)); static const unsigned long __kcrctab___lock_page __attribute__((__used__)) __attribute__((section("__kcrctab" ""), unused)) = (unsigned long) &__crc___lock_page; static const char __kstrtab___lock_page[] __attribute__((section("__ksymtab_strings"))) = "" "__lock_page"; static const struct kernel_symbol __ksymtab___lock_page __attribute__((__used__)) __attribute__((section("__ksymtab" ""), unused)) = { (unsigned long)&__lock_page, __kstrtab___lock_page };





struct page * find_get_page(struct address_space *mapping, unsigned long offset)
{
        struct page *page;

        do { __asm__ __volatile__("cli": : :"memory"); do { do { (current_thread_info()->preempt_count)++; } while (0); __asm__ __volatile__("": : :"memory"); } while (0); _raw_spin_lock(&mapping->tree_lock); } while (0);
        page = radix_tree_lookup(&mapping->page_tree, offset);
        if (page)
                get_page(page);
        do { _raw_spin_unlock(&mapping->tree_lock); __asm__ __volatile__("sti": : :"memory"); do { do { __asm__ __volatile__("": : :"memory"); do { (current_thread_info()->preempt_count)--; } while (0); } while (0); do { if (__builtin_expect(!!(test_thread_flag(3)), 0)) preempt_schedule(); } while (0); } while (0); } while (0);
        return page;
}

extern void *__crc_find_get_page __attribute__((weak)); static const unsigned long __kcrctab_find_get_page __attribute__((__used__)) __attribute__((section("__kcrctab" ""), unused)) = (unsigned long) &__crc_find_get_page; static const char __kstrtab_find_get_page[] __attribute__((section("__ksymtab_strings"))) = "" "find_get_page"; static const struct kernel_symbol __ksymtab_find_get_page __attribute__((__used__)) __attribute__((section("__ksymtab" ""), unused)) = { (unsigned long)&find_get_page, __kstrtab_find_get_page };




struct page *find_trylock_page(struct address_space *mapping, unsigned long offset)
{
        struct page *page;

        do { __asm__ __volatile__("cli": : :"memory"); do { do { (current_thread_info()->preempt_count)++; } while (0); __asm__ __volatile__("": : :"memory"); } while (0); _raw_spin_lock(&mapping->tree_lock); } while (0);
        page = radix_tree_lookup(&mapping->page_tree, offset);
        if (page && test_and_set_bit(0, &(page)->flags))
                page = ((void *)0);
        do { _raw_spin_unlock(&mapping->tree_lock); __asm__ __volatile__("sti": : :"memory"); do { do { __asm__ __volatile__("": : :"memory"); do { (current_thread_info()->preempt_count)--; } while (0); } while (0); do { if (__builtin_expect(!!(test_thread_flag(3)), 0)) preempt_schedule(); } while (0); } while (0); } while (0);
        return page;
}

extern void *__crc_find_trylock_page __attribute__((weak)); static const unsigned long __kcrctab_find_trylock_page __attribute__((__used__)) __attribute__((section("__kcrctab" ""), unused)) = (unsigned long) &__crc_find_trylock_page; static const char __kstrtab_find_trylock_page[] __attribute__((section("__ksymtab_strings"))) = "" "find_trylock_page"; static const struct kernel_symbol __ksymtab_find_trylock_page __attribute__((__used__)) __attribute__((section("__ksymtab" ""), unused)) = { (unsigned long)&find_trylock_page, __kstrtab_find_trylock_page };
# 481 "mm/filemap.c"
struct page *find_lock_page(struct address_space *mapping,
                                unsigned long offset)
{
        struct page *page;

        do { __asm__ __volatile__("cli": : :"memory"); do { do { (current_thread_info()->preempt_count)++; } while (0); __asm__ __volatile__("": : :"memory"); } while (0); _raw_spin_lock(&mapping->tree_lock); } while (0);
repeat:
        page = radix_tree_lookup(&mapping->page_tree, offset);
        if (page) {
                get_page(page);
                if (test_and_set_bit(0, &(page)->flags)) {
                        do { _raw_spin_unlock(&mapping->tree_lock); __asm__ __volatile__("sti": : :"memory"); do { do { __asm__ __volatile__("": : :"memory"); do { (current_thread_info()->preempt_count)--; } while (0); } while (0); do { if (__builtin_expect(!!(test_thread_flag(3)), 0)) preempt_schedule(); } while (0); } while (0); } while (0);
                        lock_page(page);
                        do { __asm__ __volatile__("cli": : :"memory"); do { do { (current_thread_info()->preempt_count)++; } while (0); __asm__ __volatile__("": : :"memory"); } while (0); _raw_spin_lock(&mapping->tree_lock); } while (0);


                        if (page->mapping != mapping || page->index != offset) {
                                unlock_page(page);
                                put_page(page);
                                goto repeat;
                        }
                }
        }
        do { _raw_spin_unlock(&mapping->tree_lock); __asm__ __volatile__("sti": : :"memory"); do { do { __asm__ __volatile__("": : :"memory"); do { (current_thread_info()->preempt_count)--; } while (0); } while (0); do { if (__builtin_expect(!!(test_thread_flag(3)), 0)) preempt_schedule(); } while (0); } while (0); } while (0);
        return page;
}

extern void *__crc_find_lock_page __attribute__((weak)); static const unsigned long __kcrctab_find_lock_page __attribute__((__used__)) __attribute__((section("__kcrctab" ""), unused)) = (unsigned long) &__crc_find_lock_page; static const char __kstrtab_find_lock_page[] __attribute__((section("__ksymtab_strings"))) = "" "find_lock_page"; static const struct kernel_symbol __ksymtab_find_lock_page __attribute__((__used__)) __attribute__((section("__ksymtab" ""), unused)) = { (unsigned long)&find_lock_page, __kstrtab_find_lock_page };
# 528 "mm/filemap.c"
struct page *find_or_create_page(struct address_space *mapping,
                unsigned long index, unsigned int gfp_mask)
{
        struct page *page, *cached_page = ((void *)0);
        int err;
repeat:
        page = find_lock_page(mapping, index);
        if (!page) {
                if (!cached_page) {
                        cached_page = alloc_pages_node(((0)), gfp_mask, 0);
                        if (!cached_page)
                                return ((void *)0);
                }
                err = add_to_page_cache_lru(cached_page, mapping,
                                        index, gfp_mask);
                if (!err) {
                        page = cached_page;
                        cached_page = ((void *)0);
                } else if (err == -17)
                        goto repeat;
        }
        if (cached_page)
                put_page(cached_page);
        return page;
}

extern void *__crc_find_or_create_page __attribute__((weak)); static const unsigned long __kcrctab_find_or_create_page __attribute__((__used__)) __attribute__((section("__kcrctab" ""), unused)) = (unsigned long) &__crc_find_or_create_page; static const char __kstrtab_find_or_create_page[] __attribute__((section("__ksymtab_strings"))) = "" "find_or_create_page"; static const struct kernel_symbol __ksymtab_find_or_create_page __attribute__((__used__)) __attribute__((section("__ksymtab" ""), unused)) = { (unsigned long)&find_or_create_page, __kstrtab_find_or_create_page };
# 572 "mm/filemap.c"
unsigned find_get_pages(struct address_space *mapping, unsigned long start,
                            unsigned int nr_pages, struct page **pages)
{
        unsigned int i;
        unsigned int ret;

        do { __asm__ __volatile__("cli": : :"memory"); do { do { (current_thread_info()->preempt_count)++; } while (0); __asm__ __volatile__("": : :"memory"); } while (0); _raw_spin_lock(&mapping->tree_lock); } while (0);
        ret = radix_tree_gang_lookup(&mapping->page_tree,
                                (void **)pages, start, nr_pages);
        for (i = 0; i < ret; i++)
                get_page(pages[i]);
        do { _raw_spin_unlock(&mapping->tree_lock); __asm__ __volatile__("sti": : :"memory"); do { do { __asm__ __volatile__("": : :"memory"); do { (current_thread_info()->preempt_count)--; } while (0); } while (0); do { if (__builtin_expect(!!(test_thread_flag(3)), 0)) preempt_schedule(); } while (0); } while (0); } while (0);
        return ret;
}





unsigned find_get_pages_tag(struct address_space *mapping, unsigned long *index,
                        int tag, unsigned int nr_pages, struct page **pages)
{
        unsigned int i;
        unsigned int ret;

        do { __asm__ __volatile__("cli": : :"memory"); do { do { (current_thread_info()->preempt_count)++; } while (0); __asm__ __volatile__("": : :"memory"); } while (0); _raw_spin_lock(&mapping->tree_lock); } while (0);
        ret = radix_tree_gang_lookup_tag(&mapping->page_tree,
                                (void **)pages, *index, nr_pages, tag);
        for (i = 0; i < ret; i++)
                get_page(pages[i]);
        if (ret)
                *index = pages[ret - 1]->index + 1;
        do { _raw_spin_unlock(&mapping->tree_lock); __asm__ __volatile__("sti": : :"memory"); do { do { __asm__ __volatile__("": : :"memory"); do { (current_thread_info()->preempt_count)--; } while (0); } while (0); do { if (__builtin_expect(!!(test_thread_flag(3)), 0)) preempt_schedule(); } while (0); } while (0); } while (0);
        return ret;
}
# 617 "mm/filemap.c"
struct page *
grab_cache_page_nowait(struct address_space *mapping, unsigned long index)
{
        struct page *page = find_get_page(mapping, index);
        int gfp_mask;

        if (page) {
                if (!test_and_set_bit(0, &(page)->flags))
                        return page;
                put_page(page);
                return ((void *)0);
        }
        gfp_mask = mapping_gfp_mask(mapping) & ~0x80;
        page = alloc_pages_node(((0)), gfp_mask, 0);
        if (page && add_to_page_cache_lru(page, mapping, index, gfp_mask)) {
                put_page(page);
                page = ((void *)0);
        }
        return page;
}

extern void *__crc_grab_cache_page_nowait __attribute__((weak)); static const unsigned long __kcrctab_grab_cache_page_nowait __attribute__((__used__)) __attribute__((section("__kcrctab" ""), unused)) = (unsigned long) &__crc_grab_cache_page_nowait; static const char __kstrtab_grab_cache_page_nowait[] __attribute__((section("__ksymtab_strings"))) = "" "grab_cache_page_nowait"; static const struct kernel_symbol __ksymtab_grab_cache_page_nowait __attribute__((__used__)) __attribute__((section("__ksymtab" ""), unused)) = { (unsigned long)&grab_cache_page_nowait, __kstrtab_grab_cache_page_nowait };
# 649 "mm/filemap.c"
void do_generic_mapping_read(struct address_space *mapping,
                             struct file_ra_state *_ra,
                             struct file * filp,
                             loff_t *ppos,
                             read_descriptor_t * desc,
                             read_actor_t actor)
{
        struct inode *inode = mapping->host;
        unsigned long index, end_index, offset;
        loff_t isize;
        struct page *cached_page;
        int error;
        struct file_ra_state ra = *_ra;

        cached_page = ((void *)0);
        index = *ppos >> 12;
        offset = *ppos & ~(~((1UL << 12)-1));

        isize = i_size_read(inode);
        end_index = isize >> 12;
        if (index > end_index)
                goto out;

        for (;;) {
                struct page *page;
                unsigned long nr, ret;

                cond_resched();
                page_cache_readahead(mapping, &ra, filp, index);

find_page:
                page = find_get_page(mapping, index);
                if (__builtin_expect(!!(page == ((void *)0)), 0)) {
                        handle_ra_miss(mapping, &ra, index);
                        goto no_cached_page;
                }
                if (!(__builtin_constant_p(3) ? constant_test_bit((3),(&(page)->flags)) : variable_test_bit((3),(&(page)->flags))))
                        goto page_not_up_to_date;
page_ok:

                nr = (1UL << 12);
                if (index == end_index) {
                        nr = isize & ~(~((1UL << 12)-1));
                        if (nr <= offset) {
                                put_page(page);
                                goto out;
                        }
                }
                nr = nr - offset;





                if (mapping_writably_mapped(mapping))
                        do { } while (0);




                if (!offset)
                        mark_page_accessed(page);
# 722 "mm/filemap.c"
                ret = actor(desc, page, offset, nr);
                offset += ret;
                index += offset >> 12;
                offset &= ~(~((1UL << 12)-1));

                put_page(page);
                if (ret == nr && desc->count)
                        continue;
                goto out;

page_not_up_to_date:

                lock_page(page);


                if (!page->mapping) {
                        unlock_page(page);
                        put_page(page);
                        continue;
                }


                if ((__builtin_constant_p(3) ? constant_test_bit((3),(&(page)->flags)) : variable_test_bit((3),(&(page)->flags)))) {
                        unlock_page(page);
                        goto page_ok;
                }

readpage:

                error = mapping->a_ops->readpage(filp, page);

                if (__builtin_expect(!!(error), 0))
                        goto readpage_error;

                if (!(__builtin_constant_p(3) ? constant_test_bit((3),(&(page)->flags)) : variable_test_bit((3),(&(page)->flags)))) {
                        wait_on_page_locked(page);
                        if (!(__builtin_constant_p(3) ? constant_test_bit((3),(&(page)->flags)) : variable_test_bit((3),(&(page)->flags)))) {
                                error = -5;
                                goto readpage_error;
                        }
                }
# 772 "mm/filemap.c"
                isize = i_size_read(inode);
                end_index = isize >> 12;
                if (index > end_index) {
                        put_page(page);
                        goto out;
                }
                goto page_ok;

readpage_error:

                desc->error = error;
                put_page(page);
                goto out;

no_cached_page:




                if (!cached_page) {
                        cached_page = page_cache_alloc_cold(mapping);
                        if (!cached_page) {
                                desc->error = -12;
                                goto out;
                        }
                }
                error = add_to_page_cache_lru(cached_page, mapping,
                                                index, (0x10 | 0x40 | 0x80));
                if (error) {
                        if (error == -17)
                                goto find_page;
                        desc->error = error;
                        goto out;
                }
                page = cached_page;
                cached_page = ((void *)0);
                goto readpage;
        }

out:
        *_ra = ra;

        *ppos = ((loff_t) index << 12) + offset;
        if (cached_page)
                put_page(cached_page);
        file_accessed(filp);
}

extern void *__crc_do_generic_mapping_read __attribute__((weak)); static const unsigned long __kcrctab_do_generic_mapping_read __attribute__((__used__)) __attribute__((section("__kcrctab" ""), unused)) = (unsigned long) &__crc_do_generic_mapping_read; static const char __kstrtab_do_generic_mapping_read[] __attribute__((section("__ksymtab_strings"))) = "" "do_generic_mapping_read"; static const struct kernel_symbol __ksymtab_do_generic_mapping_read __attribute__((__used__)) __attribute__((section("__ksymtab" ""), unused)) = { (unsigned long)&do_generic_mapping_read, __kstrtab_do_generic_mapping_read };

int file_read_actor(read_descriptor_t *desc, struct page *page,
                        unsigned long offset, unsigned long size)
{
        char *kaddr;
        unsigned long left, count = desc->count;

        if (size > count)
                size = count;





        if (!fault_in_pages_writeable(desc->arg.buf, size)) {
                kaddr = kmap_atomic(page, KM_USER0);
                left = __copy_to_user(desc->arg.buf, kaddr + offset, size);
                kunmap_atomic(kaddr, KM_USER0);
                if (left == 0)
                        goto success;
        }


        kaddr = kmap(page);
        left = __copy_to_user(desc->arg.buf, kaddr + offset, size);
        kunmap(page);

        if (left) {
                size -= left;
                desc->error = -14;
        }
success:
        desc->count = count - size;
        desc->written += size;
        desc->arg.buf += size;
        return size;
}





ssize_t
__generic_file_aio_read(struct kiocb *iocb, const struct iovec *iov,
                unsigned long nr_segs, loff_t *ppos)
{
        struct file *filp = iocb->ki_filp;
        ssize_t retval;
        unsigned long seg;
        size_t count;

        count = 0;
        for (seg = 0; seg < nr_segs; seg++) {
                const struct iovec *iv = &iov[seg];





                count += iv->iov_len;
                if (__builtin_expect(!!((ssize_t)(count|iv->iov_len) < 0), 0))
                        return -22;
                if ((__builtin_expect(!!(({ unsigned long flag,sum; (void)0; asm("addl %3,%1 ; sbbl %0,%0; cmpl %1,%4; sbbl $0,%0" :"=&r" (flag), "=r" (sum) :"1" (iv->iov_base),"g" ((int)(iv->iov_len)),"g" (current_thread_info()->addr_limit.seg)); flag; }) == 0), 1)))
                        continue;
                if (seg == 0)
                        return -14;
                nr_segs = seg;
                count -= iv->iov_len;
                break;
        }


        if (filp->f_flags & 040000) {
                loff_t pos = *ppos, size;
                struct address_space *mapping;
                struct inode *inode;

                mapping = filp->f_mapping;
                inode = mapping->host;
                retval = 0;
                if (!count)
                        goto out;
                size = i_size_read(inode);
                if (pos < size) {
                        retval = generic_file_direct_IO(0, iocb,
                                                iov, pos, nr_segs);
                        if (retval >= 0 && !((iocb)->ki_key == (~0U)))
                                retval = -529;
                        if (retval > 0)
                                *ppos = pos + retval;
                }
                file_accessed(filp);
                goto out;
        }

        retval = 0;
        if (count) {
                for (seg = 0; seg < nr_segs; seg++) {
                        read_descriptor_t desc;

                        desc.written = 0;
                        desc.arg.buf = iov[seg].iov_base;
                        desc.count = iov[seg].iov_len;
                        if (desc.count == 0)
                                continue;
                        desc.error = 0;
                        do_generic_file_read(filp,ppos,&desc,file_read_actor);
                        retval += desc.written;
                        if (!retval) {
                                retval = desc.error;
                                break;
                        }
                }
        }
out:
        return retval;
}

extern void *__crc___generic_file_aio_read __attribute__((weak)); static const unsigned long __kcrctab___generic_file_aio_read __attribute__((__used__)) __attribute__((section("__kcrctab" ""), unused)) = (unsigned long) &__crc___generic_file_aio_read; static const char __kstrtab___generic_file_aio_read[] __attribute__((section("__ksymtab_strings"))) = "" "__generic_file_aio_read"; static const struct kernel_symbol __ksymtab___generic_file_aio_read __attribute__((__used__)) __attribute__((section("__ksymtab" ""), unused)) = { (unsigned long)&__generic_file_aio_read, __kstrtab___generic_file_aio_read };

ssize_t
generic_file_aio_read(struct kiocb *iocb, char *buf, size_t count, loff_t pos)
{
        struct iovec local_iov = { .iov_base = buf, .iov_len = count };

        do { if (__builtin_expect(!!((iocb->ki_pos != pos)!=0), 0)) __asm__ __volatile__( "ud2\n" "\t.word %c0\n" "\t.long %c1\n" : : "i" (946), "i" ("mm/filemap.c")); } while(0);
        return __generic_file_aio_read(iocb, &local_iov, 1, &iocb->ki_pos);
}

extern void *__crc_generic_file_aio_read __attribute__((weak)); static const unsigned long __kcrctab_generic_file_aio_read __attribute__((__used__)) __attribute__((section("__kcrctab" ""), unused)) = (unsigned long) &__crc_generic_file_aio_read; static const char __kstrtab_generic_file_aio_read[] __attribute__((section("__ksymtab_strings"))) = "" "generic_file_aio_read"; static const struct kernel_symbol __ksymtab_generic_file_aio_read __attribute__((__used__)) __attribute__((section("__ksymtab" ""), unused)) = { (unsigned long)&generic_file_aio_read, __kstrtab_generic_file_aio_read };

ssize_t
generic_file_read(struct file *filp, char *buf, size_t count, loff_t *ppos)
{
        struct iovec local_iov = { .iov_base = buf, .iov_len = count };
        struct kiocb kiocb;
        ssize_t ret;

        do { struct task_struct *tsk = get_current(); (&kiocb)->ki_flags = 0; (&kiocb)->ki_users = 1; (&kiocb)->ki_key = (~0U); (&kiocb)->ki_filp = (filp); (&kiocb)->ki_ctx = &tsk->active_mm->default_kioctx; (&kiocb)->ki_cancel = ((void *)0); (&kiocb)->ki_dtor = ((void *)0); (&kiocb)->ki_obj.tsk = tsk; } while (0);
        ret = __generic_file_aio_read(&kiocb, &local_iov, 1, ppos);
        if (-529 == ret)
                ret = wait_on_sync_kiocb(&kiocb);
        return ret;
}

extern void *__crc_generic_file_read __attribute__((weak)); static const unsigned long __kcrctab_generic_file_read __attribute__((__used__)) __attribute__((section("__kcrctab" ""), unused)) = (unsigned long) &__crc_generic_file_read; static const char __kstrtab_generic_file_read[] __attribute__((section("__ksymtab_strings"))) = "" "generic_file_read"; static const struct kernel_symbol __ksymtab_generic_file_read __attribute__((__used__)) __attribute__((section("__ksymtab" ""), unused)) = { (unsigned long)&generic_file_read, __kstrtab_generic_file_read };

int file_send_actor(read_descriptor_t * desc, struct page *page, unsigned long offset, unsigned long size)
{
        ssize_t written;
        unsigned long count = desc->count;
        struct file *file = desc->arg.data;

        if (size > count)
                size = count;

        written = file->f_op->sendpage(file, page, offset,
                                       size, &file->f_pos, size<count);
        if (written < 0) {
                desc->error = written;
                written = 0;
        }
        desc->count = count - written;
        desc->written += written;
        return written;
}

ssize_t generic_file_sendfile(struct file *in_file, loff_t *ppos,
                         size_t count, read_actor_t actor, void *target)
{
        read_descriptor_t desc;

        if (!count)
                return 0;

        desc.written = 0;
        desc.count = count;
        desc.arg.data = target;
        desc.error = 0;

        do_generic_file_read(in_file, ppos, &desc, actor);
        if (desc.written)
                return desc.written;
        return desc.error;
}

extern void *__crc_generic_file_sendfile __attribute__((weak)); static const unsigned long __kcrctab_generic_file_sendfile __attribute__((__used__)) __attribute__((section("__kcrctab" ""), unused)) = (unsigned long) &__crc_generic_file_sendfile; static const char __kstrtab_generic_file_sendfile[] __attribute__((section("__ksymtab_strings"))) = "" "generic_file_sendfile"; static const struct kernel_symbol __ksymtab_generic_file_sendfile __attribute__((__used__)) __attribute__((section("__ksymtab" ""), unused)) = { (unsigned long)&generic_file_sendfile, __kstrtab_generic_file_sendfile };

static ssize_t
do_readahead(struct address_space *mapping, struct file *filp,
             unsigned long index, unsigned long nr)
{
        if (!mapping || !mapping->a_ops || !mapping->a_ops->readpage)
                return -22;

        force_page_cache_readahead(mapping, filp, index,
                                        max_sane_readahead(nr));
        return 0;
}

 __attribute__((regparm(0))) ssize_t sys_readahead(int fd, loff_t offset, size_t count)
{
        ssize_t ret;
        struct file *file;

        ret = -9;
        file = fget(fd);
        if (file) {
                if (file->f_mode & 1) {
                        struct address_space *mapping = file->f_mapping;
                        unsigned long start = offset >> 12;
                        unsigned long end = (offset + count - 1) >> 12;
                        unsigned long len = end - start + 1;
                        ret = do_readahead(mapping, file, start, len);
                }
                fput(file);
        }
        return ret;
}






static int page_cache_read(struct file * file, unsigned long offset) __attribute__((regparm(3)));
static int __attribute__((regparm(3))) page_cache_read(struct file * file, unsigned long offset)
{
        struct address_space *mapping = file->f_mapping;
        struct page *page;
        int error;

        page = page_cache_alloc_cold(mapping);
        if (!page)
                return -12;

        error = add_to_page_cache_lru(page, mapping, offset, (0x10 | 0x40 | 0x80));
        if (!error) {
                error = mapping->a_ops->readpage(file, page);
                put_page(page);
                return error;
        }






        put_page(page);
        return error == -17 ? 0 : error;
}
# 1083 "mm/filemap.c"
struct page * filemap_nopage(struct vm_area_struct * area, unsigned long address, int *type)
{
        int error;
        struct file *file = area->vm_file;
        struct address_space *mapping = file->f_mapping;
        struct file_ra_state *ra = &file->f_ra;
        struct inode *inode = mapping->host;
        struct page *page;
        unsigned long size, pgoff, endoff;
        int did_readaround = 0, majmin = 1;

        pgoff = ((address - area->vm_start) >> 12) + area->vm_pgoff;
        endoff = ((area->vm_end - area->vm_start) >> 12) + area->vm_pgoff;

retry_all:
        size = (i_size_read(inode) + (1UL << 12) - 1) >> 12;
        if (pgoff >= size)
                goto outside_data_content;


        if (((area)->vm_flags & 0x00010000))
                goto no_cached_page;





        if (size > endoff)
                size = endoff;







        if (((area)->vm_flags & 0x00008000))
                page_cache_readahead(mapping, ra, file, pgoff);




retry_find:
        page = find_get_page(mapping, pgoff);
        if (!page) {
                unsigned long ra_pages;

                if (((area)->vm_flags & 0x00008000)) {
                        handle_ra_miss(mapping, ra, pgoff);
                        goto no_cached_page;
                }
                ra->mmap_miss++;





                if (ra->mmap_miss > ra->mmap_hit + (100))
                        goto no_cached_page;





                if (!did_readaround) {
                        majmin = 2;
                        do { unsigned long flags; __asm__ __volatile__("pushfl ; popl %0 ; cli":"=g" (flags): :"memory"); (*({ unsigned long __ptr; __asm__ ("" : "=g"(__ptr) : "0"(&per_cpu__page_states)); (typeof(&per_cpu__page_states)) (__ptr + (__per_cpu_offset[(current_thread_info()->cpu)])); })).pgmajfault += (1UL); do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); __asm__ __volatile__("pushl %0 ; popfl": :"g" (flags):"memory", "cc"); } while (0); } while (0);
                }
                did_readaround = 1;
                ra_pages = max_sane_readahead(file->f_ra.ra_pages);
                if (ra_pages) {
                        unsigned long start = 0;

                        if (pgoff > ra_pages / 2)
                                start = pgoff - ra_pages / 2;
                        do_page_cache_readahead(mapping, file, start, ra_pages);
                }
                page = find_get_page(mapping, pgoff);
                if (!page)
                        goto no_cached_page;
        }

        if (!did_readaround)
                ra->mmap_hit++;





        if (!(__builtin_constant_p(3) ? constant_test_bit((3),(&(page)->flags)) : variable_test_bit((3),(&(page)->flags))))
                goto page_not_uptodate;

success:



        mark_page_accessed(page);
        if (type)
                *type = majmin;
        return page;

outside_data_content:




        if (area->vm_mm == get_current()->mm)
                return ((void *)0);

no_cached_page:




        error = page_cache_read(file, pgoff);






        if (error >= 0)
                goto retry_find;






        if (error == -12)
                return ((struct page *) (-1));
        return ((void *)0);

page_not_uptodate:
        if (!did_readaround) {
                majmin = 2;
                do { unsigned long flags; __asm__ __volatile__("pushfl ; popl %0 ; cli":"=g" (flags): :"memory"); (*({ unsigned long __ptr; __asm__ ("" : "=g"(__ptr) : "0"(&per_cpu__page_states)); (typeof(&per_cpu__page_states)) (__ptr + (__per_cpu_offset[(current_thread_info()->cpu)])); })).pgmajfault += (1UL); do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); __asm__ __volatile__("pushl %0 ; popfl": :"g" (flags):"memory", "cc"); } while (0); } while (0);
        }
        lock_page(page);


        if (!page->mapping) {
                unlock_page(page);
                put_page(page);
                goto retry_all;
        }


        if ((__builtin_constant_p(3) ? constant_test_bit((3),(&(page)->flags)) : variable_test_bit((3),(&(page)->flags)))) {
                unlock_page(page);
                goto success;
        }

        if (!mapping->a_ops->readpage(file, page)) {
                wait_on_page_locked(page);
                if ((__builtin_constant_p(3) ? constant_test_bit((3),(&(page)->flags)) : variable_test_bit((3),(&(page)->flags))))
                        goto success;
        }







        lock_page(page);


        if (!page->mapping) {
                unlock_page(page);
                put_page(page);
                goto retry_all;
        }


        if ((__builtin_constant_p(3) ? constant_test_bit((3),(&(page)->flags)) : variable_test_bit((3),(&(page)->flags)))) {
                unlock_page(page);
                goto success;
        }
        clear_bit(1, &(page)->flags);
        if (!mapping->a_ops->readpage(file, page)) {
                wait_on_page_locked(page);
                if ((__builtin_constant_p(3) ? constant_test_bit((3),(&(page)->flags)) : variable_test_bit((3),(&(page)->flags))))
                        goto success;
        }





        put_page(page);
        return ((void *)0);
}

extern void *__crc_filemap_nopage __attribute__((weak)); static const unsigned long __kcrctab_filemap_nopage __attribute__((__used__)) __attribute__((section("__kcrctab" ""), unused)) = (unsigned long) &__crc_filemap_nopage; static const char __kstrtab_filemap_nopage[] __attribute__((section("__ksymtab_strings"))) = "" "filemap_nopage"; static const struct kernel_symbol __ksymtab_filemap_nopage __attribute__((__used__)) __attribute__((section("__ksymtab" ""), unused)) = { (unsigned long)&filemap_nopage, __kstrtab_filemap_nopage };

static struct page * filemap_getpage(struct file *file, unsigned long pgoff,
                                        int nonblock)
{
        struct address_space *mapping = file->f_mapping;
        struct page *page;
        int error;




retry_find:
        page = find_get_page(mapping, pgoff);
        if (!page) {
                if (nonblock)
                        return ((void *)0);
                goto no_cached_page;
        }





        if (!(__builtin_constant_p(3) ? constant_test_bit((3),(&(page)->flags)) : variable_test_bit((3),(&(page)->flags))))
                goto page_not_uptodate;

success:



        mark_page_accessed(page);
        return page;

no_cached_page:
        error = page_cache_read(file, pgoff);






        if (error >= 0)
                goto retry_find;






        return ((void *)0);

page_not_uptodate:
        lock_page(page);


        if (!page->mapping) {
                unlock_page(page);
                goto err;
        }


        if ((__builtin_constant_p(3) ? constant_test_bit((3),(&(page)->flags)) : variable_test_bit((3),(&(page)->flags)))) {
                unlock_page(page);
                goto success;
        }

        if (!mapping->a_ops->readpage(file, page)) {
                wait_on_page_locked(page);
                if ((__builtin_constant_p(3) ? constant_test_bit((3),(&(page)->flags)) : variable_test_bit((3),(&(page)->flags))))
                        goto success;
        }







        lock_page(page);


        if (!page->mapping) {
                unlock_page(page);
                goto err;
        }

        if ((__builtin_constant_p(3) ? constant_test_bit((3),(&(page)->flags)) : variable_test_bit((3),(&(page)->flags)))) {
                unlock_page(page);
                goto success;
        }

        clear_bit(1, &(page)->flags);
        if (!mapping->a_ops->readpage(file, page)) {
                wait_on_page_locked(page);
                if ((__builtin_constant_p(3) ? constant_test_bit((3),(&(page)->flags)) : variable_test_bit((3),(&(page)->flags))))
                        goto success;
        }





err:
        put_page(page);

        return ((void *)0);
}

static int filemap_populate(struct vm_area_struct *vma,
                        unsigned long addr,
                        unsigned long len,
                        pgprot_t prot,
                        unsigned long pgoff,
                        int nonblock)
{
        struct file *file = vma->vm_file;
        struct address_space *mapping = file->f_mapping;
        struct inode *inode = mapping->host;
        unsigned long size;
        struct mm_struct *mm = vma->vm_mm;
        struct page *page;
        int err;

        if (!nonblock)
                force_page_cache_readahead(mapping, vma->vm_file,
                                        pgoff, len >> 12);

repeat:
        size = (i_size_read(inode) + (1UL << 12) - 1) >> 12;
        if (pgoff + (len >> 12) > size)
                return -22;

        page = filemap_getpage(file, pgoff, nonblock);
        if (!page && !nonblock)
                return -12;
        if (page) {
                err = install_page(mm, vma, addr, page, prot);
                if (err) {
                        put_page(page);
                        return err;
                }
        } else {
                err = install_file_pte(mm, vma, addr, pgoff, prot);
                if (err)
                        return err;
        }

        len -= (1UL << 12);
        addr += (1UL << 12);
        pgoff++;
        if (len)
                goto repeat;

        return 0;
}

static struct vm_operations_struct generic_file_vm_ops = {
        .nopage = filemap_nopage,
        .populate = filemap_populate,
};



int generic_file_mmap(struct file * file, struct vm_area_struct * vma)
{
        struct address_space *mapping = file->f_mapping;

        if (!mapping->a_ops->readpage)
                return -8;
        file_accessed(file);
        vma->vm_ops = &generic_file_vm_ops;
        return 0;
}




int generic_file_readonly_mmap(struct file *file, struct vm_area_struct *vma)
{
        if ((vma->vm_flags & 0x00000008) && (vma->vm_flags & 0x00000020))
                return -22;
        return generic_file_mmap(file, vma);
}
# 1472 "mm/filemap.c"
extern void *__crc_generic_file_mmap __attribute__((weak)); static const unsigned long __kcrctab_generic_file_mmap __attribute__((__used__)) __attribute__((section("__kcrctab" ""), unused)) = (unsigned long) &__crc_generic_file_mmap; static const char __kstrtab_generic_file_mmap[] __attribute__((section("__ksymtab_strings"))) = "" "generic_file_mmap"; static const struct kernel_symbol __ksymtab_generic_file_mmap __attribute__((__used__)) __attribute__((section("__ksymtab" ""), unused)) = { (unsigned long)&generic_file_mmap, __kstrtab_generic_file_mmap };
extern void *__crc_generic_file_readonly_mmap __attribute__((weak)); static const unsigned long __kcrctab_generic_file_readonly_mmap __attribute__((__used__)) __attribute__((section("__kcrctab" ""), unused)) = (unsigned long) &__crc_generic_file_readonly_mmap; static const char __kstrtab_generic_file_readonly_mmap[] __attribute__((section("__ksymtab_strings"))) = "" "generic_file_readonly_mmap"; static const struct kernel_symbol __ksymtab_generic_file_readonly_mmap __attribute__((__used__)) __attribute__((section("__ksymtab" ""), unused)) = { (unsigned long)&generic_file_readonly_mmap, __kstrtab_generic_file_readonly_mmap };

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct page *__read_cache_page(struct address_space *mapping,
                                unsigned long index,
                                int (*filler)(void *,struct page*),
                                void *data)
{
        struct page *page, *cached_page = ((void *)0);
        int err;
repeat:
        page = find_get_page(mapping, index);
        if (!page) {
                if (!cached_page) {
                        cached_page = page_cache_alloc_cold(mapping);
                        if (!cached_page)
                                return ERR_PTR(-12);
                }
                err = add_to_page_cache_lru(cached_page, mapping,
                                        index, (0x10 | 0x40 | 0x80));
                if (err == -17)
                        goto repeat;
                if (err < 0) {

                        put_page(cached_page);
                        return ERR_PTR(err);
                }
                page = cached_page;
                cached_page = ((void *)0);
                err = filler(data, page);
                if (err < 0) {
                        put_page(page);
                        page = ERR_PTR(err);
                }
        }
        if (cached_page)
                put_page(cached_page);
        return page;
}





struct page *read_cache_page(struct address_space *mapping,
                                unsigned long index,
                                int (*filler)(void *,struct page*),
                                void *data)
{
        struct page *page;
        int err;

retry:
        page = __read_cache_page(mapping, index, filler, data);
        if (IS_ERR(page))
                goto out;
        mark_page_accessed(page);
        if ((__builtin_constant_p(3) ? constant_test_bit((3),(&(page)->flags)) : variable_test_bit((3),(&(page)->flags))))
                goto out;

        lock_page(page);
        if (!page->mapping) {
                unlock_page(page);
                put_page(page);
                goto retry;
        }
        if ((__builtin_constant_p(3) ? constant_test_bit((3),(&(page)->flags)) : variable_test_bit((3),(&(page)->flags)))) {
                unlock_page(page);
                goto out;
        }
        err = filler(data, page);
        if (err < 0) {
                put_page(page);
                page = ERR_PTR(err);
        }
 out:
        return page;
}

extern void *__crc_read_cache_page __attribute__((weak)); static const unsigned long __kcrctab_read_cache_page __attribute__((__used__)) __attribute__((section("__kcrctab" ""), unused)) = (unsigned long) &__crc_read_cache_page; static const char __kstrtab_read_cache_page[] __attribute__((section("__ksymtab_strings"))) = "" "read_cache_page"; static const struct kernel_symbol __ksymtab_read_cache_page __attribute__((__used__)) __attribute__((section("__ksymtab" ""), unused)) = { (unsigned long)&read_cache_page, __kstrtab_read_cache_page };






static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct page *
__grab_cache_page(struct address_space *mapping, unsigned long index,
                        struct page **cached_page, struct pagevec *lru_pvec)
{
        int err;
        struct page *page;
repeat:
        page = find_lock_page(mapping, index);
        if (!page) {
                if (!*cached_page) {
                        *cached_page = page_cache_alloc(mapping);
                        if (!*cached_page)
                                return ((void *)0);
                }
                err = add_to_page_cache(*cached_page, mapping,
                                        index, (0x10 | 0x40 | 0x80));
                if (err == -17)
                        goto repeat;
                if (err == 0) {
                        page = *cached_page;
                        get_page(page);
                        if (!pagevec_add(lru_pvec, page))
                                __pagevec_lru_add(lru_pvec);
                        *cached_page = ((void *)0);
                }
        }
        return page;
}







int remove_suid(struct dentry *dentry)
{
        mode_t mode = dentry->d_inode->i_mode;
        int kill = 0;
        int result = 0;


        if (__builtin_expect(!!(mode & 0004000), 0))
                kill = 2048;





        if (__builtin_expect(!!((mode & 0002000) && (mode & 00010)), 0))
                kill |= 4096;

        if (__builtin_expect(!!(kill && !capable(4)), 0)) {
                struct iattr newattrs;

                newattrs.ia_valid = 512 | kill;
                result = notify_change(dentry, &newattrs);
        }
        return result;
}
extern void *__crc_remove_suid __attribute__((weak)); static const unsigned long __kcrctab_remove_suid __attribute__((__used__)) __attribute__((section("__kcrctab" ""), unused)) = (unsigned long) &__crc_remove_suid; static const char __kstrtab_remove_suid[] __attribute__((section("__ksymtab_strings"))) = "" "remove_suid"; static const struct kernel_symbol __ksymtab_remove_suid __attribute__((__used__)) __attribute__((section("__ksymtab" ""), unused)) = { (unsigned long)&remove_suid, __kstrtab_remove_suid };






static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) size_t
filemap_copy_from_user(struct page *page, unsigned long offset,
                        const char *buf, unsigned bytes)
{
        char *kaddr;
        int left;

        kaddr = kmap_atomic(page, KM_USER0);
        left = __copy_from_user(kaddr + offset, buf, bytes);
        kunmap_atomic(kaddr, KM_USER0);

        if (left != 0) {

                kaddr = kmap(page);
                left = __copy_from_user(kaddr + offset, buf, bytes);
                kunmap(page);
        }
        return bytes - left;
}

static size_t
__filemap_copy_from_user_iovec(char *vaddr,
                        const struct iovec *iov, size_t base, size_t bytes)
{
        size_t copied = 0, left = 0;

        while (bytes) {
                char *buf = iov->iov_base + base;
                int copy = ({ typeof(bytes) _x = (bytes); typeof(iov->iov_len - base) _y = (iov->iov_len - base); (void) (&_x == &_y); _x < _y ? _x : _y; });

                base = 0;
                left = __copy_from_user(vaddr, buf, copy);
                copied += copy;
                bytes -= copy;
                vaddr += copy;
                iov++;

                if (__builtin_expect(!!(left), 0)) {

                        if (bytes)
                                (__builtin_constant_p(0) ? (__builtin_constant_p((bytes)) ? __constant_c_and_count_memset(((vaddr)),((0x01010101UL*(unsigned char)(0))),((bytes))) : __constant_c_memset(((vaddr)),((0x01010101UL*(unsigned char)(0))),((bytes)))) : (__builtin_constant_p((bytes)) ? __memset_generic((((vaddr))),(((0))),(((bytes)))) : __memset_generic(((vaddr)),((0)),((bytes)))));
                        break;
                }
        }
        return copied - left;
}







static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) size_t
filemap_copy_from_user_iovec(struct page *page, unsigned long offset,
                        const struct iovec *iov, size_t base, size_t bytes)
{
        char *kaddr;
        size_t copied;

        kaddr = kmap_atomic(page, KM_USER0);
        copied = __filemap_copy_from_user_iovec(kaddr + offset, iov,
                                                base, bytes);
        kunmap_atomic(kaddr, KM_USER0);
        if (copied != bytes) {
                kaddr = kmap(page);
                copied = __filemap_copy_from_user_iovec(kaddr + offset, iov,
                                                        base, bytes);
                kunmap(page);
        }
        return copied;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void
filemap_set_next_iovec(const struct iovec **iovp, size_t *basep, size_t bytes)
{
        const struct iovec *iov = *iovp;
        size_t base = *basep;

        while (bytes) {
                int copy = ({ typeof(bytes) _x = (bytes); typeof(iov->iov_len - base) _y = (iov->iov_len - base); (void) (&_x == &_y); _x < _y ? _x : _y; });

                bytes -= copy;
                base += copy;
                if (iov->iov_len == base) {
                        iov++;
                        base = 0;
                }
        }
        *iovp = iov;
        *basep = base;
}
# 1725 "mm/filemap.c"
__inline__ __attribute__((always_inline)) __attribute__((always_inline)) int generic_write_checks(struct file *file, loff_t *pos, size_t *count, int isblk)
{
        struct inode *inode = file->f_mapping->host;
        unsigned long limit = get_current()->rlim[1].rlim_cur;

        if (__builtin_expect(!!(*pos < 0), 0))
                return -22;

        if (__builtin_expect(!!(file->f_error), 0)) {
                int err = file->f_error;
                file->f_error = 0;
                return err;
        }

        if (!isblk) {

                if (file->f_flags & 02000)
                        *pos = i_size_read(inode);

                if (limit != (~0UL)) {
                        if (*pos >= limit) {
                                send_sig(25, get_current(), 0);
                                return -27;
                        }
                        if (*count > limit - (typeof(limit))*pos) {
                                *count = limit - (typeof(limit))*pos;
                        }
                }
        }




        if (__builtin_expect(!!(*pos + *count > ((1UL<<31) - 1) && !(file->f_flags & 0100000)), 0)) {

                if (*pos >= ((1UL<<31) - 1)) {
                        send_sig(25, get_current(), 0);
                        return -27;
                }
                if (*count > ((1UL<<31) - 1) - (unsigned long)*pos) {
                        *count = ((1UL<<31) - 1) - (unsigned long)*pos;
                }
        }
# 1776 "mm/filemap.c"
        if (__builtin_expect(!!(!isblk), 1)) {
                if (__builtin_expect(!!(*pos >= inode->i_sb->s_maxbytes), 0)) {
                        if (*count || *pos > inode->i_sb->s_maxbytes) {
                                send_sig(25, get_current(), 0);
                                return -27;
                        }

                }

                if (__builtin_expect(!!(*pos + *count > inode->i_sb->s_maxbytes), 0))
                        *count = inode->i_sb->s_maxbytes - *pos;
        } else {
                loff_t isize;
                if (bdev_read_only(I_BDEV(inode)))
                        return -1;
                isize = i_size_read(inode);
                if (*pos >= isize) {
                        if (*count || *pos > isize)
                                return -28;
                }

                if (*pos + *count > isize)
                        *count = isize - *pos;
        }
        return 0;
}

extern void *__crc_generic_write_checks __attribute__((weak)); static const unsigned long __kcrctab_generic_write_checks __attribute__((__used__)) __attribute__((section("__kcrctab" ""), unused)) = (unsigned long) &__crc_generic_write_checks; static const char __kstrtab_generic_write_checks[] __attribute__((section("__ksymtab_strings"))) = "" "generic_write_checks"; static const struct kernel_symbol __ksymtab_generic_write_checks __attribute__((__used__)) __attribute__((section("__ksymtab" ""), unused)) = { (unsigned long)&generic_write_checks, __kstrtab_generic_write_checks };
# 1815 "mm/filemap.c"
ssize_t
generic_file_aio_write_nolock(struct kiocb *iocb, const struct iovec *iov,
                                unsigned long nr_segs, loff_t *ppos)
{
        struct file *file = iocb->ki_filp;
        struct address_space * mapping = file->f_mapping;
        struct address_space_operations *a_ops = mapping->a_ops;
        size_t ocount;
        size_t count;
        struct inode *inode = mapping->host;
        long status = 0;
        loff_t pos;
        struct page *page;
        struct page *cached_page = ((void *)0);
        const int isblk = (((inode->i_mode) & 00170000) == 0060000);
        ssize_t written;
        ssize_t err;
        size_t bytes;
        struct pagevec lru_pvec;
        const struct iovec *cur_iov = iov;
        size_t iov_base = 0;
        unsigned long seg;
        char *buf;

        ocount = 0;
        for (seg = 0; seg < nr_segs; seg++) {
                const struct iovec *iv = &iov[seg];





                ocount += iv->iov_len;
                if (__builtin_expect(!!((ssize_t)(ocount|iv->iov_len) < 0), 0))
                        return -22;
                if ((__builtin_expect(!!(({ unsigned long flag,sum; (void)0; asm("addl %3,%1 ; sbbl %0,%0; cmpl %1,%4; sbbl $0,%0" :"=&r" (flag), "=r" (sum) :"1" (iv->iov_base),"g" ((int)(iv->iov_len)),"g" (current_thread_info()->addr_limit.seg)); flag; }) == 0), 1)))
                        continue;
                if (seg == 0)
                        return -14;
                nr_segs = seg;
                ocount -= iv->iov_len;
                break;
        }

        count = ocount;
        pos = *ppos;
        pagevec_init(&lru_pvec, 0);


        get_current()->backing_dev_info = mapping->backing_dev_info;
        written = 0;

        err = generic_write_checks(file, &pos, &count, isblk);
        if (err)
                goto out;

        if (count == 0)
                goto out;

        err = remove_suid(file->f_dentry);
        if (err)
                goto out;

        inode_update_time(inode, 1);


        if (__builtin_expect(!!(file->f_flags & 040000), 0)) {
                if (count != ocount)
                        nr_segs = iov_shorten((struct iovec *)iov,
                                                nr_segs, count);
                written = generic_file_direct_IO(1, iocb,
                                        iov, pos, nr_segs);
                if (written > 0) {
                        loff_t end = pos + written;
                        if (end > i_size_read(inode) && !isblk) {
                                i_size_write(inode, end);
                                mark_inode_dirty(inode);
                        }
                        *ppos = end;
                }






                if (written >= 0 && file->f_flags & 010000)
                        status = generic_osync_inode(inode, mapping, (1<<0));
                if (written == count && !((iocb)->ki_key == (~0U)))
                        written = -529;
                if (written < 0 || written == count)
                        goto out_status;




                pos += written;
                count -= written;
        }

        buf = iov->iov_base + written;
        do {
                unsigned long index;
                unsigned long offset;
                size_t copied;

                offset = (pos & ((1UL << 12) -1));
                index = pos >> 12;
                bytes = (1UL << 12) - offset;
                if (bytes > count)
                        bytes = count;







                fault_in_pages_readable(buf, bytes);

                page = __grab_cache_page(mapping,index,&cached_page,&lru_pvec);
                if (!page) {
                        status = -12;
                        break;
                }

                status = a_ops->prepare_write(file, page, offset, offset+bytes);
                if (__builtin_expect(!!(status), 0)) {
                        loff_t isize = i_size_read(inode);




                        unlock_page(page);
                        put_page(page);
                        if (pos + bytes > isize)
                                vmtruncate(inode, isize);
                        break;
                }
                if (__builtin_expect(!!(nr_segs == 1), 1))
                        copied = filemap_copy_from_user(page, offset,
                                                        buf, bytes);
                else
                        copied = filemap_copy_from_user_iovec(page, offset,
                                                cur_iov, iov_base, bytes);
                do { } while (0);
                status = a_ops->commit_write(file, page, offset, offset+bytes);
                if (__builtin_expect(!!(copied > 0), 1)) {
                        if (!status)
                                status = copied;

                        if (status >= 0) {
                                written += status;
                                count -= status;
                                pos += status;
                                buf += status;
                                if (__builtin_expect(!!(nr_segs > 1), 0))
                                        filemap_set_next_iovec(&cur_iov,
                                                        &iov_base, status);
                        }
                }
                if (__builtin_expect(!!(copied != bytes), 0))
                        if (status >= 0)
                                status = -14;
                unlock_page(page);
                mark_page_accessed(page);
                put_page(page);
                if (status < 0)
                        break;
                balance_dirty_pages_ratelimited(mapping);
                cond_resched();
        } while (count);
        *ppos = pos;

        if (cached_page)
                put_page(cached_page);




        if (status >= 0) {
                if ((file->f_flags & 010000) || (((inode)->i_sb->s_flags & (16)) || ((inode)->i_flags & 1)))
                        status = generic_osync_inode(inode, mapping,
                                        (1<<0)|(1<<1));
        }






        if (__builtin_expect(!!(file->f_flags & 040000), 0) && written)
                status = filemap_write_and_wait(mapping);

out_status:
        err = written ? written : status;
out:
        pagevec_lru_add(&lru_pvec);
        get_current()->backing_dev_info = ((void *)0);
        return err;
}

extern void *__crc_generic_file_aio_write_nolock __attribute__((weak)); static const unsigned long __kcrctab_generic_file_aio_write_nolock __attribute__((__used__)) __attribute__((section("__kcrctab" ""), unused)) = (unsigned long) &__crc_generic_file_aio_write_nolock; static const char __kstrtab_generic_file_aio_write_nolock[] __attribute__((section("__ksymtab_strings"))) = "" "generic_file_aio_write_nolock"; static const struct kernel_symbol __ksymtab_generic_file_aio_write_nolock __attribute__((__used__)) __attribute__((section("__ksymtab" ""), unused)) = { (unsigned long)&generic_file_aio_write_nolock, __kstrtab_generic_file_aio_write_nolock };

ssize_t
generic_file_write_nolock(struct file *file, const struct iovec *iov,
                                unsigned long nr_segs, loff_t *ppos)
{
        struct kiocb kiocb;
        ssize_t ret;

        do { struct task_struct *tsk = get_current(); (&kiocb)->ki_flags = 0; (&kiocb)->ki_users = 1; (&kiocb)->ki_key = (~0U); (&kiocb)->ki_filp = (file); (&kiocb)->ki_ctx = &tsk->active_mm->default_kioctx; (&kiocb)->ki_cancel = ((void *)0); (&kiocb)->ki_dtor = ((void *)0); (&kiocb)->ki_obj.tsk = tsk; } while (0);
        ret = generic_file_aio_write_nolock(&kiocb, iov, nr_segs, ppos);
        if (-529 == ret)
                ret = wait_on_sync_kiocb(&kiocb);
        return ret;
}

extern void *__crc_generic_file_write_nolock __attribute__((weak)); static const unsigned long __kcrctab_generic_file_write_nolock __attribute__((__used__)) __attribute__((section("__kcrctab" ""), unused)) = (unsigned long) &__crc_generic_file_write_nolock; static const char __kstrtab_generic_file_write_nolock[] __attribute__((section("__ksymtab_strings"))) = "" "generic_file_write_nolock"; static const struct kernel_symbol __ksymtab_generic_file_write_nolock __attribute__((__used__)) __attribute__((section("__ksymtab" ""), unused)) = { (unsigned long)&generic_file_write_nolock, __kstrtab_generic_file_write_nolock };

ssize_t generic_file_aio_write(struct kiocb *iocb, const char *buf,
                               size_t count, loff_t pos)
{
        struct file *file = iocb->ki_filp;
        struct inode *inode = file->f_mapping->host;
        ssize_t err;
        struct iovec local_iov = { .iov_base = (void *)buf, .iov_len = count };

        do { if (__builtin_expect(!!((iocb->ki_pos != pos)!=0), 0)) __asm__ __volatile__( "ud2\n" "\t.word %c0\n" "\t.long %c1\n" : : "i" (2043), "i" ("mm/filemap.c")); } while(0);

        down(&inode->i_sem);
        err = generic_file_aio_write_nolock(iocb, &local_iov, 1,
                                                &iocb->ki_pos);
        up(&inode->i_sem);

        return err;
}

extern void *__crc_generic_file_aio_write __attribute__((weak)); static const unsigned long __kcrctab_generic_file_aio_write __attribute__((__used__)) __attribute__((section("__kcrctab" ""), unused)) = (unsigned long) &__crc_generic_file_aio_write; static const char __kstrtab_generic_file_aio_write[] __attribute__((section("__ksymtab_strings"))) = "" "generic_file_aio_write"; static const struct kernel_symbol __ksymtab_generic_file_aio_write __attribute__((__used__)) __attribute__((section("__ksymtab" ""), unused)) = { (unsigned long)&generic_file_aio_write, __kstrtab_generic_file_aio_write };

ssize_t generic_file_write(struct file *file, const char *buf,
                           size_t count, loff_t *ppos)
{
        struct inode *inode = file->f_mapping->host;
        ssize_t err;
        struct iovec local_iov = { .iov_base = (void *)buf, .iov_len = count };

        down(&inode->i_sem);
        err = generic_file_write_nolock(file, &local_iov, 1, ppos);
        up(&inode->i_sem);

        return err;
}

extern void *__crc_generic_file_write __attribute__((weak)); static const unsigned long __kcrctab_generic_file_write __attribute__((__used__)) __attribute__((section("__kcrctab" ""), unused)) = (unsigned long) &__crc_generic_file_write; static const char __kstrtab_generic_file_write[] __attribute__((section("__ksymtab_strings"))) = "" "generic_file_write"; static const struct kernel_symbol __ksymtab_generic_file_write __attribute__((__used__)) __attribute__((section("__ksymtab" ""), unused)) = { (unsigned long)&generic_file_write, __kstrtab_generic_file_write };

ssize_t generic_file_readv(struct file *filp, const struct iovec *iov,
                        unsigned long nr_segs, loff_t *ppos)
{
        struct kiocb kiocb;
        ssize_t ret;

        do { struct task_struct *tsk = get_current(); (&kiocb)->ki_flags = 0; (&kiocb)->ki_users = 1; (&kiocb)->ki_key = (~0U); (&kiocb)->ki_filp = (filp); (&kiocb)->ki_ctx = &tsk->active_mm->default_kioctx; (&kiocb)->ki_cancel = ((void *)0); (&kiocb)->ki_dtor = ((void *)0); (&kiocb)->ki_obj.tsk = tsk; } while (0);
        ret = __generic_file_aio_read(&kiocb, iov, nr_segs, ppos);
        if (-529 == ret)
                ret = wait_on_sync_kiocb(&kiocb);
        return ret;
}

extern void *__crc_generic_file_readv __attribute__((weak)); static const unsigned long __kcrctab_generic_file_readv __attribute__((__used__)) __attribute__((section("__kcrctab" ""), unused)) = (unsigned long) &__crc_generic_file_readv; static const char __kstrtab_generic_file_readv[] __attribute__((section("__ksymtab_strings"))) = "" "generic_file_readv"; static const struct kernel_symbol __ksymtab_generic_file_readv __attribute__((__used__)) __attribute__((section("__ksymtab" ""), unused)) = { (unsigned long)&generic_file_readv, __kstrtab_generic_file_readv };

ssize_t generic_file_writev(struct file *file, const struct iovec *iov,
                        unsigned long nr_segs, loff_t * ppos)
{
        struct inode *inode = file->f_mapping->host;
        ssize_t ret;

        down(&inode->i_sem);
        ret = generic_file_write_nolock(file, iov, nr_segs, ppos);
        up(&inode->i_sem);
        return ret;
}

extern void *__crc_generic_file_writev __attribute__((weak)); static const unsigned long __kcrctab_generic_file_writev __attribute__((__used__)) __attribute__((section("__kcrctab" ""), unused)) = (unsigned long) &__crc_generic_file_writev; static const char __kstrtab_generic_file_writev[] __attribute__((section("__ksymtab_strings"))) = "" "generic_file_writev"; static const struct kernel_symbol __ksymtab_generic_file_writev __attribute__((__used__)) __attribute__((section("__ksymtab" ""), unused)) = { (unsigned long)&generic_file_writev, __kstrtab_generic_file_writev };




ssize_t
generic_file_direct_IO(int rw, struct kiocb *iocb, const struct iovec *iov,
        loff_t offset, unsigned long nr_segs)
{
        struct file *file = iocb->ki_filp;
        struct address_space *mapping = file->f_mapping;
        ssize_t retval;

        retval = filemap_write_and_wait(mapping);
        if (retval == 0) {
                retval = mapping->a_ops->direct_IO(rw, iocb, iov,
                                                offset, nr_segs);
                if (rw == 1 && mapping->nrpages)
                        invalidate_inode_pages2(mapping);
        }
        return retval;
}

extern void *__crc_generic_file_direct_IO __attribute__((weak)); static const unsigned long __kcrctab_generic_file_direct_IO __attribute__((__used__)) __attribute__((section("__kcrctab" "_gpl"), unused)) = (unsigned long) &__crc_generic_file_direct_IO; static const char __kstrtab_generic_file_direct_IO[] __attribute__((section("__ksymtab_strings"))) = "" "generic_file_direct_IO"; static const struct kernel_symbol __ksymtab_generic_file_direct_IO __attribute__((__used__)) __attribute__((section("__ksymtab" "_gpl"), unused)) = { (unsigned long)&generic_file_direct_IO, __kstrtab_generic_file_direct_IO };
