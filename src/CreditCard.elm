module CreditCard exposing (..)

import Html exposing (Html)



------------------------------------------------------------------------------------------------------------------------------
-- Validating Credit Card Numbers
------------------------------------------------------------------------------------------------------------------------------
-- ===================================
-- Ex. 0 Convert String into List of Integers
-- ===================================


toDigits : String -> List Int
toDigits x =
    List.map (\y -> y - Char.toCode '0') (List.map Char.toCode (String.toList x))



-- ===================================
-- Ex. 1 Convert String into List of Integers and reverse List
-- ===================================


toDigitsRev : String -> List Int
toDigitsRev x =
    List.foldl (::) [] <| toDigits x



-- ===================================
-- Ex. 2 Double every second Integer in the List
-- ===================================


doubleSecond : List Int -> List Int
doubleSecond list =
    case list of
        x :: x2 :: xs ->
            x :: x2 * 2 :: doubleSecond xs

        x :: xs ->
            x :: doubleSecond xs

        [] ->
            []



-- ===================================
-- Ex. 3 Sum all the digits of numbers
-- ===================================


sumDigitsOfInt : Int -> Int
sumDigitsOfInt int =
    if int <= 9 then
        int

    else
        sumDigitsOfInt (int // 10) + modBy 10 int


sumDigits : List Int -> Int
sumDigits list =
    case list of
        [] ->
            0

        x :: xs ->
            sumDigitsOfInt x + sumDigits xs



-- ===================================
-- Ex. 4 Verify whether card number is divisible by 10
-- ===================================


isValid : String -> Bool
isValid str =
    (modBy 10 <| sumDigits <| doubleSecond <| toDigitsRev str) == 0



-- ===================================
-- Ex. 5 Count number of valid credit card numbers in the list
-- ===================================


numValid : List String -> Int
numValid =
    List.filter isValid >> List.length


creditCards : List Int
creditCards =
    [ 4716347184862961
    , 4532899082537349
    , 4485429517622493
    , 4320635998241421
    , 4929778869082405
    , 5256283618614517
    , 5507514403575522
    , 5191806267524120
    , 5396452857080331
    , 5567798501168013
    , 6011798764103720
    , 6011970953092861
    , 6011486447384806
    , 6011337752144550
    , 6011442159205994
    , 4916188093226163
    , 4916699537435624
    , 4024607115319476
    , 4556945538735693
    , 4532818294886666
    , 5349308918130507
    , 5156469512589415
    , 5210896944802939
    , 5442782486960998
    , 5385907818416901
    , 6011920409800508
    , 6011978316213975
    , 6011221666280064
    , 6011285399268094
    , 6011111757787451
    , 4024007106747875
    , 4916148692391990
    , 4916918116659358
    , 4024007109091313
    , 4716815014741522
    , 5370975221279675
    , 5586822747605880
    , 5446122675080587
    , 5361718970369004
    , 5543878863367027
    , 6011996932510178
    , 6011475323876084
    , 6011358905586117
    , 6011672107152563
    , 6011660634944997
    , 4532917110736356
    , 4485548499291791
    , 4532098581822262
    , 4018626753711468
    , 4454290525773941
    , 5593710059099297
    , 5275213041261476
    , 5244162726358685
    , 5583726743957726
    , 5108718020905086
    , 6011887079002610
    , 6011119104045333
    , 6011296087222376
    , 6011183539053619
    , 6011067418196187
    , 4532462702719400
    , 4420029044272063
    , 4716494048062261
    , 4916853817750471
    , 4327554795485824
    , 5138477489321723
    , 5452898762612993
    , 5246310677063212
    , 5211257116158320
    , 5230793016257272
    , 6011265295282522
    , 6011034443437754
    , 6011582769987164
    , 6011821695998586
    , 6011420220198992
    , 4716625186530516
    , 4485290399115271
    , 4556449305907296
    , 4532036228186543
    , 4916950537496300
    , 5188481717181072
    , 5535021441100707
    , 5331217916806887
    , 5212754109160056
    , 5580039541241472
    , 6011450326200252
    , 6011141461689343
    , 6011886911067144
    , 6011835735645726
    , 6011063209139742
    , 379517444387209
    , 377250784667541
    , 347171902952673
    , 379852678889749
    , 345449316207827
    , 349968440887576
    , 347727987370269
    , 370147776002793
    , 374465794689268
    , 340860752032008
    , 349569393937707
    , 379610201376008
    , 346590844560212
    , 376638943222680
    , 378753384029375
    , 348159548355291
    , 345714137642682
    , 347556554119626
    , 370919740116903
    , 375059255910682
    , 373129538038460
    , 346734548488728
    , 370697814213115
    , 377968192654740
    , 379127496780069
    , 375213257576161
    , 379055805946370
    , 345835454524671
    , 377851536227201
    , 345763240913232
    ]



-- collecting results for printing:
-- convert the List of Int's to List of String's and validate them


validateCreditCards : List Int -> Int
validateCreditCards =
    List.map String.fromInt >> numValid



-- get List of valid Credit Cards


validCreditCards : List String
validCreditCards =
    creditCards
        |> List.map String.fromInt
        |> List.filter isValid


myResults : List String
myResults =
    [ "calculations:" ++ (String.fromInt <| validateCreditCards creditCards)
    , "valid credit cards: "
    ]
        ++ validCreditCards
        ++ [ "-- end --" ]



-- create main method (Boiler-plate)


toDiv : String -> Html msg
toDiv myValue =
    Html.div [] [ myValue |> Html.text ]


main : Html msg
main =
    Html.div
        []
        (List.map toDiv myResults)
