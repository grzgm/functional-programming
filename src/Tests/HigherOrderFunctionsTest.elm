module Tests.HigherOrderFunctionsTest exposing (..)

import HigherOrderFunctions exposing (..)
import Html


repeatUntilTest =
    [ repeatUntil ((==) 10) ((+) 1) 0 == 10
    , repeatUntil (aboveGiven 100) double 7 == 112
    , repeatUntil (aboveGiven 100) ((+) 1) 42 == 101
    , repeatUntil (logarithmsCondition 3 100) ((+) 1) 1 == 5
    , repeatUntil collatzCompareFirstElement collatz [ 19 ]
        == [ 1, 2, 4, 8, 16, 5, 10, 20, 40, 13, 26, 52, 17, 34, 11, 22, 44, 88, 29, 58, 19 ]
    , repeatUntil collatzCompareFirstElement collatz [ 1 ] == [ 1 ]
    ]


logarithmsConditionTest =
    [ logarithmsCondition 3 81 4 == True
    , logarithmsCondition 2 128 6 == False
    , logarithmsCondition 5 5 2 == True
    ]


collatzCompareFirstElementTest =
    [ collatzCompareFirstElement [ 1, 2, 3 ] == True
    , collatzCompareFirstElement [ 5, 7, 9 ] == False
    , collatzCompareFirstElement [] == False
    ]


collatzValueTest =
    [ collatzValue 6 == 3
    , collatzValue 7 == 22
    , collatzValue 10 == 5
    ]


collatzTest =
    [ collatz [ 19 ]
        == [ 1, 2, 4, 8, 16, 5, 10, 20, 40, 13, 26, 52, 17, 34, 11, 22, 44, 88, 29, 58, 19 ]
    , collatz [ 10 ] == [ 1, 2, 4, 8, 16, 5, 10 ]
    , collatz [] == []
    ]


myResults =
    repeatUntilTest
        ++ logarithmsConditionTest
        ++ collatzCompareFirstElementTest
        ++ collatzValueTest
        ++ collatzTest


main =
    Html.text <| Debug.toString myResults
