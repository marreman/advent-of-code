module Main exposing (main)

import Browser
import Html exposing (..)
import Html.Events exposing (onInput)


main : Program () Model Msg
main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }



-- MODEL


type alias Model =
    { result : Int
    }


init : Model
init =
    { result = 0
    }



-- UPDATE


type Msg
    = NewInput String


update : Msg -> Model -> Model
update msg model =
    case msg of
        NewInput input ->
            { model
                | result =
                    input
                        |> String.split "\n"
                        |> List.map (String.toInt >> Maybe.withDefault 0)
                        |> List.sum
            }



-- VIEW


view : Model -> Html Msg
view model =
    div
        []
        [ fieldset []
            [ legend [] [ text "Input" ]
            , textarea [ onInput NewInput ] []
            ]
        , fieldset []
            [ legend [] [ text "Result" ]
            , span [] [ text (String.fromInt model.result) ]
            ]
        ]
