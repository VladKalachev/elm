module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
import Debug exposing (log)
import List

type alias Model =
    {
       value: String 
    }

type Message = 
    Add
    | InputText String

-- INIT
init: Model 
init = 
    { value = "List" }

-- VIEW
view : Model -> Html Message
view model =
        div [ class "wrapper" ] [ 
            div [] [ text "TODO list"] 
            , text model.value
            ,div [] []
            , input [ onInput InputText ] []
            , button [ onClick Add ] [ text "add" ] 
        ] 
    
-- UPDATE
update : Message -> Model -> Model
update msg model =
    let
        log1 = log "msg" msg
        log2 = log "model" model
    in
    
    case msg of
            Add ->
                model
            InputText inputText ->
                { model | value = inputText }

-- MAIN
main =
    Browser.sandbox
        { init = init
        , view = view
        , update = update
        }