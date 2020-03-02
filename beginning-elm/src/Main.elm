module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)
import String exposing (..)


-- MODEL 

type alias Model =
  { query : String,
    results: List SearcResult
  }
type alias SearcResult =
     {  id: Int
        , name: String
        , stars: Int }

-- type alias Msg =
--     { operation: String
--     , data: Int
--     }
type Msg
    = SetQuery String | DeleteById Int

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



view : Model -> Html Msg
view model =
    div [ class "content"] 
            [ elmHubHeader
                , input [ class "search-query"
                , onInput SetQuery
                --, defaultValue model.query 
                ]
                 []
                , button [ class "search-button" ] [ text "Search"] 
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
    case msg of
       1 ->
        model
        -- SetQuery ->
        --    { model | results = List.filter (\result -> result.id /= msg.data) model.results }
        _ ->
        model
    
--    if msg.operation == "DELETE_BY_ID" then
--        { model | results = List.filter (\result -> result.id /= msg.data) model.results } 
--    else 
--        model

-- MAIN


main =
    Browser.sandbox 
    { 
      init = initialModel,
      update = update, 
      view = view
    }