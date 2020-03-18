module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
import Debug exposing (log)
import List exposing (..)

-- MAIN
main =
    Browser.sandbox
        { init = init
        , view = view
        , update = update
        }

-- MODEL
type alias Model =
    { value: String
     , list: List String }

init: Model 
init = 
    { value = "List"
    , list = ["Todo 1"] }

-- VIEW
view : Model -> Html Message
view model =
        div [ class "wrapper" ] [ 
            div [] [ text "TODO list"]
            ,ul [ class "results" ] (List.map viewResult model.list)
            ,div [] []
            , input [ onInput InputText ] []
            , button [ onClick Add ] [ text "add" ] 
        ] 

viewResult: String -> Html Message
viewResult name =
    li [ ] [ text name ]

type Message = 
    Add
    | InputText String

-- UPDATE
update : Message -> Model -> Model
update msg model =
    let
        log1 = log "msg" msg
        log2 = log "model" model
    in
    case msg of
            Add ->
                { model | list = model.value::model.list }
            InputText inputText ->
                { model | value = inputText }