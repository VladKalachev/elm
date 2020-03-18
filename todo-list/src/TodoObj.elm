module TodoObj exposing (..)

{- Example of writing a simple todo list -}
import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
import String exposing (fromInt, toInt)
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
type alias Todo = 
    { id: Int
    , value: String }

type alias Model =
    { value: String
     , list: List Todo }

init: Model 
init = 
    { value = ""
    , list = [
        {
            id = 1,
            value = "Test"
        }
    ] }

-- VIEW
view : Model -> Html Message
view model =
        div [ class "wrapper", style "color" "red" ] [ 
            div [] [ text "TODO list"]
            ,ul [ class "results" ] (List.map viewResult model.list )
            ,div [] []
            , input [ onInput InputText, value model.value ] []
            , button [ onClick Add ] [ text "add" ] 
        ] 

-- viewResult: String -> Html Message
viewResult result =
    li [ ] [
      div [] [
        text (fromInt result.id)
        , text " - "
        , text result.value
        , span [ 
            style "cursor" "pointer", 
            style "color" "#000",
            onClick (DelteElemet result.id)
         ] [ text " X" ]
     ]
      ]

type Message = 
    Add
    | InputText String
    | DelteElemet Int

-- UPDATE
update : Message -> Model -> Model
update msg model =
    let
        log1 = log "msg" msg
        log2 = log "model" model
    in
    case msg of
            Add ->
                let
                  
                    adding = { 
                        id = List.length model.list + 1, value = model.value
                        }::model.list  
                    data = List.sortBy .id adding
                    log4 = log "model.adding" adding
                    -- |> List.reverse model.list 
                in
                    { model | list = data, value = "" }

            InputText inputText ->
                { model | value = inputText  }

            DelteElemet id ->
                let
                    log3 = log "id" id
                in
                    { model | list = List.filter (\result -> result.id /= id) model.list }
            