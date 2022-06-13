/*
 * File: dft_filter.c
 *
 * Code generated for Simulink model 'dft_filter'.
 *
 * Model version                  : 1.9
 * Simulink Coder version         : 9.6 (R2021b) 14-May-2021
 * C/C++ source code generated on : Mon Jun 13 00:31:23 2022
 *
 * Target selection: ert.tlc
 * Embedded hardware selection: Intel->x86-64 (Windows64)
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#include "dft_filter.h"
#include "dft_filter_private.h"

/* Block states (default storage) */
DW_dft_filter_T dft_filter_DW;

/* Real-time model */
static RT_MODEL_dft_filter_T dft_filter_M_;
RT_MODEL_dft_filter_T *const dft_filter_M = &dft_filter_M_;

/* Model step function */
real32_T dft_filter_cal(real32_T rtu_signal_in)
{
  real32_T rty_amp_out_0;
  UNUSED_PARAMETER(rtu_signal_in);

  /* Outputs for Function Call SubSystem: '<Root>/Simulink Function' */
  /* Outputs for IfAction SubSystem: '<S1>/If Action Subsystem' incorporates:
   *  ActionPort: '<S2>/Action Port'
   */
  /* If: '<S1>/If' incorporates:
   *  DataTypeConversion: '<S1>/Data Type Conversion'
   *  Inport: '<S2>/In1'
   *  SignalConversion generated from: '<S1>/y'
   */
  rty_amp_out_0 = 0.0F;

  /* End of Outputs for SubSystem: '<S1>/If Action Subsystem' */

  /* Update for UnitDelay: '<S1>/Unit Delay' incorporates:
   *  Constant: '<S1>/Constant3'
   *  Sum: '<S1>/Add'
   */
  dft_filter_DW.UnitDelay_DSTATE++;

  /* End of Outputs for SubSystem: '<Root>/Simulink Function' */
  return rty_amp_out_0;
}

/* Model initialize function */
void dft_filter_initialize(void)
{
  /* (no initialization code required) */
}

/* Model terminate function */
void dft_filter_terminate(void)
{
  /* (no terminate code required) */
}

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
