let _ =
  let wins = Football.wins in
  let draw = Football.draw in
  let lose = Football.lose in
  let wins_percent_lst = BatList.map Football.run_prediction wins in
  let draw_percent_lst = BatList.map Football.run_prediction draw in
  let lose_precent_lst = BatList.map Football.run_prediction lose in
  let win_percent = List.fold_left (+.) 0. wins_percent_lst in
  let draw_percent = List.fold_left (+.) 0. draw_percent_lst in
  let lose_percent =  List.fold_left (+.) 0. lose_precent_lst in
    print_endline ("win --> " ^ (string_of_float win_percent));
    print_endline ("draw --> " ^ (string_of_float draw_percent));
    print_endline ("lose --> " ^ (string_of_float lose_percent));
