# 1 "dbutil.c"
#pragma GCC set_debug_pwd "/Users/rgrimm/Desktop/avenger-0.4/util"
# 1 "<built-in>"
# 1 "<command line>"
# 1 "dbutil.c"
# 24 "dbutil.c"
# 1 "avutil.h" 1
# 27 "avutil.h"
# 1 "../config.h" 1
# 28 "avutil.h" 2
# 1 "/usr/include/stdio.h" 1 3 4
# 65 "/usr/include/stdio.h" 3 4
# 1 "/usr/include/sys/types.h" 1 3 4
# 66 "/usr/include/sys/types.h" 3 4
# 1 "/usr/include/sys/appleapiopts.h" 1 3 4
# 67 "/usr/include/sys/types.h" 2 3 4


# 1 "/usr/include/sys/cdefs.h" 1 3 4
# 70 "/usr/include/sys/types.h" 2 3 4


# 1 "/usr/include/machine/types.h" 1 3 4
# 30 "/usr/include/machine/types.h" 3 4
# 1 "/usr/include/ppc/types.h" 1 3 4
# 69 "/usr/include/ppc/types.h" 3 4
typedef signed char int8_t;
typedef unsigned char u_int8_t;
typedef short int16_t;
typedef unsigned short u_int16_t;
typedef int int32_t;
typedef unsigned int u_int32_t;
typedef long long int64_t;
typedef unsigned long long u_int64_t;

typedef int32_t register_t;

typedef long int intptr_t;
typedef unsigned long int uintptr_t;
# 31 "/usr/include/machine/types.h" 2 3 4
# 73 "/usr/include/sys/types.h" 2 3 4

# 1 "/usr/include/machine/ansi.h" 1 3 4
# 33 "/usr/include/machine/ansi.h" 3 4
# 1 "/usr/include/ppc/ansi.h" 1 3 4
# 93 "/usr/include/ppc/ansi.h" 3 4
typedef union {
        char __mbstate8[128];
        long long _mbstateL;
} __mbstate_t;
# 34 "/usr/include/machine/ansi.h" 2 3 4
# 75 "/usr/include/sys/types.h" 2 3 4
# 1 "/usr/include/machine/endian.h" 1 3 4
# 30 "/usr/include/machine/endian.h" 3 4
# 1 "/usr/include/ppc/endian.h" 1 3 4
# 81 "/usr/include/ppc/endian.h" 3 4

unsigned long htonl (unsigned long);
unsigned short htons (unsigned short);
unsigned long ntohl (unsigned long);
unsigned short ntohs (unsigned short);

# 31 "/usr/include/machine/endian.h" 2 3 4
# 76 "/usr/include/sys/types.h" 2 3 4


typedef unsigned char u_char;
typedef unsigned short u_short;
typedef unsigned int u_int;
typedef unsigned long u_long;
typedef unsigned short ushort;
typedef unsigned int uint;


typedef u_int64_t u_quad_t;
typedef int64_t quad_t;
typedef quad_t * qaddr_t;

typedef char * caddr_t;
typedef int32_t daddr_t;
typedef int32_t dev_t;
typedef u_int32_t fixpt_t;
typedef u_int32_t gid_t;
typedef u_int32_t in_addr_t;
typedef u_int16_t in_port_t;
typedef u_int32_t ino_t;
typedef long key_t;
typedef u_int16_t mode_t;
typedef u_int16_t nlink_t;
typedef quad_t off_t;
typedef int32_t pid_t;
typedef quad_t rlim_t;
typedef int32_t segsz_t;
typedef int32_t swblk_t;
typedef u_int32_t uid_t;
typedef u_int32_t useconds_t;
# 118 "/usr/include/sys/types.h" 3 4
typedef unsigned long clock_t;




typedef long unsigned int size_t;




typedef int ssize_t;




typedef long time_t;
# 147 "/usr/include/sys/types.h" 3 4
typedef int32_t fd_mask;






typedef struct fd_set {
        fd_mask fds_bits[(((1024) + (((sizeof(fd_mask) * 8)) - 1)) / ((sizeof(fd_mask) * 8)))];
} fd_set;
# 183 "/usr/include/sys/types.h" 3 4
struct _pthread_handler_rec
{
        void (*routine)(void *);
        void *arg;
        struct _pthread_handler_rec *next;
};
# 203 "/usr/include/sys/types.h" 3 4
typedef struct _opaque_pthread_t { long sig; struct _pthread_handler_rec *cleanup_stack; char opaque[596];} *pthread_t;

typedef struct _opaque_pthread_attr_t { long sig; char opaque[36]; } pthread_attr_t;

typedef struct _opaque_pthread_mutexattr_t { long sig; char opaque[8]; } pthread_mutexattr_t;

typedef struct _opaque_pthread_mutex_t { long sig; char opaque[40]; } pthread_mutex_t;

typedef struct _opaque_pthread_condattr_t { long sig; char opaque[4]; } pthread_condattr_t;

typedef struct _opaque_pthread_cond_t { long sig; char opaque[24]; } pthread_cond_t;

typedef struct _opaque_pthread_rwlockattr_t { long sig; char opaque[12]; } pthread_rwlockattr_t;

typedef struct _opaque_pthread_rwlock_t { long sig; char opaque[124]; } pthread_rwlock_t;

typedef struct { long sig; char opaque[4]; } pthread_once_t;



typedef unsigned long pthread_key_t;
# 66 "/usr/include/stdio.h" 2 3 4
# 81 "/usr/include/stdio.h" 3 4
typedef off_t fpos_t;
# 96 "/usr/include/stdio.h" 3 4
struct __sbuf {
        unsigned char *_base;
        int _size;
};


struct __sFILEX;
# 130 "/usr/include/stdio.h" 3 4
typedef struct __sFILE {
        unsigned char *_p;
        int _r;
        int _w;
        short _flags;
        short _file;
        struct __sbuf _bf;
        int _lbfsize;


        void *_cookie;
        int (*_close)(void *);
        int (*_read) (void *, char *, int);
        fpos_t (*_seek) (void *, fpos_t, int);
        int (*_write)(void *, const char *, int);


        struct __sbuf _ub;
        struct __sFILEX *_extra;
        int _ur;


        unsigned char _ubuf[3];
        unsigned char _nbuf[1];


        struct __sbuf _lb;


        int _blksize;
        fpos_t _offset;
} FILE;


extern FILE __sF[];

# 234 "/usr/include/stdio.h" 3 4

void clearerr(FILE *);
int fclose(FILE *);
int feof(FILE *);
int ferror(FILE *);
int fflush(FILE *);
int fgetc(FILE *);
int fgetpos(FILE *, fpos_t *);
char *fgets(char *, int, FILE *);
FILE *fopen(const char *, const char *);
int fprintf(FILE *, const char *, ...);
int fputc(int, FILE *);
int fputs(const char *, FILE *);
size_t fread(void *, size_t, size_t, FILE *);
FILE *freopen(const char *, const char *, FILE *);
int fscanf(FILE *, const char *, ...);
int fseek(FILE *, long, int);
int fsetpos(FILE *, const fpos_t *);
long ftell(FILE *);
size_t fwrite(const void *, size_t, size_t, FILE *);
int getc(FILE *);
int getchar(void);
char *gets(char *);

extern const int sys_nerr;
extern const char *const sys_errlist[];

void perror(const char *);
int printf(const char *, ...);
int putc(int, FILE *);
int putchar(int);
int puts(const char *);
int remove(const char *);
int rename (const char *, const char *);
void rewind(FILE *);
int scanf(const char *, ...);
void setbuf(FILE *, char *);
int setvbuf(FILE *, char *, int, size_t);
int sprintf(char *, const char *, ...);
int sscanf(const char *, const char *, ...);
FILE *tmpfile(void);
char *tmpnam(char *);
int ungetc(int, FILE *);
int vfprintf(FILE *, const char *, __builtin_va_list);
int vprintf(const char *, __builtin_va_list);
int vsprintf(char *, const char *, __builtin_va_list);
int asprintf(char **, const char *, ...);
int vasprintf(char **, const char *, __builtin_va_list);

# 291 "/usr/include/stdio.h" 3 4

char *ctermid(char *);
char *ctermid_r(char *);
FILE *fdopen(int, const char *);
int fileno(FILE *);








char *fgetln(FILE *, size_t *);
void flockfile(FILE *);
const char
        *fmtcheck(const char *, const char *);
int fpurge(FILE *);
int fseeko(FILE *, fpos_t, int);
fpos_t ftello(FILE *);
int ftrylockfile(FILE *);
void funlockfile(FILE *);
int getc_unlocked(FILE *);
int getchar_unlocked(void);
int getw(FILE *);
int pclose(FILE *);
FILE *popen(const char *, const char *);
int putc_unlocked(int, FILE *);
int putchar_unlocked(int);
int putw(int, FILE *);
void setbuffer(FILE *, char *, int);
int setlinebuf(FILE *);
char *tempnam(const char *, const char *);
int snprintf(char *, size_t, const char *, ...);
int vfscanf(FILE *, const char *, __builtin_va_list);
int vsnprintf(char *, size_t, const char *, __builtin_va_list);
int vscanf(const char *, __builtin_va_list);
int vsscanf(const char *, const char *, __builtin_va_list);
FILE *zopen(const char *, const char *, int);






FILE *funopen(const void *,
                int (*)(void *, char *, int),
                int (*)(void *, const char *, int),
                fpos_t (*)(void *, fpos_t, int),
                int (*)(void *));









int __srget(FILE *);
int __svfscanf(FILE *, const char *, __builtin_va_list);
int __swbuf(int, FILE *);








static __inline int __sputc(int _c, FILE *_p) {
        if (--_p->_w >= 0 || (_p->_w >= _p->_lbfsize && (char)_c != '\n'))
                return (*_p->_p++ = _c);
        else
                return (__swbuf(_c, _p));
}
# 29 "avutil.h" 2
# 1 "/usr/include/unistd.h" 1 3 4
# 73 "/usr/include/unistd.h" 3 4
# 1 "/usr/include/sys/unistd.h" 1 3 4
# 74 "/usr/include/unistd.h" 2 3 4
# 127 "/usr/include/unistd.h" 3 4


void _Exit(int) __attribute__((__noreturn__));
void _exit(int) __attribute__((__noreturn__));
int access(const char *, int);
unsigned int alarm(unsigned int);
int chdir(const char *);
int chown(const char *, uid_t, gid_t);
int close(int);
size_t confstr(int, char *, size_t);
int dup(int);
int dup2(int, int);
int execl(const char *, const char *, ...);
int execle(const char *, const char *, ...);
int execlp(const char *, const char *, ...);
int execv(const char *, char * const *);
int execve(const char *, char * const *, char * const *);
int execvp(const char *, char * const *);
pid_t fork(void);
long fpathconf(int, int);
char *getcwd(char *, size_t);
int getdomainname(char *, int);
gid_t getegid(void);
uid_t geteuid(void);
gid_t getgid(void);
int getgroups(int, gid_t []);
char *getlogin(void);
int getlogin_r(char *, int);
pid_t getpgrp(void);
pid_t getpid(void);
pid_t getppid(void);
uid_t getuid(void);
int isatty(int);
int link(const char *, const char *);
off_t lseek(int, off_t, int);
long pathconf(const char *, int);
int pause(void);
int pipe(int *);
ssize_t read(int, void *, size_t);
int rmdir(const char *);
int setdomainname(const char *, int);
int setgid(gid_t);
int setpgid(pid_t, pid_t);
pid_t setsid(void);
int setuid(uid_t);
unsigned int sleep(unsigned int);
long sysconf(int);
pid_t tcgetpgrp(int);
int tcsetpgrp(int, pid_t);
char *ttyname(int);
char *ttyname_r(int, char *, size_t);
int unlink(const char *);
ssize_t write(int, const void *, size_t);

