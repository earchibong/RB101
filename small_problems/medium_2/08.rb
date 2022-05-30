=begin
A featured number (something unique to this exercise) is an odd number that is 
a multiple of 7, and whose digits occur exactly once each. 
So, for example, 49 is a featured number, but 98 is not (it is not odd), 
97 is not (it is not a multiple of 7), 
and 133 is not (the digit 3 appears twice).

Write a method that takes a single integer as an argument, and returns the 
next featured number that is greater than the argument. 
Return an error message if there is no next featured number.

Algorithm
featured number: n % 7 == 0 && digits occur once && odd
digits = n.to_s.chars: if count of digits == 1 then featured number

- validate single occuring digits
- call find method on range(n..)
 - find should return one value that matches the condition within the block
 - set condition to:
   - multiple of 7
   - odd
   - single occuring number (return value of method)
=end


def valid?(number)
   number.odd? && number % 7 == 0 && number.digits == number.digits.uniq
end

def featured(number)
return "invalid" if number >= 9_876_543_210

     loop do
        number += 1
        break if valid?(number)
    end
    number
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

#p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements

