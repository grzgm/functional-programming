module ModellingMathFunctionsPart1 exposing (..)

import Html exposing (Html, text)


type Function
    = Plus Function Function
    | Minus Function Function
    | Mult Function Function
    | Div Function Function
    | Poly Function Int
    | Const Int
    | X


print : Function -> String
print fun =
    case fun of
        Plus f1 f2 ->
            "(" ++ print f1 ++ " + " ++ print f2 ++ ")"

        Minus f1 f2 ->
            "(" ++ print f1 ++ " - " ++ print f2 ++ ")"

        Mult f1 f2 ->
            "(" ++ print f1 ++ " * " ++ print f2 ++ ")"

        Div f1 f2 ->
            "(" ++ print f1 ++ " / " ++ print f2 ++ ")"

        Poly f1 i ->
            "(" ++ print f1 ++ " ^ " ++ String.fromInt i ++ ")"

        Const i ->
            String.fromInt i

        X ->
            "x"


eval : Float -> Function -> Float
eval num fun =
    case fun of
        Plus f1 f2 ->
            eval num f1 + eval num f2

        Minus f1 f2 ->
            eval num f1 - eval num f2

        Mult f1 f2 ->
            eval num f1 * eval num f2

        Div f1 f2 ->
            eval num f1 / eval num f2

        Poly f1 i ->
            eval num f1 ^ toFloat i

        Const i ->
            toFloat i

        X ->
            num


graphLine : Function -> Int -> Int -> Int -> String
graphLine fun x1 y1 y2 =
    let
        funValue =
            round <| eval (toFloat x1) fun

        ySpace =
            abs y1 + abs y2
    in
    if (funValue > y1) && (funValue < y2) then
        String.padLeft (funValue - y1) '+' "" ++ String.padRight (ySpace - (funValue - y1)) '=' ""

    else if funValue > y1 then
        String.padLeft ySpace '+' ""

    else
        String.padRight ySpace '=' ""


graph : Function -> Int -> Int -> Int -> Int -> String
graph fun x1 x2 y1 y2 =
    if x1 == x2 then
        graphLine fun x1 y1 y2 ++ "\n"

    else
        graphLine fun x1 y1 y2 ++ "\n" ++ graph fun (x1 + 1) x2 y1 y2


f =
    Plus (Mult (Plus (Const 3) X) (Minus X (Poly X 5))) (Const 2)


result =
    String.words <| graph f -15 15 -15 15
--  [print f]


toDiv : String -> Html msg
toDiv myValue =
    Html.div [] [ myValue |> Html.text ]


main : Html msg
main =
    Html.div
        []
        (List.map toDiv result)
