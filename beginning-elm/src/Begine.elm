module Begine exposing (..)

import Browser
import Html exposing (..)
import Html.Events exposing (onClick, onInput)
import String exposing (fromInt)
import Debug exposing (log)

type alias Model =
    { 
        value: Int
        , firstName: String
        , numberAdd: Int
    }

type Messages =
    Add
    | ChangedAddText String

-- INIT
init: Model   
init =
    { value = 0
    , firstName = "Mat"
    , numberAdd = 0
    }


-- VIEW
view : Model -> Html Messages
view model =   
        div [] [ text (fromInt model.value)
            , div [] []
            , input [ onInput ChangedAddText ] []
            , button [ onClick Add ] [ text "Add" ]
            , div [] [ text model.firstName ]
        ]

-- UPDATE
update : Messages -> Model -> Model
update msg model =
    let
        log1 = log "msg" msg
        log2 = log "model" model
    in
     case msg of 
       Add -> 
           { model | value = 70 }
       ChangedAddText theText -> 
            let
                log3 = log "theText" theText
            in
           { model | firstName = theText }
       


main =
    Browser.sandbox
        { init = init
        , view = view
        , update = update
        }