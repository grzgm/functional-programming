module Prepexam.Tests exposing (..)

import Prepexam.Finances exposing (minimumGain)
import Html exposing (Html)

testA: Bool
testA = (minimumGain [315.75, 0, -90.55, -151.35, 0, 290.10, -722.25]
             == Just 290.10)

testB: Bool
testB = (minimumGain [0, -90.55, -151.35, 0, -722.25]
             == Nothing)

allTests: List Bool
allTests = [testA, testB]


result =
    [ Debug.toString <| allTests

    , Debug.toString <| minimumGain [0, -90.55, -151.35, 0, -722.25]
    , Debug.toString <| minimumGain [315.75, 0, -90.55, -151.35, 0, 290.10, -722.25]
    ]


toDiv : String -> Html msg
toDiv myValue =
    Html.div [] [ myValue |> Html.text ]


main : Html msg
main =
    Html.div
        []
        (List.map toDiv result)