extern char *optarg;
extern int optind, opterr, optopt, optreset;
int getopt(int, char * const [], const char *);



struct timespec;
struct timeval;

int acct(const char *);
int async_daemon(void);
char *brk(const char *);
int chroot(const char *);
char *crypt(const char *, const char *);
int des_cipher(const char *, char *, long, int);
int des_setkey(const char *key);
int encrypt(char *, int);
void endusershell(void);
int fchdir(int);
int fchown(int, int, int);
char *fflagstostr(u_long);
int fsync(int);
int ftruncate(int, off_t);
int getdtablesize(void);
int getgrouplist(const char *, int, int *, int *);
long gethostid(void);
int gethostname(char *, int);
mode_t getmode(const void *, mode_t);
int getpagesize(void) __attribute__((__const__));
char *getpass(const char *);
int getpgid(pid_t _pid);
int getsid(pid_t _pid);
char *getusershell(void);
char *getwd(char *);
int lockf(int, int, off_t);
int initgroups(const char *, int);
int iruserok(unsigned long, int, const char *, const char *);
int issetugid(void);
char *mkdtemp(char *);
int mknod(const char *, mode_t, dev_t);
int mkstemp(char *);
int mkstemps(char *, int);
char *mktemp(char *);
int nfssvc(int, void *);
int nice(int);
ssize_t pread(int, void *, size_t, off_t);




# 1 "/usr/include/signal.h" 1 3 4
# 63 "/usr/include/signal.h" 3 4
# 1 "/usr/include/sys/signal.h" 1 3 4
# 72 "/usr/include/sys/signal.h" 3 4
# 1 "/usr/include/machine/signal.h" 1 3 4
# 27 "/usr/include/machine/signal.h" 3 4
# 1 "/usr/include/ppc/signal.h" 1 3 4
# 32 "/usr/include/ppc/signal.h" 3 4
typedef int sig_atomic_t;
# 50 "/usr/include/ppc/signal.h" 3 4
typedef enum {
        REGS_SAVED_NONE,
        REGS_SAVED_CALLER,


        REGS_SAVED_ALL
} regs_saved_t;
# 66 "/usr/include/ppc/signal.h" 3 4
struct sigcontext {
    int sc_onstack;
    int sc_mask;
        int sc_ir;
    int sc_psw;
    int sc_sp;
        void *sc_regs;
};
# 28 "/usr/include/machine/signal.h" 2 3 4
# 73 "/usr/include/sys/signal.h" 2 3 4
# 136 "/usr/include/sys/signal.h" 3 4
typedef unsigned int sigset_t;

union sigval {

        int sigval_int;
        void *sigval_ptr;
};







struct sigevent {
        int sigev_notify;
        int sigev_signo;
        union sigval sigev_value;
        void (*sigev_notify_function)(union sigval);
        pthread_attr_t *sigev_notify_attributes;
};

typedef struct __siginfo {
        int si_signo;
        int si_errno;
        int si_code;
        int si_pid;
        unsigned int si_uid;
        int si_status;
        void *si_addr;
        union sigval si_value;
        long si_band;
        unsigned int pad[7];
} siginfo_t;
# 218 "/usr/include/sys/signal.h" 3 4
union __sigaction_u {
        void (*__sa_handler)(int);
        void (*__sa_sigaction)(int, struct __siginfo *,
                       void *);
};


struct __sigaction {
        union __sigaction_u __sigaction_u;
        void (*sa_tramp)(void *, int, int, siginfo_t *, void *);
        sigset_t sa_mask;
        int sa_flags;
};




struct sigaction {
        union __sigaction_u __sigaction_u;
        sigset_t sa_mask;
        int sa_flags;
};
# 275 "/usr/include/sys/signal.h" 3 4
typedef void (*sig_t) (int);




struct sigaltstack {
        char *ss_sp;
        int ss_size;
        int ss_flags;
};

typedef struct sigaltstack stack_t;
# 297 "/usr/include/sys/signal.h" 3 4
struct sigvec {
        void (*sv_handler)(int);
        int sv_mask;
        int sv_flags;
};
# 315 "/usr/include/sys/signal.h" 3 4
struct sigstack {
        char *ss_sp;
        int ss_onstack;
};
# 348 "/usr/include/sys/signal.h" 3 4

void (*signal (int, void (*) (int))) (int);

# 64 "/usr/include/signal.h" 2 3 4


extern const char *const sys_signame[32];
extern const char *const sys_siglist[32];



int raise(int);

int kill(pid_t, int);
int sigaction(int, const struct sigaction *, struct sigaction *);
int sigaddset(sigset_t *, int);
int sigaltstack(const struct sigaltstack *, struct sigaltstack *);
int sigdelset(sigset_t *, int);
int sigemptyset(sigset_t *);
int sigfillset(sigset_t *);
int sigismember(const sigset_t *, int);
int sigpending(sigset_t *);
int sigprocmask(int, const sigset_t *, sigset_t *);
int sigsuspend(const sigset_t *);
int sigwait(const sigset_t *, int *);

int killpg(pid_t, int);
int sigblock(int);
int siginterrupt(int, int);
int sighold(int);
int sigrelse(int);
int sigpause(int);
int sigreturn(struct sigcontext *);
int sigsetmask(int);
int sigvec(int, struct sigvec *, struct sigvec *);
void psignal(unsigned int, const char *);




# 232 "/usr/include/unistd.h" 2 3 4

int profil(char *, int, int, int);

int pselect(int, fd_set *, fd_set *, fd_set *,
            const struct timespec *, const sigset_t *);

ssize_t pwrite(int, const void *, size_t, off_t);
int rcmd(char **, int, const char *, const char *, const char *, int *);
int readlink(const char *, char *, int);
int reboot(int);
int revoke(const char *);
int rresvport(int *);
int rresvport_af(int *, int);
int ruserok(const char *, int, const char *, const char *);
char *sbrk(int);
int select(int, fd_set *, fd_set *, fd_set *, struct timeval *);
int setegid(gid_t);
int seteuid(uid_t);
int setgroups(int, const gid_t *);
void sethostid(long);
int sethostname(const char *, int);
int setkey(const char *);
int setlogin(const char *);
void *setmode(const char *);
int setpgrp(pid_t pid, pid_t pgrp);
int setregid(gid_t, gid_t);
int setreuid(uid_t, uid_t);
int setrgid(gid_t);
int setruid(uid_t);
void setusershell(void);
int strtofflags(char **, u_long *, u_long *);
int swapon(const char *);
int symlink(const char *, const char *);
void sync(void);
int syscall(int, ...);
int truncate(const char *, off_t);
int ttyslot(void);
unsigned int ualarm(unsigned int, unsigned int);
int undelete(const char *);
int unwhiteout(const char *);
int usleep(unsigned int);
void *valloc(size_t);
pid_t vfork(void);

extern char *suboptarg;
int getsubopt(char **, char * const *, char **);


int getattrlist(const char*,void*,void*,size_t,unsigned long);
int setattrlist(const char*,void*,void*,size_t,unsigned long);
int exchangedata(const char*,const char*,unsigned long);
int checkuseraccess(const char*,uid_t,gid_t*,int,int,unsigned long);
int getdirentriesattr(int,void*,void*,size_t,unsigned long*,unsigned long*,unsigned long*,unsigned long);
int searchfs(const char*,void*,void*,unsigned long,unsigned long,void*);

int fsctl(const char *,unsigned long,void*,unsigned long);




# 30 "avutil.h" 2
# 1 "/usr/include/errno.h" 1 3 4
# 23 "/usr/include/errno.h" 3 4
# 1 "/usr/include/sys/errno.h" 1 3 4
# 68 "/usr/include/sys/errno.h" 3 4

extern int * __error (void);


# 24 "/usr/include/errno.h" 2 3 4
# 31 "avutil.h" 2
# 1 "/usr/include/gcc/darwin/3.3/assert.h" 1 3 4
# 45 "/usr/include/gcc/darwin/3.3/assert.h" 3 4
extern void __eprintf (const char *, const char *, unsigned, const char *)
    __attribute__ ((noreturn));
# 32 "avutil.h" 2
# 1 "/usr/include/sys/stat.h" 1 3 4
# 67 "/usr/include/sys/stat.h" 3 4
# 1 "/usr/include/sys/time.h" 1 3 4
# 68 "/usr/include/sys/time.h" 3 4
struct timeval {
        int32_t tv_sec;
        int32_t tv_usec;
};






struct timespec {
        time_t tv_sec;
        int32_t tv_nsec;
};
# 93 "/usr/include/sys/time.h" 3 4
struct timezone {
        int tz_minuteswest;
        int tz_dsttime;
};
# 143 "/usr/include/sys/time.h" 3 4
struct itimerval {
        struct timeval it_interval;
        struct timeval it_value;
};




struct clockinfo {
        int hz;
        int tick;
        int tickadj;
        int stathz;
        int profhz;
};
# 176 "/usr/include/sys/time.h" 3 4
# 1 "/usr/include/time.h" 1 3 4
# 95 "/usr/include/time.h" 3 4
struct tm {
        int tm_sec;
        int tm_min;
        int tm_hour;
        int tm_mday;
        int tm_mon;
        int tm_year;
        int tm_wday;
        int tm_yday;
        int tm_isdst;
        long tm_gmtoff;
        char *tm_zone;
};

# 1 "/usr/include/gcc/darwin/3.3/machine/limits.h" 1 3 4
# 24 "/usr/include/gcc/darwin/3.3/machine/limits.h" 3 4
# 1 "/usr/include/ppc/limits.h" 1 3 4
# 25 "/usr/include/gcc/darwin/3.3/machine/limits.h" 2 3 4
# 110 "/usr/include/time.h" 2 3 4






extern char *tzname[];



char *asctime(const struct tm *);
clock_t clock(void);
char *ctime(const time_t *);
double difftime(time_t, time_t);
struct tm *gmtime(const time_t *);
struct tm *localtime(const time_t *);
time_t mktime(struct tm *);
size_t strftime(char *, size_t, const char *, const struct tm *);
time_t time(time_t *);


void tzset(void);



char *asctime_r(const struct tm *, char *);
char *ctime_r(const time_t *, char *);
struct tm *gmtime_r(const time_t *, struct tm *);
struct tm *localtime_r(const time_t *, struct tm *);
time_t posix2time(time_t);
char *strptime(const char *, const char *, struct tm *);
char *timezone(int, int);
void tzsetwall(void);
time_t time2posix(time_t);
time_t timelocal(struct tm * const);
time_t timegm(struct tm * const);



int nanosleep(const struct timespec *, struct timespec *);


# 177 "/usr/include/sys/time.h" 2 3 4





int adjtime (const struct timeval *, struct timeval *);
int futimes (int, const struct timeval *);
int getitimer (int, struct itimerval *);
int gettimeofday (struct timeval *, struct timezone *);
int setitimer (int, const struct itimerval *, struct itimerval *);
int settimeofday (const struct timeval *, const struct timezone *);
int utimes (const char *, const struct timeval *);

# 68 "/usr/include/sys/stat.h" 2 3 4


