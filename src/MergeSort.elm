module MergeSort exposing (..)
import Html
import List

msort : List comparable -> List comparable
msort list =
    case list of
        [] ->
            []
        [x] ->
            [x]
        _ ->
            list
            |> split
            |> (\(left, right) -> merge (msort left) (msort right))


merge: List comparable -> List comparable -> List comparable
merge left right =
    case (left, right) of
        (_, []) ->
            left

        ([], _) ->
            right

        (leftHead :: leftTail, rightHead :: rightTail) ->
            if leftHead < rightHead then
                leftHead :: merge leftTail right
            else
                rightHead :: merge left rightTail

split: List comparable -> ( List comparable, List comparable )
split listToSplit =
    let
        halfLength =
            List.length listToSplit // 2
        (firstHalf, _) =
            splitAt halfLength listToSplit
    in
    (firstHalf, List.drop halfLength listToSplit)

splitAt : Int -> List a -> (List a, List a)
splitAt x xs = (List.take x xs, List.drop x xs)

main =
    Html.text(Debug.toString (msort [1, 2, 5, 4, 3, 1, 2]))
