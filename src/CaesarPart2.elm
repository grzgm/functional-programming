module CaesarPart2 exposing (..)

import Html exposing (text)
import Char exposing (toCode, fromCode)

charToEncode = 'A'

desiredShift = 1

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

isLetter: Char -> Bool
isLetter char =
    Char.isUpper char || Char.isLower char

normalize: String -> String
normalize str = 
    String.filter isLetter str

encodedChar = encode desiredShift charToEncode
decodedChar = decode desiredShift encodedChar
encoding = Debug.toString encodedChar
decoding = Debug.toString decodedChar

encrypt: Int -> String -> String
encrypt shift str =
    case String.toList str of
      [] -> ""
      x :: xs -> String.fromChar (encode shift x) ++ (encrypt shift (String.fromList xs))

decrypt: Int -> String -> String
decrypt shift str = 
    case String.toList str of
        [] -> ""
        x :: xs -> String.fromChar (decode shift x) ++ (decrypt shift (String.fromList xs))



--main = text ("Original: " ++ String.fromChar charToEncode
--            ++ " Encoding: " ++ encoding
--            ++ " Decoding: " ++ decoding)

og = "Hello Fontys~!@"
normalized = normalize og
encrypted = encrypt 1 normalized
decrypted = decrypt 1 encrypted
main = text("Original: " ++ og ++ " Normalized: " ++ normalized ++ " Encrypted: " ++ encrypted ++ " Decrypted:" ++ decrypted)

