module Day01 exposing (partOne, partTwo)

import Set exposing (Set)



-- PART ONE


partOne : String -> Int
partOne =
    parse >> List.sum



-- PART TWO


partTwo : String -> Int
partTwo =
    parse >> findFirstRepeatedSum


type State
    = Found Int
    | NotFound Int (Set Int)


initState : State
initState =
    NotFound 0 (Set.fromList [])


findFirstRepeatedSum : List Int -> Int
findFirstRepeatedSum xs =
    let
        find : Int -> State -> State
        find operand lastState =
            case lastState of
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
    in
    case List.foldl find initState xs of
        Found value ->
            value

        NotFound _ _ ->
            findFirstRepeatedSum (List.append xs xs)


parse : String -> List Int
parse =
    String.split "\n"
        >> List.map String.trim
        >> List.filter (String.isEmpty >> not)
        >> List.map (String.toInt >> Maybe.withDefault 0)
