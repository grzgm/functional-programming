module Pythagoras exposing(..)
import Html exposing(text)

toString : Bool -> String
toString value =
  if value then
    "True"
  else
    "False"

sqr: Int -> Int
sqr num =
    num * num

main = text(result)
--result = toString (isTriple numA numB numC)

numA = 3
numB = 4
numC = 5

numGenerateLeft = 5
numGenerateRight = 4

result = toString (isTripleTuple (pythTriple (numGenerateLeft, numGenerateRight)))



isTriple: Int -> Int -> Int -> Bool
isTriple a b c =
    sqr a + sqr b == sqr c

leg1: Int -> Int -> Int
leg1 left right =
  sqr left - sqr right

leg2: Int -> Int -> Int
leg2 left right = 
  2 * left * right

leg3: Int -> Int -> Int
leg3 left right =
  sqr left + sqr right

pythTriple: (Int, Int) -> (Int, Int, Int)
pythTriple (left, right) =
  ((leg1 left right), (leg2 left right), (leg3 left right))

isTripleTuple: (Int, Int, Int) -> Bool
isTripleTuple (a, b, c) =
  isTriple a b c

