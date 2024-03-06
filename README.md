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

Script displays the amount of valid credit card numbers in the `creditCards` list and the valid credit card numbers.

#### Tests

In addition to the fact that the script operates on the 219 credit cards number, which ultimately tests its correctness on different examples, each function is tested for standard cases and edge cases. Some of the functions are parts of other, so the testing starts with the most basic standalone functions.

## Week 4

### Name

---

Solution File: _src/.elm_

Test File: _src/Tests/.elm_

#### Solution

#### Tests

### Modelling Math Functions Part 1

---

Solution File: _src/ModellingMathFunctionsPart1.elm_

Test File: _src/Tests/ModellingMathFunctionsPart1Test.elm_

#### Solution

Script implements:

`type Function`:

This is an algebraic data type representing mathematical functions. The type has several constructors:

- `Plus`: Represents the addition of two functions.
- `Minus`: Represents the subtraction of two functions.
- `Mult`: Represents the multiplication of two functions.
- `Div`: Represents the division of two functions.
- `Poly`: Represents a function raised to a power.
- `Const`: Represents a constant value.
- `X`: Represents the variable 'x'.

`print : Function -> String`:

The `print` function takes a `Function` as input and returns a string representation of that function. It uses pattern matching to traverse the structure of the function and recursively builds a string on the nested `Function` type.

`eval : Float -> Function -> Float`:

The `eval` function takes a floating-point number `num` and a `Function` and calculates the result of the function for the given 'x' value. It uses pattern matching to traverse the function structure and recursively evaluates the function on the nested `Function` type. Its structure is similar to the `print` function.

`graphLine : Function -> Int -> Int -> Int -> String`:

The `graphLine` function generates a string representing a line on a graph for a given function within a specified range (`x1` to `x2`). It calculates the function value for each x-coordinate in the range and represents it with '+' and '=' characters. The function returns a string where the calculated function value is represented as '+' characters, and the rest are '=' characters. This creates a visual representation of the function on the graph.

`graph : Function -> Int -> Int -> Int -> Int -> String`:

The `graph` function recursively generates a complete graph for a given function within a specified range (`x1` to `x2` on the x-axis, `y1` to `y2` on the y-axis). It calls `graphLine` for each x-coordinate in the range and concatenates the results to form the complete graph string.

Html output is done with the same method as [Validating Credit Card Numbers](#Validating_Credit_Card_Numbers) exercise

#### Tests

Tests cover wide range of the normal and edge cases. From evaluating different types of functions (Linear, Quadratic, Polynomial, Rational) and input from minimal to multi parameter functions.

## Week 5

### Higher Order Functions

---

Solution File: _src/HigherOrderFunctions.elm_

Test File: _src/Tests/HigherOrderFunctionsTest.elm_

#### Solution

Script implements:

`repeatUntil : (a -> Bool) -> (a -> a) -> a -> a`:

This higher-order function repeatedly applies a given function (`doFun`) to an initial value (`arg`) until a specified condition (`testFun`) is satisfied. It's a form of recursion where the base case is defined by the condition function. The function has a generic type `a` to accommodate different types of arguments.

`aboveGiven : Int -> Int -> Bool`:

This function takes two integers, `cap` and `x`, and returns `True` if `x` is greater than `cap`. This is a basic comparison function.

`logarithmsCondition : Int -> Int -> Int -> Bool`:

This function takes three integers: `base`, `value`, and `exponent`. It checks if the result of raising `base` to the power of `exponent` is greater than or equal to `value`. This is used for checking if a logarithmic condition is met.

`collatzCompareFirstElement : List Int -> Bool`:

This function checks if the first element of a list of integers is equal to 1 with the `case` notation. It's designed for use in the Collatz sequence.

`collatzValue : Int -> Int`:

This function implements the Collatz conjecture by determining the next value in the sequence based on the rules. If the current number is even, it's halved; if odd, it's tripled and one is added.

`collatz : List Int -> List Int`:

This function applies the `collatzValue` function to the first element of the input list and recursively calls itself until the computed value is 1. It builds a list of integers representing a Collatz sequence. In the implementation, `Just` and `Nothing` are used to handle optional values when pattern matching on the result of `List.head list`. If the list is non-empty, `Just first` is matched, and if it's empty, `Nothing` is matched.

Usage:

`repeatUntil (aboveGiven 100) double 7`:

This example uses `repeatUntil` to double the value 7 until it is above 100. `aboveGiven 100` is a partially applied function where `cap` is set to 100.

`repeatUntil (aboveGiven 100) ((+) 1) 42`:

Similar to the first example, this one uses `repeatUntil` to increment the value 42 until it is above 100. Again, `aboveGiven 100` is a partially applied function.

`repeatUntil (logarithmsCondition 3 100) ((+) 1) 1`:

This example uses `repeatUntil` to increment the value 1 until the condition `(3 ^ x) >= 100` is met. `logarithmsCondition 3 100` is a partially applied function, this approach allows for control over base and value of logarithm.

`repeatUntil collatzCompareFirstElement collatz [19]`:

`repeatUntil` is applied to the `collatz` function with an initial list `[19]`. It generates a Collatz sequence until the condition specified in `collatzCompareFirstElement` is met.

#### Tests

### Name

---

Solution File: _src/.elm_

Test File: _src/Tests/.elm_

#### Solution

#### Tests
