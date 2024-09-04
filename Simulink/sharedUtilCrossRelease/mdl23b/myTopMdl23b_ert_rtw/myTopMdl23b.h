/*
 * File: myTopMdl23b.h
 *
 * Code generated for Simulink model 'myTopMdl23b'.
 *
 * Model version                  : 1.8
 * Simulink Coder version         : 23.2 (R2023b) 01-Aug-2023
 * C/C++ source code generated on : Fri Apr 19 11:45:12 2024
 *
 * Target selection: ert.tlc
 * Embedded hardware selection: Intel->x86-64 (Windows64)
 * Code generation objectives:
 *    1. Execution efficiency
 *    2. Traceability
 * Validation result: Not run
 */

#ifndef RTW_HEADER_myTopMdl23b_h_
#define RTW_HEADER_myTopMdl23b_h_
#ifndef myTopMdl23b_COMMON_INCLUDES_
#define myTopMdl23b_COMMON_INCLUDES_
#include "rtwtypes.h"
#endif                                 /* myTopMdl23b_COMMON_INCLUDES_ */

#include "myMdl20awSharedUtil.h"

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
extern void myTopMdl23b_initialize(void);
extern void myTopMdl23b_step(void);

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
 * '<Root>' : 'myTopMdl23b'
 */

/*-
 * Requirements for '<Root>': myTopMdl23b

 */
#endif                                 /* RTW_HEADER_myTopMdl23b_h_ */

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
