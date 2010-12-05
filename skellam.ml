let home_team_gpm = (float_of_string Sys.argv.(1))
let away_team_gpm = (float_of_string Sys.argv.(2))

let skellam k u1 u2 =
  let first = Lanczos.e ** -.(u1 +. u2) in
  let second = (u1 /. u2) ** ((float k) /. 2.) in
  let third = 2. *. sqrt (u1 *. u2) in
    first *. second *. (Bessel.run_mod_bessel (abs k) third)

let cartesian_product xs ys =
  List.rev 
  (List.fold_left (fun acc x ->
    List.fold_left (fun acc y ->
      (x,y) :: acc)
    acc ys)
  [] xs)

let run_prediction = function
  (home, away) -> skellam (home-away) home_team_gpm away_team_gpm

let print_predictions pred scores =
  match scores with
    (home, away) ->
      let home_str = string_of_int home in
      let away_str = string_of_int away in
      let pred_str = string_of_float pred in
        print_endline (home_str ^ " - " ^ away_str ^ " --> " ^ pred_str)


