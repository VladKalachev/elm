module Main exposing (..)

import Html exposing (..)
import Header
import Footer

main =
  div [] [
    Header.main
    , text "Main"
    , Footer.main
  ]