struct ostat {
        u_int16_t st_dev;
        ino_t st_ino;
        mode_t st_mode;
        nlink_t st_nlink;
        u_int16_t st_uid;
        u_int16_t st_gid;
        u_int16_t st_rdev;
        int32_t st_size;
        struct timespec st_atimespec;
        struct timespec st_mtimespec;
        struct timespec st_ctimespec;
        int32_t st_blksize;
        int32_t st_blocks;
        u_int32_t st_flags;
        u_int32_t st_gen;
};


struct stat {
        dev_t st_dev;
        ino_t st_ino;
        mode_t st_mode;
        nlink_t st_nlink;
        uid_t st_uid;
        gid_t st_gid;
        dev_t st_rdev;

        struct timespec st_atimespec;
        struct timespec st_mtimespec;
        struct timespec st_ctimespec;
# 109 "/usr/include/sys/stat.h" 3 4
        off_t st_size;
        int64_t st_blocks;
        u_int32_t st_blksize;
        u_int32_t st_flags;
        u_int32_t st_gen;
        int32_t st_lspare;
        int64_t st_qspare[2];
};
# 216 "/usr/include/sys/stat.h" 3 4

int chmod (const char *, mode_t);
int fstat (int, struct stat *);
int mkdir (const char *, mode_t);
int mkfifo (const char *, mode_t);
int stat (const char *, struct stat *);
mode_t umask (mode_t);

int chflags (const char *, u_long);
int fchflags (int, u_long);
int fchmod (int, mode_t);
int lstat (const char *, struct stat *);


# 33 "avutil.h" 2
# 1 "/usr/include/stdlib.h" 1 3 4
# 64 "/usr/include/stdlib.h" 3 4
# 1 "/usr/include/alloca.h" 1 3 4
# 35 "/usr/include/alloca.h" 3 4

void *alloca(size_t);

# 65 "/usr/include/stdlib.h" 2 3 4
# 75 "/usr/include/stdlib.h" 3 4
typedef int ct_rune_t;




typedef int rune_t;







typedef int wchar_t;
# 97 "/usr/include/stdlib.h" 3 4
typedef int wint_t;


typedef struct {
        int quot;
        int rem;
} div_t;

typedef struct {
        long quot;
        long rem;
} ldiv_t;
# 119 "/usr/include/stdlib.h" 3 4
extern int __mb_cur_max;





void abort(void) __attribute__((__noreturn__));
int abs(int) __attribute__((__const__));
int atexit(void (*)(void));
double atof(const char *);
int atoi(const char *);
long atol(const char *);
void *bsearch(const void *, const void *, size_t,
            size_t, int (*)(const void *, const void *));
void *calloc(size_t, size_t);
div_t div(int, int) __attribute__((__const__));
void exit(int) __attribute__((__noreturn__));
void free(void *);
char *getenv(const char *);
long labs(long) __attribute__((__const__));
ldiv_t ldiv(long, long) __attribute__((__const__));
void *malloc(size_t);
int mblen(const char *, size_t);
size_t mbstowcs(wchar_t * __restrict , const char * __restrict, size_t);
int mbtowc(wchar_t * __restrict, const char * __restrict, size_t);
void qsort(void *, size_t, size_t,
            int (*)(const void *, const void *));
int rand(void);
void *realloc(void *, size_t);
void srand(unsigned);
double strtod(const char *, char **);
float strtof(const char *, char **);
long strtol(const char *, char **, int);
long double
         strtold(const char *, char **);
unsigned long
         strtoul(const char *, char **, int);
int system(const char *);
void *valloc(size_t);
int wctomb(char *, wchar_t);
size_t wcstombs(char * __restrict, const wchar_t * __restrict, size_t);


int putenv(const char *);
int setenv(const char *, const char *, int);



u_int32_t
         arc4random(void);
void arc4random_addrandom(unsigned char *dat, int datlen);
void arc4random_stir(void);
double drand48(void);
double erand48(unsigned short[3]);
long jrand48(unsigned short[3]);
void lcong48(unsigned short[7]);
long lrand48(void);
long mrand48(void);
long nrand48(unsigned short[3]);
unsigned short
        *seed48(unsigned short[3]);
void srand48(long);


char *cgetcap(char *, const char *, int);
int cgetclose(void);
int cgetent(char **, char **, const char *);
int cgetfirst(char **, char **);
int cgetmatch(const char *, const char *);
int cgetnext(char **, char **);
int cgetnum(char *, const char *, long *);
int cgetset(const char *);
int cgetstr(char *, const char *, char **);
int cgetustr(char *, const char *, char **);

int daemon(int, int);
char *devname(int, int);
char *getbsize(int *, long *);
int getloadavg(double [], int);
const char
        *getprogname(void);

long a64l(const char *);
char *l64a(long);


int heapsort(void *, size_t, size_t,
            int (*)(const void *, const void *));
char *initstate(unsigned long, char *, long);
int mergesort(void *, size_t, size_t,
            int (*)(const void *, const void *));


void qsort_r(void *, size_t, size_t, void *,
            int (*)(void *, const void *, const void *));
int radixsort(const unsigned char **, int, const unsigned char *,
            unsigned);
void setprogname(const char *);
int sradixsort(const unsigned char **, int, const unsigned char *,
            unsigned);
void sranddev(void);
void srandomdev(void);
int rand_r(unsigned *);
long random(void);
void *reallocf(void *, size_t);
char *realpath(const char *, char resolved_path[]);
char *setstate(char *);
void srandom(unsigned long);


typedef struct {
        long long quot;
        long long rem;
} lldiv_t;

long long
         atoll(const char *);
long long
         llabs(long long);
lldiv_t lldiv(long long, long long);
long long
         strtoll(const char *, char **, int);
unsigned long long
         strtoull(const char *, char **, int);
long long
         strtoq(const char *, char **, int);
unsigned long long
         strtouq(const char *, char **, int);

void unsetenv(const char *);


# 34 "avutil.h" 2
# 1 "/usr/include/fcntl.h" 1 3 4
# 23 "/usr/include/fcntl.h" 3 4
# 1 "/usr/include/sys/fcntl.h" 1 3 4
# 218 "/usr/include/sys/fcntl.h" 3 4
struct flock {
        off_t l_start;
        off_t l_len;
        pid_t l_pid;
        short l_type;
        short l_whence;
};






struct radvisory {
       off_t ra_offset;
       int ra_count;
};
# 247 "/usr/include/sys/fcntl.h" 3 4
typedef struct fstore {
        u_int32_t fst_flags;
        int fst_posmode;
        off_t fst_offset;
        off_t fst_length;
        off_t fst_bytesalloc;
} fstore_t;



typedef struct fbootstraptransfer {
  off_t fbt_offset;
  size_t fbt_length;
  void *fbt_buffer;
} fbootstraptransfer_t;
# 279 "/usr/include/sys/fcntl.h" 3 4
struct log2phys {
        u_int32_t l2p_flags;
        off_t l2p_contigbytes;
        off_t l2p_devoffset;
};
# 293 "/usr/include/sys/fcntl.h" 3 4

int open (const char *, int, ...);
int creat (const char *, mode_t);
int fcntl (int, int, ...);

int flock (int, int);


# 24 "/usr/include/fcntl.h" 2 3 4
# 35 "avutil.h" 2


# 1 "/usr/include/sys/file.h" 1 3 4
# 38 "avutil.h" 2
# 54 "avutil.h"
int clock_gettime (int, struct timespec *);
# 102 "avutil.h"
# 1 "/usr/include/string.h" 1 3 4
# 73 "/usr/include/string.h" 3 4

void *memchr(const void *, int, size_t);
int memcmp(const void *, const void *, size_t);
void *memcpy(void *, const void *, size_t);
void *memmove(void *, const void *, size_t);
void *memset(void *, int, size_t);
char *stpcpy(char *, const char *);
char *strcasestr(const char *, const char *);
char *strcat(char *, const char *);
char *strchr(const char *, int);
int strcmp(const char *, const char *);
int strcoll(const char *, const char *);
char *strcpy(char *, const char *);
size_t strcspn(const char *, const char *);
char *strerror(int);
int strerror_r(int, char *, size_t);
size_t strlen(const char *);
char *strncat(char *, const char *, size_t);
int strncmp(const char *, const char *, size_t);
char *strncpy(char *, const char *, size_t);
char *strnstr(const char *, const char *, size_t);
char *strpbrk(const char *, const char *);
char *strrchr(const char *, int);
size_t strspn(const char *, const char *);
char *strstr(const char *, const char *);
char *strtok(char *, const char *);
size_t strxfrm(char *, const char *, size_t);



int bcmp(const void *, const void *, size_t);
void bcopy(const void *, void *, size_t);
void bzero(void *, size_t);
int ffs(int);
char *index(const char *, int);
void *memccpy(void *, const void *, int, size_t);
char *rindex(const char *, int);
int strcasecmp(const char *, const char *);
char *strdup(const char *);
size_t strlcat(char *, const char *, size_t);
size_t strlcpy(char *, const char *, size_t);
void strmode(int, char *);
int strncasecmp(const char *, const char *, size_t);
char *strsep(char **, const char *);
char *strsignal(int sig);
char *strtok_r(char *, const char *, char **);
void swab(const void *, void *, size_t);


# 103 "avutil.h" 2
# 134 "avutil.h"
# 1 "/usr/include/fcntl.h" 1 3 4
# 135 "avutil.h" 2
# 146 "avutil.h"
static inline void
putint (void *_dp, u_int32_t val)
{
  unsigned char *dp = (unsigned char *) (_dp);
  dp[0] = val >> 24;
  dp[1] = val >> 16;
  dp[2] = val >> 8;
  dp[3] = val;
}

static inline u_int32_t
getint (const void *_dp)
{
  const unsigned char *dp = (const unsigned char *) (_dp);
  return dp[0] << 24 | dp[1] << 16 | dp[2] << 8 | dp[3];
}

static inline void
putshort (void *_dp, u_int16_t val)
{
  unsigned char *dp = (unsigned char *) (_dp);
  dp[0] = val >> 8;
  dp[1] = val;
}

static inline u_int16_t
getshort (const void *_dp)
{
  const unsigned char *dp = (const unsigned char *) (_dp);
  return dp[0] << 8 | dp[1];
}






static inline void *
xmalloc (size_t n)
{
  void *p = malloc (n);
  if (!p) {
    fprintf ((&__sF[2]), "out of memory\n");
    abort ();
  }
  return p;
}



long parse_expire (const char *age, time_t now);


struct aes_ctx {
  int nrounds;
  u_int32_t e_key[60];
  u_int32_t d_key[60];
};
typedef struct aes_ctx aes_ctx;
void aes_setkey (aes_ctx *aes, const void *key, u_int keylen);
void aes_encrypt (const aes_ctx *aes, void *buf, const void *ibuf);
void aes_decrypt (const aes_ctx *aes, void *buf, const void *ibuf);


struct mdblock {
  u_int64_t count;
  void (*consume) (struct mdblock *, const unsigned char block[64]);
  unsigned char buffer[64];
};
typedef struct mdblock mdblock;
void mdblock_init (mdblock *mp,
                   void (*consume) (mdblock *, const unsigned char block[64]));
void mdblock_update (mdblock *mp, const void *bytes, size_t len);
void mdblock_finish (mdblock *mp, int bigendian);


