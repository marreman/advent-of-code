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
    { sum : Int
    , firstFreqReachedTwice : Maybe Int
    }


init : Model
init =
    { sum = 0
    , firstFreqReachedTwice = Nothing
    }



-- UPDATE


type Msg
    = NewInput String


update : Msg -> Model -> Model
update msg model =
    case msg of
        NewInput input ->
            let
                values =
                    parseRawInput input

                inter1 =
                    toIntermediarySums values

                inter2 =
                    toIntermediarySums inter1

                inter3 =
                    toIntermediarySums inter2
            in
            { model
                | sum = List.sum values
                , firstFreqReachedTwice =
                    inter3
                        |> toIntermediarySums
                        |> Debug.log "sums"
                        |> findDuplicates
                        |> Debug.log "first"
                        |> Just
                        |> always Nothing
            }


parseRawInput : String -> List Int
parseRawInput =
    String.split "\n"
        >> List.map (String.toInt >> Maybe.withDefault 0)


toIntermediarySums =
    let
        lastFreq =
            List.head >> Maybe.withDefault 0

        handle freqChange frequencies =
            freqChange + lastFreq frequencies :: frequencies
    in
    List.foldl handle []
        >> List.reverse


findDuplicates freqs =
    freqs
        |> List.indexedMap
            (\i freq ->
                ( freq
                , freqs
                    |> List.indexedMap (\j freq2 -> i /= j && freq == freq2)
                    |> List.any ((==) True)
                )
            )
        |> List.filter (Tuple.second >> (==) True)



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
            [ legend [] [ text "Sum of input (first half of challenge)" ]
            , span [] [ text (String.fromInt model.sum) ]
            ]
        , fieldset []
            [ legend [] [ text "First frequency reached twice (second half of challenge)" ]
            , span [] [ text (Debug.toString model.firstFreqReachedTwice) ]
            ]
        ]
