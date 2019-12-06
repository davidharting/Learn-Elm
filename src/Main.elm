module Main exposing (main)

import Browser
import Html exposing (Html, button, div, form, h1, h2, input, label, p, text)
import Html.Attributes exposing (class, for, name, placeholder, type_, value)
import Html.Events exposing (onClick, onInput)



-- main


main =
    Browser.sandbox { init = init, update = update, view = view }



-- model
-- Control show / hide password


type alias SignUpForm =
    { name : String
    , password : String
    , passwordAgain : String
    , showPassword : Bool
    }


type alias Model =
    { content : String, count : Int, form : SignUpForm }


init : Model
init =
    { content = ""
    , count = 0
    , form =
        { name = ""
        , password = ""
        , passwordAgain = ""
        , showPassword = False
        }
    }



-- update


type Msg
    = Increment
    | Decrement
    | Change String
    | FormTogglePasswordVisiblity
    | FormName String
    | FormPassword String



-- | FormPassword String
-- | FormPasswordAgain String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            { model | count = .count model + 1 }

        Decrement ->
            { model | count = .count model - 1 }

        Change newContent ->
            { model | content = newContent }

        FormTogglePasswordVisiblity ->
            let
                oldForm =
                    .form model

                newForm =
                    { oldForm | showPassword = Basics.not model.form.showPassword }
            in
            { model | form = newForm }

        FormName newName ->
            let
                oldForm =
                    .form model

                newForm =
                    { oldForm | name = newName }
            in
            { model | form = newForm }

        FormPassword newPassword ->
            let
                oldForm =
                    .form model

                newForm =
                    { oldForm | password = newPassword }
            in
            { model | form = newForm }



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
        , h2 [] [ text "Forms" ]
        , form []
            [ div [ class "form-group" ]
                [ label [ for "name" ] [ text "Name" ]
                , input [ class "form-control", name "name", placeholder "Your name", value model.form.name, onInput FormName ] []
                ]
            , div [ class "form-group" ]
                [ label [ for "password" ] [ text "Password" ]
                , div [ class "input-group" ]
                    [ input
                        [ class "form-control"
                        , name "password"
                        , placeholder "Ssssshhh"
                        , type_ <|
                            if model.form.showPassword == True then
                                "text"

                            else
                                "password"
                        , value model.form.password
                        , onInput FormPassword
                        ]
                        []
                    , div [ class "input-group-append" ]
                        [ div [ class "btn btn-info", onClick FormTogglePasswordVisiblity ]
                            [ text <|
                                if model.form.showPassword then
                                    "Hide"

                                else
                                    "Show"
                            ]
                        ]
                    ]
                ]
            ]
        ]