struct sha1_ctx {
  mdblock mdb;
  u_int32_t state[5];
};
typedef struct sha1_ctx sha1_ctx;
enum { sha1_hashsize = 20 };
void sha1_init (sha1_ctx *sc);
void sha1_update (sha1_ctx *sc, const void *bytes, size_t len);
void sha1_final (sha1_ctx *sc, unsigned char out[20]);
void hmac_sha1 (void *out, const char *key, const void *data, u_int dlen);


char *armor32 (const void *dp, size_t dl);
ssize_t dearmor32len (const char *s);
ssize_t dearmor32 (void *out, const char *s);
char *armor64 (const void *dp, size_t len);
ssize_t dearmor64len (const char *s);
ssize_t dearmor64 (void *out, const char *s);
# 25 "dbutil.c" 2
# 1 "dbexp.h" 1
# 24 "dbexp.h"
# 1 "/usr/local/BerkeleyDB.4.2/include/db.h" 1
# 28 "/usr/local/BerkeleyDB.4.2/include/db.h"
# 1 "/usr/include/gcc/darwin/3.3/inttypes.h" 1 3 4
# 35 "/usr/include/gcc/darwin/3.3/inttypes.h" 3 4
# 1 "/usr/include/gcc/darwin/3.3/stdint.h" 1 3 4
# 34 "/usr/include/gcc/darwin/3.3/stdint.h" 3 4
typedef u_int8_t uint8_t;
typedef u_int16_t uint16_t;
typedef u_int32_t uint32_t;
typedef u_int64_t uint64_t;



typedef int8_t int_least8_t;
typedef int16_t int_least16_t;
typedef int32_t int_least32_t;
typedef int64_t int_least64_t;
typedef uint8_t uint_least8_t;
typedef uint16_t uint_least16_t;
typedef uint32_t uint_least32_t;
typedef uint64_t uint_least64_t;



typedef int8_t int_fast8_t;
typedef int16_t int_fast16_t;
typedef int32_t int_fast32_t;
typedef int64_t int_fast64_t;
typedef uint8_t uint_fast8_t;
typedef uint16_t uint_fast16_t;
typedef uint32_t uint_fast32_t;
typedef uint64_t uint_fast64_t;
# 68 "/usr/include/gcc/darwin/3.3/stdint.h" 3 4
typedef long long intmax_t;
typedef unsigned long long uintmax_t;
# 36 "/usr/include/gcc/darwin/3.3/inttypes.h" 2 3 4
# 261 "/usr/include/gcc/darwin/3.3/inttypes.h" 3 4



  extern intmax_t imaxabs(intmax_t j);


  typedef struct {
        intmax_t quot;
        intmax_t rem;
  } imaxdiv_t;

  extern imaxdiv_t imaxdiv(intmax_t numer, intmax_t denom);


  extern intmax_t strtoimax(const char * nptr, char ** endptr, int base);
  extern uintmax_t strtoumax(const char * nptr, char ** endptr, int base);
# 286 "/usr/include/gcc/darwin/3.3/inttypes.h" 3 4
  extern intmax_t wcstoimax(const wchar_t * nptr, wchar_t ** endptr, int base);
  extern uintmax_t wcstoumax(const wchar_t * nptr, wchar_t ** endptr, int base);


# 29 "/usr/local/BerkeleyDB.4.2/include/db.h" 2
# 77 "/usr/local/BerkeleyDB.4.2/include/db.h"
typedef u_int32_t db_pgno_t;
typedef u_int16_t db_indx_t;


typedef u_int32_t db_recno_t;


typedef u_int32_t db_timeout_t;






typedef u_int32_t roff_t;





struct __db; typedef struct __db DB;
struct __db_bt_stat; typedef struct __db_bt_stat DB_BTREE_STAT;
struct __db_cipher; typedef struct __db_cipher DB_CIPHER;
struct __db_dbt; typedef struct __db_dbt DBT;
struct __db_env; typedef struct __db_env DB_ENV;
struct __db_h_stat; typedef struct __db_h_stat DB_HASH_STAT;
struct __db_ilock; typedef struct __db_ilock DB_LOCK_ILOCK;
struct __db_lock_stat; typedef struct __db_lock_stat DB_LOCK_STAT;
struct __db_lock_u; typedef struct __db_lock_u DB_LOCK;
struct __db_lockreq; typedef struct __db_lockreq DB_LOCKREQ;
struct __db_log_cursor; typedef struct __db_log_cursor DB_LOGC;
struct __db_log_stat; typedef struct __db_log_stat DB_LOG_STAT;
struct __db_lsn; typedef struct __db_lsn DB_LSN;
struct __db_mpool; typedef struct __db_mpool DB_MPOOL;
struct __db_mpool_fstat;typedef struct __db_mpool_fstat DB_MPOOL_FSTAT;
struct __db_mpool_stat; typedef struct __db_mpool_stat DB_MPOOL_STAT;
struct __db_mpoolfile; typedef struct __db_mpoolfile DB_MPOOLFILE;
struct __db_preplist; typedef struct __db_preplist DB_PREPLIST;
struct __db_qam_stat; typedef struct __db_qam_stat DB_QUEUE_STAT;
struct __db_rep; typedef struct __db_rep DB_REP;
struct __db_rep_stat; typedef struct __db_rep_stat DB_REP_STAT;
struct __db_txn; typedef struct __db_txn DB_TXN;
struct __db_txn_active; typedef struct __db_txn_active DB_TXN_ACTIVE;
struct __db_txn_stat; typedef struct __db_txn_stat DB_TXN_STAT;
struct __db_txnmgr; typedef struct __db_txnmgr DB_TXNMGR;
struct __dbc; typedef struct __dbc DBC;
struct __dbc_internal; typedef struct __dbc_internal DBC_INTERNAL;
struct __fh_t; typedef struct __fh_t DB_FH;
struct __fname; typedef struct __fname FNAME;
struct __key_range; typedef struct __key_range DB_KEY_RANGE;
struct __mpoolfile; typedef struct __mpoolfile MPOOLFILE;
struct __mutex_t; typedef struct __mutex_t DB_MUTEX;


struct __db_dbt {



        void *data;
        u_int32_t size;

        u_int32_t ulen;
        u_int32_t dlen;
        u_int32_t doff;
# 149 "/usr/local/BerkeleyDB.4.2/include/db.h"
        u_int32_t flags;
};
# 349 "/usr/local/BerkeleyDB.4.2/include/db.h"
typedef enum {
        DB_LOCK_NG=0,
        DB_LOCK_READ=1,
        DB_LOCK_WRITE=2,
        DB_LOCK_WAIT=3,
        DB_LOCK_IWRITE=4,
        DB_LOCK_IREAD=5,
        DB_LOCK_IWR=6,
        DB_LOCK_DIRTY=7,
        DB_LOCK_WWRITE=8
} db_lockmode_t;




typedef enum {
        DB_LOCK_DUMP=0,
        DB_LOCK_GET=1,
        DB_LOCK_GET_TIMEOUT=2,
        DB_LOCK_INHERIT=3,
        DB_LOCK_PUT=4,
        DB_LOCK_PUT_ALL=5,
        DB_LOCK_PUT_OBJ=6,
        DB_LOCK_PUT_READ=7,
        DB_LOCK_TIMEOUT=8,
        DB_LOCK_TRADE=9,
        DB_LOCK_UPGRADE_WRITE=10
} db_lockop_t;




typedef enum {
        DB_LSTAT_ABORTED=1,
        DB_LSTAT_ERR=2,
        DB_LSTAT_EXPIRED=3,
        DB_LSTAT_FREE=4,
        DB_LSTAT_HELD=5,
        DB_LSTAT_NOTEXIST=6,

        DB_LSTAT_PENDING=7,


        DB_LSTAT_WAITING=8
}db_status_t;


struct __db_lock_stat {
        u_int32_t st_id;
        u_int32_t st_cur_maxid;
        u_int32_t st_maxlocks;
        u_int32_t st_maxlockers;
        u_int32_t st_maxobjects;
        u_int32_t st_nmodes;
        u_int32_t st_nlocks;
        u_int32_t st_maxnlocks;
        u_int32_t st_nlockers;
        u_int32_t st_maxnlockers;
        u_int32_t st_nobjects;
        u_int32_t st_maxnobjects;
        u_int32_t st_nconflicts;
        u_int32_t st_nrequests;
        u_int32_t st_nreleases;
        u_int32_t st_nnowaits;

        u_int32_t st_ndeadlocks;
        db_timeout_t st_locktimeout;
        u_int32_t st_nlocktimeouts;
        db_timeout_t st_txntimeout;
        u_int32_t st_ntxntimeouts;
        u_int32_t st_region_wait;
        u_int32_t st_region_nowait;
        u_int32_t st_regsize;
};





struct __db_ilock {
        db_pgno_t pgno;
        u_int8_t fileid[20];



        u_int32_t type;
};






struct __db_lock_u {
        size_t off;
        u_int32_t ndx;

        u_int32_t gen;
        db_lockmode_t mode;
};


struct __db_lockreq {
        db_lockop_t op;
        db_lockmode_t mode;
        db_timeout_t timeout;
        DBT *obj;
        DB_LOCK lock;
};
# 490 "/usr/local/BerkeleyDB.4.2/include/db.h"
struct __db_lsn {
        u_int32_t file;
        u_int32_t offset;
};
# 511 "/usr/local/BerkeleyDB.4.2/include/db.h"
struct __db_log_cursor {
        DB_ENV *dbenv;

        DB_FH *c_fhp;
        DB_LSN c_lsn;
        u_int32_t c_len;
        u_int32_t c_prev;

        DBT c_dbt;


        u_int8_t *bp;
        u_int32_t bp_size;
        u_int32_t bp_rlen;
        DB_LSN bp_lsn;

        u_int32_t bp_maxrec;


        int (*close) (DB_LOGC *, u_int32_t);
        int (*get) (DB_LOGC *, DB_LSN *, DBT *, u_int32_t);




        u_int32_t flags;
};


struct __db_log_stat {
        u_int32_t st_magic;
        u_int32_t st_version;
        int st_mode;
        u_int32_t st_lg_bsize;
        u_int32_t st_lg_size;
        u_int32_t st_w_bytes;
        u_int32_t st_w_mbytes;
        u_int32_t st_wc_bytes;
        u_int32_t st_wc_mbytes;
        u_int32_t st_wcount;
        u_int32_t st_wcount_fill;
        u_int32_t st_scount;
        u_int32_t st_region_wait;
        u_int32_t st_region_nowait;
        u_int32_t st_cur_file;
        u_int32_t st_cur_offset;
        u_int32_t st_disk_file;
        u_int32_t st_disk_offset;
        u_int32_t st_regsize;
        u_int32_t st_maxcommitperflush;
        u_int32_t st_mincommitperflush;
};
# 582 "/usr/local/BerkeleyDB.4.2/include/db.h"
typedef enum {
        DB_PRIORITY_VERY_LOW=1,
        DB_PRIORITY_LOW=2,
        DB_PRIORITY_DEFAULT=3,
        DB_PRIORITY_HIGH=4,
        DB_PRIORITY_VERY_HIGH=5
} DB_CACHE_PRIORITY;


struct __db_mpoolfile {
        DB_FH *fhp;





        u_int32_t ref;

        u_int32_t pinref;






        struct {
                struct __db_mpoolfile *tqe_next;
                struct __db_mpoolfile **tqe_prev;
        } q;
# 622 "/usr/local/BerkeleyDB.4.2/include/db.h"
        DB_ENV *dbenv;
        MPOOLFILE *mfp;

