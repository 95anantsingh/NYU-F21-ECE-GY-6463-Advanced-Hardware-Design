/* Provide Declarations */
#include <stdarg.h>
#include <setjmp.h>
#include <limits.h>
#ifdef NEED_CBEAPINT
#include <autopilot_cbe.h>
#else
#define aesl_fopen fopen
#define aesl_freopen freopen
#define aesl_tmpfile tmpfile
#endif
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>
#ifdef __STRICT_ANSI__
#define inline __inline__
#define typeof __typeof__ 
#endif
#define __isoc99_fscanf fscanf
#define __isoc99_sscanf sscanf
#undef ferror
#undef feof
/* get a declaration for alloca */
#if defined(__CYGWIN__) || defined(__MINGW32__)
#define  alloca(x) __builtin_alloca((x))
#define _alloca(x) __builtin_alloca((x))
#elif defined(__APPLE__)
extern void *__builtin_alloca(unsigned long);
#define alloca(x) __builtin_alloca(x)
#define longjmp _longjmp
#define setjmp _setjmp
#elif defined(__sun__)
#if defined(__sparcv9)
extern void *__builtin_alloca(unsigned long);
#else
extern void *__builtin_alloca(unsigned int);
#endif
#define alloca(x) __builtin_alloca(x)
#elif defined(__FreeBSD__) || defined(__NetBSD__) || defined(__OpenBSD__) || defined(__DragonFly__) || defined(__arm__)
#define alloca(x) __builtin_alloca(x)
#elif defined(_MSC_VER)
#define inline _inline
#define alloca(x) _alloca(x)
#else
#include <alloca.h>
#endif

#ifndef __GNUC__  /* Can only support "linkonce" vars with GCC */
#define __attribute__(X)
#endif

#if defined(__GNUC__) && defined(__APPLE_CC__)
#define __EXTERNAL_WEAK__ __attribute__((weak_import))
#elif defined(__GNUC__)
#define __EXTERNAL_WEAK__ __attribute__((weak))
#else
#define __EXTERNAL_WEAK__
#endif

#if defined(__GNUC__) && (defined(__APPLE_CC__) || defined(__CYGWIN__) || defined(__MINGW32__))
#define __ATTRIBUTE_WEAK__
#elif defined(__GNUC__)
#define __ATTRIBUTE_WEAK__ __attribute__((weak))
#else
#define __ATTRIBUTE_WEAK__
#endif

#if defined(__GNUC__)
#define __HIDDEN__ __attribute__((visibility("hidden")))
#endif

#ifdef __GNUC__
#define LLVM_NAN(NanStr)   __builtin_nan(NanStr)   /* Double */
#define LLVM_NANF(NanStr)  __builtin_nanf(NanStr)  /* Float */
#define LLVM_NANS(NanStr)  __builtin_nans(NanStr)  /* Double */
#define LLVM_NANSF(NanStr) __builtin_nansf(NanStr) /* Float */
#define LLVM_INF           __builtin_inf()         /* Double */
#define LLVM_INFF          __builtin_inff()        /* Float */
#define LLVM_PREFETCH(addr,rw,locality) __builtin_prefetch(addr,rw,locality)
#define __ATTRIBUTE_CTOR__ __attribute__((constructor))
#define __ATTRIBUTE_DTOR__ __attribute__((destructor))
#define LLVM_ASM           __asm__
#else
#define LLVM_NAN(NanStr)   ((double)0.0)           /* Double */
#define LLVM_NANF(NanStr)  0.0F                    /* Float */
#define LLVM_NANS(NanStr)  ((double)0.0)           /* Double */
#define LLVM_NANSF(NanStr) 0.0F                    /* Float */
#define LLVM_INF           ((double)0.0)           /* Double */
#define LLVM_INFF          0.0F                    /* Float */
#define LLVM_PREFETCH(addr,rw,locality)            /* PREFETCH */
#define __ATTRIBUTE_CTOR__
#define __ATTRIBUTE_DTOR__
#define LLVM_ASM(X)
#endif

#if __GNUC__ < 4 /* Old GCC's, or compilers not GCC */ 
#define __builtin_stack_save() 0   /* not implemented */
#define __builtin_stack_restore(X) /* noop */
#endif

#if __GNUC__ && __LP64__ /* 128-bit integer types */
typedef int __attribute__((mode(TI))) llvmInt128;
typedef unsigned __attribute__((mode(TI))) llvmUInt128;
#endif

#define CODE_FOR_MAIN() /* Any target-specific code for main()*/

#ifndef __cplusplus
typedef unsigned char bool;
#endif


/* Support for floating point constants */
typedef unsigned long long ConstantDoubleTy;
typedef unsigned int        ConstantFloatTy;
typedef struct { unsigned long long f1; unsigned short f2; unsigned short pad[3]; } ConstantFP80Ty;
typedef struct { unsigned long long f1; unsigned long long f2; } ConstantFP128Ty;


/* Global Declarations */
/* Helper union for bitcasts */
typedef union {
  unsigned int Int32;
  unsigned long long Int64;
  float Float;
  double Double;
} llvmBitCastUnion;

/* External Global Variable Declarations */

/* Function Declarations */
double fmod(double, double);
float fmodf(float, float);
long double fmodl(long double, long double);
void LFSR(bool llvm_cbe_rstn, bool llvm_cbe_w_en, signed int llvm_cbe_d_in, signed int *llvm_cbe_d_out);
void Din( char *llvm_cbe_sel, signed int *llvm_cbe_d_in,  char *llvm_cbe_data_in);
void Dout( char *llvm_cbe_sel, signed int *llvm_cbe_d_out,  char *llvm_cbe_data_out);
void PRNumGen(bool llvm_cbe_rstn, bool llvm_cbe_get_random, bool llvm_cbe_load_seed,  char llvm_cbe_data_in,  char *llvm_cbe_data_out);


/* Global Variable Definitions and Initialization */
static unsigned int aesl_internal_LFSR_OC_rnum = 38177485u;
static unsigned char aesl_internal_PRNumGen_OC_in_cnt;
static unsigned char aesl_internal_PRNumGen_OC_out_cnt;
static unsigned int aesl_internal_PRNumGen_OC_d_in;
static unsigned int aesl_internal_PRNumGen_OC_d_out;


/* Function Bodies */
static inline int llvm_fcmp_ord(double X, double Y) { return X == X && Y == Y; }
static inline int llvm_fcmp_uno(double X, double Y) { return X != X || Y != Y; }
static inline int llvm_fcmp_ueq(double X, double Y) { return X == Y || llvm_fcmp_uno(X, Y); }
static inline int llvm_fcmp_une(double X, double Y) { return X != Y; }
static inline int llvm_fcmp_ult(double X, double Y) { return X <  Y || llvm_fcmp_uno(X, Y); }
static inline int llvm_fcmp_ugt(double X, double Y) { return X >  Y || llvm_fcmp_uno(X, Y); }
static inline int llvm_fcmp_ule(double X, double Y) { return X <= Y || llvm_fcmp_uno(X, Y); }
static inline int llvm_fcmp_uge(double X, double Y) { return X >= Y || llvm_fcmp_uno(X, Y); }
static inline int llvm_fcmp_oeq(double X, double Y) { return X == Y ; }
static inline int llvm_fcmp_one(double X, double Y) { return X != Y && llvm_fcmp_ord(X, Y); }
static inline int llvm_fcmp_olt(double X, double Y) { return X <  Y ; }
static inline int llvm_fcmp_ogt(double X, double Y) { return X >  Y ; }
static inline int llvm_fcmp_ole(double X, double Y) { return X <= Y ; }
static inline int llvm_fcmp_oge(double X, double Y) { return X >= Y ; }

