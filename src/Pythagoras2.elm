module Pythagoras2 exposing (..)

import Html exposing (text)
import List exposing (filter, map)
import Pythagoras exposing (isTripleTuple, pythTriple)


main =
    -- text <| Debug.toString <| pythTriplesRec [(5,4),(2,1),(35,7)]
    text <| Debug.toString <| arePythTriplesRec [(1,2,3), (9,40,41), (3,4,5), (100,2,500)]


pythTriplesMap : List ( Int, Int ) -> List ( Int, Int, Int )
pythTriplesMap list =
    map pythTriple list


pythTriplesRec : List ( Int, Int ) -> List ( Int, Int, Int )
pythTriplesRec list =
    case list of
        [] ->
            []

        x :: xs ->
            pythTriple x :: pythTriplesRec xs


arePythTriplesFilter : List ( Int, Int, Int ) -> List ( Int, Int, Int )
arePythTriplesFilter list =
    filter isTripleTuple list


arePythTriplesRec : List ( Int, Int, Int ) -> List ( Int, Int, Int )
arePythTriplesRec list =
    case list of
        [] ->
            []

        x :: xs ->
            if isTripleTuple x then
                x :: arePythTriplesRec xs

            else
                arePythTriplesRec xs
