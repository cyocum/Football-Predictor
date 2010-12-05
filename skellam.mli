type t

val skellam : int -> float -> float -> float
val cartesian_product : 'a list -> 'b list -> ('a * 'b) list
val run_prediction : int * int -> t
val print_predictions : t list -> unit
val find_max_prediction : t list -> t
