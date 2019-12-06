module Main exposing (main)

import Browser
import Html exposing (Html, button, div, h1, h2, input, p, text)
import Html.Attributes exposing (class, placeholder, value)
import Html.Events exposing (onClick, onInput)



-- main


main =
    Browser.sandbox { init = init, update = update, view = view }



-- model


type alias Model =
    { content : String, count : Int }


init : Model
init =
    { content = "", count = 0 }



-- update


type Msg
    = Increment
    | Decrement
    | Change String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            { model | count = .count model + 1 }

        Decrement ->
            { model | count = .count model - 1 }

        Change newContent ->
            { model | content = newContent }



-- view


view : Model -> Html Msg
view model =
    div [ class "container" ]
        [ h1 []
            [ text "David Learns Elm 🌳" ]
        , h2 [] [ text "Counter" ]
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
        , h2 [] [ text "Reverse text field" ]
        , div []
            [ input [ class "form-control", placeholder "Text to reverse", value <| .content model, onInput Change ] []
            , p [] [ text <| String.reverse <| .content model ]
            ]
        ]
