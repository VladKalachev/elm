module Button exposing (..)

import Browser
import Html exposing (Html, Attribute, div, button, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)

-- MAIN

main =
  Browser.sandbox { init = init, update = update, view = view }

-- MODEL
type alias Model = Int

init: Model
init = 0


-- UPDATE
type Msg =  Decrement | Increment

update: Msg -> Model -> Model
update msg model =
  case msg of
    Increment -> 
        model + 1

    Decrement ->
      model - 1

-- VIEW
view : Model -> Html Msg
view model =
    div[ ]
        [
            div [ ]
                [ button [ onClick Decrement ] [ text "-" ],
                div [] [text (String.fromInt model),
                div [] [ 
                    button [onClick Increment ] [ text "+"] 
                    ]
                ]  
            ]
        ]
        
       
       
   