void LFSR(bool llvm_cbe_rstn, bool llvm_cbe_w_en, signed int llvm_cbe_d_in, signed int *llvm_cbe_d_out) {
  static  unsigned long long aesl_llvm_cbe_1_count = 0;
  static  unsigned long long aesl_llvm_cbe_2_count = 0;
  static  unsigned long long aesl_llvm_cbe_3_count = 0;
  static  unsigned long long aesl_llvm_cbe_4_count = 0;
  static  unsigned long long aesl_llvm_cbe_5_count = 0;
  static  unsigned long long aesl_llvm_cbe_6_count = 0;
  static  unsigned long long aesl_llvm_cbe_7_count = 0;
  static  unsigned long long aesl_llvm_cbe_8_count = 0;
  static  unsigned long long aesl_llvm_cbe_9_count = 0;
  static  unsigned long long aesl_llvm_cbe_10_count = 0;
  static  unsigned long long aesl_llvm_cbe_11_count = 0;
  static  unsigned long long aesl_llvm_cbe_12_count = 0;
  static  unsigned long long aesl_llvm_cbe_13_count = 0;
  unsigned int llvm_cbe_tmp__1;
  static  unsigned long long aesl_llvm_cbe_14_count = 0;
  unsigned int llvm_cbe_tmp__2;
  static  unsigned long long aesl_llvm_cbe_15_count = 0;
  static  unsigned long long aesl_llvm_cbe_16_count = 0;
  static  unsigned long long aesl_llvm_cbe_17_count = 0;
  unsigned int llvm_cbe_tmp__3;
  static  unsigned long long aesl_llvm_cbe_18_count = 0;
  static  unsigned long long aesl_llvm_cbe_19_count = 0;
  unsigned int llvm_cbe_tmp__4;
  static  unsigned long long aesl_llvm_cbe_20_count = 0;
  static  unsigned long long aesl_llvm_cbe_21_count = 0;
  static  unsigned long long aesl_llvm_cbe_22_count = 0;
  unsigned int llvm_cbe_tmp__5;
  static  unsigned long long aesl_llvm_cbe_23_count = 0;
  static  unsigned long long aesl_llvm_cbe_24_count = 0;
  unsigned int llvm_cbe_tmp__6;
  static  unsigned long long aesl_llvm_cbe_25_count = 0;
  static  unsigned long long aesl_llvm_cbe_26_count = 0;
  static  unsigned long long aesl_llvm_cbe_27_count = 0;
  unsigned int llvm_cbe_tmp__7;
  static  unsigned long long aesl_llvm_cbe_28_count = 0;
  static  unsigned long long aesl_llvm_cbe_29_count = 0;
  unsigned int llvm_cbe_tmp__8;
  static  unsigned long long aesl_llvm_cbe_30_count = 0;
  static  unsigned long long aesl_llvm_cbe_31_count = 0;
  static  unsigned long long aesl_llvm_cbe_32_count = 0;
  unsigned int llvm_cbe_tmp__9;
  static  unsigned long long aesl_llvm_cbe_33_count = 0;
  static  unsigned long long aesl_llvm_cbe_34_count = 0;
  unsigned int llvm_cbe_tmp__10;
  static  unsigned long long aesl_llvm_cbe_35_count = 0;
  static  unsigned long long aesl_llvm_cbe_36_count = 0;
  static  unsigned long long aesl_llvm_cbe_37_count = 0;
  unsigned int llvm_cbe_tmp__11;
  static  unsigned long long aesl_llvm_cbe_38_count = 0;
  static  unsigned long long aesl_llvm_cbe_39_count = 0;
  unsigned int llvm_cbe_tmp__12;
  static  unsigned long long aesl_llvm_cbe_40_count = 0;
  static  unsigned long long aesl_llvm_cbe_41_count = 0;
  unsigned int llvm_cbe_tmp__13;
  static  unsigned long long aesl_llvm_cbe_42_count = 0;
  static  unsigned long long aesl_llvm_cbe_43_count = 0;
  unsigned int llvm_cbe_tmp__14;
  static  unsigned long long aesl_llvm_cbe_44_count = 0;
  unsigned int llvm_cbe_tmp__15;
  static  unsigned long long aesl_llvm_cbe_45_count = 0;
  static  unsigned long long aesl_llvm_cbe_46_count = 0;
  static  unsigned long long aesl_llvm_cbe_47_count = 0;
  static  unsigned long long aesl_llvm_cbe_48_count = 0;
  static  unsigned long long aesl_llvm_cbe_49_count = 0;
  static  unsigned long long aesl_llvm_cbe_50_count = 0;
  static  unsigned long long aesl_llvm_cbe_51_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @LFSR\n");
  if (llvm_cbe_rstn) {
    goto llvm_cbe_tmp__16;
  } else {
    goto llvm_cbe_tmp__17;
  }

llvm_cbe_tmp__16:
  if (llvm_cbe_w_en) {
    goto llvm_cbe_tmp__18;
  } else {
    goto llvm_cbe_tmp__19;
  }

llvm_cbe_tmp__18:
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%d_in, i32* @aesl_internal_LFSR.rnum, align 4, !dbg !6 for 0x%I64xth hint within @LFSR  --> \n", ++aesl_llvm_cbe_11_count);
  *(&aesl_internal_LFSR_OC_rnum) = llvm_cbe_d_in;
if (AESL_DEBUG_TRACE)
printf("\nd_in = 0x%X\n", llvm_cbe_d_in);
  goto llvm_cbe_tmp__20;

llvm_cbe_tmp__19:
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = load i32* @aesl_internal_LFSR.rnum, align 4, !dbg !7 for 0x%I64xth hint within @LFSR  --> \n", ++aesl_llvm_cbe_13_count);
  llvm_cbe_tmp__1 = (unsigned int )*(&aesl_internal_LFSR_OC_rnum);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__1);
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = and i32 %%4, -1940652031, !dbg !7 for 0x%I64xth hint within @LFSR  --> \n", ++aesl_llvm_cbe_14_count);
  llvm_cbe_tmp__2 = (unsigned int )llvm_cbe_tmp__1 & 2354315265u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__2);
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = lshr i32 %%5, 16, !dbg !8 for 0x%I64xth hint within @LFSR  --> \n", ++aesl_llvm_cbe_17_count);
  llvm_cbe_tmp__3 = (unsigned int )((unsigned int )(((unsigned int )(llvm_cbe_tmp__2&4294967295ull)) >> ((unsigned int )(16u&4294967295ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__3&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = or i32 %%6, %%5, !dbg !8 for 0x%I64xth hint within @LFSR  --> \n", ++aesl_llvm_cbe_19_count);
  llvm_cbe_tmp__4 = (unsigned int )llvm_cbe_tmp__3 | llvm_cbe_tmp__2;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__4);
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = lshr i32 %%7, 8, !dbg !8 for 0x%I64xth hint within @LFSR  --> \n", ++aesl_llvm_cbe_22_count);
  llvm_cbe_tmp__5 = (unsigned int )((unsigned int )(((unsigned int )(llvm_cbe_tmp__4&4294967295ull)) >> ((unsigned int )(8u&4294967295ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__5&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%9 = xor i32 %%8, %%7, !dbg !8 for 0x%I64xth hint within @LFSR  --> \n", ++aesl_llvm_cbe_24_count);
  llvm_cbe_tmp__6 = (unsigned int )llvm_cbe_tmp__5 ^ llvm_cbe_tmp__4;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__6);
if (AESL_DEBUG_TRACE)
printf("\n  %%10 = lshr i32 %%9, 4, !dbg !8 for 0x%I64xth hint within @LFSR  --> \n", ++aesl_llvm_cbe_27_count);
  llvm_cbe_tmp__7 = (unsigned int )((unsigned int )(((unsigned int )(llvm_cbe_tmp__6&4294967295ull)) >> ((unsigned int )(4u&4294967295ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__7&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%11 = xor i32 %%10, %%9, !dbg !8 for 0x%I64xth hint within @LFSR  --> \n", ++aesl_llvm_cbe_29_count);
  llvm_cbe_tmp__8 = (unsigned int )llvm_cbe_tmp__7 ^ llvm_cbe_tmp__6;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__8);
if (AESL_DEBUG_TRACE)
printf("\n  %%12 = lshr i32 %%11, 2, !dbg !8 for 0x%I64xth hint within @LFSR  --> \n", ++aesl_llvm_cbe_32_count);
  llvm_cbe_tmp__9 = (unsigned int )((unsigned int )(((unsigned int )(llvm_cbe_tmp__8&4294967295ull)) >> ((unsigned int )(2u&4294967295ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__9&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%13 = xor i32 %%12, %%11, !dbg !8 for 0x%I64xth hint within @LFSR  --> \n", ++aesl_llvm_cbe_34_count);
  llvm_cbe_tmp__10 = (unsigned int )llvm_cbe_tmp__9 ^ llvm_cbe_tmp__8;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__10);
if (AESL_DEBUG_TRACE)
printf("\n  %%14 = lshr i32 %%13, 1, !dbg !8 for 0x%I64xth hint within @LFSR  --> \n", ++aesl_llvm_cbe_37_count);
  llvm_cbe_tmp__11 = (unsigned int )((unsigned int )(((unsigned int )(llvm_cbe_tmp__10&4294967295ull)) >> ((unsigned int )(1u&4294967295ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__11&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%15 = xor i32 %%14, %%13, !dbg !8 for 0x%I64xth hint within @LFSR  --> \n", ++aesl_llvm_cbe_39_count);
  llvm_cbe_tmp__12 = (unsigned int )llvm_cbe_tmp__11 ^ llvm_cbe_tmp__10;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__12);
if (AESL_DEBUG_TRACE)
printf("\n  %%16 = lshr i32 %%4, 1, !dbg !8 for 0x%I64xth hint within @LFSR  --> \n", ++aesl_llvm_cbe_41_count);
  llvm_cbe_tmp__13 = (unsigned int )((unsigned int )(((unsigned int )(llvm_cbe_tmp__1&4294967295ull)) >> ((unsigned int )(1u&4294967295ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__13&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%17 = shl i32 %%15, 31, !dbg !8 for 0x%I64xth hint within @LFSR  --> \n", ++aesl_llvm_cbe_43_count);
  llvm_cbe_tmp__14 = (unsigned int )llvm_cbe_tmp__12 << 31u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__14);
if (AESL_DEBUG_TRACE)
printf("\n  %%18 = or i32 %%17, %%16, !dbg !8 for 0x%I64xth hint within @LFSR  --> \n", ++aesl_llvm_cbe_44_count);
  llvm_cbe_tmp__15 = (unsigned int )llvm_cbe_tmp__14 | llvm_cbe_tmp__13;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__15);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%18, i32* @aesl_internal_LFSR.rnum, align 4, !dbg !8 for 0x%I64xth hint within @LFSR  --> \n", ++aesl_llvm_cbe_45_count);
  *(&aesl_internal_LFSR_OC_rnum) = llvm_cbe_tmp__15;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__15);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%18, i32* %%d_out, align 4, !dbg !7 for 0x%I64xth hint within @LFSR  --> \n", ++aesl_llvm_cbe_46_count);
  *llvm_cbe_d_out = llvm_cbe_tmp__15;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__15);
  goto llvm_cbe_tmp__20;

llvm_cbe_tmp__20:
  goto llvm_cbe_tmp__21;

llvm_cbe_tmp__17:
if (AESL_DEBUG_TRACE)
printf("\n  store i32 38177485, i32* @aesl_internal_LFSR.rnum, align 4, !dbg !8 for 0x%I64xth hint within @LFSR  --> \n", ++aesl_llvm_cbe_49_count);
  *(&aesl_internal_LFSR_OC_rnum) = 38177485u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 38177485u);
  goto llvm_cbe_tmp__21;

llvm_cbe_tmp__21:
  if (AESL_DEBUG_TRACE)
      printf("\nEND @LFSR}\n");
  return;
}


void Din( char *llvm_cbe_sel, signed int *llvm_cbe_d_in,  char *llvm_cbe_data_in) {
  static  unsigned long long aesl_llvm_cbe_52_count = 0;
  static  unsigned long long aesl_llvm_cbe_53_count = 0;
  static  unsigned long long aesl_llvm_cbe_54_count = 0;
  static  unsigned long long aesl_llvm_cbe_55_count = 0;
  static  unsigned long long aesl_llvm_cbe_56_count = 0;
  static  unsigned long long aesl_llvm_cbe_57_count = 0;
  static  unsigned long long aesl_llvm_cbe_58_count = 0;
  static  unsigned long long aesl_llvm_cbe_59_count = 0;
  static  unsigned long long aesl_llvm_cbe_60_count = 0;
  static  unsigned long long aesl_llvm_cbe_61_count = 0;
  static  unsigned long long aesl_llvm_cbe_62_count = 0;
  static  unsigned long long aesl_llvm_cbe_63_count = 0;
  static  unsigned long long aesl_llvm_cbe_64_count = 0;
  static  unsigned long long aesl_llvm_cbe_65_count = 0;
  static  unsigned long long aesl_llvm_cbe_66_count = 0;
  static  unsigned long long aesl_llvm_cbe_67_count = 0;
  static  unsigned long long aesl_llvm_cbe_68_count = 0;
  static  unsigned long long aesl_llvm_cbe_69_count = 0;
  static  unsigned long long aesl_llvm_cbe_70_count = 0;
  unsigned char llvm_cbe_tmp__22;
  static  unsigned long long aesl_llvm_cbe_71_count = 0;
  static  unsigned long long aesl_llvm_cbe_72_count = 0;
  static  unsigned long long aesl_llvm_cbe_73_count = 0;
  unsigned char llvm_cbe_tmp__23;
  static  unsigned long long aesl_llvm_cbe_74_count = 0;
  unsigned int llvm_cbe_tmp__24;
  static  unsigned long long aesl_llvm_cbe_75_count = 0;
  static  unsigned long long aesl_llvm_cbe_76_count = 0;
  static  unsigned long long aesl_llvm_cbe_77_count = 0;
  static  unsigned long long aesl_llvm_cbe_78_count = 0;
  static  unsigned long long aesl_llvm_cbe_79_count = 0;
  unsigned int llvm_cbe_tmp__25;
  static  unsigned long long aesl_llvm_cbe_80_count = 0;
  unsigned char llvm_cbe_tmp__26;
  static  unsigned long long aesl_llvm_cbe_81_count = 0;
  unsigned int llvm_cbe_tmp__27;
  static  unsigned long long aesl_llvm_cbe_82_count = 0;
  unsigned int llvm_cbe_tmp__28;
  static  unsigned long long aesl_llvm_cbe_83_count = 0;
  unsigned int llvm_cbe_tmp__29;
  static  unsigned long long aesl_llvm_cbe_84_count = 0;
  static  unsigned long long aesl_llvm_cbe_85_count = 0;
  static  unsigned long long aesl_llvm_cbe_86_count = 0;
  static  unsigned long long aesl_llvm_cbe_87_count = 0;
  static  unsigned long long aesl_llvm_cbe_88_count = 0;
  unsigned int llvm_cbe_tmp__30;
  static  unsigned long long aesl_llvm_cbe_89_count = 0;
  unsigned char llvm_cbe_tmp__31;
  static  unsigned long long aesl_llvm_cbe_90_count = 0;
  unsigned int llvm_cbe_tmp__32;
  static  unsigned long long aesl_llvm_cbe_91_count = 0;
  unsigned int llvm_cbe_tmp__33;
  static  unsigned long long aesl_llvm_cbe_92_count = 0;
  unsigned int llvm_cbe_tmp__34;
  static  unsigned long long aesl_llvm_cbe_93_count = 0;
  static  unsigned long long aesl_llvm_cbe_94_count = 0;
  static  unsigned long long aesl_llvm_cbe_95_count = 0;
  static  unsigned long long aesl_llvm_cbe_96_count = 0;
  static  unsigned long long aesl_llvm_cbe_97_count = 0;
  unsigned int llvm_cbe_tmp__35;
  static  unsigned long long aesl_llvm_cbe_98_count = 0;
  unsigned char llvm_cbe_tmp__36;
  static  unsigned long long aesl_llvm_cbe_99_count = 0;
  unsigned int llvm_cbe_tmp__37;
  static  unsigned long long aesl_llvm_cbe_100_count = 0;
  unsigned int llvm_cbe_tmp__38;
  static  unsigned long long aesl_llvm_cbe_101_count = 0;
  unsigned int llvm_cbe_tmp__39;
  static  unsigned long long aesl_llvm_cbe_102_count = 0;
  static  unsigned long long aesl_llvm_cbe_103_count = 0;
  static  unsigned long long aesl_llvm_cbe_104_count = 0;
  static  unsigned long long aesl_llvm_cbe_105_count = 0;
  static  unsigned long long aesl_llvm_cbe_106_count = 0;
  static  unsigned long long aesl_llvm_cbe_107_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @Din\n");
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = load i3* %%sel, align 1, !dbg !6 for 0x%I64xth hint within @Din  --> \n", ++aesl_llvm_cbe_70_count);
  llvm_cbe_tmp__22 = (unsigned char )*llvm_cbe_sel;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__22);
  if (((llvm_cbe_tmp__22&7U) == (((unsigned char )0)&7U))) {
    goto llvm_cbe_tmp__40;
  } else {
    goto llvm_cbe_tmp__41;
  }

llvm_cbe_tmp__40:
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = load i8* %%data_in, align 1, !dbg !6 for 0x%I64xth hint within @Din  --> \n", ++aesl_llvm_cbe_73_count);
  llvm_cbe_tmp__23 = (unsigned char )*llvm_cbe_data_in;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__23);
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = zext i8 %%4 to i32, !dbg !6 for 0x%I64xth hint within @Din  --> \n", ++aesl_llvm_cbe_74_count);
  llvm_cbe_tmp__24 = (unsigned int )((unsigned int )(unsigned char )llvm_cbe_tmp__23&255U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__24);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%5, i32* %%d_in, align 4, !dbg !6 for 0x%I64xth hint within @Din  --> \n", ++aesl_llvm_cbe_75_count);
  *llvm_cbe_d_in = llvm_cbe_tmp__24;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__24);
  goto llvm_cbe_tmp__42;

llvm_cbe_tmp__41:
  if (((llvm_cbe_tmp__22&7U) == (((unsigned char )1)&7U))) {
    goto llvm_cbe_tmp__43;
  } else {
    goto llvm_cbe_tmp__44;
  }

llvm_cbe_tmp__43:
if (AESL_DEBUG_TRACE)
printf("\n  %%9 = load i32* %%d_in, align 4, !dbg !7 for 0x%I64xth hint within @Din  --> \n", ++aesl_llvm_cbe_79_count);
  llvm_cbe_tmp__25 = (unsigned int )*llvm_cbe_d_in;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__25);
if (AESL_DEBUG_TRACE)
printf("\n  %%10 = load i8* %%data_in, align 1, !dbg !7 for 0x%I64xth hint within @Din  --> \n", ++aesl_llvm_cbe_80_count);
  llvm_cbe_tmp__26 = (unsigned char )*llvm_cbe_data_in;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__26);
if (AESL_DEBUG_TRACE)
printf("\n  %%11 = zext i8 %%10 to i32, !dbg !7 for 0x%I64xth hint within @Din  --> \n", ++aesl_llvm_cbe_81_count);
  llvm_cbe_tmp__27 = (unsigned int )((unsigned int )(unsigned char )llvm_cbe_tmp__26&255U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__27);
if (AESL_DEBUG_TRACE)
printf("\n  %%12 = shl nuw nsw i32 %%11, 8, !dbg !7 for 0x%I64xth hint within @Din  --> \n", ++aesl_llvm_cbe_82_count);
  llvm_cbe_tmp__28 = (unsigned int )llvm_cbe_tmp__27 << 8u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__28);
if (AESL_DEBUG_TRACE)
printf("\n  %%13 = or i32 %%12, %%9, !dbg !7 for 0x%I64xth hint within @Din  --> \n", ++aesl_llvm_cbe_83_count);
  llvm_cbe_tmp__29 = (unsigned int )llvm_cbe_tmp__28 | llvm_cbe_tmp__25;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__29);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%13, i32* %%d_in, align 4, !dbg !7 for 0x%I64xth hint within @Din  --> \n", ++aesl_llvm_cbe_84_count);
  *llvm_cbe_d_in = llvm_cbe_tmp__29;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__29);
  goto llvm_cbe_tmp__45;

llvm_cbe_tmp__44:
  if (((llvm_cbe_tmp__22&7U) == (((unsigned char )2)&7U))) {
    goto llvm_cbe_tmp__46;
  } else {
    goto llvm_cbe_tmp__47;
  }

llvm_cbe_tmp__46:
if (AESL_DEBUG_TRACE)
printf("\n  %%17 = load i32* %%d_in, align 4, !dbg !7 for 0x%I64xth hint within @Din  --> \n", ++aesl_llvm_cbe_88_count);
  llvm_cbe_tmp__30 = (unsigned int )*llvm_cbe_d_in;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__30);
if (AESL_DEBUG_TRACE)
printf("\n  %%18 = load i8* %%data_in, align 1, !dbg !7 for 0x%I64xth hint within @Din  --> \n", ++aesl_llvm_cbe_89_count);
  llvm_cbe_tmp__31 = (unsigned char )*llvm_cbe_data_in;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__31);
if (AESL_DEBUG_TRACE)
printf("\n  %%19 = zext i8 %%18 to i32, !dbg !7 for 0x%I64xth hint within @Din  --> \n", ++aesl_llvm_cbe_90_count);
  llvm_cbe_tmp__32 = (unsigned int )((unsigned int )(unsigned char )llvm_cbe_tmp__31&255U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__32);
if (AESL_DEBUG_TRACE)
printf("\n  %%20 = shl nuw nsw i32 %%19, 16, !dbg !7 for 0x%I64xth hint within @Din  --> \n", ++aesl_llvm_cbe_91_count);
  llvm_cbe_tmp__33 = (unsigned int )llvm_cbe_tmp__32 << 16u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__33);
if (AESL_DEBUG_TRACE)
printf("\n  %%21 = or i32 %%20, %%17, !dbg !7 for 0x%I64xth hint within @Din  --> \n", ++aesl_llvm_cbe_92_count);
  llvm_cbe_tmp__34 = (unsigned int )llvm_cbe_tmp__33 | llvm_cbe_tmp__30;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__34);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%21, i32* %%d_in, align 4, !dbg !7 for 0x%I64xth hint within @Din  --> \n", ++aesl_llvm_cbe_93_count);
  *llvm_cbe_d_in = llvm_cbe_tmp__34;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__34);
  goto llvm_cbe_tmp__48;

llvm_cbe_tmp__47:
  if (((llvm_cbe_tmp__22&7U) == (((unsigned char )3)&7U))) {
    goto llvm_cbe_tmp__49;
  } else {
    goto llvm_cbe_tmp__50;
  }

llvm_cbe_tmp__49:
if (AESL_DEBUG_TRACE)
printf("\n  %%25 = load i32* %%d_in, align 4, !dbg !7 for 0x%I64xth hint within @Din  --> \n", ++aesl_llvm_cbe_97_count);
  llvm_cbe_tmp__35 = (unsigned int )*llvm_cbe_d_in;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__35);
