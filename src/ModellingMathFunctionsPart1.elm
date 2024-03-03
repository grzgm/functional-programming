module ModellingMathFunctionsPart1 exposing (..)

import Html exposing (text)


  
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
      
eval: Float -> Function -> Float
eval num fun =
  case fun of
    Plus f1 f2 ->
      (eval num f1) + (eval num f2)
    Minus f1 f2 ->
      (eval num f1) - (eval num f2)
    Mult f1 f2 ->
      (eval num f1) * (eval num f2)
    Div f1 f2 ->
      (eval num f1) / (eval num f2)
    Poly f1 i ->
      ((eval num f1) ^ (toFloat i))
    Const i ->
      (toFloat i)
    X ->
      num

graph: Function -> Int -> Int -> Int -> Int -> String
graph fun x1 x2 y1 y2 =
    ""
      
f = Plus (Mult (Plus (Const 3) X) (Minus X (Poly X 5))) (Const 2)

main =
  text <| Debug.toString <| eval 1.0 f