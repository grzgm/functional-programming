module Prepexam.Ex1 exposing (..)

import Html exposing (Html)
import Html.Attributes exposing (list)


insert : Int -> List Int -> List Int
insert num list =
    case list of
        x :: xs ->
            if num > x then
                x :: insert num xs

            else
                num :: x :: xs

        _ ->
            [ num ]


insertionSort : List Int -> List Int -> List Int
insertionSort unord ord =
    case unord of
        x :: xs ->
            insertionSort xs <| insert x ord

        [] ->
            ord


posProduct : List ( Int, Int ) -> List Int
posProduct list =
    case list of
        x :: xs ->
            let
                product =
                    Tuple.first x * Tuple.second x
            in
            if product > 0 then
                product :: posProduct xs

            else
                posProduct xs

        [] ->
            []


type Expression
    = Plus Expression Expression
    | Minus Expression Expression
    | Mult Expression Expression
    | Fact Expression
    | Val Int


factorial : Int -> Int
factorial num =
    if num > 0 then
        num * factorial (num - 1)
    else
        1

toString2 : Expression -> String
toString2 fun =
    case fun of
        Plus f1 f2 ->
            "(" ++ toString2 f1 ++ " + " ++ toString2 f2 ++ ")"

        Minus f1 f2 ->
            "(" ++ toString2 f1 ++ " - " ++ toString2 f2 ++ ")"

        Mult f1 f2 ->
            "(" ++ toString2 f1 ++ " * " ++ toString2 f2 ++ ")"

        Fact f1 ->
            "(" ++ toString2 f1 ++ "!" ++ ")"

        Val i ->
            String.fromInt i


eval : Expression -> Int
eval fun =
    case fun of
        Plus f1 f2 ->
            eval f1 + eval f2

        Minus f1 f2 ->
            eval f1 - eval f2

        Mult f1 f2 ->
            eval f1 * eval f2

        Fact f1 ->
            factorial <| eval f1

        Val i ->
            i


-- prune : Expression -> Expression
-- prune fun =
--     case fun of
--         Plus f1 f2 ->
--             if eval f1 == 0 then
--                 Val f2
--             else
--                 Plus f1 f2

--         Minus f1 f2 ->
--             if eval fun == 0 then
--                 Val 0
--             else
--                 Minus f1 f2

--         Mult f1 f2 ->
--             if eval fun == 0 then
--                 Val 0
--             else
--                 Mult f1 f2

--         Fact f1 ->
--             factorial <| eval f1

--         Val i ->
--             i


e0 =
    Fact (Val 5)


e1 =
    Mult (Plus e0 (Val -110)) (Val 3)



-- pmap : (a -> Bool) -> List a -> List a
-- pmap fun list =
--     case list of
--         x :: xs ->
--             if fun x then
--                 x :: pmap fun xs
--             else
--                 pmap fun xs
--         [] ->
--             []
-- partition : (a -> Bool) -> List a -> ( List a, List a )
-- partition fun list =
--     ( pmap fun list, pmap (not << fun) list )


result =
    [ Debug.toString <| insert -1 [ 0, 1, 3, 4, 5 ]
    , Debug.toString <| insert 4 [ 1, 3, 5, 7, 9 ] == [ 1, 3, 4, 5, 7, 9 ]
    , Debug.toString <| insert -4 [ 5, 3, 6, 2 ] == [ -4, 5, 3, 6, 2 ]
    , Debug.toString <| insert 73 [ 5, 3, 6, 2 ] == [ 5, 3, 6, 2, 73 ]
    , Debug.toString <| insert 73 [] == [ 73 ]
    , Debug.toString <| insertionSort [ 3, 7, 4, 9, 1 ] [] == [ 1, 3, 4, 7, 9 ]
    , Debug.toString <| posProduct [ ( 3, -4 ), ( 2, 5 ), ( 7, 0 ), ( -1, -9 ) ] == [ 10, 9 ]
    , Debug.toString <| toString2 e0
    , Debug.toString <| eval e0
    , Debug.toString <| toString2 e1
    , Debug.toString <| eval e1

    -- , Debug.toString <| partition ((>) 0) [ -1, -2, 0, 1, 3, 4, -5 ]
    ]


toDiv : String -> Html msg
toDiv myValue =
    Html.div [] [ myValue |> Html.text ]


main : Html msg
main =
    Html.div
        []
        (List.map toDiv result)
