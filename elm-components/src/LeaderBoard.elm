module LeaderBoard exposing (..)

import Browser
import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)

-- model

type alias Model =
    {
        runner: List Runner
       , query: String
    }

type alias Runner = 
    {
        id: Int
       , name: String
       , location: String
    }

initModel : Model
initModel =
    {
        runner = []
        , query = ""
    }

-- update

type Msg
    = QueryInput String

update : Msg -> Model -> Model
update msg model =
    case msg of 
        QueryInput query ->
            { model | query = query }

-- view
view : Model -> Html Msg
view model =
    div []
        [ h3 [] [ text "Leaderboard page... So far" ]
            , input
                [ type_ "text" 
                 , onInput QueryInput
                 , value model.query
                 , placeholder "Search for a runner..."
                ]
                []
            , hr [] []
            , h4 [] [ text "Leaderboard Model:" ]
          --  , p [] [ text <| toString model ] 
        ]

main : Program () Model Msg
main =
    Browser.sandbox
        { init = initModel
        , view = view
        , update = update
        }