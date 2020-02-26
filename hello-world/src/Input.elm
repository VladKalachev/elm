module Input exposing (..)

import Browser
import Html exposing (Html, Attribute, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)

-- MAIN

main =
  Browser.sandbox { init = init, update = update, view = view }

-- MODEL
type alias Model =
 { value: String }

init: Model
init =
    { value = "" }


-- UPDATE
type Msg
  = Change String

update: Msg -> Model -> Model
update msg model =
  case msg of
    Change newContent ->
      { model | value = newContent }

-- VIEW
view : Model -> Html Msg
view model =
    div[ ]
        [
            div [ ]
            [ input [ placeholder "Text to reverse", value model.value, onInput Change ] []
            , div [] [ text (model.value) ]
            ]
        ]
       
       
   