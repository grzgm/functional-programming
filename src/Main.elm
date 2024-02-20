module Main exposing (..)

import Html exposing (text)
import Char exposing (toCode)
import List exposing (map)
import Char exposing (fromCode)
import String exposing (toList)
import String exposing (fromList)

main = text ( encodedString )

words = "Test"

desiredShift = -1000

-- Split String to List of Char's

chars = toList words

-- Map Char's to the Int's
ints = map toCode chars

-- Shift Int's
-- shiftedInts = map (encode desiredShift) ints
shiftedInts2 = map (encode desiredShift) ints
shiftedInts = map (decode desiredShift) shiftedInts2

-- Map Int's to Char's
shiftedChars = map fromCode shiftedInts 

-- Concatenate List of Char's to String
encodedString = fromList shiftedChars

-- change 65 and 90 to toCode 65
-- abstarct if
-- encode as Int -> Char -> Char
-- make into one function encode
encode: Int -> Int -> Int
encode shift int =
    if ((int >= 65) && (int <= 90)) || ((int >= 97) && (int <= 122)) then
        if (int >= 65) && (int <= 90) then
            (modBy 26 (int - 65 + shift)) + 65

        else
            (modBy 26 (int - 97 + shift)) + 97
    else
        int

decode: Int -> Int -> Int
decode shift int =
    encode -shift int