if (AESL_DEBUG_TRACE)
printf("\n  %%26 = load i8* %%data_in, align 1, !dbg !7 for 0x%I64xth hint within @Din  --> \n", ++aesl_llvm_cbe_98_count);
  llvm_cbe_tmp__36 = (unsigned char )*llvm_cbe_data_in;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__36);
if (AESL_DEBUG_TRACE)
printf("\n  %%27 = zext i8 %%26 to i32, !dbg !7 for 0x%I64xth hint within @Din  --> \n", ++aesl_llvm_cbe_99_count);
  llvm_cbe_tmp__37 = (unsigned int )((unsigned int )(unsigned char )llvm_cbe_tmp__36&255U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__37);
if (AESL_DEBUG_TRACE)
printf("\n  %%28 = shl nuw i32 %%27, 24, !dbg !7 for 0x%I64xth hint within @Din  --> \n", ++aesl_llvm_cbe_100_count);
  llvm_cbe_tmp__38 = (unsigned int )llvm_cbe_tmp__37 << 24u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__38);
if (AESL_DEBUG_TRACE)
printf("\n  %%29 = or i32 %%28, %%25, !dbg !7 for 0x%I64xth hint within @Din  --> \n", ++aesl_llvm_cbe_101_count);
  llvm_cbe_tmp__39 = (unsigned int )llvm_cbe_tmp__38 | llvm_cbe_tmp__35;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__39);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%29, i32* %%d_in, align 4, !dbg !7 for 0x%I64xth hint within @Din  --> \n", ++aesl_llvm_cbe_102_count);
  *llvm_cbe_d_in = llvm_cbe_tmp__39;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__39);
  goto llvm_cbe_tmp__50;

