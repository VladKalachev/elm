module HttpRequest exposing (..)

-- Make a GET request to load a book called "Public Opinion"
--
-- Read how it works:
--   https://guide.elm-lang.org/effects/http.html
--

import Browser
import Html exposing (..)
import Json.Decode exposing (Decoder, field, string)
import Http

-- MAIN

main =
  Browser.element
    { init = init
    , update = update
    , subscriptions = subscriptions
    , view = view
    }

-- MODEL

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


init : () -> (Model, Cmd Msg)
init _ =
  ( Loading
  , getData
  )


-- UPDATE

type Msg
  = GotText (Result Http.Error String)

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    GotText result ->
      case result of
        Ok fullText ->
          (Success fullText, Cmd.none)

        Err _ ->
          (Failure, Cmd.none)

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
      pre [] [ text fullText
        --  div [ ] [
        --      ul [] (List.map viewSearcResult fullText)
         --  ]
      ]
         -- text fullText ]

viewSearcResult result = 
    li []
        [  
            span [ ] [ text result ] 
        ]

-- HTTP


getData : Cmd Msg
getData =
  Http.get
    { url = "https://jsonplaceholder.typicode.com/todos"
    , expect = Http.expectJson GotText gitDecoder
    }
-- https://api.giphy.com/v1/gifs/random?api_key=dc6zaTOxFJmzC&tag=cat

gitDecoder : Decoder (List TodoResult)
gitDecoder =
  field "data" (field "title" string)

--   Http.get
--       { url = "https://jsonplaceholder.typicode.com/todos"
--       , expect = Http.expectJson GotText (list string)-- gifDecoder
--       }