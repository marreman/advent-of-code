module Tests.Day01 exposing (suite)

import Day01
import Expect
import Set exposing (Set)
import Test exposing (..)


suite : Test
suite =
    describe "Day01"
        [ describe "partOne"
            [ test "1" <|
                \_ ->
                    Day01.partOne "-1\n-2"
                        |> Expect.equal -3
            , test "2" <|
                \_ ->
                    Day01.partOne " -1\n-2\n3\n4 "
                        |> Expect.equal 4
            ]
        , describe "partTwo"
            [ test "1" <|
                \_ ->
                    Day01.partTwo "1\n1\n-1"
                        |> Expect.equal 1
            , test "2" <|
                \_ ->
                    Day01.partTwo "2\n2\n-4"
                        |> Expect.equal 2
            ]
        , describe "toIntermediarySums"
            [ test "1" <|
                \_ ->
                    Day01.toIntermediarySums [ 1, 2, 3 ]
                        |> Expect.equal [ 1, 3, 6 ]
            ]
        , describe "findRepeatingValues"
            [ test "1" <|
                \_ ->
                    Day01.findRepeatingValues [ 1, 0, 1 ]
                        |> Expect.equal [ 1, 1 ]
            , test "2" <|
                \_ ->
                    Day01.findRepeatingValues [ 2, 3, 3, 5, 2 ]
                        |> Expect.equal [ 2, 3, 3, 2 ]
            ]
        ]
