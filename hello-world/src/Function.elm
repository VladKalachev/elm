module Function exposing (..)

import Html exposing (..)

{-sun : Int -> Int -> Int
sun a b
    = a ++ b


-}
sum a b
    = a + b

add a b
    = (+) a b

multiply a b = a * b
greet name 
    = "Hello " ++ name ++ "!"

escapeEarth myVelocity mySpeed =
    if myVelocity > 11.186 then
        "Godspeed"

    else if mySpeed == 7.67 then
        "Stay in orbit"

    else
        "Come back"

{- main =
  text (String.fromFloat(add 10 20))
-}

view =  
    add 20 20
        |> String.fromFloat
        |> text
main =
    view