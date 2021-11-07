# 1 "armor.c"
#pragma GCC set_debug_pwd "/Users/rgrimm/Desktop/avenger-0.4/util"
# 1 "<built-in>"
# 1 "<command line>"
# 1 "armor.c"
# 24 "armor.c"
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
# 25 "armor.c" 2

static const char b2a32[32] = {
  'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h',
  'i', 'j', 'k', 'm', 'n', 'p', 'q', 'r',
  's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
  '2', '3', '4', '5', '6', '7', '8', '9',
};

static const signed char a2b32[256] = {
  -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
  -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
  -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
  -1, -1, 24, 25, 26, 27, 28, 29, 30, 31, -1, -1, -1, -1, -1, -1,
  -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, -1, 11, 12, -1,
  13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, -1, -1, -1, -1, -1,
  -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, -1, 11, 12, -1,
  13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, -1, -1, -1, -1, -1,
  -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
  -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
  -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
  -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
  -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
  -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
  -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
  -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
};

static const int b2a32rem[5] = {0, 2, 4, 5, 7};
static const int a2b32rem[8] = {0, -1, 1, -1, 2, 3, -1, 4};
# 63 "armor.c"
char *
armor32 (const void *dp, size_t dl)
{
  const u_char *p = dp;
  int rem = dl % 5;
  const u_char *e = p + (dl - rem);
  size_t reslen = (dl / 5) * 8 + b2a32rem[rem];
  char *res = malloc (reslen + 1);
  char *d = res;

  if (!res)
    return 0;

  while (p < e) {
    d[0] = b2a32[p[0] >> 3];
    d[1] = b2a32[(p[0] & 0x7) << 2 | p[1] >> 6];
    d[2] = b2a32[p[1] >> 1 & 0x1f];
    d[3] = b2a32[(p[1] & 0x1) << 4 | p[2] >> 4];
    d[4] = b2a32[(p[2] & 0xf) << 1 | p[3] >> 7];
    d[5] = b2a32[p[3] >> 2 & 0x1f];
    d[6] = b2a32[(p[3] & 0x3) << 3 | p[4] >> 5];
    d[7] = b2a32[p[4] & 0x1f];
    p += 5;
    d += 8;
  }

  switch (rem) {
  case 4:
    d[6] = b2a32[(p[3] & 0x3) << 3];
    d[5] = b2a32[p[3] >> 2 & 0x1f];
    d[4] = b2a32[(p[2] & 0xf) << 1 | p[3] >> 7];
    d[3] = b2a32[(p[1] & 0x1) << 4 | p[2] >> 4];
    d[2] = b2a32[p[1] >> 1 & 0x1f];
    d[1] = b2a32[(p[0] & 0x7) << 2 | p[1] >> 6];
    d[0] = b2a32[p[0] >> 3];
    d += 7;
    break;
  case 3:
    d[4] = b2a32[(p[2] & 0xf) << 1];
    d[3] = b2a32[(p[1] & 0x1) << 4 | p[2] >> 4];
    d[2] = b2a32[p[1] >> 1 & 0x1f];
    d[1] = b2a32[(p[0] & 0x7) << 2 | p[1] >> 6];
    d[0] = b2a32[p[0] >> 3];
    d += 5;
    break;
  case 2:
    d[3] = b2a32[(p[1] & 0x1) << 4];
    d[2] = b2a32[p[1] >> 1 & 0x1f];
    d[1] = b2a32[(p[0] & 0x7) << 2 | p[1] >> 6];
    d[0] = b2a32[p[0] >> 3];
    d += 4;
    break;
  case 1:
    d[1] = b2a32[(p[0] & 0x7) << 2];
    d[0] = b2a32[p[0] >> 3];
    d += 2;
    break;
  }

  ((void) ((d == res + reslen) ? 0 : (__eprintf ("%s:%u: failed assertion `%s'\n", "armor.c", 122, "d == res + reslen"), 0)));
  *d = '\0';
  return res;
}

ssize_t
armor32len (const char *_s)
{
  const u_char *s = (const u_char *) _s;
  const u_char *p = s;
  size_t len;
  while (a2b32[*p] >= 0)
    p++;
  len = p - s;
  return a2b32rem[len & 7] < 0 ? -1 : len;
}

ssize_t
dearmor32len (const char *s)
{
  ssize_t len = armor32len (s);
  return len < 0 ? -1 : (len >> 3) * 5 + a2b32rem[len & 7];
}

