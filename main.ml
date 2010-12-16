let input_file_name = Sys.argv.(1)
let predictions = Csv.to_array (Csv.load input_file_name)

let calc = function
  (home_name, away_name, home_gpg, away_gpg) ->
    let win_percent = Football.calc_outcome Football.Win home_gpg away_gpg in
    let draw_percent = Football.calc_outcome Football.Draw home_gpg away_gpg in
    let lose_percent = Football.calc_outcome Football.Lose home_gpg away_gpg in
      print_endline (home_name ^ " - " ^ away_name);
      print_endline ("win --> " ^ (string_of_float win_percent));
      print_endline ("draw --> " ^ (string_of_float draw_percent));
      print_endline ("lose --> " ^ (string_of_float lose_percent))

let create_tuples = function
  | [| home_name; away_name; home_gpg; away_gpg |] ->
    (home_name, away_name, (float_of_string home_gpg), (float_of_string
    away_gpg))
  | _ -> raise (Invalid_argument "the array must have four elements")   


let _ =
  let prediction_lst = Array.to_list (Array.map create_tuples predictions) in 
    List.iter calc prediction_lst
