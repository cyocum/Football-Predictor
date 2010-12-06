let prob_mass k u1 u2 =
  let first = Lanczos.e ** -.(u1 +. u2) in
  let second = (u1 /. u2) ** ((float k) /. 2.) in
  let third = 2. *. sqrt (u1 *. u2) in
    first *. second *. (Bessel.run_mod_bessel (abs k) third)


