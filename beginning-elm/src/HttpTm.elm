module HttpTm exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Http
import Json.Decode exposing (Decoder, field, string, list)


type Model
    = Loading
    | Failure
    | Success (List String)

type alias TodoResult =
    { 
    -- userId: Int
      id: Int
      ,title: String
   --  , completed: Bool
    }

view : Model -> Html Msg
view model =
    case model of
        Loading ->
            text "loading..."

        Failure ->
            text "failed to fetch new cat image"

        Success data ->
            div [ class "name" ] [
                 ul [ class "results" ] (List.map listData data )
            ]
listData: String -> Html Msg
listData result 
    = li [] [ text result ]

fetchCatImageUrl : Cmd Msg
fetchCatImageUrl =
    Http.get
        { url = "https://jsonplaceholder.typicode.com/todos"
        , expect = Http.expectJson GotResult  getDecoder
        }

getDecoder : Decoder (List String)
getDecoder = 
    Json.Decode.list (field "title" string)


init : () -> ( Model, Cmd Msg )
init _ =
    ( Loading, fetchCatImageUrl )


type Msg
    = GotResult (Result Http.Error (List String))

-- UPDATE

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GotResult result ->
            case result of
                Ok imageUrl ->
                    ( Success imageUrl, Cmd.none )

                Err _ ->
                    ( Failure, Cmd.none )

-- MAIN

main =
    Browser.element
        { init = init
        , update = update
        , subscriptions = \_ -> Sub.none
        , view = view
        }