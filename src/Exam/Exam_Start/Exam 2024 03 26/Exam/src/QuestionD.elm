
module QuestionD exposing (..)


type Expr a b = Leaf a | Node b (Expr a b) (Expr a b)

heightRec : Expr a b -> Int -> Int
heightRec expr lvl =
    case expr of
        Leaf value ->
            lvl + 1
        Node value expr1 expr2 ->
            let
                height1 = heightRec expr1 (lvl + 1)
                height2 = heightRec expr2 (lvl + 1)
            in
            if height1 > height2 then
                height1
            else
                height2


height : Expr a b -> Int
height expr =
 heightRec expr 0


boolEval : Expr Bool String -> Maybe Bool
boolEval expr =
    case expr of
        Leaf value ->
            Just value
        Node operation expr1 expr2 ->
            let
                value1 = boolEval expr1
                value2 = boolEval expr2
            in
              case (value1, value2) of
                (Just Bool, Just Bool) ->
                    if operation == "AND" then
                        value1 && value2
                    else
                        if operation == "OR" then
                            value1 && value2
                        else
                            Nothing

                _ ->
                    Nothing




-- Tests for functions 'height' and 'boolEval' --
-- You do not need to modify anything from this point onwards...

exprA: Expr Int Char
exprA = Node '*' (Leaf 3) (Node '+' (Leaf 5) (Leaf 2))

exprB: Expr Bool String
exprB = Node "AND" (Leaf True) (Node "OR" (Leaf False) (Leaf True))

exprC: Expr Bool String
exprC = Node "AND" (Leaf True)
                   (Node "OR" (Node "AND" (Leaf False) (Leaf True))
                              (Leaf False))

exprD: Expr Bool String
exprD = Node "AND" (Leaf True)
                   (Node "XX" (Node "AND" (Leaf False) (Leaf True))
                              (Leaf False))

testHA: Bool
testHA = (height exprA == 2)

testHB: Bool
testHB = (height exprB == 2)

testHC: Bool
testHC = (height exprC == 3)

testEB: Bool
testEB = (boolEval exprB == Just True)

testEC: Bool
testEC = (boolEval exprC == Just False)

testED: Bool
testED = (boolEval exprD == Nothing)

testsQuestionD: List Bool
testsQuestionD = [testHA, testHB, testHC, testEB, testEC, testED]
