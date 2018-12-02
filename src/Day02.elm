module Day02 exposing (partOne, partTwo)

import Array
import Dict exposing (Dict)



-- PART ONE


partOne : String -> Int
partOne =
    parse
        >> List.map countChars
        >> summarizeResults


parse : String -> List String
parse =
    String.lines
        >> List.map String.trim
        >> List.filter (String.isEmpty >> not)


type alias ScanResult =
    { hasDupletChar : Bool
    , hasTripletChar : Bool
    }


countChars : String -> ScanResult
countChars id =
    id
        |> String.foldl
            (\char chars ->
                Dict.insert char
                    (chars
                        |> Dict.get char
                        |> Maybe.map ((+) 1)
                        |> Maybe.withDefault 1
                    )
                    chars
            )
            Dict.empty
        |> Dict.toList
        |> List.foldl
            (\( char, n ) result ->
                let
                    isTripletChar =
                        n == 3

                    isDupletChar =
                        n == 2
                in
                { hasDupletChar = result.hasDupletChar || isDupletChar
                , hasTripletChar = result.hasTripletChar || isTripletChar
                }
            )
            (ScanResult False False)


summarizeResults : List ScanResult -> Int
summarizeResults results =
    let
        summarize_ f =
            results
                |> List.map f
                |> List.filter ((==) True)
                |> List.length
    in
    summarize_ .hasDupletChar * summarize_ .hasTripletChar



-- PART TWO


type alias Line =
    { chars : String
    , strikes : Int
    }


toLine : String -> Line
toLine chars =
    { chars = chars
    , strikes = 0
    }


partTwo : String -> String
partTwo input =
    let
        lines =
            input
                |> parse
                |> List.map toLine

        length =
            lines
                |> List.head
                |> Maybe.map (.chars >> String.length)
                |> Maybe.withDefault 0

        forEachChar f =
            List.map f (List.range 0 (length - 1))
    in
    (forEachChar <|
        \index ->
            lines
                |> List.map (testIndex index lines)
    )
        -- |> List.map (List.foldl flatten Dict.empty)
        |> flatten
        |> Dict.filter (\k v -> v == 1)
        -- |> Debug.log "output"
        |> Debug.toString


flatten : List (List Line) -> Dict String Int
flatten lines =
    lines
        |> List.map
            (List.foldl
                (\{ chars, strikes } result ->
                    result
                        |> Dict.insert chars
                            (result
                                |> Dict.get chars
                                |> Maybe.withDefault 0
                                |> (+) strikes
                            )
                )
                Dict.empty
            )
        |> List.foldl
            (\dict result ->
                Dict.foldl
                    (\chars strikes result_ ->
                        result_
                            |> Dict.insert chars
                                (result_
                                    |> Dict.get chars
                                    |> Maybe.withDefault 0
                                    |> (+) strikes
                                )
                    )
                    result
                    dict
            )
            Dict.empty



-- flatten =
--     \line dict ->
--         let
--             strikes =
--                 Dict.get line.chars dict
--         in
--         Dict.insert line.chars
--             ((strikes
--                 |> Maybe.withDefault 0
--              )
--                 + line.strikes
--             )
--             dict


testIndex : Int -> List Line -> Line -> Line
testIndex index lines line =
    let
        hasSameChar =
            lines
                |> List.filter (.chars >> (/=) line.chars)
                |> List.map
                    (.chars
                        >> (\chars ->
                                sameCharAt index line.chars chars
                           )
                    )
                |> List.any ((==) True)
    in
    { line
        | strikes =
            if hasSameChar then
                line.strikes

            else
                line.strikes + 1
    }


charAt index =
    String.toList >> Array.fromList >> Array.get index >> Maybe.withDefault '_'


sameCharAt index line1 line2 =
    charAt index line1 == charAt index line2
