=begin

Problem
input = 2 integers that...
    - count : first argument
    - sequence start point : 2nd argument

output = array that...
 -  contains the same number of elements as the count
 - values of each element == multiples of the starting number
  - values % start num == 0
   
   
rules / examples:
- assume that the count argument will always have a value of 0 or greater
- the starting number can be any integer value
- If the count is 0, an empty list should be returned.
  - if count == 0 return []
  
sequence(5, 1) == [1, 2, 3, 4, 5]
sequence(4, -7) == [-7, -14, -21, -28]
sequence(3, 0) == [0, 0, 0]
sequence(0, 1000000) == []

 
data structure = array

algorithm
given two integers: count and start
- determine the range
  - (1 ..count)
- iterate over the range
  -  for each number passed itno the block
    - multiply element by starting num

  
  


BLOCKS = [ 'BO', 'XK', 'DQ', 'CP', 'NA', 'GT', 'RE', 'FS', 'JW', 'HU',
           'VI', 'LY', 'ZM' ].freeze

def block_word?(string)
  str = string.upcase
  BLOCKS.none? { |block| str.count(block) >= 2 }
end


p block_word?('BATCH') #== true
p block_word?('BUTCH') #== false
p block_word?('jest') #== true
=end

  NUMBERS = { 'one' => 1, 'two' => 2, 'three' => 3, 'four' => 4, 'five' => 5,
              'six' => 6, 'seven' => 7, 'eight' => 8, 'nine' => 9, 'zero' => 0 }



def word_to_digit(string)
  NUMBERS.each do |written_number, digit|
    string.gsub!(written_number, digit)
  end
  string
end
p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'