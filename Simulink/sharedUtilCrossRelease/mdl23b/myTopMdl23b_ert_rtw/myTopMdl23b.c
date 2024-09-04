/*
 * File: myTopMdl23b.c
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

#include "myTopMdl23b.h"
#include "myMdl20awSharedUtil.h"

/* External inputs (root inport signals with default storage) */
ExtU rtU;

/* External outputs (root outports fed by signals with default storage) */
ExtY rtY;

/* Model step function */
void myTopMdl23b_step(void)
{
  /* ModelReference: '<Root>/Model' incorporates:
   *  Inport: '<Root>/In1'
   *  Outport: '<Root>/Out1'
   */
  myMdl20awSharedUtil(&rtU.In1, &rtY.Out1);
}

/* Model initialize function */
void myTopMdl23b_initialize(void)
{
  /* (no initialization code required) */
}

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
