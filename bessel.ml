let factorial n =
  let rec fact_aux n a =
    match n with
      | 0 -> a
      | _ -> fact_aux (n-1) (n*a)
  in
    fact_aux n 1
  
let mod_bessel_first m a =
  (1. /. ((float (factorial m)) *. (Lanczos.gamma (float (m + a + 1)))))

let mod_bessel_second m x a =
  (x /. 2.) ** (float (2 * m + a))

let mod_bessel m a x =
  (mod_bessel_first m a) *. (mod_bessel_second m x a)

let run_mod_bessel a x =
  let range = (BatList.of_enum (BatEnum.range 0 ~until:50)) in
  let ans_list = BatList.map (fun m -> mod_bessel m a x) range in
    List.fold_left (+.) 0. ans_list


