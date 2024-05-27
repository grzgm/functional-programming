
module QuestionA exposing (..)


elemAt: Int -> List a -> Maybe a
elemAt index list =
    if index < 0 then
        Nothing
    else
        case list of
            x :: xs ->
                if index == 0 then
                    Just x
                else
                    elemAt (index - 1) xs
            [] ->
                Nothing




-- Tests for function 'elemAt' --
-- You do not need to modify anything from this point onwards...

testEAA: Bool
testEAA = (elemAt  0 ['a', 'e', 'i', 'o', 'u'] == Just 'a')

testEAB: Bool
testEAB = (elemAt  3 ['a', 'e', 'i', 'o', 'u'] == Just 'o')

testEAC: Bool
testEAC = (elemAt  6 ['a', 'e', 'i', 'o', 'u'] == Nothing)

testEAD: Bool
testEAD = (elemAt -3 ['a', 'e', 'i', 'o', 'u'] == Nothing)

testsQuestionA: List Bool
testsQuestionA = [testEAA, testEAB, testEAC, testEAD]
