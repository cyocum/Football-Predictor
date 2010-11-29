

let skellam k u1 u2 =
    (Lanczos.e exp -(u1 +. u2)) * ((u1 /. u2) exp (k / 2)) * (Bessel.mod_bessel (abs_float k)
    (2 *. sqrt (u1 +. u2)))  

