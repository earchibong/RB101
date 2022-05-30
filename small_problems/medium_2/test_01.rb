=begin
Implement a method #substrings that takes a word as the first argument and then
an array of valid substrings (your dictionary) as the second argument. 
It should return a hash listing each substring (case insensitive) that was 
found in the original string and how many times it was found.

Example:
  > dictionary = ["below","down","go","going","horn","how","howdy","it","i",
                  "low","own","part","partner","sit"]

  => ["below","down","go","going","horn","how","howdy","it","i","low","own",
       "part","partner","sit"]

  substrings("below", dictionary) ==  { "below" => 1, "low" => 1 }
  
 Next, make sure your method can handle multiple words:
 

substrings("Howdy partner, sit down! How's it going?", dictionary)

{ "down" => 1, "go" => 1, "going" => 1, "how" => 2, "howdy" => 1, 
  "it" => 2, "i" => 3, "own" => 1, "part" => 1, "partner" => 1, "sit" => 1 }

input: one word string (exercise 1) + array
input: multiple word string (exercise 2) + array

out = hash that:

rules:
- lists each substring of the word (first argument)
- counts how many times the substring is found in the array (second argument)
- assume each substring is case insensitive

data structure: hash

algorithm
given 2 arguments: a string and an array

- find all substrings of the given string
  - finding substrings that begin with the first letter of the string (lead)
  - use lead to find all other substrings that begin with other letters of the 
    string.
- match all substrings with array collection 
  - return substrings that are a match with array elements
- iterate over substrings and count how many of each sub string are in the 
  array
  return count results in a hash
=end

# exercise 1

def leading_substrings(string)
  result = []
    0.upto(string.size - 1) do |index|
      result << string[0..index]
    end
    result.flatten
end

def all_substrings(string)
  result = []
  0.upto(string.size) do |index|
    subs = string[index..-1]
    result << leading_substrings(subs)
  end
  result.flatten
end

def validate_substring(string, array)
  substrings = all_substrings(string)
  validated = []
  substrings.each do |string| 
    validated << string if array.include?(string)
  end
  validated
end
    

def substrings(string, array)
  hash_count = {}
  valid_substrings = validate_substring(string, array)
  valid_substrings.each do |substring|
    hash_count[substring] = array.count(substring)
  end
  hash_count
end
  

dictionary = ["below","down","go","going","horn","how","howdy","it","i",
                  "low","own","part","partner","sit"]

p substrings("below", dictionary) ==  { "below" => 1, "low" => 1 }
p substrings("Howdy partner, sit down! How's it going?", dictionary) == {"part"=>1, 
"partner"=>1, "sit"=>1, "i"=>1, "it"=>1, "down"=>1, "own"=>1, "go"=>1, "going"=>1}