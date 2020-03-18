module Main exposing (..)

import Browser
import Html exposing (..)
import List

type alias Model =
    {
       value: String 
    }

type Message 
    = Add

-- INIT
init: Model 
init = 
    { value = "List" }

-- VIEW
view : Model -> Html Message
view model =
        div [] [ text model.value ] 
    
-- UPDATE
update : Message -> Model -> Model
update msg model =
    model

-- MAIN
main =
    Browser.sandbox
        { init = init
        , view = view
        , update = update
        }