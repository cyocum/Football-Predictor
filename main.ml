let input_file_name = Sys.argv.(1)
let predictions = Csv.to_array (Csv.load input_file_name)

let create_tuples predictions =
  BatList.map (fun x -> (x.(0), x.(1), x.(2), x.(3))) predictions.(0)

let _ =
  let win_percent = Football.calc_outcome Football.Win in
  let draw_percent = Football.calc_outcome Football.Draw in
  let lose_percent = Football.calc_outcome Football.Lose in
    print_endline ("win --> " ^ (string_of_float win_percent));
    print_endline ("draw --> " ^ (string_of_float draw_percent));
    print_endline ("lose --> " ^ (string_of_float lose_percent));   
