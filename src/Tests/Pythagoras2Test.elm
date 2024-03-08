module Tests.Pythagoras2Test exposing (..)

import Html exposing (text)
import Pythagoras2 exposing (..)


toString =
    Debug.toString


pythTriplesMapTest =
    [ toString <| pythTriplesMap [ ( 5, 4 ), ( 2, 1 ), ( 35, 7 ) ] == [ ( 9, 40, 41 ), ( 3, 4, 5 ), ( 1176, 490, 1274 ) ]
    , toString <| pythTriplesMap [] == []
    ]


pythTriplesRecTest =
    [ toString <| pythTriplesRec [ ( 5, 4 ), ( 2, 1 ), ( 35, 7 ) ] == [ ( 9, 40, 41 ), ( 3, 4, 5 ), ( 1176, 490, 1274 ) ]
    , toString <| pythTriplesRec [] == []
    ]


arePythTriplesFilterTest =
    [ toString <| arePythTriplesFilter [ ( 1, 2, 3 ), ( 9, 40, 41 ), ( 3, 4, 5 ), ( 100, 2, 500 ) ] == [ ( 9, 40, 41 ), ( 3, 4, 5 ) ]
    , toString <| arePythTriplesFilter [] == []
    ]


arePythTriplesRecTest =
    [ toString <| arePythTriplesRec [ ( 1, 2, 3 ), ( 9, 40, 41 ), ( 3, 4, 5 ), ( 100, 2, 500 ) ] == [ ( 9, 40, 41 ), ( 3, 4, 5 ) ]
    , toString <| arePythTriplesRec [] == []
    ]


main =
    text
        ("pythTriplesMapTest:"
            ++ String.concat pythTriplesMapTest
            ++ "pythTriplesRecTest:"
            ++ String.concat pythTriplesRecTest
            ++ "arePythTriplesFilterTest:"
            ++ String.concat arePythTriplesFilterTest
            ++ "arePythTriplesRecTest:"
            ++ String.concat arePythTriplesRecTest
        )
