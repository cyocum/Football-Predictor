let home_team_gpm = (float_of_string Sys.argv.(1))
let away_team_gpm = (float_of_string Sys.argv.(2))

let wins = [1;2;3;4;5;6;7;8;9;10]
let draw = [0]
let lose = [-1;-2;-3;-4;-5;-6;-7;-8;-9;-10] 

let run_prediction spread =
  Skellam.prob_mass spread home_team_gpm away_team_gpm