        u_int32_t clear_len;
        u_int8_t
                        fileid[20];
        int ftype;
        int32_t lsn_offset;
        u_int32_t gbytes, bytes;
        DBT *pgcookie;
        DB_CACHE_PRIORITY
                        priority;

        void *addr;
        size_t len;

        u_int32_t config_flags;


        int (*close) (DB_MPOOLFILE *, u_int32_t);
        int (*get) (DB_MPOOLFILE *, db_pgno_t *, u_int32_t, void *);
        int (*open)(DB_MPOOLFILE *, const char *, u_int32_t, int, size_t);
        int (*put) (DB_MPOOLFILE *, void *, u_int32_t);
        int (*set) (DB_MPOOLFILE *, void *, u_int32_t);
        int (*get_clear_len) (DB_MPOOLFILE *, u_int32_t *);
        int (*set_clear_len) (DB_MPOOLFILE *, u_int32_t);
        int (*get_fileid) (DB_MPOOLFILE *, u_int8_t *);
        int (*set_fileid) (DB_MPOOLFILE *, u_int8_t *);
        int (*get_flags) (DB_MPOOLFILE *, u_int32_t *);
        int (*set_flags) (DB_MPOOLFILE *, u_int32_t, int);
        int (*get_ftype) (DB_MPOOLFILE *, int *);
        int (*set_ftype) (DB_MPOOLFILE *, int);
        int (*get_lsn_offset) (DB_MPOOLFILE *, int32_t *);
        int (*set_lsn_offset) (DB_MPOOLFILE *, int32_t);
        int (*get_maxsize) (DB_MPOOLFILE *, u_int32_t *, u_int32_t *);
        int (*set_maxsize) (DB_MPOOLFILE *, u_int32_t, u_int32_t);
        int (*get_pgcookie) (DB_MPOOLFILE *, DBT *);
        int (*set_pgcookie) (DB_MPOOLFILE *, DBT *);
        int (*get_priority) (DB_MPOOLFILE *, DB_CACHE_PRIORITY *);
        int (*set_priority) (DB_MPOOLFILE *, DB_CACHE_PRIORITY);
        int (*sync) (DB_MPOOLFILE *);
# 676 "/usr/local/BerkeleyDB.4.2/include/db.h"
        u_int32_t flags;
};




struct __db_mpool_stat {
        u_int32_t st_gbytes;
        u_int32_t st_bytes;
        u_int32_t st_ncache;
        u_int32_t st_regsize;
        u_int32_t st_map;
        u_int32_t st_cache_hit;
        u_int32_t st_cache_miss;
        u_int32_t st_page_create;
        u_int32_t st_page_in;
        u_int32_t st_page_out;
        u_int32_t st_ro_evict;
        u_int32_t st_rw_evict;
        u_int32_t st_page_trickle;
        u_int32_t st_pages;
        u_int32_t st_page_clean;
        u_int32_t st_page_dirty;
        u_int32_t st_hash_buckets;
        u_int32_t st_hash_searches;
        u_int32_t st_hash_longest;
        u_int32_t st_hash_examined;
        u_int32_t st_hash_nowait;
        u_int32_t st_hash_wait;
        u_int32_t st_hash_max_wait;
        u_int32_t st_region_nowait;
        u_int32_t st_region_wait;
        u_int32_t st_alloc;
        u_int32_t st_alloc_buckets;
        u_int32_t st_alloc_max_buckets;
        u_int32_t st_alloc_pages;
        u_int32_t st_alloc_max_pages;
};


struct __db_mpool_fstat {
        char *file_name;
        size_t st_pagesize;
        u_int32_t st_map;
        u_int32_t st_cache_hit;
        u_int32_t st_cache_miss;
        u_int32_t st_page_create;
        u_int32_t st_page_in;
        u_int32_t st_page_out;
};






typedef enum {
        DB_TXN_ABORT=0,
        DB_TXN_APPLY=1,
        DB_TXN_BACKWARD_ALLOC=2,
        DB_TXN_BACKWARD_ROLL=3,
        DB_TXN_FORWARD_ROLL=4,
        DB_TXN_GETPGNOS=5,
        DB_TXN_OPENFILES=6,
        DB_TXN_POPENFILES=7,
        DB_TXN_PRINT=8
} db_recops;
# 754 "/usr/local/BerkeleyDB.4.2/include/db.h"
struct __db_txn {
        DB_TXNMGR *mgrp;
        DB_TXN *parent;
        DB_LSN last_lsn;
        u_int32_t txnid;
        u_int32_t tid;
        roff_t off;
        db_timeout_t lock_timeout;
        db_timeout_t expire;
        void *txn_list;







        struct {
                struct __db_txn *tqe_next;
                struct __db_txn **tqe_prev;
        } links;
        struct {
                struct __db_txn *tqe_next;
                struct __db_txn **tqe_prev;
        } xalinks;






        struct {
                struct __txn_event *tqh_first;
                struct __txn_event **tqh_last;
        } events;






        struct {
                struct __txn_logrec *stqh_first;
                struct __txn_logrec **stqh_last;
        } logs;






        struct __kids {
                struct __db_txn *tqh_first;
                struct __db_txn **tqh_last;
        } kids;






        struct {
                struct __db_txn *tqe_next;
                struct __db_txn **tqe_prev;
        } klinks;


        void *api_internal;

        u_int32_t cursors;


        int (*abort) (DB_TXN *);
        int (*commit) (DB_TXN *, u_int32_t);
        int (*discard) (DB_TXN *, u_int32_t);
        u_int32_t (*id) (DB_TXN *);
        int (*prepare) (DB_TXN *, u_int8_t *);
        int (*set_timeout) (DB_TXN *, db_timeout_t, u_int32_t);
# 842 "/usr/local/BerkeleyDB.4.2/include/db.h"
        u_int32_t flags;
};
# 854 "/usr/local/BerkeleyDB.4.2/include/db.h"
struct __db_preplist {
        DB_TXN *txn;
        u_int8_t gid[128];
};


struct __db_txn_active {
        u_int32_t txnid;
        u_int32_t parentid;
        DB_LSN lsn;
        u_int32_t xa_status;
        u_int8_t xid[128];
};

struct __db_txn_stat {
        DB_LSN st_last_ckp;
        time_t st_time_ckp;
        u_int32_t st_last_txnid;
        u_int32_t st_maxtxns;
        u_int32_t st_naborts;
        u_int32_t st_nbegins;
        u_int32_t st_ncommits;
        u_int32_t st_nactive;
        u_int32_t st_nrestores;

        u_int32_t st_maxnactive;
        DB_TXN_ACTIVE *st_txnarray;
        u_int32_t st_region_wait;
        u_int32_t st_region_nowait;
        u_int32_t st_regsize;
};
# 899 "/usr/local/BerkeleyDB.4.2/include/db.h"
struct __db_rep_stat {
# 909 "/usr/local/BerkeleyDB.4.2/include/db.h"
        u_int32_t st_status;
        DB_LSN st_next_lsn;
        DB_LSN st_waiting_lsn;

        u_int32_t st_dupmasters;

        int st_env_id;
        int st_env_priority;
        u_int32_t st_gen;
        u_int32_t st_in_recovery;
        u_int32_t st_log_duplicated;
        u_int32_t st_log_queued;
        u_int32_t st_log_queued_max;
        u_int32_t st_log_queued_total;
        u_int32_t st_log_records;
        u_int32_t st_log_requested;
        int st_master;
        u_int32_t st_master_changes;
        u_int32_t st_msgs_badgen;
        u_int32_t st_msgs_processed;
        u_int32_t st_msgs_recover;

        u_int32_t st_msgs_send_failures;
        u_int32_t st_msgs_sent;
        u_int32_t st_newsites;
        int st_nsites;

        u_int32_t st_nthrottles;
        u_int32_t st_outdated;

        u_int32_t st_txns_applied;


        u_int32_t st_elections;
        u_int32_t st_elections_won;


        int st_election_cur_winner;
        u_int32_t st_election_gen;
        DB_LSN st_election_lsn;
        int st_election_nsites;
        int st_election_priority;
        int st_election_status;
        int st_election_tiebreaker;
        int st_election_votes;
};




typedef enum {
        DB_BTREE=1,
        DB_HASH=2,
        DB_RECNO=3,
        DB_QUEUE=4,
        DB_UNKNOWN=5
} DBTYPE;
# 1087 "/usr/local/BerkeleyDB.4.2/include/db.h"
struct __db {



        u_int32_t pgsize;


        int (*db_append_recno) (DB *, DBT *, db_recno_t);
        void (*db_feedback) (DB *, int, int);
        int (*dup_compare) (DB *, const DBT *, const DBT *);

        void *app_private;




        DB_ENV *dbenv;

        DBTYPE type;

        DB_MPOOLFILE *mpf;

        DB_MUTEX *mutexp;

        char *fname, *dname;
        u_int32_t open_flags;

        u_int8_t fileid[20];

        u_int32_t adj_fileid;


        FNAME *log_filename;

        db_pgno_t meta_pgno;
        u_int32_t lid;
        u_int32_t cur_lid;
        u_int32_t associate_lid;
        DB_LOCK handle_lock;

        long cl_id;

        time_t timestamp;




        DBT my_rskey;
        DBT my_rkey;
        DBT my_rdata;
# 1151 "/usr/local/BerkeleyDB.4.2/include/db.h"
        DB_FH *saved_open_fhp;
# 1161 "/usr/local/BerkeleyDB.4.2/include/db.h"
        struct {
                struct __db *le_next;
                struct __db **le_prev;
        } dblistlinks;
# 1175 "/usr/local/BerkeleyDB.4.2/include/db.h"
        struct __cq_fq {
                struct __dbc *tqh_first;
                struct __dbc **tqh_last;
        } free_queue;
        struct __cq_aq {
                struct __dbc *tqh_first;
                struct __dbc **tqh_last;
        } active_queue;
        struct __cq_jq {
                struct __dbc *tqh_first;
                struct __dbc **tqh_last;
        } join_queue;
# 1197 "/usr/local/BerkeleyDB.4.2/include/db.h"
        struct {
                struct __db *lh_first;
        } s_secondaries;
# 1213 "/usr/local/BerkeleyDB.4.2/include/db.h"
        struct {
                struct __db *le_next;
                struct __db **le_prev;
        } s_links;
        u_int32_t s_refcnt;


        int (*s_callback) (DB *, const DBT *, const DBT *, DBT *);


        DB *s_primary;


        void *api_internal;


        void *bt_internal;
        void *h_internal;
        void *q_internal;
        void *xa_internal;


        int (*associate) (DB *, DB_TXN *, DB *, int (*)(DB *, const DBT *, const DBT *, DBT *), u_int32_t);

        int (*close) (DB *, u_int32_t);
        int (*cursor) (DB *, DB_TXN *, DBC **, u_int32_t);
        int (*del) (DB *, DB_TXN *, DBT *, u_int32_t);
        void (*err) (DB *, int, const char *, ...);
        void (*errx) (DB *, const char *, ...);
        int (*fd) (DB *, int *);
        int (*get) (DB *, DB_TXN *, DBT *, DBT *, u_int32_t);
        int (*pget) (DB *, DB_TXN *, DBT *, DBT *, DBT *, u_int32_t);
        int (*get_byteswapped) (DB *, int *);
        int (*get_cachesize) (DB *, u_int32_t *, u_int32_t *, int *);
        int (*get_dbname) (DB *, const char **, const char **);
        int (*get_encrypt_flags) (DB *, u_int32_t *);
        int (*get_env) (DB *, DB_ENV **);
        void (*get_errfile) (DB *, FILE **);
        void (*get_errpfx) (DB *, const char **);
        int (*get_flags) (DB *, u_int32_t *);
        int (*get_lorder) (DB *, int *);
        int (*get_open_flags) (DB *, u_int32_t *);
        int (*get_pagesize) (DB *, u_int32_t *);
        int (*get_transactional) (DB *, int *);
        int (*get_type) (DB *, DBTYPE *);
        int (*join) (DB *, DBC **, DBC **, u_int32_t);
        int (*key_range) (DB *, DB_TXN *, DBT *, DB_KEY_RANGE *, u_int32_t);

