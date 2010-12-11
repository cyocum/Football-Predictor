type outcome = Win | Lose | Draw

let calc_outcome outcome =
  let calc_outcome_aux = BatList.map Football.run_prediction in
  let fold_float = List.fold_left (+.) 0. in
   match outcome with
      | Win -> 
        fold_float (calc_outcome_aux Football.wins)
      | Lose ->
        fold_float (calc_outcome_aux Football.lose)
      | Draw ->
        fold_float (calc_outcome_aux Football.draw)

let _ =
  let win_percent = calc_outcome Win in
  let draw_percent = calc_outcome Draw in
  let lose_percent = calc_outcome Lose in
    print_endline ("win --> " ^ (string_of_float win_percent));
    print_endline ("draw --> " ^ (string_of_float draw_percent));
    print_endline ("lose --> " ^ (string_of_float lose_percent));   
