let _ =
  let spreads = [1; 0; -1; 2; -2; 3; -3] in
  let preds = BatList.map (fun x -> Skellam.run_prediction x) spreads in
    BatList.iter2 Skellam.print_prediction spreads preds