        int (*open) (DB *, DB_TXN *, const char *, const char *, DBTYPE, u_int32_t, int);

        int (*put) (DB *, DB_TXN *, DBT *, DBT *, u_int32_t);
        int (*remove) (DB *, const char *, const char *, u_int32_t);
        int (*rename) (DB *, const char *, const char *, const char *, u_int32_t);

        int (*truncate) (DB *, DB_TXN *, u_int32_t *, u_int32_t);
        int (*set_append_recno) (DB *, int (*)(DB *, DBT *, db_recno_t));
        int (*set_alloc) (DB *, void *(*)(size_t), void *(*)(void *, size_t), void (*)(void *));

        int (*set_cachesize) (DB *, u_int32_t, u_int32_t, int);
        int (*set_dup_compare) (DB *, int (*)(DB *, const DBT *, const DBT *));

        int (*set_encrypt) (DB *, const char *, u_int32_t);
        void (*set_errcall) (DB *, void (*)(const char *, char *));
        void (*set_errfile) (DB *, FILE *);
        void (*set_errpfx) (DB *, const char *);
        int (*set_feedback) (DB *, void (*)(DB *, int, int));
        int (*set_flags) (DB *, u_int32_t);
        int (*set_lorder) (DB *, int);
        int (*set_pagesize) (DB *, u_int32_t);
        int (*set_paniccall) (DB *, void (*)(DB_ENV *, int));
        int (*stat) (DB *, void *, u_int32_t);
        int (*sync) (DB *, u_int32_t);
        int (*upgrade) (DB *, const char *, u_int32_t);
        int (*verify) (DB *, const char *, const char *, FILE *, u_int32_t);


        int (*get_bt_minkey) (DB *, u_int32_t *);
        int (*set_bt_compare) (DB *, int (*)(DB *, const DBT *, const DBT *));

        int (*set_bt_maxkey) (DB *, u_int32_t);
        int (*set_bt_minkey) (DB *, u_int32_t);
        int (*set_bt_prefix) (DB *, size_t (*)(DB *, const DBT *, const DBT *));


        int (*get_h_ffactor) (DB *, u_int32_t *);
        int (*get_h_nelem) (DB *, u_int32_t *);
        int (*set_h_ffactor) (DB *, u_int32_t);
        int (*set_h_hash) (DB *, u_int32_t (*)(DB *, const void *, u_int32_t));

        int (*set_h_nelem) (DB *, u_int32_t);

        int (*get_re_delim) (DB *, int *);
        int (*get_re_len) (DB *, u_int32_t *);
        int (*get_re_pad) (DB *, int *);
        int (*get_re_source) (DB *, const char **);
        int (*set_re_delim) (DB *, int);
        int (*set_re_len) (DB *, u_int32_t);
        int (*set_re_pad) (DB *, int);
        int (*set_re_source) (DB *, const char *);

        int (*get_q_extentsize) (DB *, u_int32_t *);
        int (*set_q_extentsize) (DB *, u_int32_t);

        int (*db_am_remove) (DB *, DB_TXN *, const char *, const char *, DB_LSN *);

        int (*db_am_rename) (DB *, DB_TXN *, const char *, const char *, const char *);






        int (*stored_get) (DB *, DB_TXN *, DBT *, DBT *, u_int32_t);
        int (*stored_close) (DB *, u_int32_t);





        u_int32_t am_ok;
# 1365 "/usr/local/BerkeleyDB.4.2/include/db.h"
        u_int32_t orig_flags;
        u_int32_t flags;
};
# 1432 "/usr/local/BerkeleyDB.4.2/include/db.h"
struct __dbc {
        DB *dbp;
        DB_TXN *txn;
# 1443 "/usr/local/BerkeleyDB.4.2/include/db.h"
        struct {
                DBC *tqe_next;
                DBC **tqe_prev;
        } links;
# 1459 "/usr/local/BerkeleyDB.4.2/include/db.h"
        DBT *rskey;
        DBT *rkey;
        DBT *rdata;

        DBT my_rskey;
        DBT my_rkey;
        DBT my_rdata;

        u_int32_t lid;
        u_int32_t locker;
        DBT lock_dbt;
        DB_LOCK_ILOCK lock;
        DB_LOCK mylock;

        long cl_id;

        DBTYPE dbtype;

        DBC_INTERNAL *internal;

        int (*c_close) (DBC *);
        int (*c_count) (DBC *, db_recno_t *, u_int32_t);
        int (*c_del) (DBC *, u_int32_t);
        int (*c_dup) (DBC *, DBC **, u_int32_t);
        int (*c_get) (DBC *, DBT *, DBT *, u_int32_t);
        int (*c_pget) (DBC *, DBT *, DBT *, DBT *, u_int32_t);
        int (*c_put) (DBC *, DBT *, DBT *, u_int32_t);


        int (*c_am_bulk) (DBC *, DBT *, u_int32_t);
        int (*c_am_close) (DBC *, db_pgno_t, int *);
        int (*c_am_del) (DBC *);
        int (*c_am_destroy) (DBC *);
        int (*c_am_get) (DBC *, DBT *, DBT *, u_int32_t, db_pgno_t *);
        int (*c_am_put) (DBC *, DBT *, DBT *, u_int32_t, db_pgno_t *);
        int (*c_am_writelock) (DBC *);
# 1508 "/usr/local/BerkeleyDB.4.2/include/db.h"
        u_int32_t flags;
};


struct __key_range {
        double less;
        double equal;
        double greater;
};


struct __db_bt_stat {
        u_int32_t bt_magic;
        u_int32_t bt_version;
        u_int32_t bt_metaflags;
        u_int32_t bt_nkeys;
        u_int32_t bt_ndata;
        u_int32_t bt_pagesize;
        u_int32_t bt_maxkey;
        u_int32_t bt_minkey;
        u_int32_t bt_re_len;
        u_int32_t bt_re_pad;
        u_int32_t bt_levels;
        u_int32_t bt_int_pg;
        u_int32_t bt_leaf_pg;
        u_int32_t bt_dup_pg;
        u_int32_t bt_over_pg;
        u_int32_t bt_free;
        u_int32_t bt_int_pgfree;
        u_int32_t bt_leaf_pgfree;
        u_int32_t bt_dup_pgfree;
        u_int32_t bt_over_pgfree;
};


struct __db_h_stat {
        u_int32_t hash_magic;
        u_int32_t hash_version;
        u_int32_t hash_metaflags;
        u_int32_t hash_nkeys;
        u_int32_t hash_ndata;
        u_int32_t hash_pagesize;
        u_int32_t hash_ffactor;
        u_int32_t hash_buckets;
        u_int32_t hash_free;
        u_int32_t hash_bfree;
        u_int32_t hash_bigpages;
        u_int32_t hash_big_bfree;
        u_int32_t hash_overflows;
        u_int32_t hash_ovfl_free;
        u_int32_t hash_dup;
        u_int32_t hash_dup_free;
};


struct __db_qam_stat {
        u_int32_t qs_magic;
        u_int32_t qs_version;
        u_int32_t qs_metaflags;
        u_int32_t qs_nkeys;
        u_int32_t qs_ndata;
        u_int32_t qs_pagesize;
        u_int32_t qs_extentsize;
        u_int32_t qs_pages;
        u_int32_t qs_re_len;
        u_int32_t qs_re_pad;
        u_int32_t qs_pgfree;
        u_int32_t qs_first_recno;
        u_int32_t qs_cur_recno;
};







struct __db_env {



        FILE *db_errfile;
        const char *db_errpfx;

        void (*db_errcall) (const char *, char *);
        void (*db_feedback) (DB_ENV *, int, int);
        void (*db_paniccall) (DB_ENV *, int);


        void *(*db_malloc) (size_t);
        void *(*db_realloc) (void *, size_t);
        void (*db_free) (void *);
# 1611 "/usr/local/BerkeleyDB.4.2/include/db.h"
        u_int32_t verbose;

        void *app_private;

        int (*app_dispatch)
            (DB_ENV *, DBT *, DB_LSN *, db_recops);


        u_int8_t *lk_conflicts;
        u_int32_t lk_modes;
        u_int32_t lk_max;
        u_int32_t lk_max_lockers;
        u_int32_t lk_max_objects;
        u_int32_t lk_detect;
        db_timeout_t lk_timeout;


        u_int32_t lg_bsize;
        u_int32_t lg_size;
        u_int32_t lg_regionmax;


        u_int32_t mp_gbytes;
        u_int32_t mp_bytes;
        size_t mp_size;
        int mp_ncache;
        size_t mp_mmapsize;
        int mp_maxwrite;
        int
                         mp_maxwrite_sleep;


        int rep_eid;
        int (*rep_send)
                            (DB_ENV *, const DBT *, const DBT *, const DB_LSN *, int, u_int32_t);



        u_int32_t tx_max;
        time_t tx_timestamp;
        db_timeout_t tx_timeout;





        char *db_home;
        char *db_log_dir;
        char *db_tmp_dir;

        char **db_data_dir;
        int data_cnt;
        int data_next;

        int db_mode;
        u_int32_t open_flags;

        void *reginfo;
        DB_FH *lockfhp;

        int (**recover_dtab)
                            (DB_ENV *, DBT *, DB_LSN *, db_recops, void *);
        size_t recover_dtab_size;


        void *cl_handle;
        long cl_id;

        int db_ref;

        long shm_key;
        u_int32_t tas_spins;
# 1697 "/usr/local/BerkeleyDB.4.2/include/db.h"
        DB_MUTEX *dblist_mutexp;
        struct {
                struct __db *lh_first;
        } dblist;
# 1710 "/usr/local/BerkeleyDB.4.2/include/db.h"
        struct {
                struct __db_env *tqe_next;
                struct __db_env **tqe_prev;
        } links;
        struct __xa_txn {
                struct __db_txn *tqh_first;
                struct __db_txn **tqh_last;
        } xa_txn;
        int xa_rmid;


        void *api1_internal;
        void *api2_internal;

        char *passwd;
        size_t passwd_len;
        void *crypto_handle;
        DB_MUTEX *mt_mutexp;
        int mti;
        u_long *mt;


        int (*close) (DB_ENV *, u_int32_t);
        int (*dbremove) (DB_ENV *, DB_TXN *, const char *, const char *, u_int32_t);

        int (*dbrename) (DB_ENV *, DB_TXN *, const char *, const char *, const char *, u_int32_t);

        void (*err) (const DB_ENV *, int, const char *, ...);
        void (*errx) (const DB_ENV *, const char *, ...);
        int (*get_home) (DB_ENV *, const char **);
        int (*get_open_flags) (DB_ENV *, u_int32_t *);
        int (*open) (DB_ENV *, const char *, u_int32_t, int);
        int (*remove) (DB_ENV *, const char *, u_int32_t);
        int (*set_alloc) (DB_ENV *, void *(*)(size_t), void *(*)(void *, size_t), void (*)(void *));

