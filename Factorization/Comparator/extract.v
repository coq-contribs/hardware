(* This code is copyrighted by its authors; it is distributed under  *)
(* the terms of the LGPL license (see LICENSE and description files) *)

Require Import Factorization_Synth.
Require Import Comp_Synth.

(* we provide a dummy realization for paramater BASE which 
   is in fact not used in extracted code *)

Extract Inlined Constant BASE => "".

(* some optimizations *)
Extraction Inline factorization_for_synthesis.

Extraction "Factorization/Comparator/comp.ml" Comparator.