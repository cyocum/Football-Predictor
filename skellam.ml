let skellam k u1 u2 =
  let first = Lanczos.e ** -.(u1 +. u2) in
  let second = (u1 /. u2) ** ((float k) /. 2.) in
  let third = 2. *. sqrt (u1 +. u2) in
    first *. second *. (Bessel.run_mod_bessel (abs k) third)

let _ =
  let blah = -1 in 
  let output = skellam blah 1.5 2.0 in
    print_endline (string_of_float output)
