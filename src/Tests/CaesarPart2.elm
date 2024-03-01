module Tests.CaesarPart2 exposing (..)
import CaesarPart2 exposing (normalize, encrypt, decrypt)
import Html exposing (text)

toString = Debug.toString


normalizeTest = [
    toString <| normalize "Hello Fontys!~~~" == "HelloFontys",
    toString <| normalize "Test123" == "Test",
    toString <| normalize "asdAsdZ" == "asdAsdZ"
    ]

encodingTest = [
    toString <| encrypt 25 "Hello" == "Gdkkn",
    toString <| encrypt 26 "Hello" == "Hello",
    toString <| encrypt 1 "Testz" == "Uftua",
    toString <| encrypt -1 "WelcomeToFontys" == "VdkbnldSnEnmsxr",
    toString <| encrypt 5 "Zad" == "Efi",
    toString <| encrypt 7 "RFRFRZ" == "YMYMYG"
    ]
decodingTest = [
    toString <| decrypt 5 "Efi" == "Zad",
    toString <| decrypt 7 "RFRFRZ" == "YMYMYG"
    ]
encodingDecodingTest = [
    toString <| (decrypt 5 <| encrypt 5 "Testz") == "Testz",
    toString <| (decrypt 7 <| encrypt 7 "WelcomeToFontys") == "WelcomeToFontys"
    ]
    
main = text ( toString (normalizeTest) ++ toString (encodingTest) ++ toString (decodingTest) ++ toString (encodingDecodingTest) )