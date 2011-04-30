open Arg

type cli_args =  {
  mutable input_file_name : string;
  mutable home_gpg : float;
  mutable away_gpg : float;
}

let arguments = { input_file_name = "";
		  home_gpg = 0.;
		  away_gpg = 0.
		}

let args = [("-filename", String((fun s -> arguments.input_file_name <- s)), "file name of matches");
	    ("-home_gpg", Float((fun x -> arguments.home_gpg <- x)), "home goals per game");
	    ("-away_gpg", Float((fun x -> arguments.away_gpg <- x)), "away goals perl game")
	   ]

let load_predictions file_name = Csv.to_array (Csv.load file_name)

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
  Arg.parse args (fun _ -> ()) "blah";
  match arguments.input_file_name with
    | "" -> calc ("Home", "Away", arguments.home_gpg, arguments.away_gpg)
    | _ -> 
      let predictions = load_predictions arguments.input_file_name in
      let prediction_lst = Array.to_list (Array.map create_tuples predictions) in 
        List.iter calc prediction_lst
