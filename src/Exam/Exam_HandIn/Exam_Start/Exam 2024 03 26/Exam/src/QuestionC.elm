
module QuestionC exposing (..)

import List exposing (sum, length)
        
checkStudent :  List (String, Int) -> String -> Maybe (List Int)
checkStudent list name =
    case list of
        x :: xs ->
            case x of
                (y, z) ->
                    if y == name then
                        x :: checkStudent list name
                    else
                        checkStudent list name
                [] ->
                    Nothing
        [] ->
            Nothing

report : List (String, Int) -> String -> Maybe (String, List Int, Float)
report list name =
    let
        studentGrades = checkStudent list name
    in
        case studentGrades of
            Just studentGrades ->
                (name, studentGrades, ((sum studentGrades) / (lenght studentGrades)))
            Nothing ->
                Nothing



-- Tests for function 'report' --
-- You do not need to modify anything from this point onwards...

grades: List (String, Int)
grades = [ ("Anna", 8), ("Jane", 6), ("Jane", 7),
           ("Paul", 6), ("Anna", 7), ("Jane", 9) ]

testRA: Bool
testRA = (report grades "Jane" == Just ("Jane", [6, 7, 9], 22 / 3))

testRB: Bool
testRB = (report grades "Paul" == Just ("Paul", [6], 6))

testRC: Bool
testRC = (report grades "Anna" == Just ("Anna", [8, 7], 7.5))

testRD: Bool
testRD = (report grades "Pete" == Nothing)

testsQuestionC: List Bool
testsQuestionC = [testRA, testRB, testRC, testRD]
