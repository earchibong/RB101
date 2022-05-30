=begin
Write a method that takes a sentence string as input, and returns the same
string with any sequence of the words 'zero', 'one', 'two', 'three', 
'four', 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.

Example:
word_to_digit('Please call me at five five five one two three four. Thanks.') 
== 'Please call me at 5 5 5 1 2 3 4. Thanks.'

Algorithm
- Use regex to find each word in the sentence. 
- Each word is passed into the block as an argument and set the variable ‘word’. 
- Call fetch on the collection: the NUMBERS hash. 
- On each loop, pass fetch the variable ‘word’ (the current word in the
sentence) as an argument. 
  - If a match is found fetch returns the value for that key. 
  - If there is no match then the original word is return. 

Fetch is a great method to use because we can send it two arguments. 
If there is no match for the key we return our default value: the ‘word’ variable.
=end

NUMBERS = { 'zero' => 0, 'one' => 1, 'two' => 2, 'three' => 3, 'four' => 4, 
            'five' => 5, 'six' => 6, 'seven' => 7, 'eight' => 8, 'nine' => 9 }

def word_to_digit(string)
  string.gsub(/\w+/) { |word| NUMBERS.fetch(word,word) }
end

str = 'Please call me at five five five one two three four. Thanks.'
p word_to_digit(str) == 'Please call me at 5 5 5 1 2 3 4. Thanks.'