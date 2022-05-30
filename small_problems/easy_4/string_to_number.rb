=begin
  Write a method that takes a String of digits, and returns the appropriate 
number as an integer. You may not use any of the methods mentioned above.

For now, do not worry about leading + or - signs, nor should you worry about 
invalid characters; assume all characters will be numeric.

You may not use any of the standard conversion methods available in Ruby to 
convert a string to a number, such as String#to_i, Integer(), etc. 

Your method should do this the old-fashioned way and 
calculate the result by analyzing the characters in the string.

Problem:

Inputs:
- string of digits

outputs:
- return the appropriate number as an integer


implicit:
- no use of standard ruby methods
- assume all characters are numberic
- calculate result by analysing characters in the string argument

Examples:
string_to_integer('4321') == 4321
string_to_integer('570') == 570

Data Structure / Algorithm
4321 =
10 x 0 + 4 = 4
10 x 4 + 3 = 43
10 x 43 + 2 = 432
10 x 432 + 1 = 4321

each string character will need a corresponding integer values,
so use a hash to represent the digits conversion.

split the string into individual characters
iterate over character and convert them into integer digits

build corresponding integer number
  - iterate over integer digits
    - for each digit, add it to 10 times the previous value

=end
DIGITS = { 
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}


def string_to_integer(string)
  digits = string.chars.map { |char| DIGITS[char] }
  
  value = 0
  digits.each { |digit| value = value * 10 + digit }
  value
end

p string_to_integer('4321')
