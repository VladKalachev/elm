module Begine exposing (..)

import Browser
import Html exposing (..)
import Html.Events exposing (onClick, onInput)
import String exposing (fromInt, toInt)
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
           -- , div [] [ text (fromInt model.numberAdd) ]
        ]
        
purseUserNumber : String -> Int 
purseUserNumber text =
        let
           theMeby = toInt text
        in 
            case theMeby of
               Just val ->
                    val
               Nothing ->
                    0

-- UPDATE
update : Messages -> Model -> Model
update msg model =
    let
        log1 = log "msg" msg
        log2 = log "model" model
    in
     case msg of 
       Add -> 
           { model | value = model.value + model.numberAdd }
       ChangedAddText theText -> 
            let
                log3 = log "theText" theText
            in
                { model | numberAdd = purseUserNumber theText }
          -- { model | firstName = theText }

       


main =
    Browser.sandbox
        { init = init
        , view = view
        , update = update
        }