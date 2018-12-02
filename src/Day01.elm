module Day01 exposing (partOne, partTwo)

import Set exposing (Set)



-- PART ONE


partOne : String -> Int
partOne =
    parse >> List.sum


parse : String -> List Int
parse =
    String.split "\n"
        >> List.map String.trim
        >> List.filter (String.isEmpty >> not)
        >> List.map (String.toInt >> Maybe.withDefault 0)



-- PART TWO


partTwo : String -> Int
partTwo =
    parse >> find


find : List Int -> Int
find values =
    case List.foldl update init values of
        Found value ->
            value

        NotFound _ _ ->
            find (List.append values values)


type Model
    = Found Int
    | NotFound Int (Set Int)


init : Model
init =
    NotFound 0 (Set.fromList [])


update : Int -> Model -> Model
update operand model =
    case model of
        Found sum ->
            Found sum

        NotFound lastSum seenSums ->
            let
                sum =
                    lastSum + operand
            in
            if Set.member sum seenSums then
                Found sum

            else
                NotFound sum (Set.insert sum seenSums)
