module Tests.Day01 exposing (suite)

import Day01
import Expect
import Test exposing (..)


suite : Test
suite =
    describe "Day01"
        [ describe "partOne"
            [ test "1" <|
                \_ ->
                    Day01.partOne input1
                        |> Expect.equal -3
            , test "2" <|
                \_ ->
                    Day01.partOne input2
                        |> Expect.equal 4
            ]
        ]


input1 =
    """
    -1
    -2
    """


input2 =
    """
    -1

    -2
     3

     4
    """
