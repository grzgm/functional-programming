module Tests.CaesarCharTest exposing (..)

import CaesarChar exposing (encode, decode)
import Html exposing (text)

toString = Debug.toString

encodingTest = [
    toString <| encode 5 'x' == 'c',
    toString <| encode 7 'T' == 'A'
    ]
decodingTest = [
    toString <| decode 5 'c' == 'x',
    toString <| decode 7 'A' == 'T'
    ]
encodingDecodingTest = [
    toString <| (decode 5 <| encode 5 'x') == 'x',
    toString <| (decode 7 <| encode 7 'T') == 'T'
    ]
    
main = text ( toString (encodingTest) ++ toString (decodingTest) ++ toString (encodingDecodingTest) )