let factorial n =
  let rec fact_aux n a =
    match n with
      | 0 -> a
      | _ -> fact_aux (pred n) (n*a)
  in
    fact_aux n 1
  
let mod_bessel a x m =
  let first = (1. /. ((float (factorial m)) *. (Lanczos.gamma (float (m + a +
  1))))) in
  let second = (x /. 2.) ** (float (2 * m + a)) in
    first *. second
  
let run_mod_bessel a x =
  let range = (BatList.of_enum (BatEnum.range 0 ~until:50)) in
  let mb = mod_bessel a x in
  let ans_list = BatList.map mb range in
    List.fold_left (+.) 0. ans_list
