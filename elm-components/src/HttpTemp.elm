module HttpTemp exposing (..)

-- http://api.icndb.com/jokes/random
import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Http
import Json.Decode exposing (Decoder, field, string, list, int, bool )

type Model
    = Loading
    | Failure
    | Success String



view : Model -> Html Msg
view model =
    case model of
        Loading ->
            text "loading..."

        Failure ->
            text "failed to fetch new cat image"

        Success data ->
            div [] [ text (data) ]



fetchCatImageUrl : Cmd Msg
fetchCatImageUrl =
    Http.get
        { url = "http://api.icndb.com/jokes/random"
        , expect = Http.expectString GotResult
        }


   
init : () -> ( Model, Cmd Msg )
init _ =
    ( Loading, fetchCatImageUrl )

type Msg
    = GotResult (Result Http.Error String)

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