llvm_cbe_tmp__50:
  goto llvm_cbe_tmp__48;

llvm_cbe_tmp__48:
  goto llvm_cbe_tmp__45;

llvm_cbe_tmp__45:
  goto llvm_cbe_tmp__42;

llvm_cbe_tmp__42:
  if (AESL_DEBUG_TRACE)
      printf("\nEND @Din}\n");
  return;
}


void Dout( char *llvm_cbe_sel, signed int *llvm_cbe_d_out,  char *llvm_cbe_data_out) {
  static  unsigned long long aesl_llvm_cbe_108_count = 0;
  static  unsigned long long aesl_llvm_cbe_109_count = 0;
  static  unsigned long long aesl_llvm_cbe_110_count = 0;
  static  unsigned long long aesl_llvm_cbe_111_count = 0;
  static  unsigned long long aesl_llvm_cbe_112_count = 0;
  static  unsigned long long aesl_llvm_cbe_113_count = 0;
  static  unsigned long long aesl_llvm_cbe_114_count = 0;
  static  unsigned long long aesl_llvm_cbe_115_count = 0;
  static  unsigned long long aesl_llvm_cbe_116_count = 0;
  static  unsigned long long aesl_llvm_cbe_117_count = 0;
  static  unsigned long long aesl_llvm_cbe_118_count = 0;
  static  unsigned long long aesl_llvm_cbe_119_count = 0;
  static  unsigned long long aesl_llvm_cbe_120_count = 0;
  static  unsigned long long aesl_llvm_cbe_121_count = 0;
  static  unsigned long long aesl_llvm_cbe_122_count = 0;
  static  unsigned long long aesl_llvm_cbe_123_count = 0;
  unsigned char llvm_cbe_tmp__51;
  static  unsigned long long aesl_llvm_cbe_124_count = 0;
  static  unsigned long long aesl_llvm_cbe_125_count = 0;
  static  unsigned long long aesl_llvm_cbe_126_count = 0;
  unsigned int llvm_cbe_tmp__52;
  static  unsigned long long aesl_llvm_cbe_127_count = 0;
  unsigned char llvm_cbe_tmp__53;
  static  unsigned long long aesl_llvm_cbe_128_count = 0;
  static  unsigned long long aesl_llvm_cbe_129_count = 0;
  static  unsigned long long aesl_llvm_cbe_130_count = 0;
  static  unsigned long long aesl_llvm_cbe_131_count = 0;
  static  unsigned long long aesl_llvm_cbe_132_count = 0;
  unsigned int llvm_cbe_tmp__54;
  static  unsigned long long aesl_llvm_cbe_133_count = 0;
  unsigned int llvm_cbe_tmp__55;
  static  unsigned long long aesl_llvm_cbe_134_count = 0;
  unsigned char llvm_cbe_tmp__56;
  static  unsigned long long aesl_llvm_cbe_135_count = 0;
  static  unsigned long long aesl_llvm_cbe_136_count = 0;
  static  unsigned long long aesl_llvm_cbe_137_count = 0;
  static  unsigned long long aesl_llvm_cbe_138_count = 0;
  static  unsigned long long aesl_llvm_cbe_139_count = 0;
  unsigned int llvm_cbe_tmp__57;
  static  unsigned long long aesl_llvm_cbe_140_count = 0;
  unsigned int llvm_cbe_tmp__58;
  static  unsigned long long aesl_llvm_cbe_141_count = 0;
  unsigned char llvm_cbe_tmp__59;
  static  unsigned long long aesl_llvm_cbe_142_count = 0;
  static  unsigned long long aesl_llvm_cbe_143_count = 0;
  static  unsigned long long aesl_llvm_cbe_144_count = 0;
  static  unsigned long long aesl_llvm_cbe_145_count = 0;
  static  unsigned long long aesl_llvm_cbe_146_count = 0;
  unsigned int llvm_cbe_tmp__60;
  static  unsigned long long aesl_llvm_cbe_147_count = 0;
  unsigned int llvm_cbe_tmp__61;
  static  unsigned long long aesl_llvm_cbe_148_count = 0;
  unsigned char llvm_cbe_tmp__62;
  static  unsigned long long aesl_llvm_cbe_149_count = 0;
  static  unsigned long long aesl_llvm_cbe_150_count = 0;
  static  unsigned long long aesl_llvm_cbe_151_count = 0;
  static  unsigned long long aesl_llvm_cbe_152_count = 0;
  static  unsigned long long aesl_llvm_cbe_153_count = 0;
  static  unsigned long long aesl_llvm_cbe_154_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @Dout\n");
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = load i3* %%sel, align 1, !dbg !6 for 0x%I64xth hint within @Dout  --> \n", ++aesl_llvm_cbe_123_count);
  llvm_cbe_tmp__51 = (unsigned char )*llvm_cbe_sel;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__51);
  if (((llvm_cbe_tmp__51&7U) == (((unsigned char )0)&7U))) {
    goto llvm_cbe_tmp__63;
  } else {
    goto llvm_cbe_tmp__64;
  }

