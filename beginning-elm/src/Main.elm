module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import String exposing (..)

-- MAIN

main =
  Browser.sandbox 
  { 
      init = initialModel,
      update = update, 
      view = view
  }


-- MODEL 
type alias Model =
  { query : String,
    results: List { id: Int, name: String, stars: Int }
  }

-- init: Model
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

elmHubHeader = 
            header []
                [ h1 [] [ text "ElmHub" ]
                , span [ class "tagline"] [ text "Like GitHub, but for Elm thins." ]   
                ]

{- VIEW -}

view model =
    div [ class "content"] 
            [ elmHubHeader
                , ul [ class "results" ] (List.map viewSearcResult model.results)
            ]


viewSearcResult result = 
    li []
        [  span [ class "start-count"] [ text (result.name)],
         button [class "hidden-result", onClick {operation = "DELETE_BY_ID", data = result.id}] [ text "X"]]

{- UPDATE -}

-- update msg model 
--    = model
update msg model =
    if msg.operation == "DELETE_BY_ID" then
        { model | results = List.filter (\result -> result.id /= msg.data) model.results } 
    else 
        model

        