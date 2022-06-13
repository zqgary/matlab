/*
 * File: dft_filter.h
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

#ifndef RTW_HEADER_dft_filter_h_
#define RTW_HEADER_dft_filter_h_
#include <stddef.h>
#ifndef dft_filter_COMMON_INCLUDES_
#define dft_filter_COMMON_INCLUDES_
#include "rtwtypes.h"
#endif                                 /* dft_filter_COMMON_INCLUDES_ */

#include "dft_filter_types.h"

/* Child system includes */
#include "dft_filter_cal_private.h"
#include "dft_filter_cal.h"
#include "rt_defines.h"

/* Macros for accessing real-time model data structure */
#ifndef rtmGetErrorStatus
#define rtmGetErrorStatus(rtm)         ((rtm)->errorStatus)
#endif

#ifndef rtmSetErrorStatus
#define rtmSetErrorStatus(rtm, val)    ((rtm)->errorStatus = (val))
#endif

/* Exported data define */

/* Definition for custom storage class: Define */
#define INJ_SAMPNUM                    1000U                     /* Referenced by: '<S1>/Constant2' */

/* Block states (default storage) for system '<Root>' */
typedef struct {
  uint16_T UnitDelay_DSTATE;           /* '<S1>/Unit Delay' */
} DW_dft_filter_T;

/* Real-time Model Data Structure */
struct tag_RTM_dft_filter_T {
  const char_T * volatile errorStatus;
};

/* Block states (default storage) */
extern DW_dft_filter_T dft_filter_DW;

/* Model entry point functions */
extern void dft_filter_initialize(void);
extern void dft_filter_terminate(void);

/* Real-time Model object */
extern RT_MODEL_dft_filter_T *const dft_filter_M;

/*-
 * These blocks were eliminated from the model due to optimizations:
 *
 * Block '<S1>/Constant' : Unused code path elimination
 * Block '<S1>/Constant1' : Unused code path elimination
 */

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
 * '<Root>' : 'dft_filter'
 * '<S1>'   : 'dft_filter/Simulink Function'
 * '<S2>'   : 'dft_filter/Simulink Function/If Action Subsystem'
 * '<S3>'   : 'dft_filter/Simulink Function/If Action Subsystem1'
 */
#endif                                 /* RTW_HEADER_dft_filter_h_ */

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
