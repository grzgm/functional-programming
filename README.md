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

#### Solution

#### Tests
