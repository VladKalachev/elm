module HttpTemplate exposing (..)

import Http
import Browser
import Html exposing (..)
import Json.Decode exposing (Decoder, list, field, string)
-- import Json.Decode as D

type Model
  = Failure
  | Loading
  | Success String

type alias TodoResult =
    {  userId: Int
     , id: Int
     , title: String
     , completed: Bool
    }

type Msg
  = GotBook (Result Http.Error String)
  | GotItems (Result Http.Error (List TodoResult))
  | GotText (Result Http.Error String)

-- MAIN

main =
  Browser.element
    { init = init
    , update = update
    , subscriptions = subscriptions
    , view = view
    }

-- INIT

init : () -> (Model, Cmd Msg)
init _ =
  ( Loading
  , fetchItems
  )

-- getBook : Cmd Msg
-- getBook =
--   Http.get
--     { url = "https://elm-lang.org/assets/public-opinion.txt"
--     , expect = Http.expectString GotBook
--     }

fetchItems : Cmd Msg
fetchItems =
  Http.get
    { url = "https://jsonplaceholder.typicode.com/todos"
    , expect = Http.expectJson GotItems -- gitDecoder
    }

-- gitDecoder : Decoder (List TodoResult)
-- gitDecoder =
--   list (field "title" string)

-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none

-- VIEW

view : Model -> Html Msg
view model =
  case model of
    Failure ->
      text "I was unable to load your book."

    Loading ->
      text "Loading..."

    Success fullText ->
      div [] [ text fullText ]
      

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    GotText result ->
      case result of
        Ok fullText ->
          (Success fullText, Cmd.none)

        Err _ ->
          (Failure, Cmd.none)

