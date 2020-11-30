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


partTwo : String -> String
partTwo input =
    let
        lines =
            input
                |> parse
    in
    lines
        |> findMatch
        |> Debug.toString


findMatch : List String -> Maybe ( String, String )
findMatch lines =
    case lines of
        head :: tail ->
            case search head tail of
                Just matches ->
                    Just matches

                Nothing ->
                    findMatch tail

        [] ->
            Nothing


search : String -> List String -> Maybe ( String, String )
search needle haystack =
    case haystack of
        line :: rest ->
            if isMatch needle line then
                Just ( needle, line )

            else
                search needle rest

        [] ->
            Nothing


isMatch : String -> String -> Bool
isMatch string1 string2 =
    List.map2 (==) (String.toList string1) (String.toList string2)
        |> List.filter ((==) False)
        |> List.length
        |> (==) 1
