/*
 * File: ert_main.c
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

#include <stdio.h>
#include "dft_filter.h"                /* Model's header file */

/*
 * The example main function illustrates what is required by your
 * application code to initialize, execute, and terminate the generated code.
 * Attaching exported functions to a real-time clock is target specific.
 * This example illustrates how you do this relative to initializing the model.
 */
int_T main(int_T argc, const char *argv[])
{
  /* Unused arguments */
  (void)(argc);
  (void)(argv);

  /* Initialize model */
  dft_filter_initialize();
  while (rtmGetErrorStatus(dft_filter_M) == (NULL)) {
    /*  Perform application tasks here. */
  }

  /* Terminate model */
  dft_filter_terminate();
  return 0;
}

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
