let _ =
  let range = BatList.of_enum (BatEnum.range 0 ~until:5) in 
  let scores = Skellam.cartesian_product range range in
  let predictions = BatList.map Skellam.run_prediction scores in  
    Skellam.print_predictions predictions
