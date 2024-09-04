/*
 * File: myMdl20awSharedUtil.h
 *
 * Code generated for Simulink model 'myMdl20awSharedUtil'.
 *
 * Model version                  : 1.1
 * Simulink Coder version         : 9.3 (R2020a) 18-Nov-2019
 * C/C++ source code generated on : Fri Apr 19 11:33:03 2024
 *
 * Target selection: ert.tlc
 * Embedded hardware selection: Intel->x86-64 (Windows64)
 * Code generation objectives:
 *    1. Execution efficiency
 *    2. Traceability
 * Validation result: Not run
 */

#ifndef RTW_HEADER_myMdl20awSharedUtil_h_
#define RTW_HEADER_myMdl20awSharedUtil_h_
#ifndef myMdl20awSharedUtil_COMMON_INCLUDES_
# define myMdl20awSharedUtil_COMMON_INCLUDES_
#include "rtwtypes.h"
#endif                                /* myMdl20awSharedUtil_COMMON_INCLUDES_ */

/* Model Code Variants */

/* Macros for accessing real-time model data structure */

/* External inputs (root inport signals with default storage) */
typedef struct {
  real_T In1;                          /* '<Root>/In1' */
} ExtU;

/* External outputs (root outports fed by signals with default storage) */
typedef struct {
  real_T Out1;                         /* '<Root>/Out1' */
} ExtY;

/* External inputs (root inport signals with default storage) */
extern ExtU rtU;

/* External outputs (root outports fed by signals with default storage) */
extern ExtY rtY;

/* Model entry point functions */
extern void myMdl20awSharedUtil_initialize(void);
extern void myMdl20awSharedUtil_step(void);

/*-
 * The generated code includes comments that allow you to trace directly
 * back to the appropriate location in the model.  The basic format
 * is <system>/block_name, where system is the system number (uniquely
 * assigned by Simulink) and block_name is the name of the block.
 *
 * Use the MATLAB hilite_system command to trace the generated code back
 * to the model.  For example,
 *
 * hilite_system('<S3>')    - opens system 3
 * hilite_system('<S3>/Kp') - opens and selects block Kp which resides in S3
 *
 * Here is the system hierarchy for this model
 *
 * '<Root>' : 'myMdl20awSharedUtil'
 */

/*-
 * Requirements for '<Root>': myMdl20awSharedUtil
 */
#endif                                 /* RTW_HEADER_myMdl20awSharedUtil_h_ */

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
