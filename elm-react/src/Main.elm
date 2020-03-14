module Main exposing (main)

import Html exposing (Html, text, div)
import Elm.Test as Test

main : Html msg
main =
    div [] [
        text "Hello",
        div [] [
            Test.main
        ]
    ]