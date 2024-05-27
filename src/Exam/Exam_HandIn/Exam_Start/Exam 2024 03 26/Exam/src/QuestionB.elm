module QuestionB exposing (..)


lastA : List a -> Maybe a
lastA list =
    case list of
        x :: xs ->
            if xs == [] then
                Just x

            else
                lastA xs

        [] ->
            Nothing


initLeft =
    Nothing


accLeft : List a -> Maybe a -> Maybe a
accLeft list value =
    if list == [] then
        Just value
    else
        Nothing


lastB : List a -> Maybe a
lastB =
    List.foldl accLeft initLeft



initRight =
    Nothing

accRight : List a -> Maybe a -> Maybe a
accRight list value =
    value


lastC : List a -> Maybe a
lastC =
    List.foldr accRight initRight



-- Definitions of 'accRight' and 'initRight'...
-- Tests for all versions of 'last' --
-- You do not need to modify anything from this point onwards...


testLAA : Bool
testLAA =
    lastA [ 1, 3, 5 ] == Just 5


testLAB : Bool
testLAB =
    lastA [] == Nothing


testLBA : Bool
testLBA =
    lastB [ 1, 3, 5 ] == Just 5


testLBB : Bool
testLBB =
    lastB [] == Nothing


testLCA : Bool
testLCA =
    lastC [ 1, 3, 5 ] == Just 5


testLCB : Bool
testLCB =
    lastC [] == Nothing


testsQuestionB : List Bool
testsQuestionB =
    [ testLAA, testLAB, testLBA, testLBB, testLCA, testLCB ]
