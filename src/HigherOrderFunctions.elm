module HigherOrderFunctions exposing (..)

import Html exposing (Html)
import Html.Attributes exposing (list)


repeatUntil : (a -> Bool) -> (a -> a) -> a -> a
repeatUntil testFun doFun arg =
    if testFun arg then
        arg

    else
        repeatUntil testFun doFun (doFun arg)


above100 : Int -> Bool
above100 =
    aboveGiven 100


aboveGiven : Int -> Int -> Bool
aboveGiven cap x =
    x > cap


double : Int -> Int
double x =
    x * 2


logarithmsCondition : Int -> Int -> Int -> Bool
logarithmsCondition base value exponent =
    (base ^ exponent) >= value


collatzCompareFirstElement : List Int -> Bool
collatzCompareFirstElement list =
    case list of
        first :: _ ->
            first == 1

        _ ->
            False


collatzValue : Int -> Int
collatzValue num =
    if modBy 2 num == 0 then
        num // 2

    else
        (3 * num) + 1


collatz : List Int -> List Int
collatz list =
    case List.head list of
        Just first ->
            let
                comptedValue =
                    collatzValue first
            in
            if comptedValue == 1 then
                comptedValue :: list

            else
                collatz (comptedValue :: list)

        Nothing ->
            []


result =
    [ Debug.toString <| repeatUntil (aboveGiven 100) double 7
    , Debug.toString <| repeatUntil (aboveGiven 100) ((+) 1) 42
    , Debug.toString <| repeatUntil (logarithmsCondition 3 100) ((+) 1) 1
    , Debug.toString <| repeatUntil collatzCompareFirstElement collatz [ 10 ]

    -- , Debug.toString <| repeatUntil (\x -> (3 ^ x) >= 100) ((+) 1) 1
    -- , Debug.toString <| ((^) 3 2)
    ]


toDiv : String -> Html msg
toDiv myValue =
    Html.div [] [ myValue |> Html.text ]


main : Html msg
main =
    Html.div
        []
        (List.map toDiv result)
