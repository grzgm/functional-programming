module CaesarString exposing (..)

import Html exposing (text)
import Char exposing (toCode)
import List exposing (map)
import Char exposing (fromCode)
import String exposing (toList)
import String exposing (fromList)

main = text ( encodedString )

words = "Test"

desiredShift = -1000

upperCaseStart = (toCode 'A')
upperCaseEnd = (toCode 'Z')
lowerCaseStart = (toCode 'a')
lowerCaseEnd = (toCode 'z')

-- Split String to List of Char's

chars = toList words

-- Map Char's to the Int's
ints = map toCode chars

-- Shift Int's
shiftedInts = map (encode desiredShift) ints
-- shiftedInts2 = map (encode desiredShift) ints
-- shiftedInts = map (decode desiredShift) shiftedInts2

-- Map Int's to Char's
shiftedChars = map fromCode shiftedInts 

-- Concatenate List of Char's to String
encodedString = fromList shiftedChars

-- encode as Int -> Char -> Char
-- make into one function encode

getShifted: Char -> Int -> Int -> Int
getShifted startOfAlphabet shift int =
    (modBy 26 (int - (toCode startOfAlphabet) + shift)) + (toCode startOfAlphabet)

encode: Int -> Int -> Int
encode shift int =
    if ((int >= upperCaseStart) && (int <= upperCaseEnd)) || ((int >= lowerCaseStart) && (int <= lowerCaseEnd)) then
        if (int >= upperCaseStart) && (int <= upperCaseEnd) then
            getShifted 'A' shift int

        else
            getShifted 'a' shift int
    else
        int

decode: Int -> Int -> Int
decode shift int =
    encode -shift int
