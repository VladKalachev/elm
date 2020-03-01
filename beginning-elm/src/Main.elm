module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import String exposing (..)


-- MODEL 

type alias SearcResult =
     {  id: Int
        , name: String
        , stars: Int }

type alias Model =
  { query : String,
    results: List SearcResult
  }


initialModel: Model
initialModel =
    {
        query = "tutorial"
        , results =
            [
                {
                    id = 1
                    , name = "TheSeamau5/elm-checkerboardgrid-tutorial"
                    , stars = 66
                }
                ,{
                    id = 2
                    , name = "TheSeamau5/elm-checkerboardgrid-tutorial"
                    , stars = 41
                }
               ,{
                    id = 3
                    , name = "TheSeamau5/elm-checkerboardgrid-tutorial"
                    , stars = 35
               }
            ]
    }

elmHubHeader: Html Msg 
elmHubHeader = 
            header []
                [ h1 [] [ text "ElmHub" ]
                , span [ class "tagline"] [ text "Like GitHub, but for Elm thins." ]   
                ]

{- VIEW -}

type alias Msg =
    { operation: String
    , data: Int
    }

view : Model -> Html Msg
view model =
    div [ class "content"] 
            [ elmHubHeader
                , ul [ class "results" ] (List.map viewSearcResult model.results)
            ]


viewSearcResult: SearcResult -> Html Msg
viewSearcResult result = 
    li []
        [  span [ class "start-count"] [ text (String.fromInt result.stars)]
        , a [ href ("https://github.com/" ++ result.name), target "_blank" ] 
            [ text result.name ]
        , button 
            [class "hidden-result", onClick { operation = "DELETE_BY_ID", data = result.id }] 
            [ text "X"]
        ]

{- UPDATE -}

update: Msg -> Model -> Model
update msg model =
    if msg.operation == "DELETE_BY_ID" then
        { model | results = List.filter (\result -> result.id /= msg.data) model.results } 
    else 
        model

-- MAIN


main =
    Browser.sandbox 
    { 
      init = initialModel,
      update = update, 
      view = view
    }