
#ifndef SYSTEM_CALL_CONTROLOR
#define SYSTEM_CALL_CONTROLOR

#include <sys/syscall.h>

int LANG_CV[256] = {0,1,2,5,9,11,12,21,59,63,89,158,231,240, 8, SYS_time, SYS_read, SYS_uname, SYS_write, SYS_open,
		SYS_close, SYS_execve, SYS_access, SYS_brk, SYS_munmap, SYS_mprotect,
		SYS_mmap, SYS_fstat, SYS_set_thread_area, 252, SYS_arch_prctl, 231, 0 };

#endif