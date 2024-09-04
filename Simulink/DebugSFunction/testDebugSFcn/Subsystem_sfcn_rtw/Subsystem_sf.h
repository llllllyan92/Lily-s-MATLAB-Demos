/*
 * Subsystem_sf.h
 *
 * Code generation for model "Subsystem_sf".
 *
 * Model version              : 1.2
 * Simulink Coder version : 23.2 (R2023b) 01-Aug-2023
 * C source code generated on : Wed Jan 24 09:46:00 2024
 *
 * Target selection: rtwsfcn.tlc
 * Note: GRT includes extra infrastructure and instrumentation for prototyping
 * Embedded hardware selection: Intel->x86-64 (Windows64)
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#ifndef RTW_HEADER_Subsystem_sf_h_
#define RTW_HEADER_Subsystem_sf_h_
#ifndef Subsystem_sf_COMMON_INCLUDES_
#define Subsystem_sf_COMMON_INCLUDES_
#include <stdlib.h>
#define S_FUNCTION_NAME                Subsystem_sf
#define S_FUNCTION_LEVEL               2
#ifndef RTW_GENERATED_S_FUNCTION
#define RTW_GENERATED_S_FUNCTION
#endif

#include "rtwtypes.h"
#include "simstruc.h"
#include "fixedpoint.h"
#if !defined(MATLAB_MEX_FILE)
#include "rt_matrx.h"
#endif

#if !defined(RTW_SFUNCTION_DEFINES)
#define RTW_SFUNCTION_DEFINES

typedef struct {
  void *blockIO;
  void *defaultParam;
  void *nonContDerivSig;
} LocalS;

#define ssSetLocalBlockIO(S, io)       ((LocalS *)ssGetUserData(S))->blockIO = ((void *)(io))
#define ssGetLocalBlockIO(S)           ((LocalS *)ssGetUserData(S))->blockIO
#define ssSetLocalDefaultParam(S, paramVector) ((LocalS *)ssGetUserData(S))->defaultParam = (paramVector)
#define ssGetLocalDefaultParam(S)      ((LocalS *)ssGetUserData(S))->defaultParam
#define ssSetLocalNonContDerivSig(S, pSig) ((LocalS *)ssGetUserData(S))->nonContDerivSig = (pSig)
#define ssGetLocalNonContDerivSig(S)   ((LocalS *)ssGetUserData(S))->nonContDerivSig
#endif
#endif                                 /* Subsystem_sf_COMMON_INCLUDES_ */

#include "Subsystem_sf_types.h"
#include <string.h>
#include "rt_nonfinite.h"
#include <stddef.h>
#include "rt_defines.h"

/* External inputs (root inport signals with default storage) */
typedef struct {
  real_T *In1;                         /* '<Root>/In1' */
} ExternalUPtrs_Subsystem_T;

/* External outputs (root outports fed by signals with default storage) */
typedef struct {
  real_T *Out1;                        /* '<Root>/Out1' */
} ExtY_Subsystem_T;

/*-
 * The generated code includes comments that allow you to trace directly
 * back to the appropriate location in the model.  The basic format
 * is <system>/block_name, where system is the system number (uniquely
 * assigned by Simulink) and block_name is the name of the block.
 *
 * Note that this particular code originates from a subsystem build,
 * and has its own system numbers different from the parent model.
 * Refer to the system hierarchy for this subsystem below, and use the
 * MATLAB hilite_system command to trace the generated code back
 * to the parent model.  For example,
 *
 * hilite_system('mymdl/Subsystem')    - opens subsystem mymdl/Subsystem
 * hilite_system('mymdl/Subsystem/Kp') - opens and selects block Kp
 *
 * Here is the system hierarchy for this model
 *
 * '<Root>' : 'mymdl'
 * '<S1>'   : 'mymdl/Subsystem'
 */
#endif                                 /* RTW_HEADER_Subsystem_sf_h_ */
