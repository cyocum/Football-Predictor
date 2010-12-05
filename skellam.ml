let home_team_gpm = (float_of_string Sys.argv.(1))
let away_team_gpm = (float_of_string Sys.argv.(2))

type t = {
  home_score : int;
  away_score : int;
  prediction : float
}

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
  (home, away) -> { home_score = home;
                    away_score = away;
                    prediction = skellam (home-away) home_team_gpm away_team_gpm
                  } 

let print_predictions preds =
  let print_pred x =
    let home_str = (string_of_int x.home_score) in
    let away_str = (string_of_int x.away_score) in
    let pred = (string_of_float x.prediction) in
      print_endline (home_str ^ " - " ^ away_str ^ " --> " ^ pred) 
  in
    List.iter print_pred preds 
  
  (*let find_max_prediction*) 
