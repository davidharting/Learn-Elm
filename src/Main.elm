module Main exposing (main)

import Browser
import Html exposing (Html, button, div, h1, p, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)



-- main


main =
    Browser.sandbox { init = init, update = update, view = view }



-- model


type alias Model =
    { count : Int }


init : Model
init =
    { count = 0 }



-- update


type Msg
    = Increment
    | Decrement


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            { model | count = .count model + 1 }

        Decrement ->
            { model | count = .count model - 1 }



-- view


view : Model -> Html Msg
view model =
    div [ class "container" ]
        [ h1 []
            [ text "David Learns Elm 🌳" ]
        , div
            [ class "row align-items-center" ]
            [ button [ class "btn btn-danger col", onClick Decrement ]
                [ text "-" ]
            , p
                [ class "h2 text-center col" ]
                [ text <| String.fromInt <| .count model ]
            , button
                [ class "btn btn-success col", onClick Increment ]
                [ text "+" ]
            ]
        ]
