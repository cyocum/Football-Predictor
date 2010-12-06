let home_team_gpm = (float_of_string Sys.argv.(1))
let away_team_gpm = (float_of_string Sys.argv.(2))

let run_prediction spread =
  Skellam.prob_mass spread home_team_gpm away_team_gpm


