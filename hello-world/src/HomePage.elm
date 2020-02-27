module HomePage exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

main =
  div [ class "wrapper"][
    div [ style "color" "red" ][ text "Hello Wolrd!"],
    span [][ text "Span" ]
  ]