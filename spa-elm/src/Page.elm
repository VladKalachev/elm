module Page exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)

-- INIT
type alias Model =
    { value: String }

-- init: Model
init = 
    { value = "" }

-- VIEW
view model = 
    div [] [ text "text" ]


type Msg =
    Add
-- UPDATE
update msg model =
    model



-- MAIN
-- main : Program () Model Msg
main =
    Browser.sandbox
        { init = init
        , view = view
        , update = update
        }