llvm_cbe_tmp__63:
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = load i32* %%d_out, align 4, !dbg !6 for 0x%I64xth hint within @Dout  --> \n", ++aesl_llvm_cbe_126_count);
  llvm_cbe_tmp__52 = (unsigned int )*llvm_cbe_d_out;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__52);
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = trunc i32 %%4 to i8, !dbg !6 for 0x%I64xth hint within @Dout  --> \n", ++aesl_llvm_cbe_127_count);
  llvm_cbe_tmp__53 = (unsigned char )((unsigned char )llvm_cbe_tmp__52&255U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__53);
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%5, i8* %%data_out, align 1, !dbg !6 for 0x%I64xth hint within @Dout  --> \n", ++aesl_llvm_cbe_128_count);
  *llvm_cbe_data_out = llvm_cbe_tmp__53;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__53);
  goto llvm_cbe_tmp__65;

llvm_cbe_tmp__64:
  if (((llvm_cbe_tmp__51&7U) == (((unsigned char )1)&7U))) {
    goto llvm_cbe_tmp__66;
  } else {
    goto llvm_cbe_tmp__67;
  }

llvm_cbe_tmp__66:
if (AESL_DEBUG_TRACE)
printf("\n  %%9 = load i32* %%d_out, align 4, !dbg !7 for 0x%I64xth hint within @Dout  --> \n", ++aesl_llvm_cbe_132_count);
  llvm_cbe_tmp__54 = (unsigned int )*llvm_cbe_d_out;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__54);