ssize_t
dearmor32 (void *out, const char *_s)
{
  const u_char *s = (const u_char *) _s;
  ssize_t len = armor32len (_s);
  int rem = a2b32rem [len & 7];
  size_t outlen = (len >> 3) * 5 + rem;
  char *d = out;
  int c0, c1, c2, c3, c4, c5, c6, c7;
  const u_char *e;

  if (rem < 0)
    return -1;
  if (len <= 0)
    return 0;

  for (e = s + (len & ~7); s < e; s += 8, d += 5) {
    c0 = a2b32[s[0]];
    c1 = a2b32[s[1]];
    d[0] = c0 << 3 | c1 >> 2;
    c2 = a2b32[s[2]];
    c3 = a2b32[s[3]];
    d[1] = c1 << 6 | c2 << 1 | c3 >> 4;
    c4 = a2b32[s[4]];
    d[2] = c3 << 4 | c4 >> 1;
    c5 = a2b32[s[5]];
    c6 = a2b32[s[6]];
    d[3] = c4 << 7 | c5 << 2 | c6 >> 3;
    c7 = a2b32[s[7]];
    d[4] = c6 << 5 | c7;
  }

  if (rem >= 1) {
    c0 = a2b32[s[0]];
    c1 = a2b32[s[1]];
    *d++ = c0 << 3 | c1 >> 2;
    if (rem >= 2) {
      c2 = a2b32[s[2]];
      c3 = a2b32[s[3]];
      *d++ = c1 << 6 | c2 << 1 | c3 >> 4;
      if (rem >= 3) {
        c4 = a2b32[s[4]];
        *d++ = c3 << 4 | c4 >> 1;
        if (rem >= 4) {
          c5 = a2b32[s[5]];
          c6 = a2b32[s[6]];
          *d++ = c4 << 7 | c5 << 2 | c6 >> 3;
        }
      }
    }
  }

  ((void) ((d == (char *) out + outlen) ? 0 : (__eprintf ("%s:%u: failed assertion `%s'\n", "armor.c", 198, "d == (char *) out + outlen"), 0)));
  return len;
}


static const char b2a64[64] = {
  'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H',
  'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P',
  'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X',
  'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f',
  'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n',
  'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
  'w', 'x', 'y', 'z', '0', '1', '2', '3',
  '4', '5', '6', '7', '8', '9', '+', '/',
};

static const signed char a2b64[256] = {
  -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
  -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
  -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 62, -1, -1, -1, 63,
  52, 53, 54, 55, 56, 57, 58, 59, 60, 61, -1, -1, -1, -1, -1, -1,
  -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14,
  15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, -1, -1, -1, -1, -1,
  -1, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40,
  41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, -1, -1, -1, -1, -1,
  -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
  -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
  -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
  -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
  -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
  -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
  -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
  -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
};

char *
armor64 (const void *dp, size_t len)
{
  const u_char *p = dp;
  int rem = len % 3;
  const u_char *e = p + (len - rem);
  size_t reslen = ((len + 2) / 3) * 4;
  char *res = malloc (reslen + 1);
  char *d = res;

  while (p < e) {
    d[0] = b2a64[p[0] >> 2];
    d[1] = b2a64[(p[0] & 0x3) << 4 | p[1] >> 4];
    d[2] = b2a64[(p[1] & 0xf) << 2 | p[2] >> 6];
    d[3] = b2a64[p[2] & 0x3f];
    d += 4;
    p += 3;
  }

  switch (rem) {
  case 1:
    d[0] = b2a64[p[0] >> 2];
    d[1] = b2a64[(p[0] & 0x3) << 4];
    d[2] = d[3] = '=';
    d += 4;
    break;
  case 2:
    d[0] = b2a64[p[0] >> 2];
    d[1] = b2a64[(p[0] & 0x3) << 4 | p[1] >> 4];
    d[2] = b2a64[(p[1] & 0xf) << 2];
    d[3] = '=';
    d += 4;
    break;
  }

  ((void) ((d == res + reslen) ? 0 : (__eprintf ("%s:%u: failed assertion `%s'\n", "armor.c", 268, "d == res + reslen"), 0)));
  *d = '\0';
  return res;
}

ssize_t
armor64len (const char *_s)
{
  const u_char *s = (const u_char *) _s;
  const u_char *p = s;
  size_t len;
  while (a2b64[*p] >= 0)
    p++;
  if (*p == '=')
    p++;
  if (*p == '=')
    p++;
  len = p - s;
  return (len & 3) ? -1 : len;
}

ssize_t
dearmor64len (const char *_s)
{
  const u_char *s = (const u_char *) _s;
  const u_char *p = s;
  size_t len;
  while (a2b64[*p] >= 0)
    p++;
  len = p - s;

  switch (len & 3) {
  case 0:
    return (len >> 2) * 3;
  case 2:
    return p[0] == '=' && p[1] == '=' ? (len >> 2) * 3 + 1 : -1;
  case 3:
    return p[0] == '=' ? (len >> 2) * 3 + 2 : -1;
  }
  return -1;
}

ssize_t
dearmor64 (void *out, const char *_s)
{
  const u_char *s = (const u_char *) _s;
  ssize_t outlen = dearmor64len (_s);
  ssize_t len = ((outlen + 2) / 3) * 4;
  char *d = out;
  int c0, c1, c2, c3;
  const u_char *e;

  if (outlen < 0)
    return -1;
  if (len <= 0)
    return len;

  for (e = s + len - 4; s < e; s += 4, d += 3) {
    c0 = a2b64[s[0]];
    c1 = a2b64[s[1]];
    d[0] = c0 << 2 | c1 >> 4;
    c2 = a2b64[s[2]];
    d[1] = c1 << 4 | c2 >> 2;
    c3 = a2b64[s[3]];
    d[2] = c2 << 6 | c3;
  }

  c0 = a2b64[s[0]];
  c1 = a2b64[s[1]];
  *d++ = c0 << 2 | c1 >> 4;
  if ((c2 = a2b64[s[2]]) >= 0) {
    *d++ = c1 << 4 | c2 >> 2;
    if ((c3 = a2b64[s[3]]) >= 0)
      *d++ = c2 << 6 | c3;
  }

  *d = '\0';
  return len;
}
