module CaesarPart3 exposing (..)

import Html
import Char exposing (toCode, fromCode)

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

decrypt: Int -> String -> String
decrypt shift str =
    case String.toList str of
        [] -> ""
        x :: xs -> String.fromChar (decode shift x) ++ (decrypt shift (String.fromList xs))


-- Function to check if a string contains any of the given search strings
isInfixOf : List Char -> List Char -> Bool
isInfixOf needle haystack =
    case (needle, haystack) of
        ([], _) ->
            True

        (x :: xs, []) ->
            False

        (x :: xs, y :: ys) ->
            if x == y then
                isInfixOf xs ys
            else
                isInfixOf needle ys

anyContainsCanary : List String -> String -> Bool
anyContainsCanary canaries text =
    case canaries of
        [] ->
            False
        canary :: rest ->
            if isInfixOf (String.toList canary) (String.toList text) then
                True
            else
                anyContainsCanary rest text

containsCanaries : List String -> String -> Bool
containsCanaries canaries text =
    anyContainsCanary canaries text

candidates : List String -> String -> List ( Int, String )
candidates canaries encryptedText =
    let
        possibleDecryptions =
            List.map (\offset -> ( offset, decrypt offset encryptedText )) (List.range 1 25)
    in
    List.filter (\( offset, decrypted ) -> containsCanaries canaries decrypted) possibleDecryptions

-- Example usage
main =
    let
        encryptedText =
            "DGGADBCOOCZYMJHZYVMTOJOCZHVS"

        canaries =
            [ "THE", "AND" ]
    in
    Html.text(Debug.toString (candidates canaries encryptedText))
