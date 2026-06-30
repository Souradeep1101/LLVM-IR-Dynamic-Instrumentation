/* Common main.c for the benchmarks

   Copyright (C) 2014 Embecosm Limited and University of Bristol
   Copyright (C) 2018-2019 Embecosm Limited

   Contributor: James Pallister <james.pallister@bristol.ac.uk>
   Contributor: Jeremy Bennett <jeremy.bennett@embecosm.com>

   This file is part of Embench and was formerly part of the Bristol/Embecosm
   Embedded Benchmark Suite.

   SPDX-License-Identifier: GPL-3.0-or-later */

#include "support.h"

int __attribute__ ((used))
main (int argc __attribute__ ((unused)),
      char *argv[] __attribute__ ((unused)))
{
  int i;
  volatile int result;
  int correct;

  initialise_board ();
  initialise_benchmark ();
  warm_caches (WARMUP_HEAT);

  start_trigger ();

  /* Loop the core benchmark execution 10,000 times to amplify the hardware 
     footprint for profiling. */
  for (int j = 0; j < 10000; j++) {
      result = benchmark ();
      
      /* THE OPTIMIZATION BARRIER:
         This empty assembly instruction tells the LLVM optimizer: 
         "I am doing something mysterious with 'result' and system memory here." 
         It forces the compiler to physically execute the benchmark every loop, 
         even under full LTO visibility. */
      __asm__ volatile("" : : "r" (result) : "memory");
  }

  stop_trigger ();

  /* bmarks that use arrays will check a global array rather than int result */
  correct = verify_benchmark (result);

  return (!correct);

}               /* main () */

/*
   Local Variables:
   mode: C
   c-file-style: "gnu"
   End:
*/