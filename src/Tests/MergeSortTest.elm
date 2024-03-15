module Tests.MergeSortTest exposing (..)

import MergeSort exposing (..)
import Html exposing (text)

toString = Debug.toString

mergeSortTest = [
    toString <| msort [] == [],
    toString <| msort [0] == [0],
    toString <| msort [1, 2, 3] == [1, 2, 3],
    toString <| msort [ 5, 4, 2, 3, 1] == [1, 2, 3, 4, 5],
    toString <| msort [12, 4, -1, -69, -12] == [-69, -12, -1, 4, 12],
    toString <| msort [ 100, 7, 10000000, 44] == [7, 44, 100, 10000000],
    toString <| msort [ 1, 1, 2, 1, 1, 1] == [1, 1, 1, 1, 1, 2],
    toString <| msort ['t', 'c', 'a', 'S'] == ['S', 'a', 'c', 't'],
    toString <| msort ['T', 't', 'e', 's'] == ['T', 'e', 's', 't'],
    toString <| msort ['P', 'R', 'A', 'a'] == ['A', 'P', 'R', 'a'],
    toString <| msort ['R', 'c', 'h', 'A'] == ['A', 'R', 'c', 'h']
    ]

main = text ( toString (mergeSortTest))
