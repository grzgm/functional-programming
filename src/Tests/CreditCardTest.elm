module Tests.CreditCardTest exposing (..)

import CreditCard exposing (..)
import Html


toDigitsTest =
    [ toDigits "12345" == [ 1, 2, 3, 4, 5 ]
    , toDigits "9876543210"
        == [ 9, 8, 7, 6, 5, 4, 3, 2, 1, 0 ]
    , toDigits "" == []
    ]


toDigitsRevTest =
    [ toDigitsRev "12345" == [ 5, 4, 3, 2, 1 ]
    , toDigitsRev "9876543210"
        == [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]
    , toDigitsRev "" == []
    ]


doubleSecondTest =
    [ doubleSecond [ 1, 2, 3, 4, 5 ]
        == [ 1, 4, 3, 8, 5 ]
    , doubleSecond [ 9, 8, 7, 6, 5, 4, 3, 2, 1, 0 ]
        == [ 9, 16, 7, 12, 5, 8, 3, 4, 1, 0 ]
    , doubleSecond [ 1 ] == [ 1 ]
    , doubleSecond [] == []
    ]


sumDigitsOfIntTest =
    [ sumDigitsOfInt 12345 == 15
    , sumDigitsOfInt 9876543210 == 45
    , sumDigitsOfInt 0 == 0
    ]


sumDigitsTest =
    [ sumDigits [ 1, 2, 3, 4, 5 ] == 15
    , sumDigits [ 9, 8, 7, 6, 5, 4, 3, 2, 1, 0 ] == 45
    , sumDigits [] == 0
    ]


isValidTest =
    [ isValid "4716347184862961" == True
    , isValid "1234567890123456" == False

    -- , isValid "" == False
    ]


numValidTest =
    [ numValid
        [ "4716347184862961"
        , "1234567890123456"
        , "6011798764103720"
        ]
        == 2
    , numValid [] == 0
    ]


validateCreditCardsTest =
    [ validateCreditCards
        [ 4716347184862961
        , 1234567890123456
        , 6011798764103720
        ]
        == 2
    , validateCreditCards [] == 0
    ]


myResults =
    toDigitsTest
        ++ toDigitsRevTest
        ++ doubleSecondTest
        ++ sumDigitsOfIntTest
        ++ sumDigitsTest
        ++ isValidTest
        ++ numValidTest
        ++ validateCreditCardsTest



-- toDiv : String -> Html msg
-- toDiv myValue =
--     Html.div [] [ myValue |> Html.text ]
-- main : Html msg
-- main =
--     Html.div
--         []
--         (List.map toDiv myResults)


main =
    Html.text <| Debug.toString myResults