if (AESL_DEBUG_TRACE)
printf("\n  %%10 = lshr i32 %%9, 8, !dbg !7 for 0x%I64xth hint within @Dout  --> \n", ++aesl_llvm_cbe_133_count);
  llvm_cbe_tmp__55 = (unsigned int )((unsigned int )(((unsigned int )(llvm_cbe_tmp__54&4294967295ull)) >> ((unsigned int )(8u&4294967295ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__55&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%11 = trunc i32 %%10 to i8, !dbg !7 for 0x%I64xth hint within @Dout  --> \n", ++aesl_llvm_cbe_134_count);
  llvm_cbe_tmp__56 = (unsigned char )((unsigned char )llvm_cbe_tmp__55&255U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__56);
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%11, i8* %%data_out, align 1, !dbg !7 for 0x%I64xth hint within @Dout  --> \n", ++aesl_llvm_cbe_135_count);
  *llvm_cbe_data_out = llvm_cbe_tmp__56;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__56);
  goto llvm_cbe_tmp__68;

llvm_cbe_tmp__67:
  if (((llvm_cbe_tmp__51&7U) == (((unsigned char )2)&7U))) {
    goto llvm_cbe_tmp__69;
  } else {
    goto llvm_cbe_tmp__70;
  }

llvm_cbe_tmp__69:
if (AESL_DEBUG_TRACE)
printf("\n  %%15 = load i32* %%d_out, align 4, !dbg !7 for 0x%I64xth hint within @Dout  --> \n", ++aesl_llvm_cbe_139_count);
  llvm_cbe_tmp__57 = (unsigned int )*llvm_cbe_d_out;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__57);
if (AESL_DEBUG_TRACE)
printf("\n  %%16 = lshr i32 %%15, 16, !dbg !7 for 0x%I64xth hint within @Dout  --> \n", ++aesl_llvm_cbe_140_count);
  llvm_cbe_tmp__58 = (unsigned int )((unsigned int )(((unsigned int )(llvm_cbe_tmp__57&4294967295ull)) >> ((unsigned int )(16u&4294967295ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__58&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%17 = trunc i32 %%16 to i8, !dbg !7 for 0x%I64xth hint within @Dout  --> \n", ++aesl_llvm_cbe_141_count);
  llvm_cbe_tmp__59 = (unsigned char )((unsigned char )llvm_cbe_tmp__58&255U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__59);
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%17, i8* %%data_out, align 1, !dbg !7 for 0x%I64xth hint within @Dout  --> \n", ++aesl_llvm_cbe_142_count);
  *llvm_cbe_data_out = llvm_cbe_tmp__59;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__59);
  goto llvm_cbe_tmp__71;

llvm_cbe_tmp__70:
  if (((llvm_cbe_tmp__51&7U) == (((unsigned char )3)&7U))) {
    goto llvm_cbe_tmp__72;
  } else {
    goto llvm_cbe_tmp__73;
  }

llvm_cbe_tmp__72:
if (AESL_DEBUG_TRACE)
printf("\n  %%21 = load i32* %%d_out, align 4, !dbg !7 for 0x%I64xth hint within @Dout  --> \n", ++aesl_llvm_cbe_146_count);
  llvm_cbe_tmp__60 = (unsigned int )*llvm_cbe_d_out;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__60);
if (AESL_DEBUG_TRACE)
printf("\n  %%22 = lshr i32 %%21, 24, !dbg !7 for 0x%I64xth hint within @Dout  --> \n", ++aesl_llvm_cbe_147_count);
  llvm_cbe_tmp__61 = (unsigned int )((unsigned int )(((unsigned int )(llvm_cbe_tmp__60&4294967295ull)) >> ((unsigned int )(24u&4294967295ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__61&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%23 = trunc i32 %%22 to i8, !dbg !7 for 0x%I64xth hint within @Dout  --> \n", ++aesl_llvm_cbe_148_count);
  llvm_cbe_tmp__62 = (unsigned char )((unsigned char )llvm_cbe_tmp__61&255U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__62);
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%23, i8* %%data_out, align 1, !dbg !7 for 0x%I64xth hint within @Dout  --> \n", ++aesl_llvm_cbe_149_count);
  *llvm_cbe_data_out = llvm_cbe_tmp__62;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__62);
  goto llvm_cbe_tmp__73;

llvm_cbe_tmp__73:
  goto llvm_cbe_tmp__71;

llvm_cbe_tmp__71:
  goto llvm_cbe_tmp__68;

llvm_cbe_tmp__68:
  goto llvm_cbe_tmp__65;

llvm_cbe_tmp__65:
  if (AESL_DEBUG_TRACE)
      printf("\nEND @Dout}\n");
  return;
}


void PRNumGen(bool llvm_cbe_rstn, bool llvm_cbe_get_random, bool llvm_cbe_load_seed,  char llvm_cbe_data_in,  char *llvm_cbe_data_out) {
  static  unsigned long long aesl_llvm_cbe_155_count = 0;
   char llvm_cbe_tmp__74;    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_156_count = 0;
  static  unsigned long long aesl_llvm_cbe_157_count = 0;
  static  unsigned long long aesl_llvm_cbe_158_count = 0;
  static  unsigned long long aesl_llvm_cbe_159_count = 0;
  static  unsigned long long aesl_llvm_cbe_160_count = 0;
  static  unsigned long long aesl_llvm_cbe_161_count = 0;
  static  unsigned long long aesl_llvm_cbe_162_count = 0;
  static  unsigned long long aesl_llvm_cbe_163_count = 0;
  static  unsigned long long aesl_llvm_cbe_164_count = 0;
  static  unsigned long long aesl_llvm_cbe_165_count = 0;
  static  unsigned long long aesl_llvm_cbe_166_count = 0;
  static  unsigned long long aesl_llvm_cbe_167_count = 0;
  static  unsigned long long aesl_llvm_cbe_168_count = 0;
  static  unsigned long long aesl_llvm_cbe_169_count = 0;
  static  unsigned long long aesl_llvm_cbe_170_count = 0;
  static  unsigned long long aesl_llvm_cbe_171_count = 0;
  static  unsigned long long aesl_llvm_cbe_172_count = 0;
  static  unsigned long long aesl_llvm_cbe_173_count = 0;
  static  unsigned long long aesl_llvm_cbe_174_count = 0;
  static  unsigned long long aesl_llvm_cbe_175_count = 0;
  static  unsigned long long aesl_llvm_cbe_176_count = 0;
  static  unsigned long long aesl_llvm_cbe_177_count = 0;
  static  unsigned long long aesl_llvm_cbe_178_count = 0;
  static  unsigned long long aesl_llvm_cbe_179_count = 0;
  unsigned char llvm_cbe_tmp__75;
  static  unsigned long long aesl_llvm_cbe_180_count = 0;
  static  unsigned long long aesl_llvm_cbe_181_count = 0;
  static  unsigned long long aesl_llvm_cbe_182_count = 0;
  static  unsigned long long aesl_llvm_cbe_183_count = 0;
  unsigned char llvm_cbe_tmp__76;
  static  unsigned long long aesl_llvm_cbe_184_count = 0;
  unsigned char llvm_cbe_tmp__77;
  static  unsigned long long aesl_llvm_cbe_185_count = 0;
  static  unsigned long long aesl_llvm_cbe__2e__count = 0;
  unsigned char llvm_cbe__2e_;
  static  unsigned long long aesl_llvm_cbe_186_count = 0;
  static  unsigned long long aesl_llvm_cbe_187_count = 0;
  static  unsigned long long aesl_llvm_cbe_188_count = 0;
  unsigned char llvm_cbe_tmp__78;
  static  unsigned long long aesl_llvm_cbe_189_count = 0;
  static  unsigned long long aesl_llvm_cbe_190_count = 0;
  static  unsigned long long aesl_llvm_cbe_191_count = 0;
  static  unsigned long long aesl_llvm_cbe_192_count = 0;
  unsigned char llvm_cbe_tmp__79;
  static  unsigned long long aesl_llvm_cbe_193_count = 0;
  unsigned char llvm_cbe_tmp__80;
  static  unsigned long long aesl_llvm_cbe_194_count = 0;
  static  unsigned long long aesl_llvm_cbe_195_count = 0;
  static  unsigned long long aesl_llvm_cbe_196_count = 0;
  static  unsigned long long aesl_llvm_cbe_197_count = 0;
  static  unsigned long long aesl_llvm_cbe_198_count = 0;
  unsigned int llvm_cbe_tmp__81;
  static  unsigned long long aesl_llvm_cbe_199_count = 0;
  static  unsigned long long aesl_llvm_cbe_200_count = 0;
  static  unsigned long long aesl_llvm_cbe_201_count = 0;
  static  unsigned long long aesl_llvm_cbe_202_count = 0;
  static  unsigned long long aesl_llvm_cbe_203_count = 0;
  static  unsigned long long aesl_llvm_cbe_204_count = 0;
  unsigned char llvm_cbe_tmp__82;
  static  unsigned long long aesl_llvm_cbe_205_count = 0;
  unsigned char llvm_cbe_tmp__83;
  static  unsigned long long aesl_llvm_cbe_206_count = 0;
  static  unsigned long long aesl_llvm_cbe_207_count = 0;
  static  unsigned long long aesl_llvm_cbe_208_count = 0;
  static  unsigned long long aesl_llvm_cbe_209_count = 0;
  static  unsigned long long aesl_llvm_cbe_210_count = 0;
  unsigned char llvm_cbe_tmp__84;
  static  unsigned long long aesl_llvm_cbe_211_count = 0;
  unsigned char llvm_cbe_tmp__85;
  static  unsigned long long aesl_llvm_cbe_212_count = 0;
  static  unsigned long long aesl_llvm_cbe_213_count = 0;
  static  unsigned long long aesl_llvm_cbe_214_count = 0;
  unsigned int llvm_cbe_tmp__86;
  static  unsigned long long aesl_llvm_cbe_215_count = 0;
  static  unsigned long long aesl_llvm_cbe_216_count = 0;
  static  unsigned long long aesl_llvm_cbe_217_count = 0;
  static  unsigned long long aesl_llvm_cbe_218_count = 0;
  static  unsigned long long aesl_llvm_cbe_219_count = 0;
  static  unsigned long long aesl_llvm_cbe_220_count = 0;
  static  unsigned long long aesl_llvm_cbe_221_count = 0;
  static  unsigned long long aesl_llvm_cbe_222_count = 0;
  static  unsigned long long aesl_llvm_cbe_223_count = 0;
  static  unsigned long long aesl_llvm_cbe_224_count = 0;
  unsigned int llvm_cbe_tmp__87;
  static  unsigned long long aesl_llvm_cbe_225_count = 0;
  static  unsigned long long aesl_llvm_cbe_226_count = 0;
  static  unsigned long long aesl_llvm_cbe_227_count = 0;
  static  unsigned long long aesl_llvm_cbe_228_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @PRNumGen\n");
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%data_in, i8* %%1, align  for 0x%I64xth hint within @PRNumGen  --> \n", ++aesl_llvm_cbe_171_count);
  *(&llvm_cbe_tmp__74) = llvm_cbe_data_in;
if (AESL_DEBUG_TRACE)
printf("\ndata_in = 0x%X\n", llvm_cbe_data_in);
  if (llvm_cbe_rstn) {
    goto llvm_cbe_tmp__88;
  } else {
    goto llvm_cbe_tmp__89;
  }

llvm_cbe_tmp__88:
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = load i3* @aesl_internal_PRNumGen.out_cnt, align 1, !dbg !8 for 0x%I64xth hint within @PRNumGen  --> \n", ++aesl_llvm_cbe_179_count);
  llvm_cbe_tmp__75 = (unsigned char )*(&aesl_internal_PRNumGen_OC_out_cnt);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__75);
  if (((llvm_cbe_tmp__75&7U) == (((unsigned char )0)&7U))) {
    goto llvm_cbe_tmp__90;
  } else {
    goto llvm_cbe_tmp__91;
  }

llvm_cbe_tmp__91:
if (AESL_DEBUG_TRACE)
printf("\n  call void @Dout(i3* @aesl_internal_PRNumGen.out_cnt, i32* @aesl_internal_PRNumGen.d_out, i8* %%data_out), !dbg !8 for 0x%I64xth hint within @PRNumGen  --> \n", ++aesl_llvm_cbe_182_count);
  Dout(( char *)(&aesl_internal_PRNumGen_OC_out_cnt), (signed int *)(&aesl_internal_PRNumGen_OC_d_out), ( char *)llvm_cbe_data_out);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = load i3* @aesl_internal_PRNumGen.out_cnt, align 1, !dbg !9 for 0x%I64xth hint within @PRNumGen  --> \n", ++aesl_llvm_cbe_183_count);
  llvm_cbe_tmp__76 = (unsigned char )*(&aesl_internal_PRNumGen_OC_out_cnt);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__76);
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = add i3 %%6, 1, !dbg !9 for 0x%I64xth hint within @PRNumGen  --> \n", ++aesl_llvm_cbe_184_count);
  llvm_cbe_tmp__77 = (unsigned char )((unsigned char )(llvm_cbe_tmp__76&7ull)) + ((unsigned char )(((unsigned char )1)&7ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned char )(llvm_cbe_tmp__77&7ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%. = select i1 %%8, i3 0, i3 %%7, !dbg !9 for 0x%I64xth hint within @PRNumGen  --> \n", ++aesl_llvm_cbe__2e__count);
  llvm_cbe__2e_ = (unsigned char )((((llvm_cbe_tmp__77&7U) == (((unsigned char )4u)&7U))) ? ((unsigned char )((unsigned char )0)) : ((unsigned char )llvm_cbe_tmp__77));
if (AESL_DEBUG_TRACE)
printf("\n. = 0x%X\n", llvm_cbe__2e_);
if (AESL_DEBUG_TRACE)
printf("\n  store i3 %%., i3* @aesl_internal_PRNumGen.out_cnt, align 1, !dbg !9 for 0x%I64xth hint within @PRNumGen  --> \n", ++aesl_llvm_cbe_186_count);
  *(&aesl_internal_PRNumGen_OC_out_cnt) = ((llvm_cbe__2e_) & 7ull);
if (AESL_DEBUG_TRACE)
printf("\n. = 0x%X\n", llvm_cbe__2e_);
  goto llvm_cbe_tmp__92;

llvm_cbe_tmp__90:
if (AESL_DEBUG_TRACE)
printf("\n  %%10 = load i3* @aesl_internal_PRNumGen.in_cnt, align 1, !dbg !9 for 0x%I64xth hint within @PRNumGen  --> \n", ++aesl_llvm_cbe_188_count);
  llvm_cbe_tmp__78 = (unsigned char )*(&aesl_internal_PRNumGen_OC_in_cnt);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__78);
  if (((llvm_cbe_tmp__78&7U) == (((unsigned char )0)&7U))) {
    goto llvm_cbe_tmp__93;
  } else {
    goto llvm_cbe_tmp__94;
  }

llvm_cbe_tmp__94:
if (AESL_DEBUG_TRACE)
printf("\n  call void @Din(i3* @aesl_internal_PRNumGen.in_cnt, i32* @aesl_internal_PRNumGen.d_in, i8* %%1), !dbg !9 for 0x%I64xth hint within @PRNumGen  --> \n", ++aesl_llvm_cbe_191_count);
  Din(( char *)(&aesl_internal_PRNumGen_OC_in_cnt), (signed int *)(&aesl_internal_PRNumGen_OC_d_in), ( char *)(&llvm_cbe_tmp__74));
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%13 = load i3* @aesl_internal_PRNumGen.in_cnt, align 1, !dbg !9 for 0x%I64xth hint within @PRNumGen  --> \n", ++aesl_llvm_cbe_192_count);
  llvm_cbe_tmp__79 = (unsigned char )*(&aesl_internal_PRNumGen_OC_in_cnt);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__79);
if (AESL_DEBUG_TRACE)
printf("\n  %%14 = add i3 %%13, 1, !dbg !9 for 0x%I64xth hint within @PRNumGen  --> \n", ++aesl_llvm_cbe_193_count);
  llvm_cbe_tmp__80 = (unsigned char )((unsigned char )(llvm_cbe_tmp__79&7ull)) + ((unsigned char )(((unsigned char )1)&7ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned char )(llvm_cbe_tmp__80&7ull)));
if (AESL_DEBUG_TRACE)
printf("\n  store i3 %%14, i3* @aesl_internal_PRNumGen.in_cnt, align 1, !dbg !9 for 0x%I64xth hint within @PRNumGen  --> \n", ++aesl_llvm_cbe_194_count);
  *(&aesl_internal_PRNumGen_OC_in_cnt) = ((llvm_cbe_tmp__80) & 7ull);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__80);
  if (((llvm_cbe_tmp__80&7U) == (((unsigned char )4u)&7U))) {
    goto llvm_cbe_tmp__95;
  } else {
    goto llvm_cbe_tmp__96;
  }

llvm_cbe_tmp__95:
if (AESL_DEBUG_TRACE)
printf("\n  store i3 0, i3* @aesl_internal_PRNumGen.in_cnt, align 1, !dbg !9 for 0x%I64xth hint within @PRNumGen  --> \n", ++aesl_llvm_cbe_197_count);
  *(&aesl_internal_PRNumGen_OC_in_cnt) = ((((unsigned char )0)) & 7ull);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned char )0));