        int (*set_app_dispatch) (DB_ENV *, int (*)(DB_ENV *, DBT *, DB_LSN *, db_recops));

        int (*get_data_dirs) (DB_ENV *, const char ***);
        int (*set_data_dir) (DB_ENV *, const char *);
        int (*get_encrypt_flags) (DB_ENV *, u_int32_t *);
        int (*set_encrypt) (DB_ENV *, const char *, u_int32_t);
        void (*set_errcall) (DB_ENV *, void (*)(const char *, char *));
        void (*get_errfile) (DB_ENV *, FILE **);
        void (*set_errfile) (DB_ENV *, FILE *);
        void (*get_errpfx) (DB_ENV *, const char **);
        void (*set_errpfx) (DB_ENV *, const char *);
        int (*set_feedback) (DB_ENV *, void (*)(DB_ENV *, int, int));
        int (*get_flags) (DB_ENV *, u_int32_t *);
        int (*set_flags) (DB_ENV *, u_int32_t, int);
        int (*set_paniccall) (DB_ENV *, void (*)(DB_ENV *, int));
        int (*set_rpc_server) (DB_ENV *, void *, const char *, long, long, u_int32_t);

        int (*get_shm_key) (DB_ENV *, long *);
        int (*set_shm_key) (DB_ENV *, long);
        int (*get_tas_spins) (DB_ENV *, u_int32_t *);
        int (*set_tas_spins) (DB_ENV *, u_int32_t);
        int (*get_tmp_dir) (DB_ENV *, const char **);
        int (*set_tmp_dir) (DB_ENV *, const char *);
        int (*get_verbose) (DB_ENV *, u_int32_t, int *);
        int (*set_verbose) (DB_ENV *, u_int32_t, int);

        void *lg_handle;
        int (*get_lg_bsize) (DB_ENV *, u_int32_t *);
        int (*set_lg_bsize) (DB_ENV *, u_int32_t);
        int (*get_lg_dir) (DB_ENV *, const char **);
        int (*set_lg_dir) (DB_ENV *, const char *);
        int (*get_lg_max) (DB_ENV *, u_int32_t *);
        int (*set_lg_max) (DB_ENV *, u_int32_t);
        int (*get_lg_regionmax) (DB_ENV *, u_int32_t *);
        int (*set_lg_regionmax) (DB_ENV *, u_int32_t);
        int (*log_archive) (DB_ENV *, char **[], u_int32_t);
        int (*log_cursor) (DB_ENV *, DB_LOGC **, u_int32_t);
        int (*log_file) (DB_ENV *, const DB_LSN *, char *, size_t);
        int (*log_flush) (DB_ENV *, const DB_LSN *);
        int (*log_put) (DB_ENV *, DB_LSN *, const DBT *, u_int32_t);
        int (*log_stat) (DB_ENV *, DB_LOG_STAT **, u_int32_t);

        void *lk_handle;
        int (*get_lk_conflicts) (DB_ENV *, const u_int8_t **, int *);
        int (*set_lk_conflicts) (DB_ENV *, u_int8_t *, int);
        int (*get_lk_detect) (DB_ENV *, u_int32_t *);
        int (*set_lk_detect) (DB_ENV *, u_int32_t);
        int (*set_lk_max) (DB_ENV *, u_int32_t);
        int (*get_lk_max_locks) (DB_ENV *, u_int32_t *);
        int (*set_lk_max_locks) (DB_ENV *, u_int32_t);
        int (*get_lk_max_lockers) (DB_ENV *, u_int32_t *);
        int (*set_lk_max_lockers) (DB_ENV *, u_int32_t);
        int (*get_lk_max_objects) (DB_ENV *, u_int32_t *);
        int (*set_lk_max_objects) (DB_ENV *, u_int32_t);
        int (*lock_detect) (DB_ENV *, u_int32_t, u_int32_t, int *);
        int (*lock_dump_region) (DB_ENV *, const char *, FILE *);
        int (*lock_get) (DB_ENV *, u_int32_t, u_int32_t, const DBT *, db_lockmode_t, DB_LOCK *);

        int (*lock_put) (DB_ENV *, DB_LOCK *);
        int (*lock_id) (DB_ENV *, u_int32_t *);
        int (*lock_id_free) (DB_ENV *, u_int32_t);
        int (*lock_stat) (DB_ENV *, DB_LOCK_STAT **, u_int32_t);
        int (*lock_vec) (DB_ENV *, u_int32_t, u_int32_t, DB_LOCKREQ *, int, DB_LOCKREQ **);


        void *mp_handle;
        int (*get_cachesize) (DB_ENV *, u_int32_t *, u_int32_t *, int *);
        int (*set_cachesize) (DB_ENV *, u_int32_t, u_int32_t, int);
        int (*get_mp_mmapsize) (DB_ENV *, size_t *);
        int (*set_mp_mmapsize) (DB_ENV *, size_t);
        int (*get_mp_maxwrite) (DB_ENV *, int *, int *);
        int (*set_mp_maxwrite) (DB_ENV *, int, int);
        int (*memp_dump_region) (DB_ENV *, const char *, FILE *);
        int (*memp_fcreate) (DB_ENV *, DB_MPOOLFILE **, u_int32_t);
        int (*memp_register) (DB_ENV *, int, int (*)(DB_ENV *, db_pgno_t, void *, DBT *), int (*)(DB_ENV *, db_pgno_t, void *, DBT *));


        int (*memp_stat) (DB_ENV *, DB_MPOOL_STAT **, DB_MPOOL_FSTAT ***, u_int32_t);

        int (*memp_sync) (DB_ENV *, DB_LSN *);
        int (*memp_trickle) (DB_ENV *, int, int *);

        void *rep_handle;
        int (*rep_elect) (DB_ENV *, int, int, u_int32_t, int *);
        int (*rep_flush) (DB_ENV *);
        int (*rep_process_message) (DB_ENV *, DBT *, DBT *, int *, DB_LSN *);

        int (*rep_start) (DB_ENV *, DBT *, u_int32_t);
        int (*rep_stat) (DB_ENV *, DB_REP_STAT **, u_int32_t);
        int (*get_rep_limit) (DB_ENV *, u_int32_t *, u_int32_t *);
        int (*set_rep_limit) (DB_ENV *, u_int32_t, u_int32_t);
        int (*set_rep_request) (DB_ENV *, u_int32_t, u_int32_t);
        int (*set_rep_transport) (DB_ENV *, int, int (*) (DB_ENV *, const DBT *, const DBT *, const DB_LSN *, int, u_int32_t));



        void *tx_handle;
        int (*get_tx_max) (DB_ENV *, u_int32_t *);
        int (*set_tx_max) (DB_ENV *, u_int32_t);
        int (*get_tx_timestamp) (DB_ENV *, time_t *);
        int (*set_tx_timestamp) (DB_ENV *, time_t *);
        int (*txn_begin) (DB_ENV *, DB_TXN *, DB_TXN **, u_int32_t);
        int (*txn_checkpoint) (DB_ENV *, u_int32_t, u_int32_t, u_int32_t);
        int (*txn_recover) (DB_ENV *, DB_PREPLIST *, long, long *, u_int32_t);

        int (*txn_stat) (DB_ENV *, DB_TXN_STAT **, u_int32_t);
        int (*get_timeout) (DB_ENV *, db_timeout_t *, u_int32_t);
        int (*set_timeout) (DB_ENV *, db_timeout_t, u_int32_t);
# 1863 "/usr/local/BerkeleyDB.4.2/include/db.h"
        int test_abort;
        int test_copy;
# 1892 "/usr/local/BerkeleyDB.4.2/include/db.h"
        u_int32_t flags;
};
# 1995 "/usr/local/BerkeleyDB.4.2/include/db.h"
int db_create (DB **, DB_ENV *, u_int32_t);
char *db_strerror (int);
int db_env_create (DB_ENV **, u_int32_t);
char *db_version (int *, int *, int *);
int log_compare (const DB_LSN *, const DB_LSN *);
int db_env_set_func_close (int (*)(int));
int db_env_set_func_dirfree (void (*)(char **, int));
int db_env_set_func_dirlist (int (*)(const char *, char ***, int *));
int db_env_set_func_exists (int (*)(const char *, int *));
int db_env_set_func_free (void (*)(void *));
int db_env_set_func_fsync (int (*)(int));
int db_env_set_func_ioinfo (int (*)(const char *, int, u_int32_t *, u_int32_t *, u_int32_t *));
int db_env_set_func_malloc (void *(*)(size_t));
int db_env_set_func_map (int (*)(char *, size_t, int, int, void **));
int db_env_set_func_open (int (*)(const char *, int, ...));
int db_env_set_func_read (ssize_t (*)(int, void *, size_t));
int db_env_set_func_realloc (void *(*)(void *, size_t));
int db_env_set_func_rename (int (*)(const char *, const char *));
int db_env_set_func_seek (int (*)(int, size_t, db_pgno_t, u_int32_t, int, int));
int db_env_set_func_sleep (int (*)(u_long, u_long));
int db_env_set_func_unlink (int (*)(const char *));
int db_env_set_func_unmap (int (*)(void *, size_t));
int db_env_set_func_write (ssize_t (*)(int, const void *, size_t));
int db_env_set_func_yield (int (*)(void));
# 25 "dbexp.h" 2

struct dbenv {
  char *home;
  int lockfd;
  DB_ENV *e;
  int txnflag;
};
typedef struct dbenv dbenv;
struct dbexp {
  dbenv *dbe;
  char *path;
  DB *db;
  DB *exp;
};
typedef struct dbexp dbexp;
dbenv *dbenv_alloc (const char *path);
void dbenv_free (dbenv *dbe);
int dbenv_txn (DB_TXN **tid, dbenv *dbe);
int dbenv_commit (DB_TXN *tid);
int dbexp_clean (dbexp *dbx);
int dbexp_free (dbexp *dbx, int sync);
dbexp *dbexp_alloc (dbenv *dbe, const char *path, int rdonly);
# 26 "dbutil.c" 2
# 1 "/usr/include/ctype.h" 1 3 4
# 69 "/usr/include/ctype.h" 3 4
# 1 "/usr/include/runetype.h" 1 3 4
# 104 "/usr/include/runetype.h" 3 4
typedef struct {
        rune_t min;
        rune_t max;
        rune_t map;
        unsigned long *types;
} _RuneEntry;

typedef struct {
        int nranges;
        _RuneEntry *ranges;
} _RuneRange;

typedef struct {
        char magic[8];
        char encoding[32];

        rune_t (*sgetrune)
           (const char *, size_t, char const **);
        int (*sputrune)
           (rune_t, char *, size_t, char **);
        rune_t invalid_rune;

        unsigned long runetype[(1 <<8 )];
        rune_t maplower[(1 <<8 )];
        rune_t mapupper[(1 <<8 )];






        _RuneRange runetype_ext;
        _RuneRange maplower_ext;
        _RuneRange mapupper_ext;

        void *variable;
        int variable_len;
} _RuneLocale;




extern _RuneLocale _DefaultRuneLocale;
extern _RuneLocale *_CurrentRuneLocale;

# 70 "/usr/include/ctype.h" 2 3 4
# 112 "/usr/include/ctype.h" 3 4

