module CaesarChar exposing (..)

import Html exposing (text)
import Char exposing (toCode, fromCode)

charToEncode = 'A'

desiredShift = 25 

upperCaseStart = (toCode 'A')
upperCaseEnd = (toCode 'Z')
lowerCaseStart = (toCode 'a')
lowerCaseEnd = (toCode 'z')

getShifted: Char -> Int -> Int -> Int
getShifted startOfAlphabet shift int =
    (modBy 26 (int - (toCode startOfAlphabet) + shift)) + (toCode startOfAlphabet)

caesarEncode: Int -> Int -> Int
caesarEncode shift int =
    if ((int >= upperCaseStart) && (int <= upperCaseEnd)) || ((int >= lowerCaseStart) && (int <= lowerCaseEnd)) then
        if (int >= upperCaseStart) && (int <= upperCaseEnd) then
            getShifted 'A' shift int

        else
            getShifted 'a' shift int
    else
        int

encode: Int -> Char -> Char
encode shift char =
    char
    |> toCode -- get ASCII value of Char
    |> caesarEncode shift -- encode Char with given shift
    |> fromCode -- convert Int to ASCII

decode: Int -> Char -> Char
decode shift char =
    encode -shift char -- to decode is the same as endode with opposite value

    
encodedChar = encode desiredShift charToEncode
decodedChar = decode desiredShift encodedChar
encoding = Debug.toString encodedChar
decoding = Debug.toString decodedChar

main = text ("Original: " ++ String.fromChar charToEncode
            ++ " Encoding: " ++ encoding
            ++ " Decoding: " ++ decoding)
