type cli_args =  {
  mutable input_file_name : string;
  mutable home_gpg : float;
  mutable away_gpg : float;
}

val parse : unit -> cli_args
