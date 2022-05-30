=begin
A collection of spelling blocks has two letters per block, as shown in this list:

B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M

This limits the words you can spell with the blocks to just those words that do 
not use both letters from any given block. Each block can only be used once.

Write a method that returns true if the word passed in as an argument can be 
spelled from this set of blocks, false otherwise.

Examples:
block_word?('BATCH') == true
block_word?('BUTCH') == false
block_word?('jest') == true

data structure:
array

algorithm:
solution two:

for the nested array
  - check if none of the blocks (sub_arrays) have first and second elements that 
    match the characters in the given string.


solution one:
for the array
  - check if none of the blocks appear twice in the given string
    - condition: count the number of times the block appears in the string.

=end

# solution one:

BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).freeze

def block_word?(string)
  str = string.upcase
  BLOCKS.none? { |block| str.count(block) >= 2 }
end


# solution 2

BLOCKS = [['B', 'O'], ['X', 'K'], ['D', 'Q'], ['C', 'P'], ['N', 'A'], ['G', 'T'], 
          ['R', 'E'], ['F', 'S'], ['J', 'W'], ['H', 'U'], ['V', 'I'], ['L', 'Y'], 
          ['Z', 'M']]

def block_word?(string)
  str = string.upcase.chars
  BLOCKS.none? { |ele| ele[0] =~ /#{str}/ && ele[1] =~ /#{str}/ }
end


p block_word?('BATCH') #== true
p block_word?('BUTCH') #== false
p block_word?('jest') #== true