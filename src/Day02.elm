module Day02 exposing (partOne)

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
