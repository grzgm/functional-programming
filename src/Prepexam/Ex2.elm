module Prepexam.Ex2 exposing (..)
import Html exposing (Html) 

import Html.Attributes exposing (list) 

import String exposing (padLeft) 

  

-------- 

--- EX 1 

-------- 

  

diffOneOne: List a -> List a -> Bool 

diffOneOne list1 list2 = 

  case (list1, list2) of 

    ([], []) ->  

      True 

    (x :: xs, y :: ys) -> 

      if x == y then 

        diffOneOne xs ys 

      else 

        False 

    (x :: xs, []) -> 

      False 

    ([], y :: ys) -> 

      False 

  

  

diffOne: List a -> List a -> Bool 

diffOne list1 list2 = 

  case (list1, list2) of 

    ([], []) ->  

      False 

    (x :: xs, y :: ys) -> 

      if x == y then 

        diffOne xs ys 

      else 

        diffOneOne xs ys 

    (x :: xs, []) -> 

      False 

    ([], y :: ys) -> 

      False 

       

-------- 

--- EX 2 

-------- 

  

runLengthEncodingCounter: Char -> List Char -> Int -> (Int, List Char) 

runLengthEncodingCounter char list counter = 

  case list of 

    [] -> 

      (counter, list) 

    x :: xs -> 

      if x == char then 

        runLengthEncodingCounter char xs (counter + 1) 

      else 

        (counter, list) 

  

runLengthEncoding: Char -> List Char -> (Int, List Char) 

runLengthEncoding char list = 

  case list of 

    [] -> 

      (0, list) 

    x :: xs -> 

      if x == char then 

        runLengthEncodingCounter char xs 1 

      else 

        (0, list) 

       

-------- 

--- EX 3 

-------- 

  

type Tree  

  = Nil                -- empty  

  | Node Int Tree Tree -- node with value + left + right 

  

  

toString: Tree -> Int -> String 

toString tree depth = 

  case tree of 

    Nil -> 

      "" 

    Node num left right -> 

      ( padLeft depth '-' "" ++ String.fromInt num) ++ " " ++ (toString left (depth + 1)) ++ (toString right (depth + 1)) 

  

insert: Int -> Tree -> Tree 

insert numInsert tree = 

  case tree of 

    Nil -> 

      Node numInsert Nil Nil 

    Node num Nil right -> 

      if numInsert < num then 

        Node num (Node numInsert Nil Nil) right 

      else 

        Node num Nil (insert numInsert right) 

    Node num left Nil -> 

      if numInsert < num then 

        Node num (insert numInsert left) Nil 

      else 

        Node num left (Node numInsert Nil Nil) 

    Node num left right -> 

      if numInsert < num then 

        Node num (insert numInsert left) right 

      else 

        Node num left (insert numInsert right) 

   

  

search: Int -> Tree -> Bool 

search numSearch tree = 

  case tree of 

    Nil -> 

      False 

    Node num Nil right -> 

      if numSearch == num then 

        True 

      else 

        if numSearch < num then 

          False 

        else 

          search numSearch right 

    Node num left Nil -> 

      if numSearch == num then 

        True 

      else 

        if numSearch < num then 

          search numSearch left 

        else 

          False 

    Node num left right -> 

      if numSearch == num then 

        True 

      else 

        if numSearch < num then 

          search numSearch left 

        else 

          search numSearch right 

  

  

  

--------------------------------- 

------------ Output ------------- 

--------------------------------- 

  

tr0 = Nil  

  

tr1 = Node 4 Nil Nil   

  

tr2 = Node 8 (Node 3 (Node 1 Nil Nil) (Node 6 tr1 (Node 7 tr0 tr0))) Nil 

  

tr3 = insert 10 tr2  

  

tr4 = insert 14 tr3  

  

tr5 = insert 13 tr4  

  

tr30 = insert 0 tr2 

tr40 = insert 2 tr3 

       

       

result = 

    [ Debug.toString <| 7 

    , Debug.toString <| diffOne [11, 2, 2] [11, 31, 2] 

    , Debug.toString <| diffOne [2,-3,42,9] [2,-3,73,9] 

    , Debug.toString <| diffOne [2,-3,42,9,333] [2,-3,73,9,444] 

     

    , Debug.toString <| runLengthEncoding 'a' [] 

    , Debug.toString <| runLengthEncoding 'a' ['b'] 

    , Debug.toString <| runLengthEncoding 'a' ['a', 'b'] 

    , Debug.toString <| runLengthEncoding 'a' ['a','a','a','b','x','a'] == (3, ['b','x','a']) 

    , Debug.toString <| runLengthEncoding 'B' ['A','A','A','B','X','A'] == (0, ['A','A','A','B','X','A']) 

     

    , Debug.toString <| toString tr0 0 

    , Debug.toString <| toString tr1 0 

    , Debug.toString <| toString tr2 0 

    , Debug.toString <| toString tr30 0 

    , Debug.toString <| toString tr40 0 

     

    , Debug.toString <| search 4 tr1 

    , Debug.toString <| search 0 tr1 

     

    , Debug.toString <| search 8 tr2 

    , Debug.toString <| search -1 tr2 

    , Debug.toString <| search 7 tr2 

     

    , Debug.toString <| search 0 tr30 

     

    , Debug.toString <| search 2 tr40 

    , Debug.toString <| search 0 tr40 

     

    , Debug.toString <| toString tr1 0 

    , Debug.toString <| toString tr3 0 

    , Debug.toString <| toString tr5 0 

     

    , Debug.toString <| search 6 tr5 

    , Debug.toString <| search 12 tr5 

    , Debug.toString <| 1 

  

    -- , Debug.toString <| repeatUntil (\x -> (3 ^ x) >= 100) ((+) 1) 1 

    -- , Debug.toString <| ((^) 3 2) 

    ] 

  

  

toDiv : String -> Html msg 

toDiv myValue = 

    Html.div [] [ myValue |> Html.text ] 

  

  

main : Html msg 

main = 

    Html.div 

        [] 

        (List.map toDiv result)