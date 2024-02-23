module Tests.PythagorasTest exposing (..)

import Pythagoras exposing (..)
import Html exposing (text)


pythagorasTestTriples = [
    toString <| isTriple 3 4 5,
    toString <| isTriple 0 1 2 == False,
    toString <| isTriple -1 1 2 == False]

pythagorasTestGenerateTriples = [
    toString <| pythTriple (5, 4) == (9, 40, 41),
    toString <| pythTriple (40, 22) == (1116, 1760, 2084),
    toString <| pythTriple (0, 1) == (0, 0, 0),
    toString <| pythTriple (1, 0) == (0, 0, 0),
    toString <| pythTriple (0, 0) == (0, 0, 0) ]

pythagorasTestIsTripleTuple = [
    toString <| isTripleTuple (9, 40, 41), 
    toString <| isTripleTuple (3, 4, 5),
    toString <| isTripleTuple (1116, 1760, 2084),
    toString <| isTripleTuple (0, 1, 0) == False,
    toString <| isTripleTuple (1, 0, 1) == False,
    toString <| isTripleTuple (1, 1, 0) == False,
    toString <| isTripleTuple (1, 1, 1) == False ]

main = text("Test triples:" ++ String.concat pythagorasTestTriples ++ " Test generate triples:" ++ String.concat pythagorasTestGenerateTriples ++ "Test is triple Tuple: " ++ String.concat pythagorasTestIsTripleTuple)
