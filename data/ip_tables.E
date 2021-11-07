# 1 "net/ipv4/netfilter/ip_tables.c"
# 1 "<built-in>"
# 1 "<command line>"
# 1 "net/ipv4/netfilter/ip_tables.c"
# 15 "net/ipv4/netfilter/ip_tables.c"
# 1 "include/linux/config.h" 1



# 1 "include/linux/autoconf.h" 1
# 5 "include/linux/config.h" 2
# 16 "net/ipv4/netfilter/ip_tables.c" 2
# 1 "include/linux/cache.h" 1



# 1 "include/linux/kernel.h" 1
# 10 "include/linux/kernel.h"
# 1 "/usr/lib/gcc-lib/i486-slackware-linux/3.3.4/include/stdarg.h" 1 3 4
# 43 "/usr/lib/gcc-lib/i486-slackware-linux/3.3.4/include/stdarg.h" 3 4
typedef __builtin_va_list __gnuc_va_list;
# 105 "/usr/lib/gcc-lib/i486-slackware-linux/3.3.4/include/stdarg.h" 3 4
typedef __gnuc_va_list va_list;
# 11 "include/linux/kernel.h" 2
# 1 "include/linux/linkage.h" 1




# 1 "include/asm/linkage.h" 1
# 6 "include/linux/linkage.h" 2
# 12 "include/linux/kernel.h" 2
# 1 "include/linux/stddef.h" 1
# 13 "include/linux/kernel.h" 2
# 1 "include/linux/types.h" 1
# 13 "include/linux/types.h"
# 1 "include/linux/posix_types.h" 1
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
# 14 "include/linux/kernel.h" 2
# 1 "include/linux/compiler.h" 1
# 24 "include/linux/compiler.h"
# 1 "include/linux/compiler-gcc3.h" 1



# 1 "include/linux/compiler-gcc.h" 1
# 5 "include/linux/compiler-gcc3.h" 2
# 25 "include/linux/compiler.h" 2
# 15 "include/linux/kernel.h" 2
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
# 5 "include/linux/cache.h" 2

# 1 "include/asm/cache.h" 1
# 7 "include/linux/cache.h" 2
# 17 "net/ipv4/netfilter/ip_tables.c" 2
# 1 "include/linux/skbuff.h" 1
# 20 "include/linux/skbuff.h"
# 1 "include/linux/time.h" 1



# 1 "include/asm/param.h" 1
# 5 "include/linux/time.h" 2




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



# 1 "include/linux/spinlock.h" 1
# 9 "include/linux/spinlock.h"
# 1 "include/linux/preempt.h" 1
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
# 12 "include/asm/system.h"
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
                "\n1:\t" "lock ; decb %0\n\t" "js 2f\n" ".subsection 1\n\t" "" ".ifndef " ".text.lock." "ip_tables" "\n\t" ".text.lock." "ip_tables" ":\n\t" ".endif\n\t" "2:\t" "rep;nop\n\t" "cmpb $0,%0\n\t" "jle 2b\n\t" "jmp 1b\n" ".previous\n\t"
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
                "\n1:\t" "lock ; decb %0\n\t" "js 2f\n\t" ".subsection 1\n\t" "" ".ifndef " ".text.lock." "ip_tables" "\n\t" ".text.lock." "ip_tables" ":\n\t" ".endif\n\t" "2:\t" "testl $0x200, %1\n\t" "jz 3f\n\t" "sti\n\t" "3:\t" "rep;nop\n\t" "cmpb $0, %0\n\t" "jle 3b\n\t" "cli\n\t" "jmp 1b\n" ".previous\n\t"
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

        do { if (__builtin_constant_p(rw)) asm volatile("lock ; " "subl $1,%0\n\t" "js 2f\n" "1:\n" ".subsection 1\n\t" "" ".ifndef " ".text.lock." "ip_tables" "\n\t" ".text.lock." "ip_tables" ":\n\t" ".endif\n\t" "2:\tpushl %%eax\n\t" "leal %0,%%eax\n\t" "call " "__read_lock_failed" "\n\t" "popl %%eax\n\t" "jmp 1b\n" ".previous\n\t" :"=m" (*(volatile int *)rw) : : "memory"); else asm volatile("lock ; " "subl $1,(%0)\n\t" "js 2f\n" "1:\n" ".subsection 1\n\t" "" ".ifndef " ".text.lock." "ip_tables" "\n\t" ".text.lock." "ip_tables" ":\n\t" ".endif\n\t" "2:\tcall " "__read_lock_failed" "\n\t" "jmp 1b\n" ".previous\n\t" ::"a" (rw) : "memory"); } while (0);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void _raw_write_lock(rwlock_t *rw)
{

        do { if (__builtin_expect(!!((rw->magic != 0xdeaf1eed)!=0), 0)) __asm__ __volatile__( "ud2\n" "\t.word %c0\n" "\t.long %c1\n" : : "i" (213), "i" ("include/asm/spinlock.h")); } while(0);

        do { if (__builtin_constant_p(rw)) asm volatile("lock ; " "subl $" "0x01000000" ",%0\n\t" "jnz 2f\n" "1:\n" ".subsection 1\n\t" "" ".ifndef " ".text.lock." "ip_tables" "\n\t" ".text.lock." "ip_tables" ":\n\t" ".endif\n\t" "2:\tpushl %%eax\n\t" "leal %0,%%eax\n\t" "call " "__write_lock_failed" "\n\t" "popl %%eax\n\t" "jmp 1b\n" ".previous\n\t" :"=m" (*(volatile int *)rw) : : "memory"); else asm volatile("lock ; " "subl $" "0x01000000" ",(%0)\n\t" "jnz 2f\n" "1:\n" ".subsection 1\n\t" "" ".ifndef " ".text.lock." "ip_tables" "\n\t" ".text.lock." "ip_tables" ":\n\t" ".endif\n\t" "2:\tcall " "__write_lock_failed" "\n\t" "jmp 1b\n" ".previous\n\t" ::"a" (rw) : "memory"); } while (0);
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
# 28 "include/linux/time.h" 2
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
# 21 "include/linux/skbuff.h" 2





# 1 "include/linux/mm.h" 1



# 1 "include/linux/sched.h" 1






# 1 "include/linux/capability.h" 1
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
                ".subsection 1\n\t" "" ".ifndef " ".text.lock." "ip_tables" "\n\t" ".text.lock." "ip_tables" ":\n\t" ".endif\n\t"
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
                ".subsection 1\n\t" "" ".ifndef " ".text.lock." "ip_tables" "\n\t" ".text.lock." "ip_tables" ":\n\t" ".endif\n\t"
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
                ".subsection 1\n\t" "" ".ifndef " ".text.lock." "ip_tables" "\n\t" ".text.lock." "ip_tables" ":\n\t" ".endif\n\t"
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
                ".subsection 1\n\t" "" ".ifndef " ".text.lock." "ip_tables" "\n\t" ".text.lock." "ip_tables" ":\n\t" ".endif\n\t"
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
                ".subsection 1\n\t" "" ".ifndef " ".text.lock." "ip_tables" "\n\t" ".text.lock." "ip_tables" ":\n\t" ".endif\n\t"
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
                ".subsection 1\n\t" "" ".ifndef " ".text.lock." "ip_tables" "\n\t" ".text.lock." "ip_tables" ":\n\t" ".endif\n\t"
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
                ".subsection 1\n\t" "" ".ifndef " ".text.lock." "ip_tables" "\n\t" ".text.lock." "ip_tables" ":\n\t" ".endif\n\t"
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
                ".subsection 1\n\t" "" ".ifndef " ".text.lock." "ip_tables" "\n\t" ".text.lock." "ip_tables" ":\n\t" ".endif\n\t"
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
                ".subsection 1\n\t" "" ".ifndef " ".text.lock." "ip_tables" "\n\t" ".text.lock." "ip_tables" ":\n\t" ".endif\n\t"
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
# 5 "include/linux/mm.h" 2
# 1 "include/linux/errno.h" 1



# 1 "include/asm/errno.h" 1



# 1 "include/asm-generic/errno.h" 1



# 1 "include/asm-generic/errno-base.h" 1
# 5 "include/asm-generic/errno.h" 2
# 5 "include/asm/errno.h" 2
# 5 "include/linux/errno.h" 2
# 6 "include/linux/mm.h" 2
# 14 "include/linux/mm.h"
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
# 15 "include/linux/mm.h" 2
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
# 18 "include/linux/fs.h" 2


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
# 223 "include/linux/fs.h" 2




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
# 16 "include/linux/mm.h" 2

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
# 27 "include/linux/skbuff.h" 2
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
# 20 "include/linux/irq.h"
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
# 21 "include/linux/irq.h" 2
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
# 28 "include/linux/skbuff.h" 2
# 1 "include/linux/poll.h" 1



# 1 "include/asm/poll.h" 1
# 20 "include/asm/poll.h"
struct pollfd {
        int fd;
        short events;
        short revents;
};
# 5 "include/linux/poll.h" 2






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
# 12 "include/linux/poll.h" 2

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
# 18 "net/ipv4/netfilter/ip_tables.c" 2
# 1 "include/linux/kmod.h" 1
# 31 "include/linux/kmod.h"
extern int request_module(const char * name, ...) __attribute__ ((format (printf, 1, 2)));





extern int call_usermodehelper(char *path, char *argv[], char *envp[], int wait);


extern char hotplug_path [];
# 19 "net/ipv4/netfilter/ip_tables.c" 2
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
# 20 "net/ipv4/netfilter/ip_tables.c" 2
# 1 "include/linux/netdevice.h" 1
# 28 "include/linux/netdevice.h"
# 1 "include/linux/if.h" 1
# 23 "include/linux/if.h"
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
# 26 "include/linux/socket.h" 2



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
# 24 "include/linux/if.h" 2



# 1 "include/linux/hdlc/ioctl.h" 1



typedef struct {
        unsigned int clock_rate;
        unsigned int clock_type;
        unsigned short loopback;
} sync_serial_settings;

typedef struct {
        unsigned int clock_rate;
        unsigned int clock_type;
        unsigned short loopback;
        unsigned int slot_map;
} te1_settings;

typedef struct {
        unsigned short encoding;
        unsigned short parity;
} raw_hdlc_proto;

typedef struct {
        unsigned int t391;
        unsigned int t392;
        unsigned int n391;
        unsigned int n392;
        unsigned int n393;
        unsigned short lmi;
        unsigned short dce;
} fr_proto;

typedef struct {
        unsigned int dlci;
} fr_proto_pvc;

typedef struct {
        unsigned int dlci;
        char master[16];
}fr_proto_pvc_info;

typedef struct {
    unsigned int interval;
    unsigned int timeout;
} cisco_proto;
# 28 "include/linux/if.h" 2
# 94 "include/linux/if.h"
struct ifmap
{
        unsigned long mem_start;
        unsigned long mem_end;
        unsigned short base_addr;
        unsigned char irq;
        unsigned char dma;
        unsigned char port;

};

struct if_settings
{
        unsigned int type;
        unsigned int size;
        union {

                raw_hdlc_proto *raw_hdlc;
                cisco_proto *cisco;
                fr_proto *fr;
                fr_proto_pvc *fr_pvc;
                fr_proto_pvc_info *fr_pvc_info;


                sync_serial_settings *sync;
                te1_settings *te1;
        } ifs_ifsu;
};
# 130 "include/linux/if.h"
struct ifreq
{

        union
        {
                char ifrn_name[16];
        } ifr_ifrn;

        union {
                struct sockaddr ifru_addr;
                struct sockaddr ifru_dstaddr;
                struct sockaddr ifru_broadaddr;
                struct sockaddr ifru_netmask;
                struct sockaddr ifru_hwaddr;
                short ifru_flags;
                int ifru_ivalue;
                int ifru_mtu;
                struct ifmap ifru_map;
                char ifru_slave[16];
                char ifru_newname[16];
                void * ifru_data;
                struct if_settings ifru_settings;
        } ifr_ifru;
};
# 180 "include/linux/if.h"
struct ifconf
{
        int ifc_len;
        union
        {
                char *ifcu_buf;
                struct ifreq *ifcu_req;
        } ifc_ifcu;
};
# 29 "include/linux/netdevice.h" 2
# 1 "include/linux/if_ether.h" 1
# 97 "include/linux/if_ether.h"
struct ethhdr
{
        unsigned char h_dest[6];
        unsigned char h_source[6];
        unsigned short h_proto;
} __attribute__((packed));
# 30 "include/linux/netdevice.h" 2
# 1 "include/linux/if_packet.h" 1



struct sockaddr_pkt
{
        unsigned short spkt_family;
        unsigned char spkt_device[14];
        unsigned short spkt_protocol;
};

struct sockaddr_ll
{
        unsigned short sll_family;
        unsigned short sll_protocol;
        int sll_ifindex;
        unsigned short sll_hatype;
        unsigned char sll_pkttype;
        unsigned char sll_halen;
        unsigned char sll_addr[8];
};
# 43 "include/linux/if_packet.h"
struct tpacket_stats
{
        unsigned int tp_packets;
        unsigned int tp_drops;
};

struct tpacket_hdr
{
        unsigned long tp_status;





        unsigned int tp_len;
        unsigned int tp_snaplen;
        unsigned short tp_mac;
        unsigned short tp_net;
        unsigned int tp_sec;
        unsigned int tp_usec;
};
# 82 "include/linux/if_packet.h"
struct tpacket_req
{
        unsigned int tp_block_size;
        unsigned int tp_block_nr;
        unsigned int tp_frame_size;
        unsigned int tp_frame_nr;
};

struct packet_mreq
{
        int mr_ifindex;
        unsigned short mr_type;
        unsigned short mr_alen;
        unsigned char mr_address[8];
};
# 31 "include/linux/netdevice.h" 2







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



# 1 "include/linux/module.h" 1
# 17 "include/linux/module.h"
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
# 20 "include/linux/module.h" 2
# 1 "include/linux/moduleparam.h" 1
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
# 21 "include/linux/device.h" 2
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
# 39 "include/linux/netdevice.h" 2


struct divert_blk;
struct vlan_group;
struct ethtool_ops;
# 103 "include/linux/netdevice.h"
struct net_device_stats
{
        unsigned long rx_packets;
        unsigned long tx_packets;
        unsigned long rx_bytes;
        unsigned long tx_bytes;
        unsigned long rx_errors;
        unsigned long tx_errors;
        unsigned long rx_dropped;
        unsigned long tx_dropped;
        unsigned long multicast;
        unsigned long collisions;


        unsigned long rx_length_errors;
        unsigned long rx_over_errors;
        unsigned long rx_crc_errors;
        unsigned long rx_frame_errors;
        unsigned long rx_fifo_errors;
        unsigned long rx_missed_errors;


        unsigned long tx_aborted_errors;
        unsigned long tx_carrier_errors;
        unsigned long tx_fifo_errors;
        unsigned long tx_heartbeat_errors;
        unsigned long tx_window_errors;


        unsigned long rx_compressed;
        unsigned long tx_compressed;
};



enum {
        IF_PORT_UNKNOWN = 0,
        IF_PORT_10BASE2,
        IF_PORT_10BASET,
        IF_PORT_AUI,
        IF_PORT_100BASET,
        IF_PORT_100BASETX,
        IF_PORT_100BASEFX
};






struct neighbour;
struct neigh_parms;
struct sk_buff;

struct netif_rx_stats
{
        unsigned total;
        unsigned dropped;
        unsigned time_squeeze;
        unsigned throttled;
        unsigned fastroute_hit;
        unsigned fastroute_success;
        unsigned fastroute_defer;
        unsigned fastroute_deferred_out;
        unsigned fastroute_latency_reduction;
        unsigned cpu_collision;
};

extern __typeof__(struct netif_rx_stats) per_cpu__netdev_rx_stat;






struct dev_mc_list
{
        struct dev_mc_list *next;
        __u8 dmi_addr[32];
        unsigned char dmi_addrlen;
        int dmi_users;
        int dmi_gusers;
};

struct hh_cache
{
        struct hh_cache *hh_next;
        atomic_t hh_refcnt;
        unsigned short hh_type;



        int hh_len;
        int (*hh_output)(struct sk_buff *skb);
        rwlock_t hh_lock;







        unsigned long hh_data[(((96)+(16 -1))&~(16 - 1)) / sizeof(long)];
};
# 226 "include/linux/netdevice.h"
enum netdev_state_t
{
        __LINK_STATE_XOFF=0,
        __LINK_STATE_START,
        __LINK_STATE_PRESENT,
        __LINK_STATE_SCHED,
        __LINK_STATE_NOCARRIER,
        __LINK_STATE_RX_SCHED,
        __LINK_STATE_LINKWATCH_PENDING
};






struct netdev_boot_setup {
        char name[16];
        struct ifmap map;
};
# 259 "include/linux/netdevice.h"
struct net_device
{






        char name[16];





        unsigned long mem_end;
        unsigned long mem_start;
        unsigned long base_addr;
        unsigned int irq;






        unsigned char if_port;
        unsigned char dma;

        unsigned long state;

        struct net_device *next;


        int (*init)(struct net_device *dev);



        struct net_device *next_sched;


        int ifindex;
        int iflink;


        struct net_device_stats* (*get_stats)(struct net_device *dev);
        struct iw_statistics* (*get_wireless_stats)(struct net_device *dev);



        struct iw_handler_def * wireless_handlers;

        struct ethtool_ops *ethtool_ops;
# 318 "include/linux/netdevice.h"
        unsigned long trans_start;
        unsigned long last_rx;

        unsigned short flags;
        unsigned short gflags;
        unsigned short priv_flags;
        unsigned short unused_alignment_fixer;



        unsigned mtu;
        unsigned short type;
        unsigned short hard_header_len;
        void *priv;

        struct net_device *master;




        unsigned char broadcast[32];
        unsigned char dev_addr[32];
        unsigned char addr_len;

        struct dev_mc_list *mc_list;
        int mc_count;
        int promiscuity;
        int allmulti;

        int watchdog_timeo;
        struct timer_list watchdog_timer;



        void *atalk_ptr;
        void *ip_ptr;
        void *dn_ptr;
        void *ip6_ptr;
        void *ec_ptr;
        void *ax25_ptr;

        struct list_head poll_list;
        int quota;
        int weight;

        struct Qdisc *qdisc;
        struct Qdisc *qdisc_sleeping;
        struct Qdisc *qdisc_ingress;
        struct list_head qdisc_list;
        unsigned long tx_queue_len;


        spinlock_t ingress_lock;

        spinlock_t xmit_lock;



        int xmit_lock_owner;

        spinlock_t queue_lock;

        atomic_t refcnt;

        struct list_head todo_list;

        struct hlist_node name_hlist;

        struct hlist_node index_hlist;


        enum { NETREG_UNINITIALIZED=0,
               NETREG_REGISTERING,
               NETREG_REGISTERED,
               NETREG_UNREGISTERING,
               NETREG_UNREGISTERED,
               NETREG_RELEASED,
        } reg_state;


        int features;
# 413 "include/linux/netdevice.h"
        void (*uninit)(struct net_device *dev);

        void (*destructor)(struct net_device *dev);


        int (*open)(struct net_device *dev);
        int (*stop)(struct net_device *dev);
        int (*hard_start_xmit) (struct sk_buff *skb,
                                                    struct net_device *dev);

        int (*poll) (struct net_device *dev, int *quota);
        int (*hard_header) (struct sk_buff *skb,
                                                struct net_device *dev,
                                                unsigned short type,
                                                void *daddr,
                                                void *saddr,
                                                unsigned len);
        int (*rebuild_header)(struct sk_buff *skb);

        void (*set_multicast_list)(struct net_device *dev);

        int (*set_mac_address)(struct net_device *dev,
                                                   void *addr);

        int (*do_ioctl)(struct net_device *dev,
                                            struct ifreq *ifr, int cmd);

        int (*set_config)(struct net_device *dev,
                                              struct ifmap *map);

        int (*hard_header_cache)(struct neighbour *neigh,
                                                     struct hh_cache *hh);
        void (*header_cache_update)(struct hh_cache *hh,
                                                       struct net_device *dev,
                                                       unsigned char * haddr);

        int (*change_mtu)(struct net_device *dev, int new_mtu);


        void (*tx_timeout) (struct net_device *dev);

        void (*vlan_rx_register)(struct net_device *dev,
                                                    struct vlan_group *grp);
        void (*vlan_rx_add_vid)(struct net_device *dev,
                                                   unsigned short vid);
        void (*vlan_rx_kill_vid)(struct net_device *dev,
                                                    unsigned short vid);

        int (*hard_header_parse)(struct sk_buff *skb,
                                                     unsigned char *haddr);
        int (*neigh_setup)(struct net_device *dev, struct neigh_parms *);
        int (*accept_fastpath)(struct net_device *, struct dst_entry*);




        void (*poll_controller)(struct net_device *dev);



        struct net_bridge_port *br_port;



        struct divert_blk *divert;



        struct class_device class_dev;
        struct net_device_stats* (*last_stats)(struct net_device *);

        int padded;
};




static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void *netdev_priv(struct net_device *dev)
{
        return (char *)dev + ((sizeof(struct net_device)
                                        + (32 - 1))
                                & ~(32 - 1));
}







struct packet_type {
        unsigned short type;
        struct net_device *dev;
        int (*func) (struct sk_buff *, struct net_device *,
                                         struct packet_type *);
        void *af_packet_priv;
        struct list_head list;
};


# 1 "include/linux/notifier.h" 1
# 14 "include/linux/notifier.h"
struct notifier_block
{
        int (*notifier_call)(struct notifier_block *self, unsigned long, void *);
        struct notifier_block *next;
        int priority;
};




extern int notifier_chain_register(struct notifier_block **list, struct notifier_block *n);
extern int notifier_chain_unregister(struct notifier_block **nl, struct notifier_block *n);
extern int notifier_call_chain(struct notifier_block **n, unsigned long val, void *v);
# 514 "include/linux/netdevice.h" 2

extern struct net_device loopback_dev;
extern struct net_device *dev_base;
extern rwlock_t dev_base_lock;

extern int netdev_boot_setup_add(char *name, struct ifmap *map);
extern int netdev_boot_setup_check(struct net_device *dev);
extern unsigned long netdev_boot_base(const char *prefix, int unit);
extern struct net_device *dev_getbyhwaddr(unsigned short type, char *hwaddr);
extern struct net_device *__dev_getfirstbyhwtype(unsigned short type);
extern struct net_device *dev_getfirstbyhwtype(unsigned short type);
extern void dev_add_pack(struct packet_type *pt);
extern void dev_remove_pack(struct packet_type *pt);
extern void __dev_remove_pack(struct packet_type *pt);
extern int __dev_get(const char *name);
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int __attribute__((deprecated)) dev_get(const char *name)
{
        return __dev_get(name);
}
extern struct net_device *dev_get_by_flags(unsigned short flags,
                                                  unsigned short mask);
extern struct net_device *__dev_get_by_flags(unsigned short flags,
                                                    unsigned short mask);
extern struct net_device *dev_get_by_name(const char *name);
extern struct net_device *__dev_get_by_name(const char *name);
extern int dev_alloc_name(struct net_device *dev, const char *name);
extern int dev_open(struct net_device *dev);
extern int dev_close(struct net_device *dev);
extern int dev_queue_xmit(struct sk_buff *skb);
extern int register_netdevice(struct net_device *dev);
extern int unregister_netdevice(struct net_device *dev);
extern void free_netdev(struct net_device *dev);
extern void synchronize_net(void);
extern int register_netdevice_notifier(struct notifier_block *nb);
extern int unregister_netdevice_notifier(struct notifier_block *nb);
extern int call_netdevice_notifiers(unsigned long val, void *v);
extern int dev_new_index(void);
extern struct net_device *dev_get_by_index(int ifindex);
extern struct net_device *__dev_get_by_index(int ifindex);
extern int dev_restart(struct net_device *dev);




typedef int gifconf_func_t(struct net_device * dev, char * bufptr, int len);
extern int register_gifconf(unsigned int family, gifconf_func_t * gifconf);
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int unregister_gifconf(unsigned int family)
{
        return register_gifconf(family, ((void *)0));
}






struct softnet_data
{
        int throttle;
        int cng_level;
        int avg_blog;
        struct sk_buff_head input_pkt_queue;
        struct list_head poll_list;
        struct net_device *output_queue;
        struct sk_buff *completion_queue;

        struct net_device backlog_dev;
};

extern __typeof__(struct softnet_data) per_cpu__softnet_data;



static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void __netif_schedule(struct net_device *dev)
{
        if (!test_and_set_bit(__LINK_STATE_SCHED, &dev->state)) {
                unsigned long flags;
                struct softnet_data *sd;

                __asm__ __volatile__("pushfl ; popl %0 ; cli":"=g" (flags): :"memory");
                sd = &(*({ unsigned long __ptr; __asm__ ("" : "=g"(__ptr) : "0"(&per_cpu__softnet_data)); (typeof(&per_cpu__softnet_data)) (__ptr + (__per_cpu_offset[(current_thread_info()->cpu)])); }));
                dev->next_sched = sd->output_queue;
                sd->output_queue = dev;
                raise_softirq_irqoff(NET_TX_SOFTIRQ);
                do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); __asm__ __volatile__("pushl %0 ; popfl": :"g" (flags):"memory", "cc"); } while (0);
        }
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void netif_schedule(struct net_device *dev)
{
        if (!(__builtin_constant_p(__LINK_STATE_XOFF) ? constant_test_bit((__LINK_STATE_XOFF),(&dev->state)) : variable_test_bit((__LINK_STATE_XOFF),(&dev->state))))
                __netif_schedule(dev);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void netif_start_queue(struct net_device *dev)
{
        clear_bit(__LINK_STATE_XOFF, &dev->state);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void netif_wake_queue(struct net_device *dev)
{




        if (test_and_clear_bit(__LINK_STATE_XOFF, &dev->state))
                __netif_schedule(dev);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void netif_stop_queue(struct net_device *dev)
{




        set_bit(__LINK_STATE_XOFF, &dev->state);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int netif_queue_stopped(const struct net_device *dev)
{
        return (__builtin_constant_p(__LINK_STATE_XOFF) ? constant_test_bit((__LINK_STATE_XOFF),(&dev->state)) : variable_test_bit((__LINK_STATE_XOFF),(&dev->state)));
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int netif_running(const struct net_device *dev)
{
        return (__builtin_constant_p(__LINK_STATE_START) ? constant_test_bit((__LINK_STATE_START),(&dev->state)) : variable_test_bit((__LINK_STATE_START),(&dev->state)));
}





static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void dev_kfree_skb_irq(struct sk_buff *skb)
{
        if (atomic_dec_and_test(&skb->users)) {
                struct softnet_data *sd;
                unsigned long flags;

                __asm__ __volatile__("pushfl ; popl %0 ; cli":"=g" (flags): :"memory");
                sd = &(*({ unsigned long __ptr; __asm__ ("" : "=g"(__ptr) : "0"(&per_cpu__softnet_data)); (typeof(&per_cpu__softnet_data)) (__ptr + (__per_cpu_offset[(current_thread_info()->cpu)])); }));
                skb->next = sd->completion_queue;
                sd->completion_queue = skb;
                raise_softirq_irqoff(NET_TX_SOFTIRQ);
                do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); __asm__ __volatile__("pushl %0 ; popfl": :"g" (flags):"memory", "cc"); } while (0);
        }
}




static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void dev_kfree_skb_any(struct sk_buff *skb)
{
        if ((((current_thread_info()->preempt_count) & (((1UL << (8))-1) << ((0 + 8) + 8)))) || ({ unsigned long flags; do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); __asm__ __volatile__("pushfl ; popl %0":"=g" (flags): ); } while (0); !(flags & (1<<9)); }))
                dev_kfree_skb_irq(skb);
        else
                kfree_skb(skb);
}


extern int netif_rx(struct sk_buff *skb);

extern int netif_receive_skb(struct sk_buff *skb);
extern int dev_ioctl(unsigned int cmd, void *);
extern int dev_ethtool(struct ifreq *);
extern unsigned dev_get_flags(const struct net_device *);
extern int dev_change_flags(struct net_device *, unsigned);
extern int dev_set_mtu(struct net_device *, int);
extern void dev_queue_xmit_nit(struct sk_buff *skb, struct net_device *dev);

extern void dev_init(void);

extern int netdev_nit;




static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int netif_rx_ni(struct sk_buff *skb)
{
       int err = netif_rx(skb);
       if ((irq_stat[((current_thread_info()->cpu))].__softirq_pending))
               do_softirq();
       return err;
}


extern void netdev_run_todo(void);

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void dev_put(struct net_device *dev)
{
        atomic_dec(&dev->refcnt);
}
# 714 "include/linux/netdevice.h"
extern void linkwatch_fire_event(struct net_device *dev);

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int netif_carrier_ok(const struct net_device *dev)
{
        return !(__builtin_constant_p(__LINK_STATE_NOCARRIER) ? constant_test_bit((__LINK_STATE_NOCARRIER),(&dev->state)) : variable_test_bit((__LINK_STATE_NOCARRIER),(&dev->state)));
}

extern void __netdev_watchdog_up(struct net_device *dev);

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void netif_carrier_on(struct net_device *dev)
{
        if (test_and_clear_bit(__LINK_STATE_NOCARRIER, &dev->state))
                linkwatch_fire_event(dev);
        if (netif_running(dev))
                __netdev_watchdog_up(dev);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void netif_carrier_off(struct net_device *dev)
{
        if (!test_and_set_bit(__LINK_STATE_NOCARRIER, &dev->state))
                linkwatch_fire_event(dev);
}


static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int netif_device_present(struct net_device *dev)
{
        return (__builtin_constant_p(__LINK_STATE_PRESENT) ? constant_test_bit((__LINK_STATE_PRESENT),(&dev->state)) : variable_test_bit((__LINK_STATE_PRESENT),(&dev->state)));
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void netif_device_detach(struct net_device *dev)
{
        if (test_and_clear_bit(__LINK_STATE_PRESENT, &dev->state) &&
            netif_running(dev)) {
                netif_stop_queue(dev);
        }
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void netif_device_attach(struct net_device *dev)
{
        if (!test_and_set_bit(__LINK_STATE_PRESENT, &dev->state) &&
            netif_running(dev)) {
                netif_wake_queue(dev);
                __netdev_watchdog_up(dev);
        }
}






enum {
        NETIF_MSG_DRV = 0x0001,
        NETIF_MSG_PROBE = 0x0002,
        NETIF_MSG_LINK = 0x0004,
        NETIF_MSG_TIMER = 0x0008,
        NETIF_MSG_IFDOWN = 0x0010,
        NETIF_MSG_IFUP = 0x0020,
        NETIF_MSG_RX_ERR = 0x0040,
        NETIF_MSG_TX_ERR = 0x0080,
        NETIF_MSG_TX_QUEUED = 0x0100,
        NETIF_MSG_INTR = 0x0200,
        NETIF_MSG_TX_DONE = 0x0400,
        NETIF_MSG_RX_STATUS = 0x0800,
        NETIF_MSG_PKTDATA = 0x1000,
        NETIF_MSG_HW = 0x2000,
        NETIF_MSG_WOL = 0x4000,
};
# 799 "include/linux/netdevice.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) u32 netif_msg_init(int debug_value, int default_msg_enable_bits)
{

        if (debug_value < 0 || debug_value >= (sizeof(u32) * 8))
                return default_msg_enable_bits;
        if (debug_value == 0)
                return 0;

        return (1 << debug_value) - 1;
}



static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int netif_rx_schedule_prep(struct net_device *dev)
{
        return netif_running(dev) &&
                !test_and_set_bit(__LINK_STATE_RX_SCHED, &dev->state);
}





static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void __netif_rx_schedule(struct net_device *dev)
{
        unsigned long flags;

        __asm__ __volatile__("pushfl ; popl %0 ; cli":"=g" (flags): :"memory");
        atomic_inc(&(dev)->refcnt);
        list_add_tail(&dev->poll_list, &(*({ unsigned long __ptr; __asm__ ("" : "=g"(__ptr) : "0"(&per_cpu__softnet_data)); (typeof(&per_cpu__softnet_data)) (__ptr + (__per_cpu_offset[(current_thread_info()->cpu)])); })).poll_list);
        if (dev->quota < 0)
                dev->quota += dev->weight;
        else
                dev->quota = dev->weight;
        do { (irq_stat[((current_thread_info()->cpu))].__softirq_pending) |= 1UL << (NET_RX_SOFTIRQ); } while (0);
        do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); __asm__ __volatile__("pushl %0 ; popfl": :"g" (flags):"memory", "cc"); } while (0);
}



static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void netif_rx_schedule(struct net_device *dev)
{
        if (netif_rx_schedule_prep(dev))
                __netif_rx_schedule(dev);
}




static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int netif_rx_reschedule(struct net_device *dev, int undo)
{
        if (netif_rx_schedule_prep(dev)) {
                unsigned long flags;

                dev->quota += undo;

                __asm__ __volatile__("pushfl ; popl %0 ; cli":"=g" (flags): :"memory");
                list_add_tail(&dev->poll_list, &(*({ unsigned long __ptr; __asm__ ("" : "=g"(__ptr) : "0"(&per_cpu__softnet_data)); (typeof(&per_cpu__softnet_data)) (__ptr + (__per_cpu_offset[(current_thread_info()->cpu)])); })).poll_list);
                do { (irq_stat[((current_thread_info()->cpu))].__softirq_pending) |= 1UL << (NET_RX_SOFTIRQ); } while (0);
                do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); __asm__ __volatile__("pushl %0 ; popfl": :"g" (flags):"memory", "cc"); } while (0);
                return 1;
        }
        return 0;
}






