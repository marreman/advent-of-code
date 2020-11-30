module Day03 exposing (partOne)

import Parser
    exposing
        ( (|.)
        , (|=)
        , Parser
        , int
        , spaces
        , succeed
        , symbol
        )



-- PART ONE


partOne : String -> Int
partOne input =
    input
        |> String.lines
        |> List.map String.trim
        |> List.filter (String.isEmpty >> not)
        |> List.map (Parser.run parser)
        |> List.map (Debug.log "result")
        |> always 0


type alias Claim =
    { left : Int
    , top : Int
    , width : Int
    , height : Int
    }


parser : Parser Claim
parser =
    succeed Claim
        |. symbol "#"
        |. int
        |. spaces
        |. symbol "@"
        |. spaces
        |= int
        |. symbol ","
        |= int
        |. symbol ":"
        |. spaces
        |= int
        |. symbol "x"
        |= int
