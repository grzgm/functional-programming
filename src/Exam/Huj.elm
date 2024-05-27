module Exam.Huj exposing (..)
import Html exposing (Html)

checkStudent :  List (String, Int) -> String -> Maybe (List Int)
checkStudent list name =
    case list of
        x :: xs ->
            case x of
                y z ->
                    if y == name then
                        x ++ checkStudent list name
                    else
                        checkStudent list name
                [] ->
                    Nothing
        [] ->
            Nothing


result =
    [ Debug.toString <| [ ("Anna", 8), ("Jane", 6), ("Jane", 7),
           ("Paul", 6), ("Anna", 7), ("Jane", 9) ]

    -- , Debug.toString <| minimumGain [0, -90.55, -151.35, 0, -722.25]
    ]


toDiv : String -> Html msg
toDiv myValue =
    Html.div [] [ myValue |> Html.text ]


main : Html msg
main =
    Html.div
        []
        (List.map toDiv result)