if (AESL_DEBUG_TRACE)
printf("\n  %%17 = load i32* @aesl_internal_PRNumGen.d_in, align 4, !dbg !6 for 0x%I64xth hint within @PRNumGen  --> \n", ++aesl_llvm_cbe_198_count);
  llvm_cbe_tmp__81 = (unsigned int )*(&aesl_internal_PRNumGen_OC_d_in);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__81);
if (AESL_DEBUG_TRACE)
printf("\n  call void @LFSR(i1 zeroext true, i1 zeroext true, i32 %%17, i32* @aesl_internal_PRNumGen.d_out), !dbg !6 for 0x%I64xth hint within @PRNumGen  --> \n", ++aesl_llvm_cbe_199_count);
  LFSR(1, 1, llvm_cbe_tmp__81, (signed int *)(&aesl_internal_PRNumGen_OC_d_out));
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",1);
printf("\nArgument  = 0x%X",1);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__81);
}
  goto llvm_cbe_tmp__96;

llvm_cbe_tmp__96:
  goto llvm_cbe_tmp__97;

llvm_cbe_tmp__93:
  if (llvm_cbe_load_seed) {
    goto llvm_cbe_tmp__98;
  } else {
    goto llvm_cbe_tmp__99;
  }

llvm_cbe_tmp__98:
if (AESL_DEBUG_TRACE)
printf("\n  call void @Din(i3* @aesl_internal_PRNumGen.in_cnt, i32* @aesl_internal_PRNumGen.d_in, i8* %%1), !dbg !10 for 0x%I64xth hint within @PRNumGen  --> \n", ++aesl_llvm_cbe_203_count);
  Din(( char *)(&aesl_internal_PRNumGen_OC_in_cnt), (signed int *)(&aesl_internal_PRNumGen_OC_d_in), ( char *)(&llvm_cbe_tmp__74));
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%21 = load i3* @aesl_internal_PRNumGen.in_cnt, align 1, !dbg !10 for 0x%I64xth hint within @PRNumGen  --> \n", ++aesl_llvm_cbe_204_count);
  llvm_cbe_tmp__82 = (unsigned char )*(&aesl_internal_PRNumGen_OC_in_cnt);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__82);
