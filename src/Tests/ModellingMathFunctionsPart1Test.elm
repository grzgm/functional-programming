module Tests.ModellingMathFunctionsPart1Test exposing (..)

import Html
import ModellingMathFunctionsPart1 exposing (..)


printTest =
    [ print (Plus (Const 3) X) == "(3 + x)"
    , print (Mult (Const 2) (Plus X (Const 1))) == "(2 * (x + 1))"
    , print (Poly (Minus (Div X (Const 5)) (Const 1)) 4)
        == "(((x / 5) - 1) ^ 4)"
    , print (Plus (Mult (Plus (Const 3) X) (Minus X (Poly X 5))) (Const 2))
        == "(((3 + x) * (x - (x ^ 5))) + 2)"
    , print X == "x"
    , print (Const 5) == "5"
    ]


evalTest =
    [ eval 2.0 (Plus (Const 3) X) == 5.0
    , eval -1.0 (Mult (Plus (Const 2) X) (Minus X (Poly X 5))) == 0.0
    , eval 1.5 (Div (Const 4) (Plus X (Const 2))) == 1.1428571428571428
    , eval 0.0 (Poly (Minus (Div X (Const 5)) (Const 1)) 4) == 1.0
    , eval 2 (Plus (Mult (Plus (Const 3) X) (Minus X (Poly X 5))) (Const 2))
        == -148
    ]


graphLineTest =
    [ graphLine (Plus X (Const 2)) 1 0 4 == "+++="
    , graphLine (Mult (Plus X (Const 1)) (Minus X (Poly X 5))) -2 -5 5
        == "=========="
    , graphLine (Poly (Minus (Div X (Const 5)) (Const 1)) 4) 0 -1 1
        == "++"
    , graphLine X 0 -5 5 == "+++++====="
    , graphLine (Const 2) 0 0 5 == "++==="
    ]


graphTest =
    [ graph (Plus X (Const 2)) 0 4 0 5 == "++===\n+++==\n++++=\n+++++\n+++++\n"
    , graph
        (Mult
            (Mult
                (Plus (Div X (Const 2)) (Const 1))
                (Minus (Div X (Const 2)) (Poly (Div X (Const 2)) 5))
            )
            (Const 4)
        )
        -3
        3
        -3
        3
        == "======\n+++===\n++====\n+++===\n++++++\n+++===\n======\n"
    , graph
        (Poly
            (Minus (Div X (Const 5)) (Const 1))
            4
        )
        -1
        1
        -2
        2
        == "++++\n+++=\n++==\n"
    , graph X -3 3 -3 3 == "======\n+=====\n++====\n+++===\n++++==\n+++++=\n++++++\n"
    , graph (Const 0) -3 3 -3 3 == "+++===\n+++===\n+++===\n+++===\n+++===\n+++===\n+++===\n"
    ]


myResults =
    printTest
        ++ evalTest
        ++ graphLineTest
        ++ graphTest


main =
    Html.text <| Debug.toString myResults