static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void netif_rx_complete(struct net_device *dev)
{
        unsigned long flags;

        __asm__ __volatile__("pushfl ; popl %0 ; cli":"=g" (flags): :"memory");
        do { if (__builtin_expect(!!((!(__builtin_constant_p(__LINK_STATE_RX_SCHED) ? constant_test_bit((__LINK_STATE_RX_SCHED),(&dev->state)) : variable_test_bit((__LINK_STATE_RX_SCHED),(&dev->state))))!=0), 0)) __asm__ __volatile__( "ud2\n" "\t.word %c0\n" "\t.long %c1\n" : : "i" (874), "i" ("include/linux/netdevice.h")); } while(0);
        list_del(&dev->poll_list);
        __asm__ __volatile__("": : :"memory");
        clear_bit(__LINK_STATE_RX_SCHED, &dev->state);
        do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); __asm__ __volatile__("pushl %0 ; popfl": :"g" (flags):"memory", "cc"); } while (0);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void netif_poll_disable(struct net_device *dev)
{
        while (test_and_set_bit(__LINK_STATE_RX_SCHED, &dev->state)) {

                get_current()->state = 1;
                schedule_timeout(1);
        }
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void netif_poll_enable(struct net_device *dev)
{
        clear_bit(__LINK_STATE_RX_SCHED, &dev->state);
}




static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void __netif_rx_complete(struct net_device *dev)
{
        do { if (__builtin_expect(!!((!(__builtin_constant_p(__LINK_STATE_RX_SCHED) ? constant_test_bit((__LINK_STATE_RX_SCHED),(&dev->state)) : variable_test_bit((__LINK_STATE_RX_SCHED),(&dev->state))))!=0), 0)) __asm__ __volatile__( "ud2\n" "\t.word %c0\n" "\t.long %c1\n" : : "i" (900), "i" ("include/linux/netdevice.h")); } while(0);
        list_del(&dev->poll_list);
        __asm__ __volatile__("": : :"memory");
        clear_bit(__LINK_STATE_RX_SCHED, &dev->state);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void netif_tx_disable(struct net_device *dev)
{
        do { do { (current_thread_info()->preempt_count) += (1UL << (0 + 8)); __asm__ __volatile__("": : :"memory"); } while (0); do { do { (current_thread_info()->preempt_count)++; } while (0); __asm__ __volatile__("": : :"memory"); } while (0); _raw_spin_lock(&dev->xmit_lock); } while (0);
        netif_stop_queue(dev);
        do { _raw_spin_unlock(&dev->xmit_lock); do { do { __asm__ __volatile__("": : :"memory"); do { (current_thread_info()->preempt_count)--; } while (0); } while (0); do { if (__builtin_expect(!!(test_thread_flag(3)), 0)) preempt_schedule(); } while (0); } while (0); local_bh_enable(); } while (0);
}



extern void ether_setup(struct net_device *dev);
extern void fddi_setup(struct net_device *dev);
extern void tr_setup(struct net_device *dev);
extern void fc_setup(struct net_device *dev);
extern void fc_freedev(struct net_device *dev);

extern struct net_device *alloc_netdev(int sizeof_priv, const char *name,
                                       void (*setup)(struct net_device *));
extern int register_netdev(struct net_device *dev);
extern void unregister_netdev(struct net_device *dev);

extern void dev_mc_upload(struct net_device *dev);
extern int dev_mc_delete(struct net_device *dev, void *addr, int alen, int all);
extern int dev_mc_add(struct net_device *dev, void *addr, int alen, int newonly);
extern void dev_mc_discard(struct net_device *dev);
extern void dev_set_promiscuity(struct net_device *dev, int inc);
extern void dev_set_allmulti(struct net_device *dev, int inc);
extern void netdev_state_change(struct net_device *dev);

extern void dev_load(const char *name);
extern void dev_mcast_init(void);
extern int netdev_register_fc(struct net_device *dev, void (*stimul)(struct net_device *dev));
extern void netdev_unregister_fc(int bit);
extern int netdev_max_backlog;
extern int weight_p;
extern unsigned long netdev_fc_xoff;
extern atomic_t netdev_dropping;
extern int netdev_set_master(struct net_device *dev, struct net_device *master);
extern int skb_checksum_help(struct sk_buff **pskb, int inward);


extern char *net_sysctl_strdup(const char *s);
# 21 "net/ipv4/netfilter/ip_tables.c" 2

# 1 "include/linux/tcp.h" 1
# 23 "include/linux/tcp.h"
struct tcphdr {
        __u16 source;
        __u16 dest;
        __u32 seq;
        __u32 ack_seq;

        __u16 res1:4,
                doff:4,
                fin:1,
                syn:1,
                rst:1,
                psh:1,
                ack:1,
                urg:1,
                ece:1,
                cwr:1;
# 53 "include/linux/tcp.h"
        __u16 window;
        __u16 check;
        __u16 urg_ptr;
};


enum {
  TCP_ESTABLISHED = 1,
  TCP_SYN_SENT,
  TCP_SYN_RECV,
  TCP_FIN_WAIT1,
  TCP_FIN_WAIT2,
  TCP_TIME_WAIT,
  TCP_CLOSE,
  TCP_CLOSE_WAIT,
  TCP_LAST_ACK,
  TCP_LISTEN,
  TCP_CLOSING,

  TCP_MAX_STATES
};




enum {
  TCPF_ESTABLISHED = (1 << 1),
  TCPF_SYN_SENT = (1 << 2),
  TCPF_SYN_RECV = (1 << 3),
  TCPF_FIN_WAIT1 = (1 << 4),
  TCPF_FIN_WAIT2 = (1 << 5),
  TCPF_TIME_WAIT = (1 << 6),
  TCPF_CLOSE = (1 << 7),
  TCPF_CLOSE_WAIT = (1 << 8),
  TCPF_LAST_ACK = (1 << 9),
  TCPF_LISTEN = (1 << 10),
  TCPF_CLOSING = (1 << 11)
};






union tcp_word_hdr {
        struct tcphdr hdr;
        __u32 words[5];
};



enum {
        TCP_FLAG_CWR = ((__u32)( (((__u32)((0x00800000)) & (__u32)0x000000ffUL) << 24) | (((__u32)((0x00800000)) & (__u32)0x0000ff00UL) << 8) | (((__u32)((0x00800000)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)((0x00800000)) & (__u32)0xff000000UL) >> 24) )),
        TCP_FLAG_ECE = ((__u32)( (((__u32)((0x00400000)) & (__u32)0x000000ffUL) << 24) | (((__u32)((0x00400000)) & (__u32)0x0000ff00UL) << 8) | (((__u32)((0x00400000)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)((0x00400000)) & (__u32)0xff000000UL) >> 24) )),
        TCP_FLAG_URG = ((__u32)( (((__u32)((0x00200000)) & (__u32)0x000000ffUL) << 24) | (((__u32)((0x00200000)) & (__u32)0x0000ff00UL) << 8) | (((__u32)((0x00200000)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)((0x00200000)) & (__u32)0xff000000UL) >> 24) )),
        TCP_FLAG_ACK = ((__u32)( (((__u32)((0x00100000)) & (__u32)0x000000ffUL) << 24) | (((__u32)((0x00100000)) & (__u32)0x0000ff00UL) << 8) | (((__u32)((0x00100000)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)((0x00100000)) & (__u32)0xff000000UL) >> 24) )),
        TCP_FLAG_PSH = ((__u32)( (((__u32)((0x00080000)) & (__u32)0x000000ffUL) << 24) | (((__u32)((0x00080000)) & (__u32)0x0000ff00UL) << 8) | (((__u32)((0x00080000)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)((0x00080000)) & (__u32)0xff000000UL) >> 24) )),
        TCP_FLAG_RST = ((__u32)( (((__u32)((0x00040000)) & (__u32)0x000000ffUL) << 24) | (((__u32)((0x00040000)) & (__u32)0x0000ff00UL) << 8) | (((__u32)((0x00040000)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)((0x00040000)) & (__u32)0xff000000UL) >> 24) )),
        TCP_FLAG_SYN = ((__u32)( (((__u32)((0x00020000)) & (__u32)0x000000ffUL) << 24) | (((__u32)((0x00020000)) & (__u32)0x0000ff00UL) << 8) | (((__u32)((0x00020000)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)((0x00020000)) & (__u32)0xff000000UL) >> 24) )),
        TCP_FLAG_FIN = ((__u32)( (((__u32)((0x00010000)) & (__u32)0x000000ffUL) << 24) | (((__u32)((0x00010000)) & (__u32)0x0000ff00UL) << 8) | (((__u32)((0x00010000)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)((0x00010000)) & (__u32)0xff000000UL) >> 24) )),
        TCP_RESERVED_BITS = ((__u32)( (((__u32)((0x0F000000)) & (__u32)0x000000ffUL) << 24) | (((__u32)((0x0F000000)) & (__u32)0x0000ff00UL) << 8) | (((__u32)((0x0F000000)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)((0x0F000000)) & (__u32)0xff000000UL) >> 24) )),
        TCP_DATA_OFFSET = ((__u32)( (((__u32)((0xF0000000)) & (__u32)0x000000ffUL) << 24) | (((__u32)((0xF0000000)) & (__u32)0x0000ff00UL) << 8) | (((__u32)((0xF0000000)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)((0xF0000000)) & (__u32)0xff000000UL) >> 24) ))
};
# 136 "include/linux/tcp.h"
enum tcp_ca_state
{
        TCP_CA_Open = 0,

        TCP_CA_Disorder = 1,

        TCP_CA_CWR = 2,

        TCP_CA_Recovery = 3,

        TCP_CA_Loss = 4

};

struct tcp_info
{
        __u8 tcpi_state;
        __u8 tcpi_ca_state;
        __u8 tcpi_retransmits;
        __u8 tcpi_probes;
        __u8 tcpi_backoff;
        __u8 tcpi_options;
        __u8 tcpi_snd_wscale : 4, tcpi_rcv_wscale : 4;

        __u32 tcpi_rto;
        __u32 tcpi_ato;
        __u32 tcpi_snd_mss;
        __u32 tcpi_rcv_mss;

        __u32 tcpi_unacked;
        __u32 tcpi_sacked;
        __u32 tcpi_lost;
        __u32 tcpi_retrans;
        __u32 tcpi_fackets;


        __u32 tcpi_last_data_sent;
        __u32 tcpi_last_ack_sent;
        __u32 tcpi_last_data_recv;
        __u32 tcpi_last_ack_recv;


        __u32 tcpi_pmtu;
        __u32 tcpi_rcv_ssthresh;
        __u32 tcpi_rtt;
        __u32 tcpi_rttvar;
        __u32 tcpi_snd_ssthresh;
        __u32 tcpi_snd_cwnd;
        __u32 tcpi_advmss;
        __u32 tcpi_reordering;

        __u32 tcpi_rcv_rtt;
        __u32 tcpi_rcv_space;
};





# 1 "include/linux/ip.h" 1
# 84 "include/linux/ip.h"
# 1 "include/net/sock.h" 1
# 50 "include/net/sock.h"
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


# 1 "include/linux/netlink.h" 1
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
# 51 "include/net/sock.h" 2

# 1 "include/linux/filter.h" 1
# 21 "include/linux/filter.h"
struct sock_filter
{
        __u16 code;
        __u8 jt;
        __u8 jf;
        __u32 k;
};

struct sock_fprog
{
        unsigned short len;
        struct sock_filter *filter;
};


struct sk_filter
{
        atomic_t refcnt;
        unsigned int len;
        struct sock_filter insns[0];
};

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned int sk_filter_len(struct sk_filter *fp)
{
        return fp->len*sizeof(struct sock_filter) + sizeof(*fp);
}
# 138 "include/linux/filter.h"
extern int sk_run_filter(struct sk_buff *skb, struct sock_filter *filter, int flen);
extern int sk_attach_filter(struct sock_fprog *fprog, struct sock *sk);
extern int sk_chk_filter(struct sock_filter *filter, int flen);
# 53 "include/net/sock.h" 2


# 1 "include/net/dst.h" 1
# 12 "include/net/dst.h"
# 1 "include/linux/rtnetlink.h" 1
# 66 "include/linux/rtnetlink.h"
struct rtattr
{
        unsigned short rta_len;
        unsigned short rta_type;
};
# 93 "include/linux/rtnetlink.h"
struct rtmsg
{
        unsigned char rtm_family;
        unsigned char rtm_dst_len;
        unsigned char rtm_src_len;
        unsigned char rtm_tos;

        unsigned char rtm_table;
        unsigned char rtm_protocol;
        unsigned char rtm_scope;
        unsigned char rtm_type;

        unsigned rtm_flags;
};



enum
{
        RTN_UNSPEC,
        RTN_UNICAST,
        RTN_LOCAL,
        RTN_BROADCAST,

        RTN_ANYCAST,

        RTN_MULTICAST,
        RTN_BLACKHOLE,
        RTN_UNREACHABLE,
        RTN_PROHIBIT,
        RTN_THROW,
        RTN_NAT,
        RTN_XRESOLVE,
        __RTN_MAX
};
# 167 "include/linux/rtnetlink.h"
enum rt_scope_t
{
        RT_SCOPE_UNIVERSE=0,

        RT_SCOPE_SITE=200,
        RT_SCOPE_LINK=253,
        RT_SCOPE_HOST=254,
        RT_SCOPE_NOWHERE=255
};
# 186 "include/linux/rtnetlink.h"
enum rt_class_t
{
        RT_TABLE_UNSPEC=0,

        RT_TABLE_DEFAULT=253,
        RT_TABLE_MAIN=254,
        RT_TABLE_LOCAL=255,
        __RT_TABLE_MAX
};






enum rtattr_type_t
{
        RTA_UNSPEC,
        RTA_DST,
        RTA_SRC,
        RTA_IIF,
        RTA_OIF,
        RTA_GATEWAY,
        RTA_PRIORITY,
        RTA_PREFSRC,
        RTA_METRICS,
        RTA_MULTIPATH,
        RTA_PROTOINFO,
        RTA_FLOW,
        RTA_CACHEINFO,
        RTA_SESSION,
        __RTA_MAX
};
# 234 "include/linux/rtnetlink.h"
struct rtnexthop
{
        unsigned short rtnh_len;
        unsigned char rtnh_flags;
        unsigned char rtnh_hops;
        int rtnh_ifindex;
};
# 261 "include/linux/rtnetlink.h"
struct rta_cacheinfo
{
        __u32 rta_clntref;
        __u32 rta_lastuse;
        __s32 rta_expires;
        __u32 rta_error;
        __u32 rta_used;


        __u32 rta_id;
        __u32 rta_ts;
        __u32 rta_tsage;
};



enum
{
        RTAX_UNSPEC,

        RTAX_LOCK,

        RTAX_MTU,

        RTAX_WINDOW,

        RTAX_RTT,

        RTAX_RTTVAR,

        RTAX_SSTHRESH,

        RTAX_CWND,

        RTAX_ADVMSS,

        RTAX_REORDERING,

        RTAX_HOPLIMIT,

        RTAX_INITCWND,

        RTAX_FEATURES,

        __RTAX_MAX
};







struct rta_session
{
        __u8 proto;

        union {
                struct {
                        __u16 sport;
                        __u16 dport;
                } ports;

                struct {
                        __u8 type;
                        __u8 code;
                        __u16 ident;
                } icmpt;

                __u32 spi;
        } u;
};






struct ifaddrmsg
{
        unsigned char ifa_family;
        unsigned char ifa_prefixlen;
        unsigned char ifa_flags;
        unsigned char ifa_scope;
        int ifa_index;
};

enum
{
        IFA_UNSPEC,
        IFA_ADDRESS,
        IFA_LOCAL,
        IFA_LABEL,
        IFA_BROADCAST,
        IFA_ANYCAST,
        IFA_CACHEINFO,
        IFA_MULTICAST,
        __IFA_MAX
};
# 372 "include/linux/rtnetlink.h"
struct ifa_cacheinfo
{
        __u32 ifa_prefered;
        __u32 ifa_valid;
        __u32 cstamp;
        __u32 tstamp;
};
# 396 "include/linux/rtnetlink.h"
struct ndmsg
{
        unsigned char ndm_family;
        unsigned char ndm_pad1;
        unsigned short ndm_pad2;
        int ndm_ifindex;
        __u16 ndm_state;
        __u8 ndm_flags;
        __u8 ndm_type;
};

enum
{
        NDA_UNSPEC,
        NDA_DST,
        NDA_LLADDR,
        NDA_CACHEINFO,
        __NDA_MAX
};
# 445 "include/linux/rtnetlink.h"
struct nda_cacheinfo
{
        __u32 ndm_confirmed;
        __u32 ndm_used;
        __u32 ndm_updated;
        __u32 ndm_refcnt;
};





struct rtgenmsg
{
        unsigned char rtgen_family;
};
# 471 "include/linux/rtnetlink.h"
struct ifinfomsg
{
        unsigned char ifi_family;
        unsigned char __ifi_pad;
        unsigned short ifi_type;
        int ifi_index;
        unsigned ifi_flags;
        unsigned ifi_change;
};





struct prefixmsg
{
        unsigned char prefix_family;
        int prefix_ifindex;
        unsigned char prefix_type;
        unsigned char prefix_len;
        unsigned char prefix_flags;
};

enum
{
        PREFIX_UNSPEC,
        PREFIX_ADDRESS,
        PREFIX_CACHEINFO,
        __PREFIX_MAX
};



struct prefix_cacheinfo
{
        __u32 preferred_time;
        __u32 valid_time;
};


struct rtnl_link_stats
{
        __u32 rx_packets;
        __u32 tx_packets;
        __u32 rx_bytes;
        __u32 tx_bytes;
        __u32 rx_errors;
        __u32 tx_errors;
        __u32 rx_dropped;
        __u32 tx_dropped;
        __u32 multicast;
        __u32 collisions;


        __u32 rx_length_errors;
        __u32 rx_over_errors;
        __u32 rx_crc_errors;
        __u32 rx_frame_errors;
        __u32 rx_fifo_errors;
        __u32 rx_missed_errors;


        __u32 tx_aborted_errors;
        __u32 tx_carrier_errors;
        __u32 tx_fifo_errors;
        __u32 tx_heartbeat_errors;
        __u32 tx_window_errors;


        __u32 rx_compressed;
        __u32 tx_compressed;
};

enum
{
        IFLA_UNSPEC,
        IFLA_ADDRESS,
        IFLA_BROADCAST,
        IFLA_IFNAME,
        IFLA_MTU,
        IFLA_LINK,
        IFLA_QDISC,
        IFLA_STATS,
        IFLA_COST,

        IFLA_PRIORITY,

        IFLA_MASTER,

        IFLA_WIRELESS,

        IFLA_PROTINFO,

        __IFLA_MAX
};
# 603 "include/linux/rtnetlink.h"
enum
{
        IFLA_INET6_UNSPEC,
        IFLA_INET6_FLAGS,
        IFLA_INET6_CONF,
        IFLA_INET6_STATS,
        IFLA_INET6_MCAST,
        IFLA_INET6_CACHEINFO,
        __IFLA_INET6_MAX
};



struct ifla_cacheinfo
{
        __u32 max_reasm_len;
        __u32 tstamp;
        __u32 reachable_time;
        __u32 retrans_time;
};





struct tcmsg
{
        unsigned char tcm_family;
        unsigned char tcm__pad1;
        unsigned short tcm__pad2;
        int tcm_ifindex;
        __u32 tcm_handle;
        __u32 tcm_parent;
        __u32 tcm_info;
};

enum
{
        TCA_UNSPEC,
        TCA_KIND,
        TCA_OPTIONS,
        TCA_STATS,
        TCA_XSTATS,
        TCA_RATE,
        TCA_FCNT,
        __TCA_MAX
};
# 683 "include/linux/rtnetlink.h"
struct tcamsg
{
        unsigned char tca_family;
        unsigned char tca__pad1;
        unsigned short tca__pad2;
};
# 700 "include/linux/rtnetlink.h"
static __inline__ __attribute__((always_inline)) int rtattr_strcmp(const struct rtattr *rta, const char *str)
{
        int len = strlen(str) + 1;
        return len > rta->rta_len || __builtin_memcmp(((void*)(((char*)(rta)) + (( ((sizeof(struct rtattr))+4 -1) & ~(4 -1) ) + (0)))), str, len);
}

extern int rtattr_parse(struct rtattr *tb[], int maxattr, struct rtattr *rta, int len);

extern struct sock *rtnl;

struct rtnetlink_link
{
        int (*doit)(struct sk_buff *, struct nlmsghdr*, void *attr);
        int (*dumpit)(struct sk_buff *, struct netlink_callback *cb);
};

extern struct rtnetlink_link * rtnetlink_links[32];
extern int rtnetlink_dump_ifinfo(struct sk_buff *skb, struct netlink_callback *cb);
extern int rtnetlink_send(struct sk_buff *skb, u32 pid, u32 group, int echo);
extern int rtnetlink_put_metrics(struct sk_buff *skb, u32 *metrics);

extern void __rta_fill(struct sk_buff *skb, int attrtype, int attrlen, const void *data);






static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct rtattr *
__rta_reserve(struct sk_buff *skb, int attrtype, int attrlen)
{
        struct rtattr *rta;
        int size = (( ((sizeof(struct rtattr))+4 -1) & ~(4 -1) ) + (attrlen));

        rta = (struct rtattr*)skb_put(skb, ( ((size)+4 -1) & ~(4 -1) ));
        rta->rta_type = attrtype;
        rta->rta_len = size;
        return rta;
}






extern void rtmsg_ifinfo(int type, struct net_device *dev, unsigned change);

extern struct semaphore rtnl_sem;
# 757 "include/linux/rtnetlink.h"
extern void rtnl_lock(void);
extern void rtnl_unlock(void);
extern void rtnetlink_init(void);
# 13 "include/net/dst.h" 2


# 1 "include/net/neighbour.h" 1
# 56 "include/net/neighbour.h"
struct neigh_parms
{
        struct neigh_parms *next;
        int (*neigh_setup)(struct neighbour *);
        struct neigh_table *tbl;
        int entries;
        void *priv;

        void *sysctl_table;

        int base_reachable_time;
        int retrans_time;
        int gc_staletime;
        int reachable_time;
        int delay_probe_time;

        int queue_len;
        int ucast_probes;
        int app_probes;
        int mcast_probes;
        int anycast_delay;
        int proxy_delay;
        int proxy_qlen;
        int locktime;
};

struct neigh_statistics
{
        unsigned long allocs;
        unsigned long res_failed;
        unsigned long rcv_probes_mcast;
        unsigned long rcv_probes_ucast;
};

struct neighbour
{
        struct neighbour *next;
        struct neigh_table *tbl;
        struct neigh_parms *parms;
        struct net_device *dev;
        unsigned long used;
        unsigned long confirmed;
        unsigned long updated;
        __u8 flags;
        __u8 nud_state;
        __u8 type;
        __u8 dead;
        atomic_t probes;
        rwlock_t lock;
        unsigned char ha[(32 +sizeof(unsigned long)-1)&~(sizeof(unsigned long)-1)];
        struct hh_cache *hh;
        atomic_t refcnt;
        int (*output)(struct sk_buff *skb);
        struct sk_buff_head arp_queue;
        struct timer_list timer;
        struct neigh_ops *ops;
        u8 primary_key[0];
};

struct neigh_ops
{
        int family;
        void (*destructor)(struct neighbour *);
        void (*solicit)(struct neighbour *, struct sk_buff*);
        void (*error_report)(struct neighbour *, struct sk_buff*);
        int (*output)(struct sk_buff*);
        int (*connected_output)(struct sk_buff*);
        int (*hh_output)(struct sk_buff*);
        int (*queue_xmit)(struct sk_buff*);
};

struct pneigh_entry
{
        struct pneigh_entry *next;
        struct net_device *dev;
        u8 key[0];
};
# 142 "include/net/neighbour.h"
struct neigh_table
{
        struct neigh_table *next;
        int family;
        int entry_size;
        int key_len;
        __u32 (*hash)(const void *pkey, const struct net_device *);
        int (*constructor)(struct neighbour *);
        int (*pconstructor)(struct pneigh_entry *);
        void (*pdestructor)(struct pneigh_entry *);
        void (*proxy_redo)(struct sk_buff *skb);
        char *id;
        struct neigh_parms parms;

        int gc_interval;
        int gc_thresh1;
        int gc_thresh2;
        int gc_thresh3;
        unsigned long last_flush;
        struct timer_list gc_timer;
        struct timer_list proxy_timer;
        struct sk_buff_head proxy_queue;
        int entries;
        rwlock_t lock;
        unsigned long last_rand;
        struct neigh_parms *parms_list;
        kmem_cache_t *kmem_cachep;
        struct neigh_statistics stats;
        struct neighbour *hash_buckets[0x1F +1];
        struct pneigh_entry *phash_buckets[0xF +1];
};

extern void neigh_table_init(struct neigh_table *tbl);
extern int neigh_table_clear(struct neigh_table *tbl);
extern struct neighbour * neigh_lookup(struct neigh_table *tbl,
                                             const void *pkey,
                                             struct net_device *dev);
extern struct neighbour * neigh_create(struct neigh_table *tbl,
                                             const void *pkey,
                                             struct net_device *dev);
extern void neigh_destroy(struct neighbour *neigh);
extern int __neigh_event_send(struct neighbour *neigh, struct sk_buff *skb);
extern int neigh_update(struct neighbour *neigh, const u8 *lladdr, u8 new, int override, int arp);
extern void neigh_changeaddr(struct neigh_table *tbl, struct net_device *dev);
extern int neigh_ifdown(struct neigh_table *tbl, struct net_device *dev);
extern int neigh_resolve_output(struct sk_buff *skb);
extern int neigh_connected_output(struct sk_buff *skb);
extern int neigh_compat_output(struct sk_buff *skb);
extern struct neighbour *neigh_event_ns(struct neigh_table *tbl,
                                                u8 *lladdr, void *saddr,
                                                struct net_device *dev);

extern struct neigh_parms *neigh_parms_alloc(struct net_device *dev, struct neigh_table *tbl);
extern void neigh_parms_release(struct neigh_table *tbl, struct neigh_parms *parms);
extern unsigned long neigh_rand_reach_time(unsigned long base);

extern void pneigh_enqueue(struct neigh_table *tbl, struct neigh_parms *p,
                                               struct sk_buff *skb);
extern struct pneigh_entry *pneigh_lookup(struct neigh_table *tbl, const void *key, struct net_device *dev, int creat);
extern int pneigh_delete(struct neigh_table *tbl, const void *key, struct net_device *dev);

struct netlink_callback;
struct nlmsghdr;
extern int neigh_dump_info(struct sk_buff *skb, struct netlink_callback *cb);
extern int neigh_add(struct sk_buff *skb, struct nlmsghdr *nlh, void *arg);
extern int neigh_delete(struct sk_buff *skb, struct nlmsghdr *nlh, void *arg);
extern void neigh_app_ns(struct neighbour *n);

extern int neigh_sysctl_register(struct net_device *dev,
                                                      struct neigh_parms *p,
                                                      int p_id, int pdev_id,
                                                      char *p_name,
                                                      proc_handler *proc_handler);
extern void neigh_sysctl_unregister(struct neigh_parms *p);





static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void neigh_release(struct neighbour *neigh)
{
        if (atomic_dec_and_test(&neigh->refcnt))
                neigh_destroy(neigh);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct neighbour * neigh_clone(struct neighbour *neigh)
{
        if (neigh)
                atomic_inc(&neigh->refcnt);
        return neigh;
}



static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void neigh_confirm(struct neighbour *neigh)
{
        if (neigh)
                neigh->confirmed = jiffies;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int neigh_is_connected(struct neighbour *neigh)
{
        return neigh->nud_state&(0x80|0x40|0x02);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int neigh_is_valid(struct neighbour *neigh)
{
        return neigh->nud_state&(0x80|0x40|0x02|0x10|0x04|0x08);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int neigh_event_send(struct neighbour *neigh, struct sk_buff *skb)
{
        neigh->used = jiffies;
        if (!(neigh->nud_state&((0x80|0x40|0x02)|0x08|0x10)))
                return __neigh_event_send(neigh, skb);
        return 0;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct neighbour *
__neigh_lookup(struct neigh_table *tbl, const void *pkey, struct net_device *dev, int creat)
{
        struct neighbour *n = neigh_lookup(tbl, pkey, dev);

        if (n || !creat)
                return n;

        n = neigh_create(tbl, pkey, dev);
        return IS_ERR(n) ? ((void *)0) : n;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct neighbour *
__neigh_lookup_errno(struct neigh_table *tbl, const void *pkey,
  struct net_device *dev)
{
        struct neighbour *n = neigh_lookup(tbl, pkey, dev);

        if (n)
                return n;

        return neigh_create(tbl, pkey, dev);
}
# 16 "include/net/dst.h" 2
# 36 "include/net/dst.h"
struct sk_buff;

struct dst_entry
{
        struct dst_entry *next;
        atomic_t __refcnt;
        int __use;
        struct dst_entry *child;
        struct net_device *dev;
        int obsolete;
        int flags;




        unsigned long lastuse;
        unsigned long expires;

        unsigned short header_len;
        unsigned short trailer_len;

        u32 metrics[(__RTAX_MAX - 1)];
        struct dst_entry *path;

        unsigned long rate_last;
        unsigned long rate_tokens;

        int error;

        struct neighbour *neighbour;
        struct hh_cache *hh;
        struct xfrm_state *xfrm;

        int (*input)(struct sk_buff*);
        int (*output)(struct sk_buff**);


        __u32 tclassid;


        struct dst_ops *ops;
        struct rcu_head rcu_head;

        char info[0];
};


struct dst_ops
{
        unsigned short family;
        unsigned short protocol;
        unsigned gc_thresh;

        int (*gc)(void);
        struct dst_entry * (*check)(struct dst_entry *, __u32 cookie);
        void (*destroy)(struct dst_entry *);
        void (*ifdown)(struct dst_entry *, int how);
        struct dst_entry * (*negative_advice)(struct dst_entry *);
        void (*link_failure)(struct sk_buff *);
        void (*update_pmtu)(struct dst_entry *dst, u32 mtu);
        int (*get_mss)(struct dst_entry *dst, u32 mtu);
        int entry_size;

        atomic_t entries;
        kmem_cache_t *kmem_cachep;
};



static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) u32
dst_metric(struct dst_entry *dst, int metric)
{
        return dst->metrics[metric-1];
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) u32
dst_path_metric(struct dst_entry *dst, int metric)
{
        return dst->path->metrics[metric-1];
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) u32
dst_pmtu(struct dst_entry *dst)
{
        u32 mtu = dst_path_metric(dst, RTAX_MTU);

        __asm__ __volatile__("": : :"memory");
        return mtu;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int
dst_metric_locked(struct dst_entry *dst, int metric)
{
        return dst_metric(dst, RTAX_LOCK) & (1<<metric);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void dst_hold(struct dst_entry * dst)
{
        atomic_inc(&dst->__refcnt);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline))
struct dst_entry * dst_clone(struct dst_entry * dst)
{
        if (dst)
                atomic_inc(&dst->__refcnt);
        return dst;
}

extern const char dst_underflow_bug_msg[];

static __inline__ __attribute__((always_inline)) __attribute__((always_inline))
void dst_release(struct dst_entry * dst)
{
        if (dst) {
                if (((&dst->__refcnt)->counter) < 1)
                        printk(dst_underflow_bug_msg,
                               ((&dst->__refcnt)->counter),
                               dst, ({ void *pc; __asm__("movl $1f,%0\n1:":"=g" (pc)); pc; }));
                atomic_dec(&dst->__refcnt);
        }
}





static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct dst_entry *dst_pop(struct dst_entry *dst)
{
        struct dst_entry *child = dst_clone(dst->child);

        dst_release(dst);
        return child;
}

extern void * dst_alloc(struct dst_ops * ops);
extern void __dst_free(struct dst_entry * dst);
extern struct dst_entry *dst_destroy(struct dst_entry * dst);

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void dst_free(struct dst_entry * dst)
{
        if (dst->obsolete > 1)
                return;
        if (!((&dst->__refcnt)->counter)) {
                dst = dst_destroy(dst);
                if (!dst)
                        return;
        }
        __dst_free(dst);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void dst_rcu_free(struct rcu_head *head)
{
        struct dst_entry *dst = ({ const typeof( ((struct dst_entry *)0)->rcu_head ) *__mptr = (head); (struct dst_entry *)( (char *)__mptr - ((size_t) &((struct dst_entry *)0)->rcu_head) );});
        dst_free(dst);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void dst_confirm(struct dst_entry *dst)
{
        if (dst)
                neigh_confirm(dst->neighbour);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void dst_negative_advice(struct dst_entry **dst_p)
{
        struct dst_entry * dst = *dst_p;
        if (dst && dst->ops->negative_advice)
                *dst_p = dst->ops->negative_advice(dst);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void dst_link_failure(struct sk_buff *skb)
{
        struct dst_entry * dst = skb->dst;
        if (dst && dst->ops && dst->ops->link_failure)
                dst->ops->link_failure(skb);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void dst_set_expires(struct dst_entry *dst, int timeout)
{
        unsigned long expires = jiffies + timeout;

        if (expires == 0)
                expires = 1;

        if (dst->expires == 0 || (({ unsigned long __dummy; typeof(dst->expires) __dummy2; (void)(&__dummy == &__dummy2); 1; }) && ({ unsigned long __dummy; typeof(expires) __dummy2; (void)(&__dummy == &__dummy2); 1; }) && ((long)(expires) - (long)(dst->expires) < 0)))
                dst->expires = expires;
}


static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int dst_output(struct sk_buff *skb)
{
        int err;

        for (;;) {
                err = skb->dst->output(&skb);

                if (__builtin_expect(!!(err == 0), 1))
                        return err;
                if (__builtin_expect(!!(err != 4), 0))
                        return err;
        }
}


static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int dst_input(struct sk_buff *skb)
{
        int err;

        for (;;) {
                err = skb->dst->input(skb);

                if (__builtin_expect(!!(err == 0), 1))
                        return err;

                if (__builtin_expect(!!(err != 4), 0))
                        return err;
        }
}

extern void dst_init(void);

struct flowi;







extern int xfrm_lookup(struct dst_entry **dst_p, struct flowi *fl,
                       struct sock *sk, int flags);
# 56 "include/net/sock.h" 2
# 77 "include/net/sock.h"
struct sock_iocb;
typedef struct {
        spinlock_t slock;
        struct sock_iocb *owner;
        wait_queue_head_t wq;
} socket_lock_t;







struct sock;
# 105 "include/net/sock.h"
struct sock_common {
        unsigned short skc_family;
        volatile unsigned char skc_state;
        unsigned char skc_reuse;
        int skc_bound_dev_if;
        struct hlist_node skc_node;
        struct hlist_node skc_bind_node;
        atomic_t skc_refcnt;
};
# 182 "include/net/sock.h"
struct sock {




        struct sock_common __sk_common;







        volatile unsigned char sk_zapped;
        unsigned char sk_shutdown;
        unsigned char sk_use_write_queue;
        unsigned char sk_userlocks;
        socket_lock_t sk_lock;
        int sk_rcvbuf;
        wait_queue_head_t *sk_sleep;
        struct dst_entry *sk_dst_cache;
        rwlock_t sk_dst_lock;
        struct xfrm_policy *sk_policy[2];
        atomic_t sk_rmem_alloc;
        struct sk_buff_head sk_receive_queue;
        atomic_t sk_wmem_alloc;
        struct sk_buff_head sk_write_queue;
        atomic_t sk_omem_alloc;
        int sk_wmem_queued;
        int sk_forward_alloc;
        unsigned int sk_allocation;
        int sk_sndbuf;
        unsigned long sk_flags;
        char sk_no_check;
        unsigned char sk_debug;
        unsigned char sk_rcvtstamp;
        unsigned char sk_no_largesend;
        int sk_route_caps;
        unsigned long sk_lingertime;
        int sk_hashent;
        struct sock *sk_pair;





        struct {
                struct sk_buff *head;
                struct sk_buff *tail;
        } sk_backlog;
        rwlock_t sk_callback_lock;
        struct sk_buff_head sk_error_queue;
        struct proto *sk_prot;
        int sk_err,
                                sk_err_soft;
        unsigned short sk_ack_backlog;
        unsigned short sk_max_ack_backlog;
        __u32 sk_priority;
        unsigned short sk_type;
        unsigned char sk_localroute;
        unsigned char sk_protocol;
        struct ucred sk_peercred;
        int sk_rcvlowat;
        long sk_rcvtimeo;
        long sk_sndtimeo;
        struct sk_filter *sk_filter;
        void *sk_protinfo;
        kmem_cache_t *sk_slab;
        struct timer_list sk_timer;
        struct timeval sk_stamp;
        struct socket *sk_socket;
        void *sk_user_data;
        struct module *sk_owner;
        struct page *sk_sndmsg_page;
        __u32 sk_sndmsg_off;
        struct sk_buff *sk_send_head;
        int sk_write_pending;
        void *sk_security;
        __u8 sk_queue_shrunk;

        void (*sk_state_change)(struct sock *sk);
        void (*sk_data_ready)(struct sock *sk, int bytes);
        void (*sk_write_space)(struct sock *sk);
        void (*sk_error_report)(struct sock *sk);
        int (*sk_backlog_rcv)(struct sock *sk,
                                                  struct sk_buff *skb);
        void (*sk_destruct)(struct sock *sk);
};




static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct sock *__sk_head(struct hlist_head *head)
{
        return ({ const typeof( ((struct sock *)0)->__sk_common.skc_node ) *__mptr = (head->first); (struct sock *)( (char *)__mptr - ((size_t) &((struct sock *)0)->__sk_common.skc_node) );});
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct sock *sk_head(struct hlist_head *head)
{
        return hlist_empty(head) ? ((void *)0) : __sk_head(head);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct sock *sk_next(struct sock *sk)
{
        return sk->__sk_common.skc_node.next ?
                ({ const typeof( ((struct sock *)0)->__sk_common.skc_node ) *__mptr = (sk->__sk_common.skc_node.next); (struct sock *)( (char *)__mptr - ((size_t) &((struct sock *)0)->__sk_common.skc_node) );}) : ((void *)0);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int sk_unhashed(struct sock *sk)
{
        return hlist_unhashed(&sk->__sk_common.skc_node);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int sk_hashed(struct sock *sk)
{
        return sk->__sk_common.skc_node.pprev != ((void *)0);
}

static __inline__ __attribute__((always_inline)) void sk_node_init(struct hlist_node *node)
{
        node->pprev = ((void *)0);
}

static __inline__ __attribute__((always_inline)) void __sk_del_node(struct sock *sk)
{
        __hlist_del(&sk->__sk_common.skc_node);
}

static __inline__ __attribute__((always_inline)) int __sk_del_node_init(struct sock *sk)
{
        if (sk_hashed(sk)) {
                __sk_del_node(sk);
                sk_node_init(&sk->__sk_common.skc_node);
                return 1;
        }
        return 0;
}







static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void sock_hold(struct sock *sk)
{
        atomic_inc(&sk->__sk_common.skc_refcnt);
}




static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void __sock_put(struct sock *sk)
{
        atomic_dec(&sk->__sk_common.skc_refcnt);
}

static __inline__ __attribute__((always_inline)) int sk_del_node_init(struct sock *sk)
{
        int rc = __sk_del_node_init(sk);

        if (rc) {

                do { if (__builtin_expect(!!((((&sk->__sk_common.skc_refcnt)->counter) == 1)!=0), 0)) { printk("Badness in %s at %s:%d\n", (__func__), "include/net/sock.h", 345); dump_stack(); } } while (0);
                __sock_put(sk);
        }
        return rc;
}

static __inline__ __attribute__((always_inline)) void __sk_add_node(struct sock *sk, struct hlist_head *list)
{
        hlist_add_head(&sk->__sk_common.skc_node, list);
}

static __inline__ __attribute__((always_inline)) void sk_add_node(struct sock *sk, struct hlist_head *list)
{
        sock_hold(sk);
        __sk_add_node(sk, list);
}

static __inline__ __attribute__((always_inline)) void __sk_del_bind_node(struct sock *sk)
{
        __hlist_del(&sk->__sk_common.skc_bind_node);
}

static __inline__ __attribute__((always_inline)) void sk_add_bind_node(struct sock *sk,
                                        struct hlist_head *list)
{
        hlist_add_head(&sk->__sk_common.skc_bind_node, list);
}
# 387 "include/net/sock.h"
enum sock_flags {
        SOCK_DEAD,
        SOCK_DONE,
        SOCK_URGINLINE,
        SOCK_KEEPOPEN,
        SOCK_LINGER,
        SOCK_DESTROY,
        SOCK_BROADCAST,
        SOCK_TIMESTAMP,
};

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void sock_set_flag(struct sock *sk, enum sock_flags flag)
{
        __set_bit(flag, &sk->sk_flags);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void sock_reset_flag(struct sock *sk, enum sock_flags flag)
{
        __clear_bit(flag, &sk->sk_flags);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int sock_flag(struct sock *sk, enum sock_flags flag)
{
        return (__builtin_constant_p(flag) ? constant_test_bit((flag),(&sk->sk_flags)) : variable_test_bit((flag),(&sk->sk_flags)));
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void sk_acceptq_removed(struct sock *sk)
{
        sk->sk_ack_backlog--;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void sk_acceptq_added(struct sock *sk)
{
        sk->sk_ack_backlog++;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int sk_acceptq_is_full(struct sock *sk)
{
        return sk->sk_ack_backlog > sk->sk_max_ack_backlog;
}




static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int sk_stream_min_wspace(struct sock *sk)
{
        return sk->sk_wmem_queued / 2;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int sk_stream_wspace(struct sock *sk)
{
        return sk->sk_sndbuf - sk->sk_wmem_queued;
}

extern void sk_stream_write_space(struct sock *sk);

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int sk_stream_memory_free(struct sock *sk)
{
        return sk->sk_wmem_queued < sk->sk_sndbuf;
}

extern void sk_stream_rfree(struct sk_buff *skb);

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void sk_stream_set_owner_r(struct sk_buff *skb, struct sock *sk)
{
        skb->sk = sk;
        skb->destructor = sk_stream_rfree;
        atomic_add(skb->truesize, &sk->sk_rmem_alloc);
        sk->sk_forward_alloc -= skb->truesize;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void sk_stream_free_skb(struct sock *sk, struct sk_buff *skb)
{
        sk->sk_queue_shrunk = 1;
        sk->sk_wmem_queued -= skb->truesize;
        sk->sk_forward_alloc += skb->truesize;
        __kfree_skb(skb);
}
# 490 "include/net/sock.h"
extern int sk_stream_wait_connect(struct sock *sk, long *timeo_p);
extern int sk_stream_wait_memory(struct sock *sk, long *timeo_p);
extern void sk_stream_wait_close(struct sock *sk, long timeo_p);
extern int sk_stream_error(struct sock *sk, int flags, int err);
extern void sk_stream_kill_queues(struct sock *sk);

extern int sk_wait_data(struct sock *sk, long *timeo);





struct proto {
        void (*close)(struct sock *sk,
                                        long timeout);
        int (*connect)(struct sock *sk,
                                        struct sockaddr *uaddr,
                                        int addr_len);
        int (*disconnect)(struct sock *sk, int flags);

        struct sock * (*accept) (struct sock *sk, int flags, int *err);

        int (*ioctl)(struct sock *sk, int cmd,
                                         unsigned long arg);
        int (*init)(struct sock *sk);
        int (*destroy)(struct sock *sk);
        void (*shutdown)(struct sock *sk, int how);
        int (*setsockopt)(struct sock *sk, int level,
                                        int optname, char *optval,
                                        int optlen);
        int (*getsockopt)(struct sock *sk, int level,
                                        int optname, char *optval,
                                        int *option);
        int (*sendmsg)(struct kiocb *iocb, struct sock *sk,
                                           struct msghdr *msg, size_t len);
        int (*recvmsg)(struct kiocb *iocb, struct sock *sk,
                                           struct msghdr *msg,
                                        size_t len, int noblock, int flags,
                                        int *addr_len);
        int (*sendpage)(struct sock *sk, struct page *page,
                                        int offset, size_t size, int flags);
        int (*bind)(struct sock *sk,
                                        struct sockaddr *uaddr, int addr_len);

        int (*backlog_rcv) (struct sock *sk,
                                                struct sk_buff *skb);


        void (*hash)(struct sock *sk);
        void (*unhash)(struct sock *sk);
        int (*get_port)(struct sock *sk, unsigned short snum);


        void (*enter_memory_pressure)(void);
        atomic_t *memory_allocated;
        atomic_t *sockets_allocated;






        int *memory_pressure;
        int *sysctl_mem;
        int *sysctl_wmem;
        int *sysctl_rmem;
        int max_header;

        char name[32];

        struct {
                int inuse;
                u8 __pad[(1 << (7)) - sizeof(int)];
        } stats[8];
};

static __inline__ __attribute__((always_inline)) void sk_set_owner(struct sock *sk, struct module *owner)
{
# 577 "include/net/sock.h"
        do { if (__builtin_expect(!!((sk->sk_owner != ((void *)0))!=0), 0)) __asm__ __volatile__( "ud2\n" "\t.word %c0\n" "\t.long %c1\n" : : "i" (577), "i" ("include/net/sock.h")); } while(0);

        sk->sk_owner = owner;
        __module_get(owner);
}


static __inline__ __attribute__((always_inline)) void sock_prot_inc_use(struct proto *prot)
{
        prot->stats[(current_thread_info()->cpu)].inuse++;
}

static __inline__ __attribute__((always_inline)) void sock_prot_dec_use(struct proto *prot)
{
        prot->stats[(current_thread_info()->cpu)].inuse--;
}
# 610 "include/net/sock.h"
struct sock_iocb {
        struct list_head list;

        int flags;
        int size;
        struct socket *sock;
        struct sock *sk;
        struct scm_cookie *scm;
        struct msghdr *msg, async_msg;
        struct iovec async_iov;
        struct kiocb *kiocb;
};

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct sock_iocb *kiocb_to_siocb(struct kiocb *iocb)
{
        return (struct sock_iocb *)iocb->private;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct kiocb *siocb_to_kiocb(struct sock_iocb *si)
{
        return si->kiocb;
}

struct socket_alloc {
        struct socket socket;
        struct inode vfs_inode;
};

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct socket *SOCKET_I(struct inode *inode)
{
        return &({ const typeof( ((struct socket_alloc *)0)->vfs_inode ) *__mptr = (inode); (struct socket_alloc *)( (char *)__mptr - ((size_t) &((struct socket_alloc *)0)->vfs_inode) );})->socket;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct inode *SOCK_INODE(struct socket *socket)
{
        return &({ const typeof( ((struct socket_alloc *)0)->socket ) *__mptr = (socket); (struct socket_alloc *)( (char *)__mptr - ((size_t) &((struct socket_alloc *)0)->socket) );})->vfs_inode;
}

extern void __sk_stream_mem_reclaim(struct sock *sk);
extern int sk_stream_mem_schedule(struct sock *sk, int size, int kind);



static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int sk_stream_pages(int amt)
{
        return (amt + ((int)(1UL << 12)) - 1) / ((int)(1UL << 12));
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void sk_stream_mem_reclaim(struct sock *sk)
{
        if (sk->sk_forward_alloc >= ((int)(1UL << 12)))
                __sk_stream_mem_reclaim(sk);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void sk_stream_writequeue_purge(struct sock *sk)
{
        struct sk_buff *skb;

        while ((skb = __skb_dequeue(&sk->sk_write_queue)) != ((void *)0))
                sk_stream_free_skb(sk, skb);
        sk_stream_mem_reclaim(sk);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int sk_stream_rmem_schedule(struct sock *sk, struct sk_buff *skb)
{
        return (int)skb->truesize <= sk->sk_forward_alloc ||
                sk_stream_mem_schedule(sk, skb->truesize, 1);
}
# 692 "include/net/sock.h"
extern void __lock_sock(struct sock *sk);
extern void __release_sock(struct sock *sk);


extern void lock_sock(struct sock *sk) __attribute__((regparm(3)));
extern void release_sock(struct sock *sk) __attribute__((regparm(3)));





extern struct sock * sk_alloc(int family, int priority, int zero_it,
                                         kmem_cache_t *slab);
extern void sk_free(struct sock *sk);

extern struct sk_buff *sock_wmalloc(struct sock *sk,
                                              unsigned long size, int force,
                                              int priority);
extern struct sk_buff *sock_rmalloc(struct sock *sk,
                                              unsigned long size, int force,
                                              int priority);
extern void sock_wfree(struct sk_buff *skb);
extern void sock_rfree(struct sk_buff *skb);

extern int sock_setsockopt(struct socket *sock, int level,
                                                int op, char *optval,
                                                int optlen);

extern int sock_getsockopt(struct socket *sock, int level,
                                                int op, char *optval,
                                                int *optlen);
extern struct sk_buff *sock_alloc_send_skb(struct sock *sk,
                                                     unsigned long size,
                                                     int noblock,
                                                     int *errcode);
extern struct sk_buff *sock_alloc_send_pskb(struct sock *sk,
                                                      unsigned long header_len,
                                                      unsigned long data_len,
                                                      int noblock,
                                                      int *errcode);
extern void *sock_kmalloc(struct sock *sk, int size, int priority);
extern void sock_kfree_s(struct sock *sk, void *mem, int size);
extern void sk_send_sigurg(struct sock *sk);





extern int sock_no_release(struct socket *);
extern int sock_no_bind(struct socket *,
                                             struct sockaddr *, int);
extern int sock_no_connect(struct socket *,
                                                struct sockaddr *, int, int);
extern int sock_no_socketpair(struct socket *,
                                                   struct socket *);
extern int sock_no_accept(struct socket *,
                                               struct socket *, int);
extern int sock_no_getname(struct socket *,
                                                struct sockaddr *, int *, int);
extern unsigned int sock_no_poll(struct file *, struct socket *,
                                             struct poll_table_struct *);
extern int sock_no_ioctl(struct socket *, unsigned int,
                                              unsigned long);
extern int sock_no_listen(struct socket *, int);
extern int sock_no_shutdown(struct socket *, int);
extern int sock_no_getsockopt(struct socket *, int , int,
                                                   char *, int *);
extern int sock_no_setsockopt(struct socket *, int, int,
                                                   char *, int);
extern int sock_no_sendmsg(struct kiocb *, struct socket *,
                                                struct msghdr *, size_t);
extern int sock_no_recvmsg(struct kiocb *, struct socket *,
                                                struct msghdr *, size_t, int);
extern int sock_no_mmap(struct file *file,
                                             struct socket *sock,
                                             struct vm_area_struct *vma);
extern ssize_t sock_no_sendpage(struct socket *sock,
                                                struct page *page,
                                                int offset, size_t size,
                                                int flags);





extern int sock_common_getsockopt(struct socket *sock, int level, int optname,
                                  char *optval, int *optlen);
extern int sock_common_recvmsg(struct kiocb *iocb, struct socket *sock,
                               struct msghdr *msg, size_t size, int flags);
extern int sock_common_setsockopt(struct socket *sock, int level, int optname,
                                  char *optval, int optlen);

extern void sk_common_release(struct sock *sk);





extern void sock_def_destruct(struct sock *);


extern void sock_init_data(struct socket *sock, struct sock *sk);
# 809 "include/net/sock.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int sk_filter(struct sock *sk, struct sk_buff *skb, int needlock)
{
        int err;

        err = security_sock_rcv_skb(sk, skb);
        if (err)
                return err;

        if (sk->sk_filter) {
                struct sk_filter *filter;

                if (needlock)
                        do { do { do { (current_thread_info()->preempt_count)++; } while (0); __asm__ __volatile__("": : :"memory"); } while (0); if (__builtin_expect(!!(!_raw_spin_trylock(&((sk)->sk_lock.slock))), 0)) __preempt_spin_lock(&((sk)->sk_lock.slock)); } while (0);

                filter = sk->sk_filter;
                if (filter) {
                        int pkt_len = sk_run_filter(skb, filter->insns,
                                                    filter->len);
                        if (!pkt_len)
                                err = -1;
                        else
                                skb_trim(skb, pkt_len);
                }

                if (needlock)
                        do { _raw_spin_unlock(&((sk)->sk_lock.slock)); do { do { __asm__ __volatile__("": : :"memory"); do { (current_thread_info()->preempt_count)--; } while (0); } while (0); do { if (__builtin_expect(!!(test_thread_flag(3)), 0)) preempt_schedule(); } while (0); } while (0); } while (0);
        }
        return err;
}
# 847 "include/net/sock.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void sk_filter_release(struct sock *sk, struct sk_filter *fp)
{
        unsigned int size = sk_filter_len(fp);

        atomic_sub(size, &sk->sk_omem_alloc);

        if (atomic_dec_and_test(&fp->refcnt))
                kfree(fp);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void sk_filter_charge(struct sock *sk, struct sk_filter *fp)
{
        atomic_inc(&fp->refcnt);
        atomic_add(sk_filter_len(fp), &sk->sk_omem_alloc);
}
# 889 "include/net/sock.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void sock_put(struct sock *sk)
{
        if (atomic_dec_and_test(&sk->__sk_common.skc_refcnt))
                sk_free(sk);
}
# 902 "include/net/sock.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void sock_orphan(struct sock *sk)
{
        do { do { (current_thread_info()->preempt_count) += (1UL << (0 + 8)); __asm__ __volatile__("": : :"memory"); } while (0); do { do { (current_thread_info()->preempt_count)++; } while (0); __asm__ __volatile__("": : :"memory"); } while (0); _raw_write_lock(&sk->sk_callback_lock); } while (0);
        sock_set_flag(sk, SOCK_DEAD);
        sk->sk_socket = ((void *)0);
        sk->sk_sleep = ((void *)0);
        do { asm volatile("lock ; addl $" "0x01000000" ",%0":"=m" ((&sk->sk_callback_lock)->lock) : : "memory"); do { do { __asm__ __volatile__("": : :"memory"); do { (current_thread_info()->preempt_count)--; } while (0); } while (0); do { if (__builtin_expect(!!(test_thread_flag(3)), 0)) preempt_schedule(); } while (0); } while (0); local_bh_enable(); } while (0);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void sock_graft(struct sock *sk, struct socket *parent)
{
        do { do { (current_thread_info()->preempt_count) += (1UL << (0 + 8)); __asm__ __volatile__("": : :"memory"); } while (0); do { do { (current_thread_info()->preempt_count)++; } while (0); __asm__ __volatile__("": : :"memory"); } while (0); _raw_write_lock(&sk->sk_callback_lock); } while (0);
        sk->sk_sleep = &parent->wait;
        parent->sk = sk;
        sk->sk_socket = parent;
        do { asm volatile("lock ; addl $" "0x01000000" ",%0":"=m" ((&sk->sk_callback_lock)->lock) : : "memory"); do { do { __asm__ __volatile__("": : :"memory"); do { (current_thread_info()->preempt_count)--; } while (0); } while (0); do { if (__builtin_expect(!!(test_thread_flag(3)), 0)) preempt_schedule(); } while (0); } while (0); local_bh_enable(); } while (0);
}

extern int sock_i_uid(struct sock *sk);
extern unsigned long sock_i_ino(struct sock *sk);

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct dst_entry *
__sk_dst_get(struct sock *sk)
{
        return sk->sk_dst_cache;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct dst_entry *
sk_dst_get(struct sock *sk)
{
        struct dst_entry *dst;

        do { do { do { (current_thread_info()->preempt_count)++; } while (0); __asm__ __volatile__("": : :"memory"); } while (0); _raw_read_lock(&sk->sk_dst_lock); } while(0);
        dst = sk->sk_dst_cache;
        if (dst)
                dst_hold(dst);
        do { asm volatile("lock ; incl %0" :"=m" ((&sk->sk_dst_lock)->lock) : : "memory"); do { do { __asm__ __volatile__("": : :"memory"); do { (current_thread_info()->preempt_count)--; } while (0); } while (0); do { if (__builtin_expect(!!(test_thread_flag(3)), 0)) preempt_schedule(); } while (0); } while (0); } while(0);
        return dst;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void
__sk_dst_set(struct sock *sk, struct dst_entry *dst)
{
        struct dst_entry *old_dst;

        old_dst = sk->sk_dst_cache;
        sk->sk_dst_cache = dst;
        dst_release(old_dst);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void
sk_dst_set(struct sock *sk, struct dst_entry *dst)
{
        do { do { do { (current_thread_info()->preempt_count)++; } while (0); __asm__ __volatile__("": : :"memory"); } while (0); if (__builtin_expect(!!(!_raw_write_trylock(&sk->sk_dst_lock)), 0)) __preempt_write_lock(&sk->sk_dst_lock); } while (0);
        __sk_dst_set(sk, dst);
        do { asm volatile("lock ; addl $" "0x01000000" ",%0":"=m" ((&sk->sk_dst_lock)->lock) : : "memory"); do { do { __asm__ __volatile__("": : :"memory"); do { (current_thread_info()->preempt_count)--; } while (0); } while (0); do { if (__builtin_expect(!!(test_thread_flag(3)), 0)) preempt_schedule(); } while (0); } while (0); } while(0);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void
__sk_dst_reset(struct sock *sk)
{
        struct dst_entry *old_dst;

        old_dst = sk->sk_dst_cache;
        sk->sk_dst_cache = ((void *)0);
        dst_release(old_dst);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void
sk_dst_reset(struct sock *sk)
{
        do { do { do { (current_thread_info()->preempt_count)++; } while (0); __asm__ __volatile__("": : :"memory"); } while (0); if (__builtin_expect(!!(!_raw_write_trylock(&sk->sk_dst_lock)), 0)) __preempt_write_lock(&sk->sk_dst_lock); } while (0);
        __sk_dst_reset(sk);
        do { asm volatile("lock ; addl $" "0x01000000" ",%0":"=m" ((&sk->sk_dst_lock)->lock) : : "memory"); do { do { __asm__ __volatile__("": : :"memory"); do { (current_thread_info()->preempt_count)--; } while (0); } while (0); do { if (__builtin_expect(!!(test_thread_flag(3)), 0)) preempt_schedule(); } while (0); } while (0); } while(0);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct dst_entry *
__sk_dst_check(struct sock *sk, u32 cookie)
{
        struct dst_entry *dst = sk->sk_dst_cache;

        if (dst && dst->obsolete && dst->ops->check(dst, cookie) == ((void *)0)) {
                sk->sk_dst_cache = ((void *)0);
                return ((void *)0);
        }

        return dst;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct dst_entry *
sk_dst_check(struct sock *sk, u32 cookie)
{
        struct dst_entry *dst = sk_dst_get(sk);

        if (dst && dst->obsolete && dst->ops->check(dst, cookie) == ((void *)0)) {
                sk_dst_reset(sk);
                return ((void *)0);
        }

        return dst;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void sk_charge_skb(struct sock *sk, struct sk_buff *skb)
{
        sk->sk_wmem_queued += skb->truesize;
        sk->sk_forward_alloc -= skb->truesize;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int skb_copy_to_page(struct sock *sk, char *from,
                                   struct sk_buff *skb, struct page *page,
                                   int off, int copy)
{
        if (skb->ip_summed == 0) {
                int err = 0;
                unsigned int csum = csum_and_copy_from_user(from,
                                                     page_address(page) + off,
                                                            copy, 0, &err);
                if (err)
                        return err;
                skb->csum = csum_block_add(skb->csum, csum, skb->len);
        } else if (copy_from_user(page_address(page) + off, from, copy))
                return -14;

        skb->len += copy;
        skb->data_len += copy;
        skb->truesize += copy;
        sk->sk_wmem_queued += copy;
        sk->sk_forward_alloc -= copy;
        return 0;
}
# 1042 "include/net/sock.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void skb_set_owner_w(struct sk_buff *skb, struct sock *sk)
{
        sock_hold(sk);
        skb->sk = sk;
        skb->destructor = sock_wfree;
        atomic_add(skb->truesize, &sk->sk_wmem_alloc);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void skb_set_owner_r(struct sk_buff *skb, struct sock *sk)
{
        skb->sk = sk;
        skb->destructor = sock_rfree;
        atomic_add(skb->truesize, &sk->sk_rmem_alloc);
}

extern void sk_reset_timer(struct sock *sk, struct timer_list* timer,
                           unsigned long expires);

extern void sk_stop_timer(struct sock *sk, struct timer_list* timer);

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int sock_queue_rcv_skb(struct sock *sk, struct sk_buff *skb)
{
        int err = 0;
        int skb_len;




        if (((&sk->sk_rmem_alloc)->counter) + skb->truesize >=
            (unsigned)sk->sk_rcvbuf) {
                err = -12;
                goto out;
        }





        err = sk_filter(sk, skb, 1);
        if (err)
                goto out;

        skb->dev = ((void *)0);
        skb_set_owner_r(skb, sk);






        skb_len = skb->len;

        skb_queue_tail(&sk->sk_receive_queue, skb);

        if (!sock_flag(sk, SOCK_DEAD))
                sk->sk_data_ready(sk, skb_len);
out:
        return err;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int sock_queue_err_skb(struct sock *sk, struct sk_buff *skb)
{



        if (((&sk->sk_rmem_alloc)->counter) + skb->truesize >=
            (unsigned)sk->sk_rcvbuf)
                return -12;
        skb_set_owner_r(skb, sk);
        skb_queue_tail(&sk->sk_error_queue, skb);
        if (!sock_flag(sk, SOCK_DEAD))
                sk->sk_data_ready(sk, skb->len);
        return 0;
}





static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int sock_error(struct sock *sk)
{
        int err = ((__typeof__(*(&sk->sk_err)))__xchg((unsigned long)(0),(&sk->sk_err),sizeof(*(&sk->sk_err))));
        return -err;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) unsigned long sock_wspace(struct sock *sk)
{
        int amt = 0;

        if (!(sk->sk_shutdown & 2)) {
                amt = sk->sk_sndbuf - ((&sk->sk_wmem_alloc)->counter);
                if (amt < 0)
                        amt = 0;
        }
        return amt;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void sk_wake_async(struct sock *sk, int how, int band)
{
        if (sk->sk_socket && sk->sk_socket->fasync_list)
                sock_wake_async(sk->sk_socket, how, band);
}




static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void sk_stream_moderate_sndbuf(struct sock *sk)
{
        if (!(sk->sk_userlocks & 1)) {
                sk->sk_sndbuf = ({ typeof(sk->sk_sndbuf) _x = (sk->sk_sndbuf); typeof(sk->sk_wmem_queued / 2) _y = (sk->sk_wmem_queued / 2); (void) (&_x == &_y); _x < _y ? _x : _y; });
                sk->sk_sndbuf = ({ typeof(sk->sk_sndbuf) _x = (sk->sk_sndbuf); typeof(2048) _y = (2048); (void) (&_x == &_y); _x > _y ? _x : _y; });
        }
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct sk_buff *sk_stream_alloc_pskb(struct sock *sk,
                                                   int size, int mem, int gfp)
{
        struct sk_buff *skb = alloc_skb(size + sk->sk_prot->max_header, gfp);

        if (skb) {
                skb->truesize += mem;
                if (sk->sk_forward_alloc >= (int)skb->truesize ||
                    sk_stream_mem_schedule(sk, skb->truesize, 0)) {
                        skb_reserve(skb, sk->sk_prot->max_header);
                        return skb;
                }
                __kfree_skb(skb);
        } else {
                sk->sk_prot->enter_memory_pressure();
                sk_stream_moderate_sndbuf(sk);
        }
        return ((void *)0);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct sk_buff *sk_stream_alloc_skb(struct sock *sk,
                                                  int size, int gfp)
{
        return sk_stream_alloc_pskb(sk, size, 0, gfp);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct page *sk_stream_alloc_page(struct sock *sk)
{
        struct page *page = ((void *)0);

        if (sk->sk_forward_alloc >= (int)(1UL << 12) ||
            sk_stream_mem_schedule(sk, (1UL << 12), 0))
                page = alloc_pages_node(((0)), sk->sk_allocation, 0);
        else {
                sk->sk_prot->enter_memory_pressure();
                sk_stream_moderate_sndbuf(sk);
        }
        return page;
}
# 1205 "include/net/sock.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int sock_writeable(const struct sock *sk)
{
        return ((&sk->sk_wmem_alloc)->counter) < (sk->sk_sndbuf / 2);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int gfp_any(void)
{
        return (((current_thread_info()->preempt_count) & (((1UL << (8))-1) << (0 + 8)))) ? (0x20) : (0x10 | 0x40 | 0x80);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) long sock_rcvtimeo(const struct sock *sk, int noblock)
{
        return noblock ? 0 : sk->sk_rcvtimeo;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) long sock_sndtimeo(const struct sock *sk, int noblock)
{
        return noblock ? 0 : sk->sk_sndtimeo;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int sock_rcvlowat(const struct sock *sk, int waitall, int len)
{
        return (waitall ? len : ({ int __x = (sk->sk_rcvlowat); int __y = (len); __x < __y ? __x: __y; })) ? : 1;
}




static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int sock_intr_errno(long timeo)
{
        return timeo == ((long)(~0UL>>1)) ? -512 : -4;
}

static __inline__ __attribute__((always_inline)) void
sock_recv_timestamp(struct msghdr *msg, struct sock *sk, struct sk_buff *skb)
{
        struct timeval *stamp = &skb->stamp;
        if (sk->sk_rcvtstamp) {


                if (stamp->tv_sec == 0)
                        do_gettimeofday(stamp);
                put_cmsg(msg, 1, 29, sizeof(struct timeval),
                         stamp);
        } else
                sk->sk_stamp = *stamp;
}
# 1261 "include/net/sock.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void sk_eat_skb(struct sock *sk, struct sk_buff *skb)
{
        __skb_unlink(skb, &sk->sk_receive_queue);
        __kfree_skb(skb);
}

extern atomic_t netstamp_needed;
extern void sock_enable_timestamp(struct sock *sk);
extern void sock_disable_timestamp(struct sock *sk);

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void net_timestamp(struct timeval *stamp)
{
        if (((&netstamp_needed)->counter))
                do_gettimeofday(stamp);
        else {
                stamp->tv_sec = 0;
                stamp->tv_usec = 0;
        }
}

extern int sock_get_timestamp(struct sock *, struct timeval *);
# 1319 "include/net/sock.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void sock_valbool_flag(struct sock *sk, int bit, int valbool)
{
        if (valbool)
                sock_set_flag(sk, bit);
        else
                sock_reset_flag(sk, bit);
}

extern __u32 sysctl_wmem_max;
extern __u32 sysctl_rmem_max;

int siocdevprivate_ioctl(unsigned int fd, unsigned int cmd, unsigned long arg);
# 85 "include/linux/ip.h" 2
# 1 "include/linux/igmp.h" 1
# 29 "include/linux/igmp.h"
struct igmphdr
{
        __u8 type;
        __u8 code;
        __u16 csum;
        __u32 group;
};
# 45 "include/linux/igmp.h"
struct igmpv3_grec {
        __u8 grec_type;
        __u8 grec_auxwords;
        __u16 grec_nsrcs;
        __u32 grec_mca;
        __u32 grec_src[0];
};

struct igmpv3_report {
        __u8 type;
        __u8 resv1;
        __u16 csum;
        __u16 resv2;
        __u16 ngrec;
        struct igmpv3_grec grec[0];
};

struct igmpv3_query {
        __u8 type;
        __u8 code;
        __u16 csum;
        __u32 group;

        __u8 qrv:3,
             suppress:1,
             resv:4;







        __u8 qqic;
        __u16 nsrcs;
        __u32 srcs[0];
};
# 130 "include/linux/igmp.h"
# 1 "include/linux/in.h" 1
# 25 "include/linux/in.h"
enum {
  IPPROTO_IP = 0,
  IPPROTO_ICMP = 1,
  IPPROTO_IGMP = 2,
  IPPROTO_IPIP = 4,
  IPPROTO_TCP = 6,
  IPPROTO_EGP = 8,
  IPPROTO_PUP = 12,
  IPPROTO_UDP = 17,
  IPPROTO_IDP = 22,
  IPPROTO_RSVP = 46,
  IPPROTO_GRE = 47,

  IPPROTO_IPV6 = 41,

  IPPROTO_ESP = 50,
  IPPROTO_AH = 51,
  IPPROTO_PIM = 103,

  IPPROTO_COMP = 108,
  IPPROTO_SCTP = 132,

  IPPROTO_RAW = 255,
  IPPROTO_MAX
};



struct in_addr {
        __u32 s_addr;
};
# 110 "include/linux/in.h"
struct ip_mreq
{
        struct in_addr imr_multiaddr;
        struct in_addr imr_interface;
};

struct ip_mreqn
{
        struct in_addr imr_multiaddr;
        struct in_addr imr_address;
        int imr_ifindex;
};

struct ip_mreq_source {
        __u32 imr_multiaddr;
        __u32 imr_interface;
        __u32 imr_sourceaddr;
};

struct ip_msfilter {
        __u32 imsf_multiaddr;
        __u32 imsf_interface;
        __u32 imsf_fmode;
        __u32 imsf_numsrc;
        __u32 imsf_slist[1];
};





struct group_req
{
        __u32 gr_interface;
        struct __kernel_sockaddr_storage gr_group;
};

struct group_source_req
{
        __u32 gsr_interface;
        struct __kernel_sockaddr_storage gsr_group;
        struct __kernel_sockaddr_storage gsr_source;
};

struct group_filter
{
        __u32 gf_interface;
        struct __kernel_sockaddr_storage gf_group;
        __u32 gf_fmode;
        __u32 gf_numsrc;
        struct __kernel_sockaddr_storage gf_slist[1];
};





struct in_pktinfo
{
        int ipi_ifindex;
        struct in_addr ipi_spec_dst;
        struct in_addr ipi_addr;
};



struct sockaddr_in {
  sa_family_t sin_family;
  unsigned short int sin_port;
  struct in_addr sin_addr;


  unsigned char __pad[16 - sizeof(short int) -
                        sizeof(unsigned short int) - sizeof(struct in_addr)];
};
# 131 "include/linux/igmp.h" 2

struct ip_sf_socklist
{
        unsigned int sl_max;
        unsigned int sl_count;
        __u32 sl_addr[0];
};
# 148 "include/linux/igmp.h"
struct ip_mc_socklist
{
        struct ip_mc_socklist *next;
        int count;
        struct ip_mreqn multi;
        unsigned int sfmode;
        struct ip_sf_socklist *sflist;
};

struct ip_sf_list
{
        struct ip_sf_list *sf_next;
        __u32 sf_inaddr;
        unsigned long sf_count[2];
        unsigned char sf_gsresp;
        unsigned char sf_oldin;
        unsigned char sf_crcount;
};

struct ip_mc_list
{
        struct in_device *interface;
        unsigned long multiaddr;
        struct ip_sf_list *sources;
        struct ip_sf_list *tomb;
        unsigned int sfmode;
        unsigned long sfcount[2];
        struct ip_mc_list *next;
        struct timer_list timer;
        int users;
        atomic_t refcnt;
        spinlock_t lock;
        char tm_running;
        char reporter;
        char unsolicit_count;
        char loaded;
        unsigned char gsquery;
        unsigned char crcount;
};
# 198 "include/linux/igmp.h"
extern int ip_check_mc(struct in_device *dev, u32 mc_addr, u32 src_addr, u16 proto);
extern int igmp_rcv(struct sk_buff *);
extern int ip_mc_join_group(struct sock *sk, struct ip_mreqn *imr);
extern int ip_mc_leave_group(struct sock *sk, struct ip_mreqn *imr);
extern void ip_mc_drop_socket(struct sock *sk);
extern int ip_mc_source(int add, int omode, struct sock *sk,
                struct ip_mreq_source *mreqs, int ifindex);
extern int ip_mc_msfilter(struct sock *sk, struct ip_msfilter *msf,int ifindex);
extern int ip_mc_msfget(struct sock *sk, struct ip_msfilter *msf,
                struct ip_msfilter *optval, int *optlen);
extern int ip_mc_gsfget(struct sock *sk, struct group_filter *gsf,
                struct group_filter *optval, int *optlen);
extern int ip_mc_sf_allow(struct sock *sk, u32 local, u32 rmt, int dif);
extern void ip_mr_init(void);
extern void ip_mc_init_dev(struct in_device *);
extern void ip_mc_destroy_dev(struct in_device *);
extern void ip_mc_up(struct in_device *);
extern void ip_mc_down(struct in_device *);
extern void ip_mc_dec_group(struct in_device *in_dev, u32 addr);
extern void ip_mc_inc_group(struct in_device *in_dev, u32 addr);
# 86 "include/linux/ip.h" 2
# 1 "include/net/flow.h" 1
# 13 "include/net/flow.h"
struct flowi {
        int oif;
        int iif;

        union {
                struct {
                        __u32 daddr;
                        __u32 saddr;
                        __u32 fwmark;
                        __u8 tos;
                        __u8 scope;
                } ip4_u;

                struct {
                        struct in6_addr daddr;
                        struct in6_addr saddr;
                        __u32 flowlabel;
                } ip6_u;

                struct {
                        __u16 daddr;
                        __u16 saddr;
                        __u32 fwmark;
                        __u8 scope;
                } dn_u;
        } nl_u;
# 52 "include/net/flow.h"
        __u8 proto;
        __u8 flags;
        union {
                struct {
                        __u16 sport;
                        __u16 dport;
                } ports;

                struct {
                        __u8 type;
                        __u8 code;
                } icmpt;

                struct {
                        __u16 sport;
                        __u16 dport;
                        __u8 objnum;
                        __u8 objnamel;
                        __u8 objname[16];
                } dnports;

                __u32 spi;
        } uli_u;





} __attribute__((__aligned__(32/8)));





typedef void (*flow_resolve_t)(struct flowi *key, u16 family, u8 dir,
                               void **objp, atomic_t **obj_refp);

extern void *flow_cache_lookup(struct flowi *key, u16 family, u8 dir,
                               flow_resolve_t resolver);
extern void flow_cache_flush(void);
extern atomic_t flow_cache_genid;
# 87 "include/linux/ip.h" 2

struct ip_options {
  __u32 faddr;
  unsigned char optlen;
  unsigned char srr;
  unsigned char rr;
  unsigned char ts;
  unsigned char is_setbyuser:1,
                is_data:1,
                is_strictroute:1,
                srr_is_hit:1,
                is_changed:1,
                rr_needaddr:1,
                ts_needtime:1,
                ts_needaddr:1;
  unsigned char router_alert;
  unsigned char __pad1;
  unsigned char __pad2;
  unsigned char __data[0];
};



struct inet_opt {

        __u32 daddr;
        __u32 rcv_saddr;
        __u16 dport;
        __u16 num;
        __u32 saddr;
        int uc_ttl;
        int tos;
        unsigned cmsg_flags;
        struct ip_options *opt;
        __u16 sport;
        unsigned char hdrincl;
        __u8 mc_ttl;
        __u8 mc_loop;
        __u8 pmtudisc;
        __u16 id;
        unsigned recverr : 1,
                                freebind : 1;
        int mc_index;
        __u32 mc_addr;
        struct ip_mc_socklist *mc_list;




        struct {
                unsigned int flags;
                unsigned int fragsize;
                struct ip_options *opt;
                struct rtable *rt;
                int length;
                u32 addr;
                struct flowi fl;
        } cork;
};



struct ipv6_pinfo;


struct inet_sock {
        struct sock sk;

        struct ipv6_pinfo *pinet6;

        struct inet_opt inet;
};

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct inet_opt * inet_sk(const struct sock *__sk)
{
        return &((struct inet_sock *)__sk)->inet;
}



struct iphdr {

        __u8 ihl:4,
                version:4;






        __u8 tos;
        __u16 tot_len;
        __u16 id;
        __u16 frag_off;
        __u8 ttl;
        __u8 protocol;
        __u16 check;
        __u32 saddr;
        __u32 daddr;

};

struct ip_auth_hdr {
        __u8 nexthdr;
        __u8 hdrlen;
        __u16 reserved;
        __u32 spi;
        __u32 seq_no;
        __u8 auth_data[0];
};

struct ip_esp_hdr {
        __u32 spi;
        __u32 seq_no;
        __u8 enc_data[0];
};

struct ip_comp_hdr {
        __u8 nexthdr;
        __u8 flags;
        __u16 cpi;
};
# 196 "include/linux/tcp.h" 2



struct tcp_sack_block {
        __u32 start_seq;
        __u32 end_seq;
};

struct tcp_opt {
        int tcp_header_len;





        __u32 pred_flags;






        __u32 rcv_nxt;
        __u32 snd_nxt;

        __u32 snd_una;
        __u32 snd_sml;
        __u32 rcv_tstamp;
        __u32 lsndtime;
        struct tcp_bind_bucket *bind_hash;

        struct {
                __u8 pending;
                __u8 quick;
                __u8 pingpong;
                __u8 blocked;
                __u32 ato;
                unsigned long timeout;
                __u32 lrcvtime;
                __u16 last_seg_size;
                __u16 rcv_mss;
        } ack;


        struct {
                struct sk_buff_head prequeue;
                struct task_struct *task;
                struct iovec *iov;
                int memory;
                int len;
        } ucopy;

        __u32 snd_wl1;
        __u32 snd_wnd;
        __u32 max_window;
        __u32 pmtu_cookie;
        __u32 mss_cache;
        __u16 mss_cache_std;
        __u16 mss_clamp;
        __u16 ext_header_len;
        __u16 ext2_header_len;
        __u8 ca_state;
        __u8 retransmits;

        __u8 reordering;
        __u8 frto_counter;
        __u32 frto_highmark;

        __u8 unused_pad;
        __u8 defer_accept;



        __u8 backoff;
        __u32 srtt;
        __u32 mdev;
        __u32 mdev_max;
        __u32 rttvar;
        __u32 rtt_seq;
        __u32 rto;

        __u32 packets_out;
        __u32 left_out;
        __u32 retrans_out;





        __u32 snd_ssthresh;
        __u32 snd_cwnd;
        __u16 snd_cwnd_cnt;
        __u16 snd_cwnd_clamp;
        __u32 snd_cwnd_used;
        __u32 snd_cwnd_stamp;


        unsigned long timeout;
        struct timer_list retransmit_timer;
        struct timer_list delack_timer;

        struct sk_buff_head out_of_order_queue;

        struct tcp_func *af_specific;

        __u32 rcv_wnd;
        __u32 rcv_wup;
        __u32 write_seq;
        __u32 pushed_seq;
        __u32 copied_seq;



        char tstamp_ok,
                wscale_ok,
                sack_ok;
        char saw_tstamp;
        __u8 snd_wscale;
        __u8 rcv_wscale;
        __u8 nonagle;
        __u8 keepalive_probes;


        __u32 rcv_tsval;
        __u32 rcv_tsecr;
        __u32 ts_recent;
        long ts_recent_stamp;


        __u16 user_mss;
        __u8 dsack;
        __u8 eff_sacks;
        struct tcp_sack_block duplicate_sack[1];
        struct tcp_sack_block selective_acks[4];

        __u32 window_clamp;
        __u32 rcv_ssthresh;
        __u8 probes_out;
        __u8 num_sacks;
        __u16 advmss;

        __u8 syn_retries;
        __u8 ecn_flags;
        __u16 prior_ssthresh;
        __u32 lost_out;
        __u32 sacked_out;
        __u32 fackets_out;
        __u32 high_seq;

        __u32 retrans_stamp;


        __u32 undo_marker;
        int undo_retrans;
        __u32 urg_seq;
        __u16 urg_data;
        __u8 pending;
        __u8 urg_mode;
        __u32 snd_up;
# 366 "include/linux/tcp.h"
        rwlock_t syn_wait_lock;
        struct tcp_listen_opt *listen_opt;


        struct open_request *accept_queue;
        struct open_request *accept_queue_tail;

        unsigned int keepalive_time;
        unsigned int keepalive_intvl;
        int linger2;

        unsigned long last_synq_overflow;


        struct {
                __u32 rtt;
                __u32 seq;
                __u32 time;
        } rcv_rtt_est;


        struct {
                int space;
                __u32 seq;
                __u32 time;
        } rcvq_space;


        struct {
                __u32 bw_ns_est;
                __u32 bw_est;
                __u32 rtt_win_sx;
                __u32 bk;
                __u32 snd_una;
                __u32 cumul_ack;
                __u32 accounted;
                __u32 rtt;
                __u32 rtt_min;
        } westwood;


        struct {
                __u32 beg_snd_nxt;
                __u32 beg_snd_una;
                __u32 beg_snd_cwnd;
                __u8 do_vegas;
                __u8 doing_vegas_now;
                __u16 cntRTT;
                __u32 minRTT;
                __u32 baseRTT;
        } vegas;


        struct {
                __u32 cnt;
                __u32 last_max_cwnd;
                __u32 last_cwnd;
                __u32 last_stamp;
        } bictcp;
};


struct tcp_sock {
        struct sock sk;

        struct ipv6_pinfo *pinet6;

        struct inet_opt inet;
        struct tcp_opt tcp;
};

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct tcp_opt * tcp_sk(const struct sock *__sk)
{
        return &((struct tcp_sock *)__sk)->tcp;
}
# 23 "net/ipv4/netfilter/ip_tables.c" 2
# 1 "include/linux/udp.h" 1
# 22 "include/linux/udp.h"
struct udphdr {
        __u16 source;
        __u16 dest;
        __u16 len;
        __u16 check;
};
# 43 "include/linux/udp.h"
struct udp_opt {
        int pending;
        unsigned int corkflag;
        __u16 encap_type;




        __u16 len;
};


struct udp_sock {
        struct sock sk;

        struct ipv6_pinfo *pinet6;

        struct inet_opt inet;
        struct udp_opt udp;
};

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct udp_opt * udp_sk(const struct sock *__sk)
{
        return &((struct udp_sock *)__sk)->udp;
}
# 24 "net/ipv4/netfilter/ip_tables.c" 2
# 1 "include/linux/icmp.h" 1
# 66 "include/linux/icmp.h"
struct icmphdr {
  __u8 type;
  __u8 code;
  __u16 checksum;
  union {
        struct {
                __u16 id;
                __u16 sequence;
        } echo;
        __u32 gateway;
        struct {
                __u16 __unused;
                __u16 mtu;
        } frag;
  } un;
};







struct icmp_filter {
        __u32 data;
};
# 25 "net/ipv4/netfilter/ip_tables.c" 2
# 1 "include/net/ip.h" 1
# 31 "include/net/ip.h"
# 1 "include/linux/inetdevice.h" 1





struct ipv4_devconf
{
        int accept_redirects;
        int send_redirects;
        int secure_redirects;
        int shared_media;
        int accept_source_route;
        int rp_filter;
        int proxy_arp;
        int bootp_relay;
        int log_martians;
        int forwarding;
        int mc_forwarding;
        int tag;
        int arp_filter;
        int arp_announce;
        int arp_ignore;
        int medium_id;
        int no_xfrm;
        int no_policy;
        int force_igmp_version;
        void *sysctl;
};

extern struct ipv4_devconf ipv4_devconf;

struct in_device
{
        struct net_device *dev;
        atomic_t refcnt;
        rwlock_t lock;
        int dead;
        struct in_ifaddr *ifa_list;
        struct ip_mc_list *mc_list;
        rwlock_t mc_lock;
        struct ip_mc_list *mc_tomb;
        unsigned long mr_v1_seen;
        unsigned long mr_v2_seen;
        unsigned long mr_maxdelay;
        unsigned char mr_qrv;
        unsigned char mr_gq_running;
        unsigned char mr_ifc_count;
        struct timer_list mr_gq_timer;
        struct timer_list mr_ifc_timer;

        struct neigh_parms *arp_parms;
        struct ipv4_devconf cnf;
};
# 79 "include/linux/inetdevice.h"
struct in_ifaddr
{
        struct in_ifaddr *ifa_next;
        struct in_device *ifa_dev;
        u32 ifa_local;
        u32 ifa_address;
        u32 ifa_mask;
        u32 ifa_broadcast;
        u32 ifa_anycast;
        unsigned char ifa_scope;
        unsigned char ifa_flags;
        unsigned char ifa_prefixlen;
        char ifa_label[16];
};

extern int register_inetaddr_notifier(struct notifier_block *nb);
extern int unregister_inetaddr_notifier(struct notifier_block *nb);

extern struct net_device *ip_dev_find(u32 addr);
extern int inet_addr_onlink(struct in_device *in_dev, u32 a, u32 b);
extern int devinet_ioctl(unsigned int cmd, void *);
extern void devinet_init(void);
extern struct in_device *inetdev_init(struct net_device *dev);
extern struct in_device *inetdev_by_index(int);
extern u32 inet_select_addr(const struct net_device *dev, u32 dst, int scope);
extern u32 inet_confirm_addr(const struct net_device *dev, u32 dst, u32 local, int scope);
extern struct in_ifaddr *inet_ifa_byprefix(struct in_device *in_dev, u32 prefix, u32 mask);
extern void inet_forward_change(void);

static __inline__ __attribute__((always_inline)) int inet_ifa_match(u32 addr, struct in_ifaddr *ifa)
{
        return !((addr^ifa->ifa_address)&ifa->ifa_mask);
}





static __inline__ __attribute__((always_inline)) int bad_mask(u32 mask, u32 addr)
{
        if (addr & (mask = ~mask))
                return 1;
        mask = (__builtin_constant_p((__u32)((mask))) ? ({ __u32 __x = (((mask))); ((__u32)( (((__u32)(__x) & (__u32)0x000000ffUL) << 24) | (((__u32)(__x) & (__u32)0x0000ff00UL) << 8) | (((__u32)(__x) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(__x) & (__u32)0xff000000UL) >> 24) )); }) : __fswab32(((mask))));
        if (mask & (mask+1))
                return 1;
        return 0;
}
# 136 "include/linux/inetdevice.h"
extern rwlock_t inetdev_lock;


static __inline__ __attribute__((always_inline)) struct in_device *
in_dev_get(const struct net_device *dev)
{
        struct in_device *in_dev;

        do { do { do { (current_thread_info()->preempt_count)++; } while (0); __asm__ __volatile__("": : :"memory"); } while (0); _raw_read_lock(&inetdev_lock); } while(0);
        in_dev = dev->ip_ptr;
        if (in_dev)
                atomic_inc(&in_dev->refcnt);
        do { asm volatile("lock ; incl %0" :"=m" ((&inetdev_lock)->lock) : : "memory"); do { do { __asm__ __volatile__("": : :"memory"); do { (current_thread_info()->preempt_count)--; } while (0); } while (0); do { if (__builtin_expect(!!(test_thread_flag(3)), 0)) preempt_schedule(); } while (0); } while (0); } while(0);
        return in_dev;
}

static __inline__ __attribute__((always_inline)) struct in_device *
__in_dev_get(const struct net_device *dev)
{
        return (struct in_device*)dev->ip_ptr;
}

extern void in_dev_finish_destroy(struct in_device *idev);

static __inline__ __attribute__((always_inline)) void
in_dev_put(struct in_device *idev)
{
        if (atomic_dec_and_test(&idev->refcnt))
                in_dev_finish_destroy(idev);
}






static __inline__ __attribute__((always_inline)) __u32 inet_make_mask(int logmask)
{
        if (logmask)
                return (__builtin_constant_p((__u32)((~((1<<(32-logmask))-1)))) ? ({ __u32 __x = (((~((1<<(32-logmask))-1)))); ((__u32)( (((__u32)(__x) & (__u32)0x000000ffUL) << 24) | (((__u32)(__x) & (__u32)0x0000ff00UL) << 8) | (((__u32)(__x) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(__x) & (__u32)0xff000000UL) >> 24) )); }) : __fswab32(((~((1<<(32-logmask))-1)))));
        return 0;
}

static __inline__ __attribute__((always_inline)) int inet_mask_len(__u32 mask)
{
        if (!(mask = (__builtin_constant_p((__u32)((mask))) ? ({ __u32 __x = (((mask))); ((__u32)( (((__u32)(__x) & (__u32)0x000000ffUL) << 24) | (((__u32)(__x) & (__u32)0x0000ff00UL) << 8) | (((__u32)(__x) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(__x) & (__u32)0xff000000UL) >> 24) )); }) : __fswab32(((mask))))))
                return 0;
        return 32 - ffz(~mask);
}
# 32 "include/net/ip.h" 2
# 1 "include/linux/in_route.h" 1
# 33 "include/net/ip.h" 2
# 1 "include/net/route.h" 1
# 29 "include/net/route.h"
# 1 "include/net/inetpeer.h" 1
# 18 "include/net/inetpeer.h"
struct inet_peer
{
        struct inet_peer *avl_left, *avl_right;
        struct inet_peer *unused_next, **unused_prevp;
        atomic_t refcnt;
        unsigned long dtime;

        __u32 v4daddr;
        __u16 avl_height;
        __u16 ip_id_count;
        __u32 tcp_ts;
        unsigned long tcp_ts_stamp;
};

void inet_initpeers(void) __attribute__ ((__section__ (".init.text")));


struct inet_peer *inet_getpeer(__u32 daddr, int create);

extern spinlock_t inet_peer_unused_lock;
extern struct inet_peer *inet_peer_unused_head;
extern struct inet_peer **inet_peer_unused_tailp;

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void inet_putpeer(struct inet_peer *p)
{
        do { do { (current_thread_info()->preempt_count) += (1UL << (0 + 8)); __asm__ __volatile__("": : :"memory"); } while (0); do { do { (current_thread_info()->preempt_count)++; } while (0); __asm__ __volatile__("": : :"memory"); } while (0); _raw_spin_lock(&inet_peer_unused_lock); } while (0);
        if (atomic_dec_and_test(&p->refcnt)) {
                p->unused_prevp = inet_peer_unused_tailp;
                p->unused_next = ((void *)0);
                *inet_peer_unused_tailp = p;
                inet_peer_unused_tailp = &p->unused_next;
                p->dtime = jiffies;
        }
        do { _raw_spin_unlock(&inet_peer_unused_lock); do { do { __asm__ __volatile__("": : :"memory"); do { (current_thread_info()->preempt_count)--; } while (0); } while (0); do { if (__builtin_expect(!!(test_thread_flag(3)), 0)) preempt_schedule(); } while (0); } while (0); local_bh_enable(); } while (0);
}

extern spinlock_t inet_peer_idlock;

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) __u16 inet_getid(struct inet_peer *p, int more)
{
        __u16 id;

        do { do { (current_thread_info()->preempt_count) += (1UL << (0 + 8)); __asm__ __volatile__("": : :"memory"); } while (0); do { do { (current_thread_info()->preempt_count)++; } while (0); __asm__ __volatile__("": : :"memory"); } while (0); _raw_spin_lock(&inet_peer_idlock); } while (0);
        id = p->ip_id_count;
        p->ip_id_count += 1 + more;
        do { _raw_spin_unlock(&inet_peer_idlock); do { do { __asm__ __volatile__("": : :"memory"); do { (current_thread_info()->preempt_count)--; } while (0); } while (0); do { if (__builtin_expect(!!(test_thread_flag(3)), 0)) preempt_schedule(); } while (0); } while (0); local_bh_enable(); } while (0);
        return id;
}
# 30 "include/net/route.h" 2



# 1 "include/linux/route.h" 1
# 30 "include/linux/route.h"
struct rtentry
{
        unsigned long rt_pad1;
        struct sockaddr rt_dst;
        struct sockaddr rt_gateway;
        struct sockaddr rt_genmask;
        unsigned short rt_flags;
        short rt_pad2;
        unsigned long rt_pad3;
        void *rt_pad4;
        short rt_metric;
        char *rt_dev;
        unsigned long rt_mtu;



        unsigned long rt_window;
        unsigned short rt_irtt;
};
# 34 "include/net/route.h" 2
# 49 "include/net/route.h"
struct inet_peer;
struct rtable
{
        union
        {
                struct dst_entry dst;
                struct rtable *rt_next;
        } u;

        struct in_device *idev;

        unsigned rt_flags;
        unsigned rt_type;

        __u32 rt_dst;
        __u32 rt_src;
        int rt_iif;


        __u32 rt_gateway;


        struct flowi fl;


        __u32 rt_spec_dst;
        struct inet_peer *peer;


        __u32 rt_src_map;
        __u32 rt_dst_map;

};

struct ip_rt_acct
{
        __u32 o_bytes;
        __u32 o_packets;
        __u32 i_bytes;
        __u32 i_packets;
};

struct rt_cache_stat
{
        unsigned int in_hit;
        unsigned int in_slow_tot;
        unsigned int in_slow_mc;
        unsigned int in_no_route;
        unsigned int in_brd;
        unsigned int in_martian_dst;
        unsigned int in_martian_src;
        unsigned int out_hit;
        unsigned int out_slow_tot;
        unsigned int out_slow_mc;
        unsigned int gc_total;
        unsigned int gc_ignored;
        unsigned int gc_goal_miss;
        unsigned int gc_dst_overflow;
        unsigned int in_hlist_search;
        unsigned int out_hlist_search;
};

extern struct rt_cache_stat *rt_cache_stat;



extern struct ip_rt_acct *ip_rt_acct;

struct in_device;
extern int ip_rt_init(void);
extern void ip_rt_redirect(u32 old_gw, u32 dst, u32 new_gw,
                                       u32 src, u8 tos, struct net_device *dev);
extern void ip_rt_advice(struct rtable **rp, int advice);
extern void rt_cache_flush(int how);
extern int __ip_route_output_key(struct rtable **, const struct flowi *flp);
extern int ip_route_output_key(struct rtable **, struct flowi *flp);
extern int ip_route_output_flow(struct rtable **rp, struct flowi *flp, struct sock *sk, int flags);
extern int ip_route_input(struct sk_buff*, u32 dst, u32 src, u8 tos, struct net_device *devin);
extern unsigned short ip_rt_frag_needed(struct iphdr *iph, unsigned short new_mtu);
extern void ip_rt_send_redirect(struct sk_buff *skb);

extern unsigned inet_addr_type(u32 addr);
extern void ip_rt_multicast_event(struct in_device *);
extern int ip_rt_ioctl(unsigned int cmd, void *arg);
extern void ip_rt_get_source(u8 *src, struct rtable *rt);
extern int ip_rt_dump(struct sk_buff *skb, struct netlink_callback *cb);

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void ip_rt_put(struct rtable * rt)
{
        if (rt)
                dst_release(&rt->u.dst);
}



extern __u8 ip_tos2prio[16];

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) char rt_tos2priority(u8 tos)
{
        return ip_tos2prio[((tos)&0x1E)>>1];
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int ip_route_connect(struct rtable **rp, u32 dst,
                                   u32 src, u32 tos, int oif, u8 protocol,
                                   u16 sport, u16 dport, struct sock *sk)
{
        struct flowi fl = { .oif = oif,
                            .nl_u = { .ip4_u = { .daddr = dst,
                                                 .saddr = src,
                                                 .tos = tos } },
                            .proto = protocol,
                            .uli_u = { .ports =
                                       { .sport = sport,
                                         .dport = dport } } };

        int err;
        if (!dst || !src) {
                err = __ip_route_output_key(rp, &fl);
                if (err)
                        return err;
                fl.nl_u.ip4_u.daddr = (*rp)->rt_dst;
                fl.nl_u.ip4_u.saddr = (*rp)->rt_src;
                ip_rt_put(*rp);
                *rp = ((void *)0);
        }
        return ip_route_output_flow(rp, &fl, sk, 0);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int ip_route_newports(struct rtable **rp, u16 sport, u16 dport,
                                    struct sock *sk)
{
        if (sport != (*rp)->fl.uli_u.ports.sport ||
            dport != (*rp)->fl.uli_u.ports.dport) {
                struct flowi fl;

                (__builtin_constant_p(sizeof(fl)) ? __constant_memcpy((&fl),(&(*rp)->fl),(sizeof(fl))) : __memcpy((&fl),(&(*rp)->fl),(sizeof(fl))));
                fl.uli_u.ports.sport = sport;
                fl.uli_u.ports.dport = dport;
                ip_rt_put(*rp);
                *rp = ((void *)0);
                return ip_route_output_flow(rp, &fl, sk, 0);
        }
        return 0;
}

extern void rt_bind_peer(struct rtable *rt, int create);

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct inet_peer *rt_get_peer(struct rtable *rt)
{
        if (rt->peer)
                return rt->peer;

        rt_bind_peer(rt, 0);
        return rt->peer;
}
# 34 "include/net/ip.h" 2
# 1 "include/net/arp.h" 1




# 1 "include/linux/if_arp.h" 1
# 102 "include/linux/if_arp.h"
struct arpreq {
  struct sockaddr arp_pa;
  struct sockaddr arp_ha;
  int arp_flags;
  struct sockaddr arp_netmask;
  char arp_dev[16];
};

struct arpreq_old {
  struct sockaddr arp_pa;
  struct sockaddr arp_ha;
  int arp_flags;
  struct sockaddr arp_netmask;
};
# 130 "include/linux/if_arp.h"
struct arphdr
{
        unsigned short ar_hrd;
        unsigned short ar_pro;
        unsigned char ar_hln;
        unsigned char ar_pln;
        unsigned short ar_op;
# 148 "include/linux/if_arp.h"
};
# 6 "include/net/arp.h" 2




extern struct neigh_table arp_tbl;

extern void arp_init(void);
extern int arp_rcv(struct sk_buff *skb, struct net_device *dev,
                        struct packet_type *pt);
extern int arp_find(unsigned char *haddr, struct sk_buff *skb);
extern int arp_ioctl(unsigned int cmd, void *arg);
extern void arp_send(int type, int ptype, u32 dest_ip,
                         struct net_device *dev, u32 src_ip,
                         unsigned char *dest_hw, unsigned char *src_hw, unsigned char *th);
extern int arp_bind_neighbour(struct dst_entry *dst);
extern int arp_mc_map(u32 addr, u8 *haddr, struct net_device *dev, int dir);
extern void arp_ifdown(struct net_device *dev);

extern struct sk_buff *arp_create(int type, int ptype, u32 dest_ip,
                                  struct net_device *dev, u32 src_ip,
                                  unsigned char *dest_hw, unsigned char *src_hw,
                                  unsigned char *target_hw);
extern void arp_xmit(struct sk_buff *skb);

extern struct neigh_ops arp_broken_ops;
# 35 "include/net/ip.h" 2
# 1 "include/net/snmp.h" 1
# 25 "include/net/snmp.h"
# 1 "include/linux/snmp.h" 1
# 18 "include/linux/snmp.h"
enum
{
        IPSTATS_MIB_NUM = 0,
        IPSTATS_MIB_INRECEIVES,
        IPSTATS_MIB_INHDRERRORS,
        IPSTATS_MIB_INTOOBIGERRORS,
        IPSTATS_MIB_INNOROUTES,
        IPSTATS_MIB_INADDRERRORS,
        IPSTATS_MIB_INUNKNOWNPROTOS,
        IPSTATS_MIB_INTRUNCATEDPKTS,
        IPSTATS_MIB_INDISCARDS,
        IPSTATS_MIB_INDELIVERS,
        IPSTATS_MIB_OUTFORWDATAGRAMS,
        IPSTATS_MIB_OUTREQUESTS,
        IPSTATS_MIB_OUTDISCARDS,
        IPSTATS_MIB_OUTNOROUTES,
        IPSTATS_MIB_REASMTIMEOUT,
        IPSTATS_MIB_REASMREQDS,
        IPSTATS_MIB_REASMOKS,
        IPSTATS_MIB_REASMFAILS,
        IPSTATS_MIB_FRAGOKS,
        IPSTATS_MIB_FRAGFAILS,
        IPSTATS_MIB_FRAGCREATES,
        IPSTATS_MIB_INMCASTPKTS,
        IPSTATS_MIB_OUTMCASTPKTS,
        __IPSTATS_MIB_MAX
};






enum
{
        ICMP_MIB_NUM = 0,
        ICMP_MIB_INMSGS,
        ICMP_MIB_INERRORS,
        ICMP_MIB_INDESTUNREACHS,
        ICMP_MIB_INTIMEEXCDS,
        ICMP_MIB_INPARMPROBS,
        ICMP_MIB_INSRCQUENCHS,
        ICMP_MIB_INREDIRECTS,
        ICMP_MIB_INECHOS,
        ICMP_MIB_INECHOREPS,
        ICMP_MIB_INTIMESTAMPS,
        ICMP_MIB_INTIMESTAMPREPS,
        ICMP_MIB_INADDRMASKS,
        ICMP_MIB_INADDRMASKREPS,
        ICMP_MIB_OUTMSGS,
        ICMP_MIB_OUTERRORS,
        ICMP_MIB_OUTDESTUNREACHS,
        ICMP_MIB_OUTTIMEEXCDS,
        ICMP_MIB_OUTPARMPROBS,
        ICMP_MIB_OUTSRCQUENCHS,
        ICMP_MIB_OUTREDIRECTS,
        ICMP_MIB_OUTECHOS,
        ICMP_MIB_OUTECHOREPS,
        ICMP_MIB_OUTTIMESTAMPS,
        ICMP_MIB_OUTTIMESTAMPREPS,
        ICMP_MIB_OUTADDRMASKS,
        ICMP_MIB_OUTADDRMASKREPS,
        __ICMP_MIB_MAX
};





enum
{
        ICMP6_MIB_NUM = 0,
        ICMP6_MIB_INMSGS,
        ICMP6_MIB_INERRORS,
        ICMP6_MIB_INDESTUNREACHS,
        ICMP6_MIB_INPKTTOOBIGS,
        ICMP6_MIB_INTIMEEXCDS,
        ICMP6_MIB_INPARMPROBLEMS,
        ICMP6_MIB_INECHOS,
        ICMP6_MIB_INECHOREPLIES,
        ICMP6_MIB_INGROUPMEMBQUERIES,
        ICMP6_MIB_INGROUPMEMBRESPONSES,
        ICMP6_MIB_INGROUPMEMBREDUCTIONS,
        ICMP6_MIB_INROUTERSOLICITS,
        ICMP6_MIB_INROUTERADVERTISEMENTS,
        ICMP6_MIB_INNEIGHBORSOLICITS,
        ICMP6_MIB_INNEIGHBORADVERTISEMENTS,
        ICMP6_MIB_INREDIRECTS,
        ICMP6_MIB_OUTMSGS,
        ICMP6_MIB_OUTDESTUNREACHS,
        ICMP6_MIB_OUTPKTTOOBIGS,
        ICMP6_MIB_OUTTIMEEXCDS,
        ICMP6_MIB_OUTPARMPROBLEMS,
        ICMP6_MIB_OUTECHOREPLIES,
        ICMP6_MIB_OUTROUTERSOLICITS,
        ICMP6_MIB_OUTNEIGHBORSOLICITS,
        ICMP6_MIB_OUTNEIGHBORADVERTISEMENTS,
        ICMP6_MIB_OUTREDIRECTS,
        ICMP6_MIB_OUTGROUPMEMBRESPONSES,
        ICMP6_MIB_OUTGROUPMEMBREDUCTIONS,
        __ICMP6_MIB_MAX
};






enum
{
        TCP_MIB_NUM = 0,
        TCP_MIB_RTOALGORITHM,
        TCP_MIB_RTOMIN,
        TCP_MIB_RTOMAX,
        TCP_MIB_MAXCONN,
        TCP_MIB_ACTIVEOPENS,
        TCP_MIB_PASSIVEOPENS,
        TCP_MIB_ATTEMPTFAILS,
        TCP_MIB_ESTABRESETS,
        TCP_MIB_CURRESTAB,
        TCP_MIB_INSEGS,
        TCP_MIB_OUTSEGS,
        TCP_MIB_RETRANSSEGS,
        TCP_MIB_INERRS,
        TCP_MIB_OUTRSTS,
        __TCP_MIB_MAX
};






enum
{
        UDP_MIB_NUM = 0,
        UDP_MIB_INDATAGRAMS,
        UDP_MIB_NOPORTS,
        UDP_MIB_INERRORS,
        UDP_MIB_OUTDATAGRAMS,
        __UDP_MIB_MAX
};





enum
{
        SCTP_MIB_NUM = 0,
        SCTP_MIB_CURRESTAB,
        SCTP_MIB_ACTIVEESTABS,
        SCTP_MIB_PASSIVEESTABS,
        SCTP_MIB_ABORTEDS,
        SCTP_MIB_SHUTDOWNS,
        SCTP_MIB_OUTOFBLUES,
        SCTP_MIB_CHECKSUMERRORS,
        SCTP_MIB_OUTCTRLCHUNKS,
        SCTP_MIB_OUTORDERCHUNKS,
        SCTP_MIB_OUTUNORDERCHUNKS,
        SCTP_MIB_INCTRLCHUNKS,
        SCTP_MIB_INORDERCHUNKS,
        SCTP_MIB_INUNORDERCHUNKS,
        SCTP_MIB_FRAGUSRMSGS,
        SCTP_MIB_REASMUSRMSGS,
        SCTP_MIB_OUTSCTPPACKS,
        SCTP_MIB_INSCTPPACKS,
        SCTP_MIB_RTOALGORITHM,
        SCTP_MIB_RTOMIN,
        SCTP_MIB_RTOMAX,
        SCTP_MIB_RTOINITIAL,
        SCTP_MIB_VALCOOKIELIFE,
        SCTP_MIB_MAXINITRETR,
        __SCTP_MIB_MAX
};


enum
{
        LINUX_MIB_NUM = 0,
        LINUX_MIB_SYNCOOKIESSENT,
        LINUX_MIB_SYNCOOKIESRECV,
        LINUX_MIB_SYNCOOKIESFAILED,
        LINUX_MIB_EMBRYONICRSTS,
        LINUX_MIB_PRUNECALLED,
        LINUX_MIB_RCVPRUNED,
        LINUX_MIB_OFOPRUNED,
        LINUX_MIB_OUTOFWINDOWICMPS,
        LINUX_MIB_LOCKDROPPEDICMPS,
        LINUX_MIB_ARPFILTER,
        LINUX_MIB_TIMEWAITED,
        LINUX_MIB_TIMEWAITRECYCLED,
        LINUX_MIB_TIMEWAITKILLED,
        LINUX_MIB_PAWSPASSIVEREJECTED,
        LINUX_MIB_PAWSACTIVEREJECTED,
        LINUX_MIB_PAWSESTABREJECTED,
        LINUX_MIB_DELAYEDACKS,
        LINUX_MIB_DELAYEDACKLOCKED,
        LINUX_MIB_DELAYEDACKLOST,
        LINUX_MIB_LISTENOVERFLOWS,
        LINUX_MIB_LISTENDROPS,
        LINUX_MIB_TCPPREQUEUED,
        LINUX_MIB_TCPDIRECTCOPYFROMBACKLOG,
        LINUX_MIB_TCPDIRECTCOPYFROMPREQUEUE,
        LINUX_MIB_TCPPREQUEUEDROPPED,
        LINUX_MIB_TCPHPHITS,
        LINUX_MIB_TCPHPHITSTOUSER,
        LINUX_MIB_TCPPUREACKS,
        LINUX_MIB_TCPHPACKS,
        LINUX_MIB_TCPRENORECOVERY,
        LINUX_MIB_TCPSACKRECOVERY,
        LINUX_MIB_TCPSACKRENEGING,
        LINUX_MIB_TCPFACKREORDER,
        LINUX_MIB_TCPSACKREORDER,
        LINUX_MIB_TCPRENOREORDER,
        LINUX_MIB_TCPTSREORDER,
        LINUX_MIB_TCPFULLUNDO,
        LINUX_MIB_TCPPARTIALUNDO,
        LINUX_MIB_TCPDSACKUNDO,
        LINUX_MIB_TCPLOSSUNDO,
        LINUX_MIB_TCPLOSS,
        LINUX_MIB_TCPLOSTRETRANSMIT,
        LINUX_MIB_TCPRENOFAILURES,
        LINUX_MIB_TCPSACKFAILURES,
        LINUX_MIB_TCPLOSSFAILURES,
        LINUX_MIB_TCPFASTRETRANS,
        LINUX_MIB_TCPFORWARDRETRANS,
        LINUX_MIB_TCPSLOWSTARTRETRANS,
        LINUX_MIB_TCPTIMEOUTS,
        LINUX_MIB_TCPRENORECOVERYFAIL,
        LINUX_MIB_TCPSACKRECOVERYFAIL,
        LINUX_MIB_TCPSCHEDULERFAILED,
        LINUX_MIB_TCPRCVCOLLAPSED,
        LINUX_MIB_TCPDSACKOLDSENT,
        LINUX_MIB_TCPDSACKOFOSENT,
        LINUX_MIB_TCPDSACKRECV,
        LINUX_MIB_TCPDSACKOFORECV,
        LINUX_MIB_TCPABORTONSYN,
        LINUX_MIB_TCPABORTONDATA,
        LINUX_MIB_TCPABORTONCLOSE,
        LINUX_MIB_TCPABORTONMEMORY,
        LINUX_MIB_TCPABORTONTIMEOUT,
        LINUX_MIB_TCPABORTONLINGER,
        LINUX_MIB_TCPABORTFAILED,
        LINUX_MIB_TCPMEMORYPRESSURES,
        __LINUX_MIB_MAX
};
# 26 "include/net/snmp.h" 2
# 35 "include/net/snmp.h"
struct snmp_mib {
        char *name;
        int entry;
};
# 73 "include/net/snmp.h"
struct ipstats_mib {
        unsigned long mibs[__IPSTATS_MIB_MAX];
} __attribute__((__aligned__((1 << (7)))));





struct icmp_mib {
        unsigned long mibs[(__ICMP_MIB_MAX + 1)];
} __attribute__((__aligned__((1 << (7)))));



struct icmpv6_mib {
        unsigned long mibs[__ICMP6_MIB_MAX];
} __attribute__((__aligned__((1 << (7)))));



struct tcp_mib {
        unsigned long mibs[__TCP_MIB_MAX];
} __attribute__((__aligned__((1 << (7)))));



struct udp_mib {
        unsigned long mibs[__UDP_MIB_MAX];
} __attribute__((__aligned__((1 << (7)))));



struct sctp_mib {
        unsigned long mibs[__SCTP_MIB_MAX];
} __attribute__((__aligned__((1 << (7)))));



struct linux_mib {
        unsigned long mibs[__LINUX_MIB_MAX];
};
# 36 "include/net/ip.h" 2

struct sock;

struct inet_skb_parm
{
        struct ip_options opt;
        unsigned char flags;





};

struct ipcm_cookie
{
        u32 addr;
        int oif;
        struct ip_options *opt;
};



struct ip_ra_chain
{
        struct ip_ra_chain *next;
        struct sock *sk;
        void (*destructor)(struct sock *);
};

extern struct ip_ra_chain *ip_ra_chain;
extern rwlock_t ip_ra_lock;
# 77 "include/net/ip.h"
extern void ip_mc_dropsocket(struct sock *);
extern void ip_mc_dropdevice(struct net_device *dev);
extern int igmp_mc_proc_init(void);





extern int ip_build_and_send_pkt(struct sk_buff *skb, struct sock *sk,
                                              u32 saddr, u32 daddr,
                                              struct ip_options *opt);
extern int ip_rcv(struct sk_buff *skb, struct net_device *dev,
                               struct packet_type *pt);
extern int ip_local_deliver(struct sk_buff *skb);
extern int ip_mr_input(struct sk_buff *skb);
extern int ip_output(struct sk_buff **pskb);
extern int ip_mc_output(struct sk_buff **pskb);
extern int ip_fragment(struct sk_buff *skb, int (*out)(struct sk_buff*));
extern int ip_do_nat(struct sk_buff *skb);
extern void ip_send_check(struct iphdr *ip);
extern int ip_queue_xmit(struct sk_buff *skb, int ipfragok);
extern void ip_init(void);
extern int ip_append_data(struct sock *sk,
                                       int getfrag(void *from, char *to, int offset, int len,
                                                   int odd, struct sk_buff *skb),
                                void *from, int len, int protolen,
                                struct ipcm_cookie *ipc,
                                struct rtable *rt,
                                unsigned int flags);
extern int ip_generic_getfrag(void *from, char *to, int offset, int len, int odd, struct sk_buff *skb);
extern ssize_t ip_append_page(struct sock *sk, struct page *page,
                                int offset, size_t size, int flags);
extern int ip_push_pending_frames(struct sock *sk);
extern void ip_flush_pending_frames(struct sock *sk);


extern int ip4_datagram_connect(struct sock *sk,
                                             struct sockaddr *uaddr, int addr_len);
# 123 "include/net/ip.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void ip_tr_mc_map(u32 addr, char *buf)
{
        buf[0]=0xC0;
        buf[1]=0x00;
        buf[2]=0x00;
        buf[3]=0x04;
        buf[4]=0x00;
        buf[5]=0x00;
}

struct ip_reply_arg {
        struct kvec iov[1];
        u32 csum;
        int csumoffset;

};

void ip_send_reply(struct sock *sk, struct sk_buff *skb, struct ip_reply_arg *arg,
                   unsigned int len);

extern int ip_finish_output(struct sk_buff *skb);

struct ipv4_config
{
        int log_martians;
        int autoconfig;
        int no_pmtu_disc;
};

extern struct ipv4_config ipv4_config;
extern __typeof__(struct ipstats_mib) *ip_statistics[2];



extern __typeof__(struct linux_mib) *net_statistics[2];






extern int sysctl_local_port_range[2];
extern int sysctl_ip_default_ttl;




static __inline__ __attribute__((always_inline)) __attribute__((always_inline))
int ip_decrease_ttl(struct iphdr *iph)
{
        u32 check = iph->check;
        check += (__builtin_constant_p((__u16)((0x0100))) ? ({ __u16 __x = (((0x0100))); ((__u16)( (((__u16)(__x) & (__u16)0x00ffU) << 8) | (((__u16)(__x) & (__u16)0xff00U) >> 8) )); }) : __fswab16(((0x0100))));
        iph->check = check + (check>=0xFFFF);
        return --iph->ttl;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline))
int ip_dont_fragment(struct sock *sk, struct dst_entry *dst)
{
        return (inet_sk(sk)->pmtudisc == 2 ||
                (inet_sk(sk)->pmtudisc == 1 &&
                 !(dst_metric(dst, RTAX_LOCK)&(1<<RTAX_MTU))));
}

extern void __ip_select_ident(struct iphdr *iph, struct dst_entry *dst, int more);

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void ip_select_ident(struct iphdr *iph, struct dst_entry *dst, struct sock *sk)
{
        if (iph->frag_off & (__builtin_constant_p((__u16)((0x4000))) ? ({ __u16 __x = (((0x4000))); ((__u16)( (((__u16)(__x) & (__u16)0x00ffU) << 8) | (((__u16)(__x) & (__u16)0xff00U) >> 8) )); }) : __fswab16(((0x4000))))) {





                iph->id = (sk && inet_sk(sk)->daddr) ?
                                        (__builtin_constant_p((__u16)((inet_sk(sk)->id++))) ? ({ __u16 __x = (((inet_sk(sk)->id++))); ((__u16)( (((__u16)(__x) & (__u16)0x00ffU) << 8) | (((__u16)(__x) & (__u16)0xff00U) >> 8) )); }) : __fswab16(((inet_sk(sk)->id++)))) : 0;
        } else
                __ip_select_ident(iph, dst, 0);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void ip_select_ident_more(struct iphdr *iph, struct dst_entry *dst, struct sock *sk, int more)
{
        if (iph->frag_off & (__builtin_constant_p((__u16)((0x4000))) ? ({ __u16 __x = (((0x4000))); ((__u16)( (((__u16)(__x) & (__u16)0x00ffU) << 8) | (((__u16)(__x) & (__u16)0xff00U) >> 8) )); }) : __fswab16(((0x4000))))) {
                if (sk && inet_sk(sk)->daddr) {
                        iph->id = (__builtin_constant_p((__u16)((inet_sk(sk)->id))) ? ({ __u16 __x = (((inet_sk(sk)->id))); ((__u16)( (((__u16)(__x) & (__u16)0x00ffU) << 8) | (((__u16)(__x) & (__u16)0xff00U) >> 8) )); }) : __fswab16(((inet_sk(sk)->id))));
                        inet_sk(sk)->id += 1 + more;
                } else
                        iph->id = 0;
        } else
                __ip_select_ident(iph, dst, more);
}





static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void ip_eth_mc_map(u32 addr, char *buf)
{
        addr=(__builtin_constant_p((__u32)((addr))) ? ({ __u32 __x = (((addr))); ((__u32)( (((__u32)(__x) & (__u32)0x000000ffUL) << 24) | (((__u32)(__x) & (__u32)0x0000ff00UL) << 8) | (((__u32)(__x) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(__x) & (__u32)0xff000000UL) >> 24) )); }) : __fswab32(((addr))));
        buf[0]=0x01;
        buf[1]=0x00;
        buf[2]=0x5e;
        buf[5]=addr&0xFF;
        addr>>=8;
        buf[4]=addr&0xFF;
        addr>>=8;
        buf[3]=addr&0x7F;
}


# 1 "include/linux/ipv6.h" 1
# 19 "include/linux/ipv6.h"
struct in6_pktinfo {
        struct in6_addr ipi6_addr;
        int ipi6_ifindex;
};


struct in6_ifreq {
        struct in6_addr ifr6_addr;
        __u32 ifr6_prefixlen;
        int ifr6_ifindex;
};







struct ipv6_rt_hdr {
        __u8 nexthdr;
        __u8 hdrlen;
        __u8 type;
        __u8 segments_left;





};


struct ipv6_opt_hdr {
        __u8 nexthdr;
        __u8 hdrlen;



};
# 69 "include/linux/ipv6.h"
struct rt0_hdr {
        struct ipv6_rt_hdr rt_hdr;
        __u32 bitmap;
        struct in6_addr addr[0];


};

struct ipv6_auth_hdr {
        __u8 nexthdr;
        __u8 hdrlen;
        __u16 reserved;
        __u32 spi;
        __u32 seq_no;
        __u8 auth_data[0];
};

struct ipv6_esp_hdr {
        __u32 spi;
        __u32 seq_no;
        __u8 enc_data[0];
};

struct ipv6_comp_hdr {
        __u8 nexthdr;
        __u8 flags;
        __u16 cpi;
};
# 105 "include/linux/ipv6.h"
struct ipv6hdr {

        __u8 priority:4,
                                version:4;






        __u8 flow_lbl[3];

        __u16 payload_len;
        __u8 nexthdr;
        __u8 hop_limit;

        struct in6_addr saddr;
        struct in6_addr daddr;
};




struct ipv6_devconf {
        __s32 forwarding;
        __s32 hop_limit;
        __s32 mtu6;
        __s32 accept_ra;
        __s32 accept_redirects;
        __s32 autoconf;
        __s32 dad_transmits;
        __s32 rtr_solicits;
        __s32 rtr_solicit_interval;
        __s32 rtr_solicit_delay;
        __s32 force_mld_version;

        __s32 use_tempaddr;
        __s32 temp_valid_lft;
        __s32 temp_prefered_lft;
        __s32 regen_max_retry;
        __s32 max_desync_factor;

        __s32 max_addresses;
        void *sysctl;
};


enum {
        DEVCONF_FORWARDING = 0,
        DEVCONF_HOPLIMIT,
        DEVCONF_MTU6,
        DEVCONF_ACCEPT_RA,
        DEVCONF_ACCEPT_REDIRECTS,
        DEVCONF_AUTOCONF,
        DEVCONF_DAD_TRANSMITS,
        DEVCONF_RTR_SOLICITS,
        DEVCONF_RTR_SOLICIT_INTERVAL,
        DEVCONF_RTR_SOLICIT_DELAY,
        DEVCONF_USE_TEMPADDR,
        DEVCONF_TEMP_VALID_LFT,
        DEVCONF_TEMP_PREFERED_LFT,
        DEVCONF_REGEN_MAX_RETRY,
        DEVCONF_MAX_DESYNC_FACTOR,
        DEVCONF_MAX_ADDRESSES,
        DEVCONF_FORCE_MLD_VERSION,
        DEVCONF_MAX
};



# 1 "include/linux/icmpv6.h" 1





struct icmp6hdr {

        __u8 icmp6_type;
        __u8 icmp6_code;
        __u16 icmp6_cksum;


        union {
                __u32 un_data32[1];
                __u16 un_data16[2];
                __u8 un_data8[4];

                struct icmpv6_echo {
                        __u16 identifier;
                        __u16 sequence;
                } u_echo;

                struct icmpv6_nd_advt {

                        __u32 reserved:5,
                                        override:1,
                                        solicited:1,
                                        router:1,
                                        reserved2:24;
# 38 "include/linux/icmpv6.h"
                } u_nd_advt;

                struct icmpv6_nd_ra {
                        __u8 hop_limit;

                        __u8 reserved:6,
                                        other:1,
                                        managed:1;
# 54 "include/linux/icmpv6.h"
                        __u16 rt_lifetime;
                } u_nd_ra;

        } icmp6_dataun;
# 73 "include/linux/icmpv6.h"
};
# 136 "include/linux/icmpv6.h"
struct icmp6_filter {
        __u32 data[8];
};
# 158 "include/linux/icmpv6.h"
extern void icmpv6_send(struct sk_buff *skb,
                                                    int type, int code,
                                                    __u32 info,
                                                    struct net_device *dev);

extern int icmpv6_init(struct net_proto_family *ops);
extern int icmpv6_err_convert(int type, int code,
                                                           int *err);
extern void icmpv6_cleanup(void);
extern void icmpv6_param_prob(struct sk_buff *skb,
                                                          int code, int pos);
# 176 "include/linux/ipv6.h" 2
# 1 "include/net/if_inet6.h" 1
# 19 "include/net/if_inet6.h"
# 1 "include/linux/ipv6.h" 1
# 20 "include/net/if_inet6.h" 2
# 34 "include/net/if_inet6.h"
struct inet6_ifaddr
{
        struct in6_addr addr;
        __u32 prefix_len;

        __u32 valid_lft;
        __u32 prefered_lft;
        unsigned long cstamp;
        unsigned long tstamp;
        atomic_t refcnt;
        spinlock_t lock;

        __u8 probes;
        __u8 flags;

        __u16 scope;

        struct timer_list timer;

        struct inet6_dev *idev;

        struct inet6_ifaddr *lst_next;
        struct inet6_ifaddr *if_next;


        struct inet6_ifaddr *tmp_next;
        struct inet6_ifaddr *ifpub;
        int regen_count;


        int dead;
};

struct ip6_sf_socklist
{
        unsigned int sl_max;
        unsigned int sl_count;
        struct in6_addr sl_addr[0];
};






struct ipv6_mc_socklist
{
        struct in6_addr addr;
        int ifindex;
        struct ipv6_mc_socklist *next;
        unsigned int sfmode;
        struct ip6_sf_socklist *sflist;
};

struct ip6_sf_list
{
        struct ip6_sf_list *sf_next;
        struct in6_addr sf_addr;
        unsigned long sf_count[2];
        unsigned char sf_gsresp;
        unsigned char sf_oldin;
        unsigned char sf_crcount;
};







struct ifmcaddr6
{
        struct in6_addr mca_addr;
        struct inet6_dev *idev;
        struct ifmcaddr6 *next;
        struct ip6_sf_list *mca_sources;
        struct ip6_sf_list *mca_tomb;
        unsigned int mca_sfmode;
        unsigned long mca_sfcount[2];
        struct timer_list mca_timer;
        unsigned mca_flags;
        int mca_users;
        atomic_t mca_refcnt;
        spinlock_t mca_lock;
        unsigned char mca_crcount;
        unsigned long mca_cstamp;
        unsigned long mca_tstamp;
};



struct ipv6_ac_socklist
{
        struct in6_addr acl_addr;
        int acl_ifindex;
        struct ipv6_ac_socklist *acl_next;
};

struct ifacaddr6
{
        struct in6_addr aca_addr;
        struct inet6_dev *aca_idev;
        struct ifacaddr6 *aca_next;
        int aca_users;
        atomic_t aca_refcnt;
        spinlock_t aca_lock;
        unsigned long aca_cstamp;
        unsigned long aca_tstamp;
};






struct ipv6_devstat {
        struct proc_dir_entry *proc_dir_entry;
        __typeof__(struct icmpv6_mib) *icmpv6[2];
};

struct inet6_dev
{
        struct net_device *dev;

        struct inet6_ifaddr *addr_list;

        struct ifmcaddr6 *mc_list;
        struct ifmcaddr6 *mc_tomb;
        rwlock_t mc_lock;
        unsigned long mc_v1_seen;
        unsigned long mc_maxdelay;
        unsigned char mc_qrv;
        unsigned char mc_gq_running;
        unsigned char mc_ifc_count;
        struct timer_list mc_gq_timer;
        struct timer_list mc_ifc_timer;

        struct ifacaddr6 *ac_list;
        rwlock_t lock;
        atomic_t refcnt;
        __u32 if_flags;
        int dead;


        u8 rndid[8];
        u8 entropy[8];
        struct timer_list regen_timer;
        struct inet6_ifaddr *tempaddr_list;
        __u8 work_eui64[8];
        __u8 work_digest[16];


        struct neigh_parms *nd_parms;
        struct inet6_dev *next;
        struct ipv6_devconf cnf;
        struct ipv6_devstat stats;
        unsigned long tstamp;
};

extern struct ipv6_devconf ipv6_devconf;

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void ipv6_eth_mc_map(struct in6_addr *addr, char *buf)
{






        buf[0]= 0x33;
        buf[1]= 0x33;

        (__builtin_constant_p(sizeof(__u32)) ? __constant_memcpy((buf + 2),(&addr->in6_u.u6_addr32[3]),(sizeof(__u32))) : __memcpy((buf + 2),(&addr->in6_u.u6_addr32[3]),(sizeof(__u32))));
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void ipv6_tr_mc_map(struct in6_addr *addr, char *buf)
{


        if (((addr->in6_u.u6_addr8[0] == 0xFF) &&
            ((addr->in6_u.u6_addr8[1] == 0x01) || (addr->in6_u.u6_addr8[1] == 0x02)) &&
             (addr->in6_u.u6_addr16[1] == 0) &&
             (addr->in6_u.u6_addr32[1] == 0) &&
             (addr->in6_u.u6_addr32[2] == 0) &&
             (addr->in6_u.u6_addr16[6] == 0) &&
             (addr->in6_u.u6_addr8[15] == 1)) ||
            ((addr->in6_u.u6_addr8[0] == 0xFF) &&
             (addr->in6_u.u6_addr8[1] == 0x02) &&
             (addr->in6_u.u6_addr16[1] == 0) &&
             (addr->in6_u.u6_addr32[1] == 0) &&
             (addr->in6_u.u6_addr16[4] == 0) &&
             (addr->in6_u.u6_addr8[10] == 0) &&
             (addr->in6_u.u6_addr8[11] == 1) &&
             (addr->in6_u.u6_addr8[12] == 0xff)))
        {
                buf[0]=0xC0;
                buf[1]=0x00;
                buf[2]=0x01;
                buf[3]=0x00;
                buf[4]=0x00;
                buf[5]=0x00;

        } else if ((addr->in6_u.u6_addr8[0] ==0xff) &&
                ((addr->in6_u.u6_addr8[1] & 0xF0) == 0) &&
                (addr->in6_u.u6_addr16[1] == 0) &&
                (addr->in6_u.u6_addr32[1] == 0) &&
                (addr->in6_u.u6_addr32[2] == 0) &&
                (addr->in6_u.u6_addr16[6] == 0) &&
                (addr->in6_u.u6_addr8[15] == 2))
        {
                buf[0]=0xC0;
                buf[1]=0x00;
                buf[2]=0x02;
                buf[3]=0x00;
                buf[4]=0x00;
                buf[5]=0x00;
        } else {
                unsigned char i ;

                i = addr->in6_u.u6_addr8[15] & 7 ;
                buf[0]=0xC0;
                buf[1]=0x00;
                buf[2]=0x00;
                buf[3]=0x01 << i ;
                buf[4]=0x00;
                buf[5]=0x00;
        }
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void ipv6_arcnet_mc_map(const struct in6_addr *addr, char *buf)
{
        buf[0] = 0x00;
}
# 177 "include/linux/ipv6.h" 2
# 185 "include/linux/ipv6.h"
struct inet6_skb_parm
{
        int iif;
        __u16 ra;
        __u16 hop;
        __u16 dst0;
        __u16 srcrt;
        __u16 dst1;
};



struct ipv6_pinfo {
        struct in6_addr saddr;
        struct in6_addr rcv_saddr;
        struct in6_addr daddr;
        struct in6_addr *daddr_cache;

        __u32 flow_label;
        __u32 frag_size;
        int hop_limit;
        int mcast_hops;
        int mcast_oif;


        union {
                struct {
                        __u8 srcrt:2,
                                rxinfo:1,
                                rxhlim:1,
                                hopopts:1,
                                dstopts:1,
                                rxflow:1;
                } bits;
                __u8 all;
        } rxopt;


        __u8 mc_loop:1,
                                recverr:1,
                                sndflow:1,
                                pmtudisc:2,
                                ipv6only:1;

        struct ipv6_mc_socklist *ipv6_mc_list;
        struct ipv6_ac_socklist *ipv6_ac_list;
        struct ipv6_fl_socklist *ipv6_fl_list;
        __u32 dst_cookie;

        struct ipv6_txoptions *opt;
        struct sk_buff *pktoptions;
        struct {
                struct ipv6_txoptions *opt;
                struct rt6_info *rt;
                int hop_limit;
        } cork;
};

struct raw6_opt {
        __u32 checksum;
        __u32 offset;

        struct icmp6_filter filter;
};


struct raw6_sock {
        struct sock sk;
        struct ipv6_pinfo *pinet6;
        struct inet_opt inet;
        struct raw6_opt raw6;
        struct ipv6_pinfo inet6;
};

struct udp6_sock {
        struct sock sk;
        struct ipv6_pinfo *pinet6;
        struct inet_opt inet;
        struct udp_opt udp;
        struct ipv6_pinfo inet6;
};

struct tcp6_sock {
        struct sock sk;
        struct ipv6_pinfo *pinet6;
        struct inet_opt inet;
        struct tcp_opt tcp;
        struct ipv6_pinfo inet6;
};

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct ipv6_pinfo * inet6_sk(const struct sock *__sk)
{
        return ((struct raw6_sock *)__sk)->pinet6;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct raw6_opt * raw6_sk(const struct sock *__sk)
{
        return &((struct raw6_sock *)__sk)->raw6;
}
# 234 "include/net/ip.h" 2


static __inline__ __attribute__((always_inline)) void inet_reset_saddr(struct sock *sk)
{
        inet_sk(sk)->rcv_saddr = inet_sk(sk)->saddr = 0;

        if (sk->__sk_common.skc_family == 10) {
                struct ipv6_pinfo *np = inet6_sk(sk);

                (__builtin_constant_p(0) ? (__builtin_constant_p((sizeof(np->saddr))) ? __constant_c_and_count_memset(((&np->saddr)),((0x01010101UL*(unsigned char)(0))),((sizeof(np->saddr)))) : __constant_c_memset(((&np->saddr)),((0x01010101UL*(unsigned char)(0))),((sizeof(np->saddr))))) : (__builtin_constant_p((sizeof(np->saddr))) ? __memset_generic((((&np->saddr))),(((0))),(((sizeof(np->saddr))))) : __memset_generic(((&np->saddr)),((0)),((sizeof(np->saddr))))));
                (__builtin_constant_p(0) ? (__builtin_constant_p((sizeof(np->rcv_saddr))) ? __constant_c_and_count_memset(((&np->rcv_saddr)),((0x01010101UL*(unsigned char)(0))),((sizeof(np->rcv_saddr)))) : __constant_c_memset(((&np->rcv_saddr)),((0x01010101UL*(unsigned char)(0))),((sizeof(np->rcv_saddr))))) : (__builtin_constant_p((sizeof(np->rcv_saddr))) ? __memset_generic((((&np->rcv_saddr))),(((0))),(((sizeof(np->rcv_saddr))))) : __memset_generic(((&np->rcv_saddr)),((0)),((sizeof(np->rcv_saddr))))));
        }

}



extern int ip_call_ra_chain(struct sk_buff *skb);





struct sk_buff *ip_defrag(struct sk_buff *skb);
extern int ip_frag_nqueues;
extern atomic_t ip_frag_mem;





extern int ip_forward(struct sk_buff *skb);
extern int ip_net_unreachable(struct sk_buff *skb);





extern void ip_options_build(struct sk_buff *skb, struct ip_options *opt, u32 daddr, struct rtable *rt, int is_frag);
extern int ip_options_echo(struct ip_options *dopt, struct sk_buff *skb);
extern void ip_options_fragment(struct sk_buff *skb);
extern int ip_options_compile(struct ip_options *opt, struct sk_buff *skb);
extern int ip_options_get(struct ip_options **optp, unsigned char *data, int optlen, int user);
extern void ip_options_undo(struct ip_options * opt);
extern void ip_forward_options(struct sk_buff *skb);
extern int ip_options_rcv_srr(struct sk_buff *skb);





extern void ip_cmsg_recv(struct msghdr *msg, struct sk_buff *skb);
extern int ip_cmsg_send(struct msghdr *msg, struct ipcm_cookie *ipc);
extern int ip_setsockopt(struct sock *sk, int level, int optname, char *optval, int optlen);
extern int ip_getsockopt(struct sock *sk, int level, int optname, char *optval, int *optlen);
extern int ip_ra_control(struct sock *sk, unsigned char on, void (*destructor)(struct sock *));

extern int ip_recv_error(struct sock *sk, struct msghdr *msg, int len);
extern void ip_icmp_error(struct sock *sk, struct sk_buff *skb, int err,
                              u16 port, u32 info, u8 *payload);
extern void ip_local_error(struct sock *sk, int err, u32 daddr, u16 dport,
                               u32 info);

extern int ipv4_proc_init(void);




int ipv4_doint_and_flush(ctl_table *ctl, int write,
                         struct file* filp, void *buffer,
                         size_t *lenp, loff_t *ppos);
int ipv4_doint_and_flush_strategy(ctl_table *table, int *name, int nlen,
                                  void *oldval, size_t *oldlenp,
                                  void *newval, size_t newlen,
                                  void **context);
# 26 "net/ipv4/netfilter/ip_tables.c" 2


# 1 "include/linux/proc_fs.h" 1
# 23 "include/linux/proc_fs.h"
enum {
        PROC_ROOT_INO = 1,
};
# 44 "include/linux/proc_fs.h"
typedef int (read_proc_t)(char *page, char **start, off_t off,
                          int count, int *eof, void *data);
typedef int (write_proc_t)(struct file *file, const char *buffer,
                           unsigned long count, void *data);
typedef int (get_info_t)(char *, char **, off_t, int);

struct proc_dir_entry {
        unsigned int low_ino;
        unsigned short namelen;
        const char *name;
        mode_t mode;
        nlink_t nlink;
        uid_t uid;
        gid_t gid;
        unsigned long size;
        struct inode_operations * proc_iops;
        struct file_operations * proc_fops;
        get_info_t *get_info;
        struct module *owner;
        struct proc_dir_entry *next, *parent, *subdir;
        void *data;
        read_proc_t *read_proc;
        write_proc_t *write_proc;
        atomic_t count;
        int deleted;
};

struct kcore_list {
        struct kcore_list *next;
        unsigned long addr;
        size_t size;
};



extern struct proc_dir_entry proc_root;
extern struct proc_dir_entry *proc_root_fs;
extern struct proc_dir_entry *proc_net;
extern struct proc_dir_entry *proc_bus;
extern struct proc_dir_entry *proc_root_driver;
extern struct proc_dir_entry *proc_root_kcore;

extern void proc_root_init(void);
extern void proc_misc_init(void);

struct dentry *proc_pid_lookup(struct inode *dir, struct dentry * dentry, struct nameidata *);
struct dentry *proc_pid_unhash(struct task_struct *p);
void proc_pid_flush(struct dentry *proc_dentry);
int proc_pid_readdir(struct file * filp, void * dirent, filldir_t filldir);

extern struct proc_dir_entry *create_proc_entry(const char *name, mode_t mode,
                                                struct proc_dir_entry *parent);
extern void remove_proc_entry(const char *name, struct proc_dir_entry *parent);

extern struct vfsmount *proc_mnt;
extern int proc_fill_super(struct super_block *,void *,int);
extern struct inode *proc_get_inode(struct super_block *, unsigned int, struct proc_dir_entry *);

extern int proc_match(int, const char *,struct proc_dir_entry *);
# 111 "include/linux/proc_fs.h"
extern int proc_readdir(struct file *, void *, filldir_t);
extern struct dentry *proc_lookup(struct inode *, struct dentry *, struct nameidata *);

extern struct file_operations proc_kcore_operations;
extern struct file_operations proc_kmsg_operations;
extern struct file_operations ppc_htab_operations;




struct tty_driver;
extern void proc_tty_init(void);
extern void proc_tty_register_driver(struct tty_driver *driver);
extern void proc_tty_unregister_driver(struct tty_driver *driver);




struct device_node;
extern void proc_device_tree_init(void);



static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void proc_device_tree_add_node(struct device_node *np, struct proc_dir_entry *pde)
{
        return;
}


extern struct proc_dir_entry *proc_symlink(const char *,
                struct proc_dir_entry *, const char *);
extern struct proc_dir_entry *proc_mkdir(const char *,struct proc_dir_entry *);
extern struct proc_dir_entry *proc_mkdir_mode(const char *name, mode_t mode,
                        struct proc_dir_entry *parent);

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct proc_dir_entry *create_proc_read_entry(const char *name,
        mode_t mode, struct proc_dir_entry *base,
        read_proc_t *read_proc, void * data)
{
        struct proc_dir_entry *res=create_proc_entry(name,mode,base);
        if (res) {
                res->read_proc=read_proc;
                res->data=data;
        }
        return res;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct proc_dir_entry *create_proc_info_entry(const char *name,
        mode_t mode, struct proc_dir_entry *base, get_info_t *get_info)
{
        struct proc_dir_entry *res=create_proc_entry(name,mode,base);
        if (res) res->get_info=get_info;
        return res;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct proc_dir_entry *proc_net_create(const char *name,
        mode_t mode, get_info_t *get_info)
{
        return create_proc_info_entry(name,mode,proc_net,get_info);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct proc_dir_entry *proc_net_fops_create(const char *name,
        mode_t mode, struct file_operations *fops)
{
        struct proc_dir_entry *res = create_proc_entry(name, mode, proc_net);
        if (res)
                res->proc_fops = fops;
        return res;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void proc_net_remove(const char *name)
{
        remove_proc_entry(name,proc_net);
}
# 233 "include/linux/proc_fs.h"
extern void kclist_add(struct kcore_list *, void *, size_t);
extern struct kcore_list *kclist_del(void *);


struct proc_inode {
        struct task_struct *task;
        int type;
        union {
                int (*proc_get_link)(struct inode *, struct dentry **, struct vfsmount **);
                int (*proc_read)(struct task_struct *task, char *page);
        } op;
        struct proc_dir_entry *pde;
        struct inode vfs_inode;
};

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct proc_inode *PROC_I(const struct inode *inode)
{
        return ({ const typeof( ((struct proc_inode *)0)->vfs_inode ) *__mptr = (inode); (struct proc_inode *)( (char *)__mptr - ((size_t) &((struct proc_inode *)0)->vfs_inode) );});
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct proc_dir_entry *PDE(const struct inode *inode)
{
        return PROC_I(inode)->pde;
}
# 29 "net/ipv4/netfilter/ip_tables.c" 2

# 1 "include/linux/netfilter_ipv4/ip_tables.h" 1
# 26 "include/linux/netfilter_ipv4/ip_tables.h"
# 1 "include/linux/netfilter_ipv4.h" 1
# 9 "include/linux/netfilter_ipv4.h"
# 1 "include/linux/netfilter.h" 1
# 32 "include/linux/netfilter.h"
extern void netfilter_init(void);




struct sk_buff;
struct net_device;

typedef unsigned int nf_hookfn(unsigned int hooknum,
                               struct sk_buff **skb,
                               const struct net_device *in,
                               const struct net_device *out,
                               int (*okfn)(struct sk_buff *));

struct nf_hook_ops
{
        struct list_head list;


        nf_hookfn *hook;
        struct module *owner;
        int pf;
        int hooknum;

        int priority;
};

struct nf_sockopt_ops
{
        struct list_head list;

        int pf;


        int set_optmin;
        int set_optmax;
        int (*set)(struct sock *sk, int optval, void *user, unsigned int len);

        int get_optmin;
        int get_optmax;
        int (*get)(struct sock *sk, int optval, void *user, int *len);


        unsigned int use;
        struct task_struct *cleanup_task;
};


struct nf_info
{

        struct nf_hook_ops *elem;


        int pf;
        unsigned int hook;
        struct net_device *indev, *outdev;
        int (*okfn)(struct sk_buff *);
};


int nf_register_hook(struct nf_hook_ops *reg);
void nf_unregister_hook(struct nf_hook_ops *reg);



int nf_register_sockopt(struct nf_sockopt_ops *reg);
void nf_unregister_sockopt(struct nf_sockopt_ops *reg);

extern struct list_head nf_hooks[32][8];

typedef void nf_logfn(unsigned int hooknum,
                      const struct sk_buff *skb,
                      const struct net_device *in,
                      const struct net_device *out,
                      const char *prefix);


int nf_log_register(int pf, nf_logfn *logfn);
void nf_log_unregister(int pf, nf_logfn *logfn);


void nf_log_packet(int pf,
                   unsigned int hooknum,
                   const struct sk_buff *skb,
                   const struct net_device *in,
                   const struct net_device *out,
                   const char *fmt, ...);
# 155 "include/linux/netfilter.h"
int nf_hook_slow(int pf, unsigned int hook, struct sk_buff *skb,
                 struct net_device *indev, struct net_device *outdev,
                 int (*okfn)(struct sk_buff *), int thresh);


int nf_setsockopt(struct sock *sk, int pf, int optval, char *opt,
                  int len);
int nf_getsockopt(struct sock *sk, int pf, int optval, char *opt,
                  int *len);


typedef int (*nf_queue_outfn_t)(struct sk_buff *skb,
                                struct nf_info *info, void *data);
extern int nf_register_queue_handler(int pf,
                                     nf_queue_outfn_t outfn, void *data);
extern int nf_unregister_queue_handler(int pf);
extern void nf_reinject(struct sk_buff *skb,
                        struct nf_info *info,
                        unsigned int verdict);

extern __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct ipt_target *
ipt_find_target_lock(const char *name, int *error, struct semaphore *mutex);
extern __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct ip6t_target *
ip6t_find_target_lock(const char *name, int *error, struct semaphore *mutex);
extern __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct arpt_target *
arpt_find_target_lock(const char *name, int *error, struct semaphore *mutex);
extern void (*ip_ct_attach)(struct sk_buff *, struct nf_ct_info *);


extern void nf_dump_skb(int pf, struct sk_buff *skb);



extern void nf_invalidate_cache(int pf);
# 10 "include/linux/netfilter_ipv4.h" 2
# 52 "include/linux/netfilter_ipv4.h"
enum nf_ip_hook_priorities {
        NF_IP_PRI_FIRST = (-((int)(~0U>>1)) - 1),
        NF_IP_PRI_CONNTRACK_DEFRAG = -400,
        NF_IP_PRI_RAW = -300,
        NF_IP_PRI_SELINUX_FIRST = -225,
        NF_IP_PRI_CONNTRACK = -200,
        NF_IP_PRI_BRIDGE_SABOTAGE_FORWARD = -175,
        NF_IP_PRI_MANGLE = -150,
        NF_IP_PRI_NAT_DST = -100,
        NF_IP_PRI_BRIDGE_SABOTAGE_LOCAL_OUT = -50,
        NF_IP_PRI_FILTER = 0,
        NF_IP_PRI_NAT_SRC = 100,
        NF_IP_PRI_SELINUX_LAST = 225,
        NF_IP_PRI_LAST = ((int)(~0U>>1)),
};
# 76 "include/linux/netfilter_ipv4.h"
void nf_debug_ip_local_deliver(struct sk_buff *skb);
void nf_debug_ip_loopback_xmit(struct sk_buff *newskb);
void nf_debug_ip_finish_output2(struct sk_buff *skb);


extern int ip_route_me_harder(struct sk_buff **pskb);




extern int skb_ip_make_writable(struct sk_buff **pskb,
                                unsigned int writable_len);
# 27 "include/linux/netfilter_ipv4/ip_tables.h" 2





struct ipt_ip {

        struct in_addr src, dst;

        struct in_addr smsk, dmsk;
        char iniface[16], outiface[16];
        unsigned char iniface_mask[16], outiface_mask[16];


        u_int16_t proto;


        u_int8_t flags;

        u_int8_t invflags;
};

struct ipt_entry_match
{
        union {
                struct {
                        u_int16_t match_size;


                        char name[30];
                } user;
                struct {
                        u_int16_t match_size;


                        struct ipt_match *match;
                } kernel;


                u_int16_t match_size;
        } u;

        unsigned char data[0];
};

struct ipt_entry_target
{
        union {
                struct {
                        u_int16_t target_size;


                        char name[30];
                } user;
                struct {
                        u_int16_t target_size;


                        struct ipt_target *target;
                } kernel;


                u_int16_t target_size;
        } u;

        unsigned char data[0];
};

struct ipt_standard_target
{
        struct ipt_entry_target target;
        int verdict;
};

struct ipt_counters
{
        u_int64_t pcnt, bcnt;
};
# 123 "include/linux/netfilter_ipv4/ip_tables.h"
struct ipt_entry
{
        struct ipt_ip ip;


        unsigned int nfcache;


        u_int16_t target_offset;

        u_int16_t next_offset;


        unsigned int comefrom;


        struct ipt_counters counters;


        unsigned char elems[0];
};
# 166 "include/linux/netfilter_ipv4/ip_tables.h"
struct ipt_tcp
{
        u_int16_t spts[2];
        u_int16_t dpts[2];
        u_int8_t option;
        u_int8_t flg_mask;
        u_int8_t flg_cmp;
        u_int8_t invflags;
};
# 184 "include/linux/netfilter_ipv4/ip_tables.h"
struct ipt_udp
{
        u_int16_t spts[2];
        u_int16_t dpts[2];
        u_int8_t invflags;
};







struct ipt_icmp
{
        u_int8_t type;
        u_int8_t code[2];
        u_int8_t invflags;
};





struct ipt_getinfo
{

        char name[32];



        unsigned int valid_hooks;


        unsigned int hook_entry[5];


        unsigned int underflow[5];


        unsigned int num_entries;


        unsigned int size;
};


struct ipt_replace
{

        char name[32];



        unsigned int valid_hooks;


        unsigned int num_entries;


        unsigned int size;


        unsigned int hook_entry[5];


        unsigned int underflow[5];



        unsigned int num_counters;

        struct ipt_counters *counters;


        struct ipt_entry entries[0];
};


struct ipt_counters_info
{

        char name[32];

        unsigned int num_counters;


        struct ipt_counters counters[0];
};


struct ipt_get_entries
{

        char name[32];


        unsigned int size;


        struct ipt_entry entrytable[0];
};







static __inline__ __attribute__((always_inline)) struct ipt_entry_target *
ipt_get_target(struct ipt_entry *e)
{
        return (void *)e + e->target_offset;
}
# 339 "include/linux/netfilter_ipv4/ip_tables.h"
static struct semaphore ipt_mutex = { { (1) }, 0, { .lock = (spinlock_t) { 1 , 0xdead4ead }, .task_list = { &((ipt_mutex).wait).task_list, &((ipt_mutex).wait).task_list } } };


extern void ipt_init(void) __attribute__ ((__section__ (".init.text")));

struct ipt_match
{
        struct list_head list;

        const char name[30];






        int (*match)(const struct sk_buff *skb,
                     const struct net_device *in,
                     const struct net_device *out,
                     const void *matchinfo,
                     int offset,
                     int *hotdrop);



        int (*checkentry)(const char *tablename,
                          const struct ipt_ip *ip,
                          void *matchinfo,
                          unsigned int matchinfosize,
                          unsigned int hook_mask);


        void (*destroy)(void *matchinfo, unsigned int matchinfosize);


        struct module *me;
};


struct ipt_target
{
        struct list_head list;

        const char name[30];





        int (*checkentry)(const char *tablename,
                          const struct ipt_entry *e,
                          void *targinfo,
                          unsigned int targinfosize,
                          unsigned int hook_mask);


        void (*destroy)(void *targinfo, unsigned int targinfosize);




        unsigned int (*target)(struct sk_buff **pskb,
                               const struct net_device *in,
                               const struct net_device *out,
                               unsigned int hooknum,
                               const void *targinfo,
                               void *userdata);


        struct module *me;
};

extern struct ipt_target *
ipt_find_target_lock(const char *name, int *error, struct semaphore *mutex);
extern struct arpt_target *
arpt_find_target_lock(const char *name, int *error, struct semaphore *mutex);

extern int ipt_register_target(struct ipt_target *target);
extern void ipt_unregister_target(struct ipt_target *target);

extern int ipt_register_match(struct ipt_match *match);
extern void ipt_unregister_match(struct ipt_match *match);


struct ipt_table
{
        struct list_head list;


        char name[32];


        struct ipt_replace *table;


        unsigned int valid_hooks;


        rwlock_t lock;


        struct ipt_table_info *private;


        struct module *me;
};

extern int ipt_register_table(struct ipt_table *table);
extern void ipt_unregister_table(struct ipt_table *table);
extern unsigned int ipt_do_table(struct sk_buff **pskb,
                                 unsigned int hook,
                                 const struct net_device *in,
                                 const struct net_device *out,
                                 struct ipt_table *table,
                                 void *userdata);
# 31 "net/ipv4/netfilter/ip_tables.c" 2

;
;
;
# 67 "net/ipv4/netfilter/ip_tables.c"
# 1 "include/linux/netfilter_ipv4/lockhelp.h" 1
# 13 "include/linux/netfilter_ipv4/lockhelp.h"
struct spinlock_debug
{
        spinlock_t l;
        atomic_t locked_by;
};

struct rwlock_debug
{
        rwlock_t l;
        long read_locked_map;
        long write_locked_map;
};
# 68 "net/ipv4/netfilter/ip_tables.c" 2
# 1 "include/linux/netfilter_ipv4/listhelp.h" 1
# 52 "include/linux/netfilter_ipv4/listhelp.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int
__list_cmp_same(const void *p1, const void *p2) { return p1 == p2; }


static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int
list_inlist(struct list_head *head, const void *entry)
{
        return ({ const struct list_head *__i, *__j = ((void *)0); do { if (!(down_trylock(&ipt_mutex) != 0)) printk("IP_NF_ASSERT: %s:%s:%u\n", (__func__), "include/linux/netfilter_ipv4/listhelp.h", 59); } while(0); for (__i = ((head))->next, prefetch(__i->next); __i != ((head)); __i = __i->next, prefetch(__i->next)) if (__list_cmp_same((const void *)__i , entry)) { __j = __i; break; } (void *)__j; }) != ((void *)0);
}
# 77 "include/linux/netfilter_ipv4/listhelp.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void
list_append(struct list_head *head, void *new)
{
        do { if (!(down_trylock(&ipt_mutex) != 0)) printk("IP_NF_ASSERT: %s:%s:%u\n", (__func__), "include/linux/netfilter_ipv4/listhelp.h", 80); } while(0);
        list_add((new), (head)->prev);
}


static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void
list_prepend(struct list_head *head, void *new)
{
        do { if (!(down_trylock(&ipt_mutex) != 0)) printk("IP_NF_ASSERT: %s:%s:%u\n", (__func__), "include/linux/netfilter_ipv4/listhelp.h", 88); } while(0);
        list_add(new, head);
}
# 105 "include/linux/netfilter_ipv4/listhelp.h"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int __list_cmp_name(const void *i, const char *name)
{
        return strcmp(name, i+sizeof(struct list_head)) == 0;
}


static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int
list_named_insert(struct list_head *head, void *new)
{
        if (({ const struct list_head *__i, *__j = ((void *)0); do { if (!(down_trylock(&ipt_mutex) != 0)) printk("IP_NF_ASSERT: %s:%s:%u\n", (__func__), "include/linux/netfilter_ipv4/listhelp.h", 115); } while(0); for (__i = ((head))->next, prefetch(__i->next); __i != ((head)); __i = __i->next, prefetch(__i->next)) if (__list_cmp_name((const void *)__i , new + sizeof(struct list_head))) { __j = __i; break; } (void *)__j; }))

                return 0;
        list_prepend(head, new);
        return 1;
}
# 69 "net/ipv4/netfilter/ip_tables.c" 2
# 91 "net/ipv4/netfilter/ip_tables.c"
struct ipt_table_info
{

        unsigned int size;

        unsigned int number;

        unsigned int initial_entries;


        unsigned int hook_entry[5];
        unsigned int underflow[5];


        char entries[0] __attribute__((__aligned__((1 << (7)))));
};

static struct list_head ipt_target = { &(ipt_target), &(ipt_target) };
static struct list_head ipt_match = { &(ipt_match), &(ipt_match) };
static struct list_head ipt_tables = { &(ipt_tables), &(ipt_tables) };
# 126 "net/ipv4/netfilter/ip_tables.c"
static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int
ip_packet_match(const struct iphdr *ip,
                const char *indev,
                const char *outdev,
                const struct ipt_ip *ipinfo,
                int isfrag)
{
        size_t i;
        unsigned long ret;



        if ((((ip->saddr&ipinfo->smsk.s_addr) != ipinfo->src.s_addr) ^ !!(ipinfo->invflags & 0x08))

            || (((ip->daddr&ipinfo->dmsk.s_addr) != ipinfo->dst.s_addr) ^ !!(ipinfo->invflags & 0x10))) {

                ;

                ;




                ;




                return 0;
        }


        for (i = 0, ret = 0; i < 16/sizeof(unsigned long); i++) {
                ret |= (((const unsigned long *)indev)[i]
                        ^ ((const unsigned long *)ipinfo->iniface)[i])
                        & ((const unsigned long *)ipinfo->iniface_mask)[i];
        }

        if (((ret != 0) ^ !!(ipinfo->invflags & 0x01))) {
                ;


                return 0;
        }

        for (i = 0, ret = 0; i < 16/sizeof(unsigned long); i++) {
                ret |= (((const unsigned long *)outdev)[i]
                        ^ ((const unsigned long *)ipinfo->outiface)[i])
                        & ((const unsigned long *)ipinfo->outiface_mask)[i];
        }

        if (((ret != 0) ^ !!(ipinfo->invflags & 0x02))) {
                ;


                return 0;
        }


        if (ipinfo->proto
            && ((ip->protocol != ipinfo->proto) ^ !!(ipinfo->invflags & 0x40))) {
                ;


                return 0;
        }



        if ((((ipinfo->flags&0x01) && !isfrag) ^ !!(ipinfo->invflags & 0x20))) {
                ;

                return 0;
        }

        return 1;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int
ip_checkentry(const struct ipt_ip *ip)
{
        if (ip->flags & ~0x01) {
                ;

                return 0;
        }
        if (ip->invflags & ~0x7F) {
                ;

                return 0;
        }
        return 1;
}

static unsigned int
ipt_error(struct sk_buff **pskb,
          const struct net_device *in,
          const struct net_device *out,
          unsigned int hooknum,
          const void *targinfo,
          void *userinfo)
{
        if (net_ratelimit())
                printk("ip_tables: error: `%s'\n", (char *)targinfo);

        return 0;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline))
int do_match(struct ipt_entry_match *m,
             const struct sk_buff *skb,
             const struct net_device *in,
             const struct net_device *out,
             int offset,
             int *hotdrop)
{

        if (!m->u.kernel.match->match(skb, in, out, m->data, offset, hotdrop))
                return 1;
        else
                return 0;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct ipt_entry *
get_entry(void *base, unsigned int offset)
{
        return (struct ipt_entry *)(base + offset);
}


unsigned int
ipt_do_table(struct sk_buff **pskb,
             unsigned int hook,
             const struct net_device *in,
             const struct net_device *out,
             struct ipt_table *table,
             void *userdata)
{
        static const char nulldevname[16] __attribute__((aligned(sizeof(long))));
        u_int16_t offset;
        struct iphdr *ip;
        u_int16_t datalen;
        int hotdrop = 0;

        unsigned int verdict = 0;
        const char *indev, *outdev;
        void *table_base;
        struct ipt_entry *e, *back;


        ip = (*pskb)->nh.iph;
        datalen = (*pskb)->len - ip->ihl * 4;
        indev = in ? in->name : nulldevname;
        outdev = out ? out->name : nulldevname;






        offset = (__builtin_constant_p((__u16)((ip->frag_off))) ? ({ __u16 __x = (((ip->frag_off))); ((__u16)( (((__u16)(__x) & (__u16)0x00ffU) << 8) | (((__u16)(__x) & (__u16)0xff00U) >> 8) )); }) : __fswab16(((ip->frag_off)))) & 0x1FFF;

        do { do { (current_thread_info()->preempt_count) += (1UL << (0 + 8)); __asm__ __volatile__("": : :"memory"); } while (0); do { do { (current_thread_info()->preempt_count)++; } while (0); __asm__ __volatile__("": : :"memory"); } while (0); _raw_read_lock(&table->lock); } while (0);
        do { if (!(table->valid_hooks & (1 << hook))) printk("IP_NF_ASSERT: %s:%s:%u\n", (__func__), "net/ipv4/netfilter/ip_tables.c", 289); } while(0);
        table_base = (void *)table->private->entries
                + (((((table->private)->size) + (1 << (7))-1) & ~((1 << (7))-1))*((current_thread_info()->cpu)));
        e = get_entry(table_base, table->private->hook_entry[hook]);



        if (((struct ipt_entry *)table_base)->comefrom != 0xdead57ac
            && ((struct ipt_entry *)table_base)->comefrom != 0xeeeeeeec) {
                printk("ASSERT: CPU #%u, %s comefrom(%p) = %X\n",
                       (current_thread_info()->cpu),
                       table->name,
                       &((struct ipt_entry *)table_base)->comefrom,
                       ((struct ipt_entry *)table_base)->comefrom);
        }
        ((struct ipt_entry *)table_base)->comefrom = 0x57acc001;



        back = get_entry(table_base, table->private->underflow[hook]);

        do {
                do { if (!(e)) printk("IP_NF_ASSERT: %s:%s:%u\n", (__func__), "net/ipv4/netfilter/ip_tables.c", 311); } while(0);
                do { if (!(back)) printk("IP_NF_ASSERT: %s:%s:%u\n", (__func__), "net/ipv4/netfilter/ip_tables.c", 312); } while(0);
                (*pskb)->nfcache |= e->nfcache;
                if (ip_packet_match(ip, indev, outdev, &e->ip, offset)) {
                        struct ipt_entry_target *t;

                        if (({ unsigned int __i; int __ret = 0; struct ipt_entry_match *__match; for (__i = sizeof(struct ipt_entry); __i < (e)->target_offset; __i += __match->u.match_size) { __match = (void *)(e) + __i; __ret = do_match(__match , *pskb, in, out, offset, &hotdrop); if (__ret != 0) break; } __ret; }) != 0)


                                goto no_match;

                        do { (e->counters).bcnt += ((__builtin_constant_p((__u16)((ip->tot_len))) ? ({ __u16 __x = (((ip->tot_len))); ((__u16)( (((__u16)(__x) & (__u16)0x00ffU) << 8) | (((__u16)(__x) & (__u16)0xff00U) >> 8) )); }) : __fswab16(((ip->tot_len))))); (e->counters).pcnt += (1); } while(0);

                        t = ipt_get_target(e);
                        do { if (!(t->u.kernel.target)) printk("IP_NF_ASSERT: %s:%s:%u\n", (__func__), "net/ipv4/netfilter/ip_tables.c", 325); } while(0);

                        if (!t->u.kernel.target->target) {
                                int v;

                                v = ((struct ipt_standard_target *)t)->verdict;
                                if (v < 0) {

                                        if (v != (-4 - 1)) {
                                                verdict = (unsigned)(-v) - 1;
                                                break;
                                        }
                                        e = back;
                                        back = get_entry(table_base,
                                                         back->comefrom);
                                        continue;
                                }
                                if (table_base + v
                                    != (void *)e + e->next_offset) {

                                        struct ipt_entry *next
                                                = (void *)e + e->next_offset;
                                        next->comefrom
                                                = (void *)back - table_base;

                                        back = next;
                                }

                                e = get_entry(table_base, v);
                        } else {



                                ((struct ipt_entry *)table_base)->comefrom
                                        = 0xeeeeeeec;

                                verdict = t->u.kernel.target->target(pskb,
                                                                     in, out,
                                                                     hook,
                                                                     t->data,
                                                                     userdata);


                                if (((struct ipt_entry *)table_base)->comefrom
                                    != 0xeeeeeeec
                                    && verdict == 0xFFFFFFFF) {
                                        printk("Target %s reentered!\n",
                                               t->u.kernel.target->name);
                                        verdict = 0;
                                }
                                ((struct ipt_entry *)table_base)->comefrom
                                        = 0x57acc001;


                                ip = (*pskb)->nh.iph;
                                datalen = (*pskb)->len - ip->ihl * 4;

                                if (verdict == 0xFFFFFFFF)
                                        e = (void *)e + e->next_offset;
                                else

                                        break;
                        }
                } else {

                no_match:
                        e = (void *)e + e->next_offset;
                }
        } while (!hotdrop);


        ((struct ipt_entry *)table_base)->comefrom = 0xdead57ac;

        do { asm volatile("lock ; incl %0" :"=m" ((&table->lock)->lock) : : "memory"); do { do { __asm__ __volatile__("": : :"memory"); do { (current_thread_info()->preempt_count)--; } while (0); } while (0); do { if (__builtin_expect(!!(test_thread_flag(3)), 0)) preempt_schedule(); } while (0); } while (0); local_bh_enable(); } while (0);




        if (hotdrop)
                return 0;
        else return verdict;

}


static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) void *
find_inlist_lock_noload(struct list_head *head,
                        const char *name,
                        int *error,
                        struct semaphore *mutex)
{
        void *ret;
# 425 "net/ipv4/netfilter/ip_tables.c"
        *error = down_interruptible(mutex);
        if (*error != 0)
                return ((void *)0);

        ret = ({ const struct list_head *__i, *__j = ((void *)0); do { if (!(down_trylock(&ipt_mutex) != 0)) printk("IP_NF_ASSERT: %s:%s:%u\n", (__func__), "net/ipv4/netfilter/ip_tables.c", 429); } while(0); for (__i = ((head))->next, prefetch(__i->next); __i != ((head)); __i = __i->next, prefetch(__i->next)) if (__list_cmp_name((const void *)__i , name)) { __j = __i; break; } (void *)__j; });
        if (!ret) {
                *error = -2;
                up(mutex);
        }
        return ret;
}




static void *
find_inlist_lock(struct list_head *head,
                 const char *name,
                 const char *prefix,
                 int *error,
                 struct semaphore *mutex)
{
        void *ret;

        ret = find_inlist_lock_noload(head, name, error, mutex);
        if (!ret) {
                ;
                request_module("%s%s", prefix, name);
                ret = find_inlist_lock_noload(head, name, error, mutex);
        }

        return ret;
}


static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct ipt_table *
ipt_find_table_lock(const char *name, int *error, struct semaphore *mutex)
{
        return find_inlist_lock(&ipt_tables, name, "iptable_", error, mutex);
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) struct ipt_match *
find_match_lock(const char *name, int *error, struct semaphore *mutex)
{
        return find_inlist_lock(&ipt_match, name, "ipt_", error, mutex);
}

struct ipt_target *
ipt_find_target_lock(const char *name, int *error, struct semaphore *mutex)
{
        return find_inlist_lock(&ipt_target, name, "ipt_", error, mutex);
}


static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int
unconditional(const struct ipt_ip *ip)
{
        unsigned int i;

        for (i = 0; i < sizeof(*ip)/sizeof(__u32); i++)
                if (((__u32 *)ip)[i])
                        return 0;

        return 1;
}



static int
mark_source_chains(struct ipt_table_info *newinfo, unsigned int valid_hooks)
{
        unsigned int hook;



        for (hook = 0; hook < 5; hook++) {
                unsigned int pos = newinfo->hook_entry[hook];
                struct ipt_entry *e
                        = (struct ipt_entry *)(newinfo->entries + pos);

                if (!(valid_hooks & (1 << hook)))
                        continue;


                e->counters.pcnt = pos;

                for (;;) {
                        struct ipt_standard_target *t
                                = (void *)ipt_get_target(e);

                        if (e->comefrom & (1 << 5)) {
                                printk("iptables: loop hook %u pos %u %08X.\n",
                                       hook, pos, e->comefrom);
                                return 0;
                        }
                        e->comefrom
                                |= ((1 << hook) | (1 << 5));


                        if (e->target_offset == sizeof(struct ipt_entry)
                            && (strcmp(t->target.u.user.name,
                                       "") == 0)
                            && t->verdict < 0
                            && unconditional(&e->ip)) {
                                unsigned int oldpos, size;



                                do {
                                        e->comefrom ^= (1<<5);
# 544 "net/ipv4/netfilter/ip_tables.c"
                                        oldpos = pos;
                                        pos = e->counters.pcnt;
                                        e->counters.pcnt = 0;


                                        if (pos == oldpos)
                                                goto next;

                                        e = (struct ipt_entry *)
                                                (newinfo->entries + pos);
                                } while (oldpos == pos + e->next_offset);


                                size = e->next_offset;
                                e = (struct ipt_entry *)
                                        (newinfo->entries + pos + size);
                                e->counters.pcnt = pos;
                                pos += size;
                        } else {
                                int newpos = t->verdict;

                                if (strcmp(t->target.u.user.name,
                                           "") == 0
                                    && newpos >= 0) {

                                        ;

                                } else {

                                        newpos = pos + e->next_offset;
                                }
                                e = (struct ipt_entry *)
                                        (newinfo->entries + newpos);
                                e->counters.pcnt = pos;
                                pos = newpos;
                        }
                }
                next:
                ;
        }
        return 1;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int
cleanup_match(struct ipt_entry_match *m, unsigned int *i)
{
        if (i && (*i)-- == 0)
                return 1;

        if (m->u.kernel.match->destroy)
                m->u.kernel.match->destroy(m->data,
                                           m->u.match_size - sizeof(*m));
        module_put(m->u.kernel.match->me);
        return 0;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int
standard_check(const struct ipt_entry_target *t,
               unsigned int max_offset)
{
        struct ipt_standard_target *targ = (void *)t;


        if (t->u.target_size
            != (((sizeof(struct ipt_standard_target)) + (__alignof__(struct ipt_entry)-1)) & ~(__alignof__(struct ipt_entry)-1))) {
                ;


                return 0;
        }

        if (targ->verdict >= 0
            && targ->verdict > max_offset - sizeof(struct ipt_entry)) {
                ;

                return 0;
        }

        if (targ->verdict < -4 - 1) {
                ;

                return 0;
        }
        return 1;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int
check_match(struct ipt_entry_match *m,
            const char *name,
            const struct ipt_ip *ip,
            unsigned int hookmask,
            unsigned int *i)
{
        int ret;
        struct ipt_match *match;

        match = find_match_lock(m->u.user.name, &ret, &ipt_mutex);
        if (!match) {
                ;
                return ret;
        }
        if (!try_module_get(match->me)) {
                up(&ipt_mutex);
                return -2;
        }
        m->u.kernel.match = match;
        up(&ipt_mutex);

        if (m->u.kernel.match->checkentry
            && !m->u.kernel.match->checkentry(name, ip, m->data,
                                              m->u.match_size - sizeof(*m),
                                              hookmask)) {
                module_put(m->u.kernel.match->me);
                ;

                return -22;
        }

        (*i)++;
        return 0;
}

static struct ipt_target ipt_standard_target;

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int
check_entry(struct ipt_entry *e, const char *name, unsigned int size,
            unsigned int *i)
{
        struct ipt_entry_target *t;
        struct ipt_target *target;
        int ret;
        unsigned int j;

        if (!ip_checkentry(&e->ip)) {
                ;
                return -22;
        }

        j = 0;
        ret = ({ unsigned int __i; int __ret = 0; struct ipt_entry_match *__match; for (__i = sizeof(struct ipt_entry); __i < (e)->target_offset; __i += __match->u.match_size) { __match = (void *)(e) + __i; __ret = check_match(__match , name, &e->ip, e->comefrom, &j); if (__ret != 0) break; } __ret; });
        if (ret != 0)
                goto cleanup_matches;

        t = ipt_get_target(e);
        target = ipt_find_target_lock(t->u.user.name, &ret, &ipt_mutex);
        if (!target) {
                ;
                goto cleanup_matches;
        }
        if (!try_module_get(target->me)) {
                up(&ipt_mutex);
                ret = -2;
                goto cleanup_matches;
        }
        t->u.kernel.target = target;
        up(&ipt_mutex);

        if (t->u.kernel.target == &ipt_standard_target) {
                if (!standard_check(t, size)) {
                        ret = -22;
                        goto cleanup_matches;
                }
        } else if (t->u.kernel.target->checkentry
                   && !t->u.kernel.target->checkentry(name, e, t->data,
                                                      t->u.target_size
                                                      - sizeof(*t),
                                                      e->comefrom)) {
                module_put(t->u.kernel.target->me);
                ;

                ret = -22;
                goto cleanup_matches;
        }

        (*i)++;
        return 0;

 cleanup_matches:
        ({ unsigned int __i; int __ret = 0; struct ipt_entry_match *__match; for (__i = sizeof(struct ipt_entry); __i < (e)->target_offset; __i += __match->u.match_size) { __match = (void *)(e) + __i; __ret = cleanup_match(__match , &j); if (__ret != 0) break; } __ret; });
        return ret;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int
check_entry_size_and_hooks(struct ipt_entry *e,
                           struct ipt_table_info *newinfo,
                           unsigned char *base,
                           unsigned char *limit,
                           const unsigned int *hook_entries,
                           const unsigned int *underflows,
                           unsigned int *i)
{
        unsigned int h;

        if ((unsigned long)e % __alignof__(struct ipt_entry) != 0
            || (unsigned char *)e + sizeof(struct ipt_entry) >= limit) {
                ;
                return -22;
        }

        if (e->next_offset
            < sizeof(struct ipt_entry) + sizeof(struct ipt_entry_target)) {
                ;

                return -22;
        }


        for (h = 0; h < 5; h++) {
                if ((unsigned char *)e - base == hook_entries[h])
                        newinfo->hook_entry[h] = hook_entries[h];
                if ((unsigned char *)e - base == underflows[h])
                        newinfo->underflow[h] = underflows[h];
        }





        e->counters = ((struct ipt_counters) { 0, 0 });
        e->comefrom = 0;

        (*i)++;
        return 0;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int
cleanup_entry(struct ipt_entry *e, unsigned int *i)
{
        struct ipt_entry_target *t;

        if (i && (*i)-- == 0)
                return 1;


        ({ unsigned int __i; int __ret = 0; struct ipt_entry_match *__match; for (__i = sizeof(struct ipt_entry); __i < (e)->target_offset; __i += __match->u.match_size) { __match = (void *)(e) + __i; __ret = cleanup_match(__match , ((void *)0)); if (__ret != 0) break; } __ret; });
        t = ipt_get_target(e);
        if (t->u.kernel.target->destroy)
                t->u.kernel.target->destroy(t->data,
                                            t->u.target_size - sizeof(*t));
        module_put(t->u.kernel.target->me);
        return 0;
}



static int
translate_table(const char *name,
                unsigned int valid_hooks,
                struct ipt_table_info *newinfo,
                unsigned int size,
                unsigned int number,
                const unsigned int *hook_entries,
                const unsigned int *underflows)
{
        unsigned int i;
        int ret;

        newinfo->size = size;
        newinfo->number = number;


        for (i = 0; i < 5; i++) {
                newinfo->hook_entry[i] = 0xFFFFFFFF;
                newinfo->underflow[i] = 0xFFFFFFFF;
        }

        ;
        i = 0;

        ret = ({ unsigned int __i; int __ret = 0; struct ipt_entry *__entry; for (__i = 0; __i < (newinfo->size); __i += __entry->next_offset) { __entry = (void *)(newinfo->entries) + __i; __ret = check_entry_size_and_hooks(__entry , newinfo, newinfo->entries, newinfo->entries + size, hook_entries, underflows, &i); if (__ret != 0) break; } __ret; });





        if (ret != 0)
                return ret;

        if (i != number) {
                ;

                return -22;
        }


        for (i = 0; i < 5; i++) {

                if (!(valid_hooks & (1 << i)))
                        continue;
                if (newinfo->hook_entry[i] == 0xFFFFFFFF) {
                        ;

                        return -22;
                }
                if (newinfo->underflow[i] == 0xFFFFFFFF) {
                        ;

                        return -22;
                }
        }

        if (!mark_source_chains(newinfo, valid_hooks))
                return -40;


        i = 0;
        ret = ({ unsigned int __i; int __ret = 0; struct ipt_entry *__entry; for (__i = 0; __i < (newinfo->size); __i += __entry->next_offset) { __entry = (void *)(newinfo->entries) + __i; __ret = check_entry(__entry , name, size, &i); if (__ret != 0) break; } __ret; });


        if (ret != 0) {
                ({ unsigned int __i; int __ret = 0; struct ipt_entry *__entry; for (__i = 0; __i < (newinfo->size); __i += __entry->next_offset) { __entry = (void *)(newinfo->entries) + __i; __ret = cleanup_entry(__entry , &i); if (__ret != 0) break; } __ret; });

                return ret;
        }


        for (i = 1; i < 8; i++) {
                (__builtin_constant_p((((newinfo->size) + (1 << (7))-1) & ~((1 << (7))-1))) ? __constant_memcpy((newinfo->entries + (((newinfo->size) + (1 << (7))-1) & ~((1 << (7))-1))*i),(newinfo->entries),((((newinfo->size) + (1 << (7))-1) & ~((1 << (7))-1)))) : __memcpy((newinfo->entries + (((newinfo->size) + (1 << (7))-1) & ~((1 << (7))-1))*i),(newinfo->entries),((((newinfo->size) + (1 << (7))-1) & ~((1 << (7))-1)))));


        }

        return ret;
}

static struct ipt_table_info *
replace_table(struct ipt_table *table,
              unsigned int num_counters,
              struct ipt_table_info *newinfo,
              int *error)
{
        struct ipt_table_info *oldinfo;


        {
                struct ipt_entry *table_base;
                unsigned int i;

                for (i = 0; i < 8; i++) {
                        table_base =
                                (void *)newinfo->entries
                                + (((((newinfo)->size) + (1 << (7))-1) & ~((1 << (7))-1))*(i));

                        table_base->comefrom = 0xdead57ac;
                }
        }



        do { do { (current_thread_info()->preempt_count) += (1UL << (0 + 8)); __asm__ __volatile__("": : :"memory"); } while (0); do { do { (current_thread_info()->preempt_count)++; } while (0); __asm__ __volatile__("": : :"memory"); } while (0); _raw_write_lock(&table->lock); } while (0);

        if (num_counters != table->private->number) {
                ;

                do { asm volatile("lock ; addl $" "0x01000000" ",%0":"=m" ((&table->lock)->lock) : : "memory"); do { do { __asm__ __volatile__("": : :"memory"); do { (current_thread_info()->preempt_count)--; } while (0); } while (0); do { if (__builtin_expect(!!(test_thread_flag(3)), 0)) preempt_schedule(); } while (0); } while (0); local_bh_enable(); } while (0);
                *error = -11;
                return ((void *)0);
        }
        oldinfo = table->private;
        table->private = newinfo;
        newinfo->initial_entries = oldinfo->initial_entries;
        do { asm volatile("lock ; addl $" "0x01000000" ",%0":"=m" ((&table->lock)->lock) : : "memory"); do { do { __asm__ __volatile__("": : :"memory"); do { (current_thread_info()->preempt_count)--; } while (0); } while (0); do { if (__builtin_expect(!!(test_thread_flag(3)), 0)) preempt_schedule(); } while (0); } while (0); local_bh_enable(); } while (0);

        return oldinfo;
}


static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int
add_entry_to_counter(const struct ipt_entry *e,
                     struct ipt_counters total[],
                     unsigned int *i)
{
        do { (total[*i]).bcnt += (e->counters.bcnt); (total[*i]).pcnt += (e->counters.pcnt); } while(0);

        (*i)++;
        return 0;
}

static void
get_counters(const struct ipt_table_info *t,
             struct ipt_counters counters[])
{
        unsigned int cpu;
        unsigned int i;

        for (cpu = 0; cpu < 8; cpu++) {
                i = 0;
                ({ unsigned int __i; int __ret = 0; struct ipt_entry *__entry; for (__i = 0; __i < (t->size); __i += __entry->next_offset) { __entry = (void *)(t->entries + (((((t)->size) + (1 << (7))-1) & ~((1 << (7))-1))*(cpu))) + __i; __ret = add_entry_to_counter(__entry , counters, &i); if (__ret != 0) break; } __ret; });




        }
}

static int
copy_entries_to_user(unsigned int total_size,
                     struct ipt_table *table,
                     void *userptr)
{
        unsigned int off, num, countersize;
        struct ipt_entry *e;
        struct ipt_counters *counters;
        int ret = 0;




        countersize = sizeof(struct ipt_counters) * table->private->number;
        counters = vmalloc(countersize);

        if (counters == ((void *)0))
                return -12;


        (__builtin_constant_p(0) ? (__builtin_constant_p((countersize)) ? __constant_c_and_count_memset(((counters)),((0x01010101UL*(unsigned char)(0))),((countersize))) : __constant_c_memset(((counters)),((0x01010101UL*(unsigned char)(0))),((countersize)))) : (__builtin_constant_p((countersize)) ? __memset_generic((((counters))),(((0))),(((countersize)))) : __memset_generic(((counters)),((0)),((countersize)))));
        do { do { (current_thread_info()->preempt_count) += (1UL << (0 + 8)); __asm__ __volatile__("": : :"memory"); } while (0); do { do { (current_thread_info()->preempt_count)++; } while (0); __asm__ __volatile__("": : :"memory"); } while (0); _raw_write_lock(&table->lock); } while (0);
        get_counters(table->private, counters);
        do { asm volatile("lock ; addl $" "0x01000000" ",%0":"=m" ((&table->lock)->lock) : : "memory"); do { do { __asm__ __volatile__("": : :"memory"); do { (current_thread_info()->preempt_count)--; } while (0); } while (0); do { if (__builtin_expect(!!(test_thread_flag(3)), 0)) preempt_schedule(); } while (0); } while (0); local_bh_enable(); } while (0);


        if (copy_to_user(userptr, table->private->entries, total_size) != 0) {
                ret = -14;
                goto free_counters;
        }



        for (off = 0, num = 0; off < total_size; off += e->next_offset, num++){
                unsigned int i;
                struct ipt_entry_match *m;
                struct ipt_entry_target *t;

                e = (struct ipt_entry *)(table->private->entries + off);
                if (copy_to_user(userptr + off
                                 + ((size_t) &((struct ipt_entry *)0)->counters),
                                 &counters[num],
                                 sizeof(counters[num])) != 0) {
                        ret = -14;
                        goto free_counters;
                }

                for (i = sizeof(struct ipt_entry);
                     i < e->target_offset;
                     i += m->u.match_size) {
                        m = (void *)e + i;

                        if (copy_to_user(userptr + off + i
                                         + ((size_t) &((struct ipt_entry_match *)0)->u.user.name),

                                         m->u.kernel.match->name,
                                         strlen(m->u.kernel.match->name)+1)
                            != 0) {
                                ret = -14;
                                goto free_counters;
                        }
                }

                t = ipt_get_target(e);
                if (copy_to_user(userptr + off + e->target_offset
                                 + ((size_t) &((struct ipt_entry_target *)0)->u.user.name),

                                 t->u.kernel.target->name,
                                 strlen(t->u.kernel.target->name)+1) != 0) {
                        ret = -14;
                        goto free_counters;
                }
        }

 free_counters:
        vfree(counters);
        return ret;
}

static int
get_entries(const struct ipt_get_entries *entries,
            struct ipt_get_entries *uptr)
{
        int ret;
        struct ipt_table *t;

        t = ipt_find_table_lock(entries->name, &ret, &ipt_mutex);
        if (t) {
                ;

                if (entries->size == t->private->size)
                        ret = copy_entries_to_user(t->private->size,
                                                   t, uptr->entrytable);
                else {
                        ;


                        ret = -22;
                }
                up(&ipt_mutex);
        } else
                ;


        return ret;
}

static int
do_replace(void *user, unsigned int len)
{
        int ret;
        struct ipt_replace tmp;
        struct ipt_table *t;
        struct ipt_table_info *newinfo, *oldinfo;
        struct ipt_counters *counters;

        if (copy_from_user(&tmp, user, sizeof(tmp)) != 0)
                return -14;


        if (len != sizeof(tmp) + tmp.size)
                return -92;


        if (((((tmp.size) + (1 << (7))-1) & ~((1 << (7))-1)) >> 12) + 2 > num_physpages)
                return -12;

        newinfo = vmalloc(sizeof(struct ipt_table_info)
                          + (((tmp.size) + (1 << (7))-1) & ~((1 << (7))-1)) * 8);
        if (!newinfo)
                return -12;

        if (copy_from_user(newinfo->entries, user + sizeof(tmp),
                           tmp.size) != 0) {
                ret = -14;
                goto free_newinfo;
        }

        counters = vmalloc(tmp.num_counters * sizeof(struct ipt_counters));
        if (!counters) {
                ret = -12;
                goto free_newinfo;
        }
        (__builtin_constant_p(0) ? (__builtin_constant_p((tmp.num_counters * sizeof(struct ipt_counters))) ? __constant_c_and_count_memset(((counters)),((0x01010101UL*(unsigned char)(0))),((tmp.num_counters * sizeof(struct ipt_counters)))) : __constant_c_memset(((counters)),((0x01010101UL*(unsigned char)(0))),((tmp.num_counters * sizeof(struct ipt_counters))))) : (__builtin_constant_p((tmp.num_counters * sizeof(struct ipt_counters))) ? __memset_generic((((counters))),(((0))),(((tmp.num_counters * sizeof(struct ipt_counters))))) : __memset_generic(((counters)),((0)),((tmp.num_counters * sizeof(struct ipt_counters))))));

        ret = translate_table(tmp.name, tmp.valid_hooks,
                              newinfo, tmp.size, tmp.num_entries,
                              tmp.hook_entry, tmp.underflow);
        if (ret != 0)
                goto free_newinfo_counters;

        ;

        t = ipt_find_table_lock(tmp.name, &ret, &ipt_mutex);
        if (!t)
                goto free_newinfo_counters_untrans;


        if (tmp.valid_hooks != t->valid_hooks) {
                ;

                ret = -22;
                goto free_newinfo_counters_untrans_unlock;
        }


        if (!try_module_get(t->me)) {
                ret = -16;
                goto free_newinfo_counters_untrans_unlock;
        }


        oldinfo = replace_table(t, tmp.num_counters, newinfo, &ret);
        if (!oldinfo)
                goto put_module;


        ;

        if ((oldinfo->number > oldinfo->initial_entries) ||
            (newinfo->number <= oldinfo->initial_entries))
                module_put(t->me);
        if ((oldinfo->number > oldinfo->initial_entries) &&
            (newinfo->number <= oldinfo->initial_entries))
                module_put(t->me);


        get_counters(oldinfo, counters);

        ({ unsigned int __i; int __ret = 0; struct ipt_entry *__entry; for (__i = 0; __i < (oldinfo->size); __i += __entry->next_offset) { __entry = (void *)(oldinfo->entries) + __i; __ret = cleanup_entry(__entry ,((void *)0)); if (__ret != 0) break; } __ret; });
        vfree(oldinfo);

        copy_to_user(tmp.counters, counters,
                     sizeof(struct ipt_counters) * tmp.num_counters);
        vfree(counters);
        up(&ipt_mutex);
        return 0;

 put_module:
        module_put(t->me);
 free_newinfo_counters_untrans_unlock:
        up(&ipt_mutex);
 free_newinfo_counters_untrans:
        ({ unsigned int __i; int __ret = 0; struct ipt_entry *__entry; for (__i = 0; __i < (newinfo->size); __i += __entry->next_offset) { __entry = (void *)(newinfo->entries) + __i; __ret = cleanup_entry(__entry ,((void *)0)); if (__ret != 0) break; } __ret; });
 free_newinfo_counters:
        vfree(counters);
 free_newinfo:
        vfree(newinfo);
        return ret;
}



static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int
add_counter_to_entry(struct ipt_entry *e,
                     const struct ipt_counters addme[],
                     unsigned int *i)
{
# 1166 "net/ipv4/netfilter/ip_tables.c"
        do { (e->counters).bcnt += (addme[*i].bcnt); (e->counters).pcnt += (addme[*i].pcnt); } while(0);

        (*i)++;
        return 0;
}

static int
do_add_counters(void *user, unsigned int len)
{
        unsigned int i;
        struct ipt_counters_info tmp, *paddc;
        struct ipt_table *t;
        int ret;

        if (copy_from_user(&tmp, user, sizeof(tmp)) != 0)
                return -14;

        if (len != sizeof(tmp) + tmp.num_counters*sizeof(struct ipt_counters))
                return -22;

        paddc = vmalloc(len);
        if (!paddc)
                return -12;

        if (copy_from_user(paddc, user, len) != 0) {
                ret = -14;
                goto free;
        }

        t = ipt_find_table_lock(tmp.name, &ret, &ipt_mutex);
        if (!t)
                goto free;

        do { do { (current_thread_info()->preempt_count) += (1UL << (0 + 8)); __asm__ __volatile__("": : :"memory"); } while (0); do { do { (current_thread_info()->preempt_count)++; } while (0); __asm__ __volatile__("": : :"memory"); } while (0); _raw_write_lock(&t->lock); } while (0);
        if (t->private->number != paddc->num_counters) {
                ret = -22;
                goto unlock_up_free;
        }

        i = 0;
        ({ unsigned int __i; int __ret = 0; struct ipt_entry *__entry; for (__i = 0; __i < (t->private->size); __i += __entry->next_offset) { __entry = (void *)(t->private->entries) + __i; __ret = add_counter_to_entry(__entry , paddc->counters, &i); if (__ret != 0) break; } __ret; });




 unlock_up_free:
        do { asm volatile("lock ; addl $" "0x01000000" ",%0":"=m" ((&t->lock)->lock) : : "memory"); do { do { __asm__ __volatile__("": : :"memory"); do { (current_thread_info()->preempt_count)--; } while (0); } while (0); do { if (__builtin_expect(!!(test_thread_flag(3)), 0)) preempt_schedule(); } while (0); } while (0); local_bh_enable(); } while (0);
        up(&ipt_mutex);
 free:
        vfree(paddc);

        return ret;
}

static int
do_ipt_set_ctl(struct sock *sk, int cmd, void *user, unsigned int len)
{
        int ret;

        if (!capable(12))
                return -1;

        switch (cmd) {
        case (64):
                ret = do_replace(user, len);
                break;

        case (64 + 1):
                ret = do_add_counters(user, len);
                break;

        default:
                ;
                ret = -22;
        }

        return ret;
}

static int
do_ipt_get_ctl(struct sock *sk, int cmd, void *user, int *len)
{
        int ret;

        if (!capable(12))
                return -1;

        switch (cmd) {
        case (64): {
                char name[32];
                struct ipt_table *t;

                if (*len != sizeof(struct ipt_getinfo)) {
                        ;

                        ret = -22;
                        break;
                }

                if (copy_from_user(name, user, sizeof(name)) != 0) {
                        ret = -14;
                        break;
                }
                name[32 -1] = '\0';
                t = ipt_find_table_lock(name, &ret, &ipt_mutex);
                if (t) {
                        struct ipt_getinfo info;

                        info.valid_hooks = t->valid_hooks;
                        (__builtin_constant_p(sizeof(info.hook_entry)) ? __constant_memcpy((info.hook_entry),(t->private->hook_entry),(sizeof(info.hook_entry))) : __memcpy((info.hook_entry),(t->private->hook_entry),(sizeof(info.hook_entry))));

                        (__builtin_constant_p(sizeof(info.underflow)) ? __constant_memcpy((info.underflow),(t->private->underflow),(sizeof(info.underflow))) : __memcpy((info.underflow),(t->private->underflow),(sizeof(info.underflow))));

                        info.num_entries = t->private->number;
                        info.size = t->private->size;
                        strcpy(info.name, name);

                        if (copy_to_user(user, &info, *len) != 0)
                                ret = -14;
                        else
                                ret = 0;

                        up(&ipt_mutex);
                }
        }
        break;

        case (64 + 1): {
                struct ipt_get_entries get;

                if (*len < sizeof(get)) {
                        ;
                        ret = -22;
                } else if (copy_from_user(&get, user, sizeof(get)) != 0) {
                        ret = -14;
                } else if (*len != sizeof(struct ipt_get_entries) + get.size) {
                        ;

                        ret = -22;
                } else
                        ret = get_entries(&get, user);
                break;
        }

        default:
                ;
                ret = -22;
        }

        return ret;
}


int
ipt_register_target(struct ipt_target *target)
{
        int ret;

        ret = down_interruptible(&ipt_mutex);
        if (ret != 0)
                return ret;

        if (!list_named_insert(&ipt_target, target)) {
                ;

                ret = -22;
        }
        up(&ipt_mutex);
        return ret;
}

void
ipt_unregister_target(struct ipt_target *target)
{
        down(&ipt_mutex);
        do { do { if (!(down_trylock(&ipt_mutex) != 0)) printk("IP_NF_ASSERT: %s:%s:%u\n", (__func__), "net/ipv4/netfilter/ip_tables.c", 1341); } while(0); if (!list_inlist(&ipt_target, target)) printk("LIST_DELETE: %s:%u `%s'(%p) not in %s.\n", "net/ipv4/netfilter/ip_tables.c", 1341, "target", target, "&ipt_target"); else list_del((struct list_head *)target); } while(0);
        up(&ipt_mutex);
}

int
ipt_register_match(struct ipt_match *match)
{
        int ret;

        ret = down_interruptible(&ipt_mutex);
        if (ret != 0)
                return ret;

        if (!list_named_insert(&ipt_match, match)) {
                ;

                ret = -22;
        }
        up(&ipt_mutex);

        return ret;
}

void
ipt_unregister_match(struct ipt_match *match)
{
        down(&ipt_mutex);
        do { do { if (!(down_trylock(&ipt_mutex) != 0)) printk("IP_NF_ASSERT: %s:%s:%u\n", (__func__), "net/ipv4/netfilter/ip_tables.c", 1368); } while(0); if (!list_inlist(&ipt_match, match)) printk("LIST_DELETE: %s:%u `%s'(%p) not in %s.\n", "net/ipv4/netfilter/ip_tables.c", 1368, "match", match, "&ipt_match"); else list_del((struct list_head *)match); } while(0);
        up(&ipt_mutex);
}

int ipt_register_table(struct ipt_table *table)
{
        int ret;
        struct ipt_table_info *newinfo;
        static struct ipt_table_info bootstrap
                = { 0, 0, 0, { 0 }, { 0 }, { } };

        newinfo = vmalloc(sizeof(struct ipt_table_info)
                          + (((table->table->size) + (1 << (7))-1) & ~((1 << (7))-1)) * 8);
        if (!newinfo)
                return -12;

        (__builtin_constant_p(table->table->size) ? __constant_memcpy((newinfo->entries),(table->table->entries),(table->table->size)) : __memcpy((newinfo->entries),(table->table->entries),(table->table->size)));

        ret = translate_table(table->name, table->valid_hooks,
                              newinfo, table->table->size,
                              table->table->num_entries,
                              table->table->hook_entry,
                              table->table->underflow);
        if (ret != 0) {
                vfree(newinfo);
                return ret;
        }

        ret = down_interruptible(&ipt_mutex);
        if (ret != 0) {
                vfree(newinfo);
                return ret;
        }


        if (({ const struct list_head *__i, *__j = ((void *)0); do { if (!(down_trylock(&ipt_mutex) != 0)) printk("IP_NF_ASSERT: %s:%s:%u\n", (__func__), "net/ipv4/netfilter/ip_tables.c", 1403); } while(0); for (__i = ((&ipt_tables))->next, prefetch(__i->next); __i != ((&ipt_tables)); __i = __i->next, prefetch(__i->next)) if (__list_cmp_name((const void *)__i , table->name)) { __j = __i; break; } (void *)__j; })) {
                ret = -17;
                goto free_unlock;
        }


        table->private = &bootstrap;
        if (!replace_table(table, 0, newinfo, &ret))
                goto free_unlock;

        ;



        table->private->initial_entries = table->private->number;

        table->lock = (rwlock_t) { 0x01000000 , 0xdeaf1eed };
        list_prepend(&ipt_tables, table);

 unlock:
        up(&ipt_mutex);
        return ret;

 free_unlock:
        vfree(newinfo);
        goto unlock;
}

void ipt_unregister_table(struct ipt_table *table)
{
        down(&ipt_mutex);
        do { do { if (!(down_trylock(&ipt_mutex) != 0)) printk("IP_NF_ASSERT: %s:%s:%u\n", (__func__), "net/ipv4/netfilter/ip_tables.c", 1434); } while(0); if (!list_inlist(&ipt_tables, table)) printk("LIST_DELETE: %s:%u `%s'(%p) not in %s.\n", "net/ipv4/netfilter/ip_tables.c", 1434, "table", table, "&ipt_tables"); else list_del((struct list_head *)table); } while(0);
        up(&ipt_mutex);


        ({ unsigned int __i; int __ret = 0; struct ipt_entry *__entry; for (__i = 0; __i < (table->private->size); __i += __entry->next_offset) { __entry = (void *)(table->private->entries) + __i; __ret = cleanup_entry(__entry , ((void *)0)); if (__ret != 0) break; } __ret; });

        vfree(table->private);
}


static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int
port_match(u_int16_t min, u_int16_t max, u_int16_t port, int invert)
{
        int ret;

        ret = (port >= min && port <= max) ^ invert;
        return ret;
}

static int
tcp_find_option(u_int8_t option,
                const struct sk_buff *skb,
                unsigned int optlen,
                int invert,
                int *hotdrop)
{

        u_int8_t opt[60 - sizeof(struct tcphdr)];
        unsigned int i;

        ;

        if (skb_copy_bits(skb, skb->nh.iph->ihl*4 + sizeof(struct tcphdr),
                          opt, optlen) < 0) {
                *hotdrop = 1;
                return 0;
        }

        for (i = 0; i < optlen; ) {
                if (opt[i] == option) return !invert;
                if (opt[i] < 2) i++;
                else i += opt[i+1]?:1;
        }

        return invert;
}

static int
tcp_match(const struct sk_buff *skb,
          const struct net_device *in,
          const struct net_device *out,
          const void *matchinfo,
          int offset,
          int *hotdrop)
{
        struct tcphdr tcph;
        const struct ipt_tcp *tcpinfo = matchinfo;

        if (offset) {






                if (offset == 1) {
                        ;
                        *hotdrop = 1;
                }

                return 0;
        }



        if (skb_copy_bits(skb, skb->nh.iph->ihl*4, &tcph, sizeof(tcph)) < 0) {


                ;
                *hotdrop = 1;
                return 0;
        }

        if (!port_match(tcpinfo->spts[0], tcpinfo->spts[1],
                        (__builtin_constant_p((__u16)((tcph.source))) ? ({ __u16 __x = (((tcph.source))); ((__u16)( (((__u16)(__x) & (__u16)0x00ffU) << 8) | (((__u16)(__x) & (__u16)0xff00U) >> 8) )); }) : __fswab16(((tcph.source)))),
                        !!(tcpinfo->invflags & 0x01)))
                return 0;
        if (!port_match(tcpinfo->dpts[0], tcpinfo->dpts[1],
                        (__builtin_constant_p((__u16)((tcph.dest))) ? ({ __u16 __x = (((tcph.dest))); ((__u16)( (((__u16)(__x) & (__u16)0x00ffU) << 8) | (((__u16)(__x) & (__u16)0xff00U) >> 8) )); }) : __fswab16(((tcph.dest)))),
                        !!(tcpinfo->invflags & 0x02)))
                return 0;
        if (!(((((unsigned char *)&tcph)[13] & tcpinfo->flg_mask) == tcpinfo->flg_cmp) ^ !!(tcpinfo->invflags & 0x04)))


                return 0;
        if (tcpinfo->option) {
                if (tcph.doff * 4 < sizeof(tcph)) {
                        *hotdrop = 1;
                        return 0;
                }
                if (!tcp_find_option(tcpinfo->option, skb, tcph.doff*4 - sizeof(tcph),
                                     tcpinfo->invflags & 0x08,
                                     hotdrop))
                        return 0;
        }
        return 1;
}


static int
tcp_checkentry(const char *tablename,
               const struct ipt_ip *ip,
               void *matchinfo,
               unsigned int matchsize,
               unsigned int hook_mask)
{
        const struct ipt_tcp *tcpinfo = matchinfo;


        return ip->proto == IPPROTO_TCP
                && !(ip->invflags & 0x40)
                && matchsize == (((sizeof(struct ipt_tcp)) + (__alignof__(struct ipt_entry)-1)) & ~(__alignof__(struct ipt_entry)-1))
                && !(tcpinfo->invflags & ~0x0F);
}

static int
udp_match(const struct sk_buff *skb,
          const struct net_device *in,
          const struct net_device *out,
          const void *matchinfo,
          int offset,
          int *hotdrop)
{
        struct udphdr udph;
        const struct ipt_udp *udpinfo = matchinfo;


        if (offset)
                return 0;

        if (skb_copy_bits(skb, skb->nh.iph->ihl*4, &udph, sizeof(udph)) < 0) {


                ;
                *hotdrop = 1;
                return 0;
        }

        return port_match(udpinfo->spts[0], udpinfo->spts[1],
                          (__builtin_constant_p((__u16)((udph.source))) ? ({ __u16 __x = (((udph.source))); ((__u16)( (((__u16)(__x) & (__u16)0x00ffU) << 8) | (((__u16)(__x) & (__u16)0xff00U) >> 8) )); }) : __fswab16(((udph.source)))),
                          !!(udpinfo->invflags & 0x01))
                && port_match(udpinfo->dpts[0], udpinfo->dpts[1],
                              (__builtin_constant_p((__u16)((udph.dest))) ? ({ __u16 __x = (((udph.dest))); ((__u16)( (((__u16)(__x) & (__u16)0x00ffU) << 8) | (((__u16)(__x) & (__u16)0xff00U) >> 8) )); }) : __fswab16(((udph.dest)))),
                              !!(udpinfo->invflags & 0x02));
}


static int
udp_checkentry(const char *tablename,
               const struct ipt_ip *ip,
               void *matchinfo,
               unsigned int matchinfosize,
               unsigned int hook_mask)
{
        const struct ipt_udp *udpinfo = matchinfo;


        if (ip->proto != IPPROTO_UDP || (ip->invflags & 0x40)) {
                ;

                return 0;
        }
        if (matchinfosize != (((sizeof(struct ipt_udp)) + (__alignof__(struct ipt_entry)-1)) & ~(__alignof__(struct ipt_entry)-1))) {
                ;

                return 0;
        }
        if (udpinfo->invflags & ~0x03) {
                ;

                return 0;
        }

        return 1;
}


static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int
icmp_type_code_match(u_int8_t test_type, u_int8_t min_code, u_int8_t max_code,
                     u_int8_t type, u_int8_t code,
                     int invert)
{
        return ((test_type == 0xFF) || (type == test_type && code >= min_code && code <= max_code))
                ^ invert;
}

static int
icmp_match(const struct sk_buff *skb,
           const struct net_device *in,
           const struct net_device *out,
           const void *matchinfo,
           int offset,
           int *hotdrop)
{
        struct icmphdr icmph;
        const struct ipt_icmp *icmpinfo = matchinfo;


        if (offset)
                return 0;

        if (skb_copy_bits(skb, skb->nh.iph->ihl*4, &icmph, sizeof(icmph)) < 0){


                ;
                *hotdrop = 1;
                return 0;
        }

        return icmp_type_code_match(icmpinfo->type,
                                    icmpinfo->code[0],
                                    icmpinfo->code[1],
                                    icmph.type, icmph.code,
                                    !!(icmpinfo->invflags&0x01));
}


static int
icmp_checkentry(const char *tablename,
           const struct ipt_ip *ip,
           void *matchinfo,
           unsigned int matchsize,
           unsigned int hook_mask)
{
        const struct ipt_icmp *icmpinfo = matchinfo;


        return ip->proto == IPPROTO_ICMP
                && !(ip->invflags & 0x40)
                && matchsize == (((sizeof(struct ipt_icmp)) + (__alignof__(struct ipt_entry)-1)) & ~(__alignof__(struct ipt_entry)-1))
                && !(icmpinfo->invflags & ~0x01);
}


static struct ipt_target ipt_standard_target = {
        .name = "",
};

static struct ipt_target ipt_error_target = {
        .name = "ERROR",
        .target = ipt_error,
};

static struct nf_sockopt_ops ipt_sockopts = {
        .pf = 2,
        .set_optmin = 64,
        .set_optmax = (64 + 1)+1,
        .set = do_ipt_set_ctl,
        .get_optmin = 64,
        .get_optmax = (64 + 1)+1,
        .get = do_ipt_get_ctl,
};

static struct ipt_match tcp_matchstruct = {
        .name = "tcp",
        .match = &tcp_match,
        .checkentry = &tcp_checkentry,
};

static struct ipt_match udp_matchstruct = {
        .name = "udp",
        .match = &udp_match,
        .checkentry = &udp_checkentry,
};

static struct ipt_match icmp_matchstruct = {
        .name = "icmp",
        .match = &icmp_match,
        .checkentry = &icmp_checkentry,
};


static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int print_name(const char *i,
                             off_t start_offset, char *buffer, int length,
                             off_t *pos, unsigned int *count)
{
        if ((*count)++ >= start_offset) {
                unsigned int namelen;

                namelen = sprintf(buffer + *pos, "%s\n",
                                  i + sizeof(struct list_head));
                if (*pos + namelen > length) {

                        return 1;
                }
                *pos += namelen;
        }
        return 0;
}

static __inline__ __attribute__((always_inline)) __attribute__((always_inline)) int print_target(const struct ipt_target *t,
                               off_t start_offset, char *buffer, int length,
                               off_t *pos, unsigned int *count)
{
        if (t == &ipt_standard_target || t == &ipt_error_target)
                return 0;
        return print_name((char *)t, start_offset, buffer, length, pos, count);
}

static int ipt_get_tables(char *buffer, char **start, off_t offset, int length)
{
        off_t pos = 0;
        unsigned int count = 0;

        if (down_interruptible(&ipt_mutex) != 0)
                return 0;

        ({ const struct list_head *__i, *__j = ((void *)0); do { if (!(down_trylock(&ipt_mutex) != 0)) printk("IP_NF_ASSERT: %s:%s:%u\n", (__func__), "net/ipv4/netfilter/ip_tables.c", 1752); } while(0); for (__i = ((&ipt_tables))->next, prefetch(__i->next); __i != ((&ipt_tables)); __i = __i->next, prefetch(__i->next)) if (print_name((const void *)__i , offset, buffer, length, &pos, &count)) { __j = __i; break; } (void *)__j; });


        up(&ipt_mutex);


        *start=(char *)((unsigned long)count-offset);
        return pos;
}

static int ipt_get_targets(char *buffer, char **start, off_t offset, int length)
{
        off_t pos = 0;
        unsigned int count = 0;

        if (down_interruptible(&ipt_mutex) != 0)
                return 0;

        ({ const struct list_head *__i, *__j = ((void *)0); do { if (!(down_trylock(&ipt_mutex) != 0)) printk("IP_NF_ASSERT: %s:%s:%u\n", (__func__), "net/ipv4/netfilter/ip_tables.c", 1770); } while(0); for (__i = ((&ipt_target))->next, prefetch(__i->next); __i != ((&ipt_target)); __i = __i->next, prefetch(__i->next)) if (print_target((const struct ipt_target *)__i , offset, buffer, length, &pos, &count)) { __j = __i; break; } (struct ipt_target *)__j; });


        up(&ipt_mutex);

        *start = (char *)((unsigned long)count - offset);
        return pos;
}

static int ipt_get_matches(char *buffer, char **start, off_t offset, int length)
{
        off_t pos = 0;
        unsigned int count = 0;

        if (down_interruptible(&ipt_mutex) != 0)
                return 0;

        ({ const struct list_head *__i, *__j = ((void *)0); do { if (!(down_trylock(&ipt_mutex) != 0)) printk("IP_NF_ASSERT: %s:%s:%u\n", (__func__), "net/ipv4/netfilter/ip_tables.c", 1787); } while(0); for (__i = ((&ipt_match))->next, prefetch(__i->next); __i != ((&ipt_match)); __i = __i->next, prefetch(__i->next)) if (print_name((const void *)__i , offset, buffer, length, &pos, &count)) { __j = __i; break; } (void *)__j; });


        up(&ipt_mutex);

        *start = (char *)((unsigned long)count - offset);
        return pos;
}

static struct { char *name; get_info_t *get_info; } ipt_proc_entry[] =
{ { "ip_tables_names", ipt_get_tables },
  { "ip_tables_targets", ipt_get_targets },
  { "ip_tables_matches", ipt_get_matches },
  { ((void *)0), ((void *)0)} };


static int __attribute__ ((__section__ (".init.text"))) init(void)
{
        int ret;


        down(&ipt_mutex);
        list_append(&ipt_target, &ipt_standard_target);
        list_append(&ipt_target, &ipt_error_target);
        list_append(&ipt_match, &tcp_matchstruct);
        list_append(&ipt_match, &udp_matchstruct);
        list_append(&ipt_match, &icmp_matchstruct);
        up(&ipt_mutex);


        ret = nf_register_sockopt(&ipt_sockopts);
        if (ret < 0) {
                ;
                return ret;
        }


        {
        struct proc_dir_entry *proc;
        int i;

        for (i = 0; ipt_proc_entry[i].name; i++) {
                proc = proc_net_create(ipt_proc_entry[i].name, 0,
                                       ipt_proc_entry[i].get_info);
                if (!proc) {
                        while (--i >= 0)
                                proc_net_remove(ipt_proc_entry[i].name);
                        nf_unregister_sockopt(&ipt_sockopts);
                        return -12;
                }
                proc->owner = ((struct module *)0);
        }
        }


        printk("ip_tables: (C) 2000-2002 Netfilter core team\n");
        return 0;
}

static void __attribute__((__used__)) __attribute__ ((__section__(".exit.text"))) fini(void)
{
        nf_unregister_sockopt(&ipt_sockopts);

        {
        int i;
        for (i = 0; ipt_proc_entry[i].name; i++)
                proc_net_remove(ipt_proc_entry[i].name);
        }

}

extern void *__crc_ipt_register_table __attribute__((weak)); static const unsigned long __kcrctab_ipt_register_table __attribute__((__used__)) __attribute__((section("__kcrctab" ""), unused)) = (unsigned long) &__crc_ipt_register_table; static const char __kstrtab_ipt_register_table[] __attribute__((section("__ksymtab_strings"))) = "" "ipt_register_table"; static const struct kernel_symbol __ksymtab_ipt_register_table __attribute__((__used__)) __attribute__((section("__ksymtab" ""), unused)) = { (unsigned long)&ipt_register_table, __kstrtab_ipt_register_table };
extern void *__crc_ipt_unregister_table __attribute__((weak)); static const unsigned long __kcrctab_ipt_unregister_table __attribute__((__used__)) __attribute__((section("__kcrctab" ""), unused)) = (unsigned long) &__crc_ipt_unregister_table; static const char __kstrtab_ipt_unregister_table[] __attribute__((section("__ksymtab_strings"))) = "" "ipt_unregister_table"; static const struct kernel_symbol __ksymtab_ipt_unregister_table __attribute__((__used__)) __attribute__((section("__ksymtab" ""), unused)) = { (unsigned long)&ipt_unregister_table, __kstrtab_ipt_unregister_table };
extern void *__crc_ipt_register_match __attribute__((weak)); static const unsigned long __kcrctab_ipt_register_match __attribute__((__used__)) __attribute__((section("__kcrctab" ""), unused)) = (unsigned long) &__crc_ipt_register_match; static const char __kstrtab_ipt_register_match[] __attribute__((section("__ksymtab_strings"))) = "" "ipt_register_match"; static const struct kernel_symbol __ksymtab_ipt_register_match __attribute__((__used__)) __attribute__((section("__ksymtab" ""), unused)) = { (unsigned long)&ipt_register_match, __kstrtab_ipt_register_match };
extern void *__crc_ipt_unregister_match __attribute__((weak)); static const unsigned long __kcrctab_ipt_unregister_match __attribute__((__used__)) __attribute__((section("__kcrctab" ""), unused)) = (unsigned long) &__crc_ipt_unregister_match; static const char __kstrtab_ipt_unregister_match[] __attribute__((section("__ksymtab_strings"))) = "" "ipt_unregister_match"; static const struct kernel_symbol __ksymtab_ipt_unregister_match __attribute__((__used__)) __attribute__((section("__ksymtab" ""), unused)) = { (unsigned long)&ipt_unregister_match, __kstrtab_ipt_unregister_match };
extern void *__crc_ipt_do_table __attribute__((weak)); static const unsigned long __kcrctab_ipt_do_table __attribute__((__used__)) __attribute__((section("__kcrctab" ""), unused)) = (unsigned long) &__crc_ipt_do_table; static const char __kstrtab_ipt_do_table[] __attribute__((section("__ksymtab_strings"))) = "" "ipt_do_table"; static const struct kernel_symbol __ksymtab_ipt_do_table __attribute__((__used__)) __attribute__((section("__ksymtab" ""), unused)) = { (unsigned long)&ipt_do_table, __kstrtab_ipt_do_table };
extern void *__crc_ipt_register_target __attribute__((weak)); static const unsigned long __kcrctab_ipt_register_target __attribute__((__used__)) __attribute__((section("__kcrctab" ""), unused)) = (unsigned long) &__crc_ipt_register_target; static const char __kstrtab_ipt_register_target[] __attribute__((section("__ksymtab_strings"))) = "" "ipt_register_target"; static const struct kernel_symbol __ksymtab_ipt_register_target __attribute__((__used__)) __attribute__((section("__ksymtab" ""), unused)) = { (unsigned long)&ipt_register_target, __kstrtab_ipt_register_target };
extern void *__crc_ipt_unregister_target __attribute__((weak)); static const unsigned long __kcrctab_ipt_unregister_target __attribute__((__used__)) __attribute__((section("__kcrctab" ""), unused)) = (unsigned long) &__crc_ipt_unregister_target; static const char __kstrtab_ipt_unregister_target[] __attribute__((section("__ksymtab_strings"))) = "" "ipt_unregister_target"; static const struct kernel_symbol __ksymtab_ipt_unregister_target __attribute__((__used__)) __attribute__((section("__ksymtab" ""), unused)) = { (unsigned long)&ipt_unregister_target, __kstrtab_ipt_unregister_target };
extern void *__crc_ipt_find_target_lock __attribute__((weak)); static const unsigned long __kcrctab_ipt_find_target_lock __attribute__((__used__)) __attribute__((section("__kcrctab" ""), unused)) = (unsigned long) &__crc_ipt_find_target_lock; static const char __kstrtab_ipt_find_target_lock[] __attribute__((section("__ksymtab_strings"))) = "" "ipt_find_target_lock"; static const struct kernel_symbol __ksymtab_ipt_find_target_lock __attribute__((__used__)) __attribute__((section("__ksymtab" ""), unused)) = { (unsigned long)&ipt_find_target_lock, __kstrtab_ipt_find_target_lock };

static initcall_t __initcall_init __attribute__((__used__)) __attribute__((__section__(".initcall" "6" ".init"))) = init;;
static exitcall_t __exitcall_fini __attribute__((__used__)) __attribute__ ((__section__ (".exitcall.exit"))) = fini;;
