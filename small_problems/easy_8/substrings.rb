=begin
Problem 1:
Write a method that returns a list of all substrings of a string that start at 
the beginning of the original string. The return value should be arranged in 
order from shortest to longest substring.
=end
def leading_substrings(string)
  result = []
  0.upto(string.size - 1) do |index|
    result << string[0..index]
  end
  result
end

=begin
Problem 2: 
Write a method that returns a list of all substrings of a string. 
The returned list should be ordered by where in the string the substring begins. 
This means that all substrings that start at position 0 should come first, 
then all substrings that start at position 1, and so on.

Since multiple substrings will occur at each position, the substrings at a 
given position should be returned in order from shortest to longest.

You may (and should) use the leading_substrings method you wrote in 
the previous exercise:
=end

def substring(string)
  arr = []
  0.upto(string.size) do |index|
    substrings = string[index..-1]
    arr.concat(leading_substrings(substrings))
  end
  arr
end

=begin
Write a method that returns a list of all substrings of a string that are 
palindromic. 
That is, each substring must consist of the same sequence of characters forwards 
as it does backwards. 

The return value should be arranged in the same sequence as the substrings appear 
in the string. Duplicate palindromes should be included multiple times.

You may (and should) use the substrings method you wrote in the previous exercise.

For the purposes of this exercise, you should consider all characters and pay 
attention to case; 
that is, "AbcbA" is a palindrome, but neither "Abcba" nor "Abc-bA" are. 
In addition, assume that single characters are not palindromes.
=end

def palindrome?(string)
  string == string.reverse && string.size > 1
end

def palindromes(string)
  filtered_strings = string.gsub(/[^a-z]/i, '').downcase
  all_substrings = substring(filtered_strings)
  result = []
  all_substrings.each do |substring|
    result << substring if palindrome?(substring)
  end
  result
end
p palindromes('hello-madam-did-madam-goodbye')