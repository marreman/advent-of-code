module Day02 exposing (hasCharAt, partOne, partTwo)

import Array
import Dict



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


type alias Id =
    { matches : List (List Bool)
    , value : String
    }


partTwo : String -> String
partTwo input =
    let
        ids : List Id
        ids =
            input
                |> parse
                |> List.map (Id [])

        check : Id -> Id
        check id =
            { id
                | matches =
                    ids
                        |> List.map .value
                        |> List.map String.toList
                        |> List.indexedMap
                            (\i char ->
                                List.map (.value >> hasCharAt char i) ids
                            )
            }
    in
    ids
        |> Debug.log "input"
        -- |> List.map (String.uncons >> Maybe.map Tuple.first >> Maybe.withDefault '-')
        |> List.map check
        |> Debug.log "output"
        |> always ""


hasCharAt : Char -> Int -> String -> Bool
hasCharAt char index string =
    string
        |> String.toList
        |> Array.fromList
        |> Array.get index
        |> Debug.log "char"
        |> Maybe.map ((==) char)
        |> Maybe.withDefault False



-- numberOfCharsInIds =
--     ids
--         |> List.head
--         |> Maybe.map String.length
--         |> Maybe.withDefault 0
--
-- loop =
--     List.range 0 numberOfCharsInIds
--
