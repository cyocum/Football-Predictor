open Arg

type cli_args =  {
  mutable input_file_name : string;
  mutable home_gpg : float;
  mutable away_gpg : float;
}



let parse () =
  let arguments = { input_file_name = "";
		    home_gpg = 0.;
		    away_gpg = 0.
		  } in
  let args = [("-filename", String((fun s -> arguments.input_file_name <- s)), "file name of matches");
	      ("-home_gpg", Float((fun x -> arguments.home_gpg <- x)), "home goals per game");
	      ("-away_gpg", Float((fun x -> arguments.away_gpg <- x)), "away goals perl game")
	   ] in  
  Arg.parse args (fun _ -> ()) "blah";
  arguments;
