module Tests.CaesarPart3Test exposing (..)
import CaesarPart3 exposing (..)
import Html exposing (text)

toString = Debug.toString

bruteForceTest = [
    toString <| (CaesarPart3.candidates ["THE", "AND"] "DGGADBCOOCZYMJHZYVMTOJOCZHVS") == [(5,"YBBVYWXJJXUTHECUTQHOJEJXUCQN"),(6,"XAAUXVWIIWTSGDBTSPGNIDIWTBPM"),(14,"PSSMPNOAAOLKYVTLKHYFAVAOLTHE"),(21,"ILLFIGHTTHEDROMEDARYTOTHEMAX"),(25,"EHHBECDPPDAZNKIAZWNUPKPDAIWT")],
    toString <| (CaesarPart3.candidates ["THE", "AND"] "Yjxy") == [],
    toString <| (CaesarPart3.candidates ["Test"] "Yjxy") == [(5, "Test")]
    ]

main = text ( toString (bruteForceTest) )
