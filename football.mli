type outcome = Win | Lose | Draw

val wins : int list 
val draw : int list
val lose : int list
val run_prediction : float -> float -> int -> float
val calc_outcome : outcome -> float -> float -> float
