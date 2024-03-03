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
      
f = Plus (Mult (Plus (Const 3) X) (Minus X (Poly X 5))) (Const 2)

main =
  text <| print f