if (AESL_DEBUG_TRACE)
printf("\n  %%22 = add i3 %%21, 1, !dbg !10 for 0x%I64xth hint within @PRNumGen  --> \n", ++aesl_llvm_cbe_205_count);
  llvm_cbe_tmp__83 = (unsigned char )((unsigned char )(llvm_cbe_tmp__82&7ull)) + ((unsigned char )(((unsigned char )1)&7ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned char )(llvm_cbe_tmp__83&7ull)));
if (AESL_DEBUG_TRACE)
printf("\n  store i3 %%22, i3* @aesl_internal_PRNumGen.in_cnt, align 1, !dbg !10 for 0x%I64xth hint within @PRNumGen  --> \n", ++aesl_llvm_cbe_206_count);
  *(&aesl_internal_PRNumGen_OC_in_cnt) = ((llvm_cbe_tmp__83) & 7ull);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__83);
  goto llvm_cbe_tmp__100;

llvm_cbe_tmp__99:
  if (llvm_cbe_get_random) {
    goto llvm_cbe_tmp__101;
  } else {
    goto llvm_cbe_tmp__102;
  }

llvm_cbe_tmp__101:
if (AESL_DEBUG_TRACE)
printf("\n  call void @Dout(i3* @aesl_internal_PRNumGen.out_cnt, i32* @aesl_internal_PRNumGen.d_out, i8* %%data_out), !dbg !8 for 0x%I64xth hint within @PRNumGen  --> \n", ++aesl_llvm_cbe_209_count);
  Dout(( char *)(&aesl_internal_PRNumGen_OC_out_cnt), (signed int *)(&aesl_internal_PRNumGen_OC_d_out), ( char *)llvm_cbe_data_out);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%25 = load i3* @aesl_internal_PRNumGen.out_cnt, align 1, !dbg !10 for 0x%I64xth hint within @PRNumGen  --> \n", ++aesl_llvm_cbe_210_count);
  llvm_cbe_tmp__84 = (unsigned char )*(&aesl_internal_PRNumGen_OC_out_cnt);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__84);
if (AESL_DEBUG_TRACE)
printf("\n  %%26 = add i3 %%25, 1, !dbg !10 for 0x%I64xth hint within @PRNumGen  --> \n", ++aesl_llvm_cbe_211_count);
  llvm_cbe_tmp__85 = (unsigned char )((unsigned char )(llvm_cbe_tmp__84&7ull)) + ((unsigned char )(((unsigned char )1)&7ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned char )(llvm_cbe_tmp__85&7ull)));
if (AESL_DEBUG_TRACE)
printf("\n  store i3 %%26, i3* @aesl_internal_PRNumGen.out_cnt, align 1, !dbg !10 for 0x%I64xth hint within @PRNumGen  --> \n", ++aesl_llvm_cbe_212_count);
  *(&aesl_internal_PRNumGen_OC_out_cnt) = ((llvm_cbe_tmp__85) & 7ull);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__85);
  goto llvm_cbe_tmp__103;

llvm_cbe_tmp__102:
if (AESL_DEBUG_TRACE)
printf("\n  %%28 = load i32* @aesl_internal_PRNumGen.d_in, align 4, !dbg !6 for 0x%I64xth hint within @PRNumGen  --> \n", ++aesl_llvm_cbe_214_count);
  llvm_cbe_tmp__86 = (unsigned int )*(&aesl_internal_PRNumGen_OC_d_in);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__86);
if (AESL_DEBUG_TRACE)
printf("\n  call void @LFSR(i1 zeroext true, i1 zeroext false, i32 %%28, i32* @aesl_internal_PRNumGen.d_out), !dbg !6 for 0x%I64xth hint within @PRNumGen  --> \n", ++aesl_llvm_cbe_215_count);
  LFSR(1, 0, llvm_cbe_tmp__86, (signed int *)(&aesl_internal_PRNumGen_OC_d_out));
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",1);
printf("\nArgument  = 0x%X",0);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__86);
}
if (AESL_DEBUG_TRACE)
printf("\n  store i8 0, i8* %%data_out, align 1, !dbg !8 for 0x%I64xth hint within @PRNumGen  --> \n", ++aesl_llvm_cbe_216_count);
  *llvm_cbe_data_out = ((unsigned char )0);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned char )0));
  goto llvm_cbe_tmp__103;

llvm_cbe_tmp__103:
  goto llvm_cbe_tmp__100;

llvm_cbe_tmp__100:
  goto llvm_cbe_tmp__97;

llvm_cbe_tmp__97:
  goto llvm_cbe_tmp__92;

llvm_cbe_tmp__92:
  goto llvm_cbe_tmp__104;

llvm_cbe_tmp__89:
if (AESL_DEBUG_TRACE)
printf("\n  store i3 0, i3* @aesl_internal_PRNumGen.out_cnt, align 1, !dbg !10 for 0x%I64xth hint within @PRNumGen  --> \n", ++aesl_llvm_cbe_222_count);
  *(&aesl_internal_PRNumGen_OC_out_cnt) = ((((unsigned char )0)) & 7ull);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned char )0));
if (AESL_DEBUG_TRACE)
printf("\n  store i3 0, i3* @aesl_internal_PRNumGen.in_cnt, align 1, !dbg !10 for 0x%I64xth hint within @PRNumGen  --> \n", ++aesl_llvm_cbe_223_count);
  *(&aesl_internal_PRNumGen_OC_in_cnt) = ((((unsigned char )0)) & 7ull);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned char )0));
if (AESL_DEBUG_TRACE)
printf("\n  %%34 = load i32* @aesl_internal_PRNumGen.d_in, align 4, !dbg !7 for 0x%I64xth hint within @PRNumGen  --> \n", ++aesl_llvm_cbe_224_count);
  llvm_cbe_tmp__87 = (unsigned int )*(&aesl_internal_PRNumGen_OC_d_in);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__87);
if (AESL_DEBUG_TRACE)
printf("\n  call void @LFSR(i1 zeroext false, i1 zeroext false, i32 %%34, i32* @aesl_internal_PRNumGen.d_out), !dbg !7 for 0x%I64xth hint within @PRNumGen  --> \n", ++aesl_llvm_cbe_225_count);
  LFSR(0, 0, llvm_cbe_tmp__87, (signed int *)(&aesl_internal_PRNumGen_OC_d_out));
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",0);
printf("\nArgument  = 0x%X",0);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__87);
}
if (AESL_DEBUG_TRACE)
printf("\n  store i8 0, i8* %%data_out, align 1, !dbg !8 for 0x%I64xth hint within @PRNumGen  --> \n", ++aesl_llvm_cbe_226_count);
  *llvm_cbe_data_out = ((unsigned char )0);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned char )0));
  goto llvm_cbe_tmp__104;

llvm_cbe_tmp__104:
  if (AESL_DEBUG_TRACE)
      printf("\nEND @PRNumGen}\n");
  return;
}

