# Functional Programming

## Week 1

### Caesar (part 1)

---

Solution File: _src/CaesarChar.elm_

Test File: _src/Tests/CaesarCharTest.elm_

#### Solution

Script encodes single character with the Ceasar cipher. It is done mainly by function `encode`, which pipelines input and output through functions: `toCode`, `caesarEncode` and `fromCode`. `toCode` get ASCII value of single character. `caesarEncode` applies the Ceasar cipher on the integer value in two steps. First step is to inspect whether character is uppercase or lowercase, if character is not letter, it is left untouched. Second step is to shift the integer by value defined in `desiredShift` with formula `(modBy 26 (int - (toCode startOfAlphabet) + shift)) + (toCode startOfAlphabet)` that utilises the fact Latin alphabet consists of 26 letters and the remainder of dividing the letter number plus shift by 26 is position of the shifted letter. Second step is abstracted to the form of function in order to avoid code duplication. At last, the `fromCode` function converts the integer value to the character. Function `decode` utilises the fact that one can decode encoded value with the shift of opposite value, so -14 decodes 14 and vice versa.

The output is displayed in the form of:
`Original: A Encoding: C Decoding: A`

#### Tests

Testing is divided into three parts: encoding, decoding, encoding and decoding at the same time. In order to pass tests all values should equal to True. The original character is compared with encoded/decoded/encoded&decoded character to make sure solution is valid.

### Pythagoras (part 1)

---

Solution File: _src/_

Test File: _src/Tests/_

#### Solution

#### Tests

## Week 2

### Caesar (part 2)

---

Solution File: _src/_

Test File: _src/Tests/_

#### Solution

#### Tests

### Pythagoras (part 2)

---

Solution File: _src/Pythagoras2.elm_

Test File: _src/Tests/Pythagoras2Test.elm_

#### Solution

Script utilises the `map`, `filter` functions and Case Expressions with the functions from the first part of exercise. `pythTriplesMap` and `arePythTriplesFilter` utilises basic implementation of `map`, `filter`. The `pythTriplesRec` has base case of empty _List_, which returns empty _List_. In other cases it is returning the list of: output for `pythTriple` given first element and `pythTriplesRec` with the rest of the _List_, this guarantees that _List_ will be empty at some point leading to base case. Similar pattern is used for `arePythTriplesRec`, which has the same base case, but if the _List_ is not empty it is utilising _if_ statement to examin wheter first triplet (first element) is Pythagorean, if so it is returned with the recursive call to `arePythTriplesRec` with the rest of _List_ as argument. Else it is just returning recursive call to `arePythTriplesRec` with the rest of _List_ as argument.

#### Tests

Tests verify whether functions correctly work with standard cases and with edge cases, such as empty list.

## Week 3

### Caesar (part 3)

---

Solution File: _src/_

Test File: _src/Tests/_

#### Solution

#### Tests

### Validating Credit Card Numbers

---

Solution File: _src/CreditCard.elm_

Test File: _src/Tests/CreditCardTest.elm_

#### Solution

Script implements `toDigits`, `toDigitsRev`, `doubleSecond`, `sumDigitsOfInt`, `sumDigits`, `isValid`, `numValid`, `validateCreditCards`, `validCreditCards`.

`toDigits`:
    The `toDigits` function converts a credit card number represented as a string into a list of integers. It achieves this by first converting each character in the string to its ASCII code using `Char.toCode`, and then subtracting the ASCII code of '0' to obtain the numeric value. The resulting list represents the individual digits of the credit card number.

`toDigitsRev`:
    This function is an extension of `toDigits`. It takes a credit card number as a string, converts it into a list of integers using `toDigits`, and then reverses the order of the obtained list. The reversal is done using `List.foldl (::) []`, where `::` is the cons operator that adds elements to the front of a list.

`doubleSecond`:
    The `doubleSecond` function takes a list of integers (representing the digits of a credit card number) and doubles every second integer in the list. It is designed to be used after obtaining the reversed list from `toDigitsRev`. The doubling is performed by pattern matching on the list and applying the doubling operation to every second element.

`sumDigitsOfInt`:
    This function calculates the sum of the digits of a given integer. It uses recursion and modulo arithmetic to break down the integer into its individual digits and then recursively adds them up. The base case checks if the integer is a single-digit number.

`sumDigits`:
    The `sumDigits` function takes a list of integers and calculates the sum of the digits for each integer in the list using `sumDigitsOfInt`. The result is the total sum of all digits in the list.

`isValid`:
    The `isValid` function checks the validity of a credit card number by applying the Luhn algorithm. It uses a composition of `toDigitsRev`, `doubleSecond`, and `sumDigits` to calculate the sum of the digits after doubling every second digit. The result is deemed valid if the sum is divisible by 10.

`numValid`:
    This function takes a list of credit card numbers as strings, filters out the valid ones using `isValid`, and then calculates the total number of valid credit cards using `List.length`.

`validateCreditCards`:
    The `validateCreditCards` function takes a list of credit card numbers as integers, converts them to strings, and then applies `numValid` to get the count of valid credit cards.

`validCreditCards`:
    This list comprehension extracts the valid credit card numbers from the predefined `creditCards` list. It converts them to strings and filters them based on the validity determined by `isValid`.
    
Script displays  the amount of valid credit card numbers in the `creditCards` list and the valid credit card numbers.

#### Tests

In addition to the fact that the script operates on the 219 credit cards number, which ultimately tests its correctness on different examples, each function is tested for standard cases and edge cases. Some of the functions are parts of other, so the testing starts with the most basic standalone functions.