int isalnum(int);
int isalpha(int);
int iscntrl(int);
int isdigit(int);
int isgraph(int);
int islower(int);
int isprint(int);
int ispunct(int);
int isspace(int);
int isupper(int);
int isxdigit(int);
int tolower(int);
int toupper(int);


int digittoint(int);
int isascii(int);
int isblank(int);
int ishexnumber(int);
int isideogram(int);
int isnumber(int);
int isphonogram(int);
int isrune(int);
int isspecial(int);
int toascii(int);


# 170 "/usr/include/ctype.h" 3 4

unsigned long ___runetype(int);
int ___tolower(int);
int ___toupper(int);

# 192 "/usr/include/ctype.h" 3 4
static __inline int
__maskrune(int _c, unsigned long _f)
{
        return ((_c < 0 || _c >= (1 <<8 )) ? ___runetype(_c) :
                _CurrentRuneLocale->runetype[_c]) & _f;
}

static __inline int
__istype(int c, unsigned long f)
{
        return !!(__maskrune(c, f));
}

static __inline int
__isctype(int _c, unsigned long _f)
{
        return (_c < 0 || _c >= (1 <<8 )) ? 0 :
                !!(_DefaultRuneLocale.runetype[_c] & _f);
}

static __inline int
__toupper(int _c)
{
        return (_c < 0 || _c >= (1 <<8 )) ? ___toupper(_c) :
                _CurrentRuneLocale->mapupper[_c];
}

static __inline int
__tolower(int _c)
{
        return (_c < 0 || _c >= (1 <<8 )) ? ___tolower(_c) :
                _CurrentRuneLocale->maplower[_c];
}
# 27 "dbutil.c" 2
# 1 "../libasync/getopt_long.h" 1
# 17 "../libasync/getopt_long.h"
enum {
  no_argument = 0,
  required_argument = 1,
  optional_argument = 2,
};

struct option {
  const char *name;
  int has_arg;
  int *flag;
  int val;
};

int getopt_long (int argc, char *const *argv, const char *optstring,
                 const struct option *longopts, int *longindex);
int getopt_long_only (int argc, char *const *argv, const char *optstring,
                      const struct option *longopts, int *longindex);
# 28 "dbutil.c" 2

char *progname;
dbenv *env;

static char *
_do_dump_time (time_t t)
{
  static char buf[80];
  int n;
  if ((u_int32_t) t == 0xffffffff)
    return "";
  n = strftime (buf, sizeof (buf) - 1, " (%a %b %e %Y %H:%M:%S)",
                localtime (&t));
  if (n)
    return buf;
  else
    return "";
}
int
do_dump (const char *db)
{
  dbexp *dbx;
  DBC *c;
  int err;
  DBT k, v;
  int ret = 0;

  if (!(dbx = dbexp_alloc (env, db, 1)))
    return 2;

  err = dbx->db->cursor (dbx->db, 0, &c, 0);
  if (err) {
    fprintf ((&__sF[2]), "%s; %s\n", db, db_strerror (err));
    dbexp_free (dbx, 0);
    return 2;
  }

  memset((&k), 0, (sizeof (k)));
  memset((&v), 0, (sizeof (v)));

  err = c->c_get (c, &k, &v, 9);
  while (!err) {
    if (v.size > 4) {
      time_t t = getint (v.data);
      printf ("%.*s %.*s%s\n", (int) k.size, (char *) k.data,
              (int) v.size - 4, (char *) v.data + 4,
              _do_dump_time (t));
    }
    err = c->c_get (c, &k, &v, 18);
  }
  if (err && err != (-30990)) {
    fprintf ((&__sF[2]), "%s; %s\n", db, db_strerror (err));
    ret = 2;
  }

  c->c_close (c);
  dbexp_free (dbx, 0);

  return ret;
}

int
do_update (const char *db, const char *key, const char *val, int opt_n,
           const char *opt_expire)
{
  dbexp *dbx;
  DBT k, v;
  int ret = 0;
  int err;
  long exp;

  if (!(dbx = dbexp_alloc (env, db, 0)) || dbexp_clean (dbx))
    return 2;

  memset((&k), 0, (sizeof (k)));
  k.data = (void *) key;
  k.size = strlen (key);

  memset((&v), 0, (sizeof (v)));
  v.size = 4 + strlen (val);
  v.data = xmalloc (v.size + 1);
  if (opt_expire && (exp = parse_expire (opt_expire, time (0))) != -1)
    putint (v.data, exp);
  else
    putint (v.data, 0xffffffff);
  strcpy ((char *) v.data + 4, val);

  err = dbx->db->put (dbx->db, 0, &k, &v,
                      dbx->dbe->txnflag | (opt_n ? 22 : 0));
  if (err == (-30996))
    ret = 1;
  else if (err) {
    fprintf ((&__sF[2]), "%s; %s\n", db, db_strerror (err));
    ret = 2;
  }

  err = dbexp_free (dbx, 1);
  if (err && ret < 2) {
    fprintf ((&__sF[2]), "%s; %s\n", db, db_strerror (err));
    ret = 2;
  }

  return ret;
}

int
do_query (const char *db, const char *key, int opt_t, const char *opt_expire)
{
  dbexp *dbx;
  DBT k, v;
  int err;
  u_int32_t now = time (0);

  if (!(dbx = dbexp_alloc (env, db, !opt_expire))
      || (opt_expire && dbexp_clean (dbx)))
    return 2;

  memset((&k), 0, (sizeof (k)));
  k.data = (void *) key;
  k.size = strlen (key);
  memset((&v), 0, (sizeof (v)));
  err = dbx->db->get (dbx->db, 0, &k, &v, 0);
  if (err == (-30990)) {
    dbexp_free (dbx, 0);
    return 1;
  }
  else if (err) {
    fprintf ((&__sF[2]), "%s: %s\n", db, db_strerror (err));
    dbexp_free (dbx, 0);
    return 2;
  }
  else if (v.size < 4) {
    fprintf ((&__sF[2]), "%s: record too short\n", db);
    dbexp_free (dbx, 0);
    return 2;
  }

  if (now > getint (v.data)) {
    dbexp_free (dbx, !!opt_expire);
    return 1;
  }

  if (opt_t)
    printf ("%lu\n", (unsigned long) getint (v.data));
  else
    printf ("%.*s\n", (int) (v.size - 4), (char *) v.data + 4);

  if (opt_expire) {
    long exp = parse_expire (opt_expire, time (0));
    if (exp != -1) {
      putint (v.data, exp);
      v.size = 4;
      v.dlen = 4;
      v.flags |= 0x008;
      err = dbx->db->put (dbx->db, 0, &k, &v, dbx->dbe->txnflag);
      if (err)
        fprintf ((&__sF[2]), "%s; %s\n", dbx->path, db_strerror (err));
    }
    else
      opt_expire = 0;
  }

  err = dbexp_free (dbx, !!opt_expire);
  if (err) {
    fprintf ((&__sF[2]), "%s; %s\n", dbx->path, db_strerror (err));
    return 2;
  }
  return 0;
}

int
do_delete (const char *db, const char *key)
{
  dbexp *dbx;
  DBT k;
  int ret = 0;
  int err;

  if (!(dbx = dbexp_alloc (env, db, 0)) || dbexp_clean (dbx))
    return 2;

  memset((&k), 0, (sizeof (k)));
  k.data = (void *) key;
  k.size = strlen (key);

  err = dbx->db->del (dbx->db, 0, &k, dbx->dbe->txnflag);
  if (err == (-30990))
    ret = 1;
  else if (err) {
    fprintf ((&__sF[2]), "%s; %s\n", db, db_strerror (err));
    ret = 2;
  }

  err = dbexp_free (dbx, 1);
  if (err) {
    fprintf ((&__sF[2]), "%s; %s\n", dbx->path, db_strerror (err));
    return 2;
  }
  return 0;
}

static void usage (void) __attribute__ ((noreturn));
static void
usage (void)
{
  fprintf ((&__sF[2]), "usage: %s options {-d | --dump} db\n",
           progname);
  fprintf ((&__sF[2]), "       %s options {-q | --query}"
           " [-t] db key\n", progname);
  fprintf ((&__sF[2]), "       %s options {-u | --update}"
           " [-n] db key [value]\n", progname);
  fprintf ((&__sF[2]), "       %s options {-x | --delete} db key\n",
           progname);
  fprintf ((&__sF[2]), "       %s -t\n", progname);
  fprintf ((&__sF[2]), "options are:\n"
           "  --dbhome=DB_HOME  Specify directory for DB log files\n"
           "  --expire=date     Specify timestamp for expiration\n");
  exit (1);
}


int
main (int argc, char **argv)
{
  int mode = 0;
  struct option o[] = {
    { "version", no_argument, &mode, 'v' },
    { "dbhome", required_argument, 0, 0x101 },
    { "dump", no_argument, 0, 'd' },
    { "query", no_argument, 0, 'q' },
    { "update", no_argument, 0, 'u' },
    { "delete", no_argument, 0, 'x' },
    { "expire", required_argument, 0, 'e' },
    { 0, 0, 0, 0 }
  };
  int c;
  int opt_n = 0, opt_t = 0;
  int ret = 0;
  char *opt_expire = 0;
  char *dbenvdir = getenv ("DB_HOME");

  progname = strrchr (argv[0], '/');
  if (progname)
    progname++;
  else
    progname = argv[0];

  while ((c = getopt_long (argc, argv, "dquxnte", o, 0)) != -1)
    switch (c) {
    case 0:
      break;
    case 'e':
      opt_expire = optarg;
      break;
    case 'n':
      opt_n = 1;
      break;
    case 't':
      opt_t = 1;
      break;
    case 'd':
    case 'q':
    case 'u':
    case 'x':
      if (mode)
        usage ();
      mode = c;
      break;
    case 0x101:
      dbenvdir = optarg;
      break;
    default:
      usage ();
    }

  if (mode == 'v') {
    fprintf ((&__sF[2]), "%s (Mail Avenger) %s\n"
             "Copyright (C) 2004 David Mazieres\n"
             "This program comes with NO WARRANTY,"
             " to the extent permitted by law.\n"
             "You may redistribute it under the terms of"
             " the GNU General Public License;\n"
             "see the file named COPYING for details.\n",
             progname, "0.4");
    exit (0);
  }

  if (opt_n && mode != 'u')
    usage ();
  if (opt_t && !mode) {
    if (optind + 1 == argc) {
      long exp = parse_expire (argv[optind], time (0));
      if (exp == -1)
        exit (2);
      printf ("%lu\n", exp);
    }
    else if (optind == argc)
      printf ("%lu\n", (unsigned long) time (0));
    else
      usage ();
    exit (0);
  }
  if (opt_t && mode != 'q')
    usage ();

  env = dbenv_alloc (dbenvdir);
  if (!env)
    exit (2);

  switch (mode) {
  case 'd':
    if (argc != optind + 1)
      usage ();
    ret = do_dump (argv[optind]);
    break;
  case 'q':
    if (argc != optind + 2)
      usage ();
    ret = do_query (argv[optind], argv[optind+1], opt_t, opt_expire);
    break;
  case 'u':
    if (argc < optind + 2 || argc > optind + 3)
      usage ();
    ret = do_update (argv[optind], argv[optind+1],
                     argc < optind + 3 ? "" : argv[optind+2], opt_n,
                     opt_expire);
    break;
  case 'x':
    if (argc != optind + 2)
      usage ();
    ret = do_delete (argv[optind], argv[optind+1]);
    break;
  default:
    usage ();
  }

  dbenv_free (env);

  return ret;
}
