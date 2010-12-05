let home_team_gpm = (float_of_string Sys.argv.(1))
let away_team_gpm = (float_of_string Sys.argv.(2))

let skellam k u1 u2 =
  let first = Lanczos.e ** -.(u1 +. u2) in
  let second = (u1 /. u2) ** ((float k) /. 2.) in
  let third = 2. *. sqrt (u1 *. u2) in
    first *. second *. (Bessel.run_mod_bessel (abs k) third)

let run_prediction spread =
  skellam spread home_team_gpm away_team_gpm

let print_prediction spread pred =
  let spread_str = (string_of_int spread) in
  let pred_str = (string_of_float pred) in
    print_endline (spread_str ^ " --> " ^ pred_str)
