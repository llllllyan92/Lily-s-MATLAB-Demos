/*
 * File: myMdl20awSharedUtil.c
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

#include "myMdl20awSharedUtil.h"
#include "look1_binlx.h"

/* External inputs (root inport signals with default storage) */
ExtU rtU;

/* External outputs (root outports fed by signals with default storage) */
ExtY rtY;
extern const real_T rtCP_pooled_5zSyEh5xujz7[11];
extern const real_T rtCP_pooled_P4HT5BbFT2LX[11];

#define rtCP_uDLookupTable_tableData   rtCP_pooled_5zSyEh5xujz7  /* Expression: tanh([-5:5])
                                                                  * Referenced by: '<Root>/1-D Lookup Table'
                                                                  */
#define rtCP_uDLookupTable_bp01Data    rtCP_pooled_P4HT5BbFT2LX  /* Expression: [-5:5]
                                                                  * Referenced by: '<Root>/1-D Lookup Table'
                                                                  */

/* Model step function */
void myMdl20awSharedUtil_step(void)
{
  /* Outport: '<Root>/Out1' incorporates:
   *  Inport: '<Root>/In1'
   *  Lookup_n-D: '<Root>/1-D Lookup Table'
   */
  rtY.Out1 = look1_binlx(rtU.In1, rtCP_uDLookupTable_bp01Data,
    rtCP_uDLookupTable_tableData, 10U);
}

/* Model initialize function */
void myMdl20awSharedUtil_initialize(void)
{
  /* (no initialization code required) */
}

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
