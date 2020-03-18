module TodoObj exposing (..)

{- Example of writing a simple todo list -}
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
type alias Todo = 
    { id: Int
    , value: String }

type alias Model =
    { value: String
     , list: List Todo }

init: Model 
init = 
    { value = "List"
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
            ,ul [ class "results" ] (List.map viewResult model.list)
            ,div [] []
            , input [ onInput InputText ] []
            , button [ onClick Add ] [ text "add" ] 
        ] 

-- viewResult: String -> Html Message
viewResult result =
    li [ ] [ text result.value ]

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
              { model | list = { 
                  id = List.length model.list + 1, value = model.value
                }::model.list }

            InputText inputText ->
                { model | value = inputText }

            DelteElemet id ->
                model
            