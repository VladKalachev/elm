module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)
import Json.Decode exposing (..)
import Json.Decode.Pipeline exposing (..)
import String exposing (..)
import SimpleResponse

-- import Test

-- MAIN
main =
    Browser.sandbox 
    { 
      init = initialModel,
      update = update, 
      view = view
    }

searchResultDecoder: Decoder SearcResult
searchResultDecoder =
    decode SearcResult
        |> required "id" int
        |> required "stargazers_count" int
        |> required "full_name" string

responseDecoder: Decoder (List SearcResult)
responseDecoder =
    decode identity
        |> required "items" (list searchResultDecoder)

decodeResults : String -> List SearcResult
decodeResults json =
    case decodeString responseDecoder json of
    Ok searcResult ->
        searcResult

    Err -> 
        []

-- MODEL 

type alias Model =
  { query : String
  , results: List SearcResult
  }

type alias SearcResult =
     {  id: Int
        , stars: Int
        , name: String
    }

-- type alias Msg =
--     { operation: String
--     , data: Int
--     }


initialModel: Model
initialModel =
    {
        query = "tutorial"
      , results = decodeResults  [] -- SimpleResponse.json
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
                , Html.Attributes.value model.query 
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
            [ class "hidden-result", onClick (DeleteById result.id) ]
            [ text "X"]
        ]

{- UPDATE -}

type Msg
    = SetQuery String | DeleteById Int

update: Msg -> Model -> Model
update msg model =
    case msg of
        SetQuery query ->
           { model | query = query }

        DeleteById id ->
            { model | results = List.filter (\result -> result.id /= id) model.results }

        -- _->
        --     model
    
