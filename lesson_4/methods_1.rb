# Practice Problem 1
# Given the array below, Turn this array into a hash where 
# the names are the keys and the values are the positions in the array.

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
hash = {}
flintstones.each_with_index { |name, index| hash[name] = index }
hash

# Practive Problem 2
# Add up all of the ages from the Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

sum = 0
ages.each { |_, age| sum += age }
sum

# Practive Problem 3
# In the age hash, remove people with age 100 or greater

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.delete_if { |_, age| age > 100 }

# Practive Problem 4
# Pick out the minimum age from our current Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
ages.values.min

# Practice Problem 5
# Find the index of the first name that starts with "Be"

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.index { |name| name[0, 2] == 'Be' }

# Practice Problem 6
# Amend this array so that the names are all shortened to just the first three characters:
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.map { |name| name.slice(0, 3) }

# Practice Problem 7
# Create a hash that expresses the frequency with which each letter occurs in this string:

statement = "The Flintstones Rock"
str = statement.chars
str.each_with_object({}) { |char, hash| hash[char] = str.count(char) }

# Practice Problem 8
# What happens when we modify an array while we are iterating over it? 
# What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

when we modify an array while we iterate over it, the index position of elements
within could be modified which affects the output and return values of the block
method invoked.

the output of the code would be: 1, 3
In the first iteration, 1 is printed and then deleted from the array. The 
modified array now has 2 as its first element. But, a first iteration has already
occured at index[0], so `each method` moves to the next element in the array at index[1]
which is 3.

so, 3 is printed and 2 is deleted from the array.
'each' stops iterating as the last element is now the first element in the array.

# What would be output by this code?
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

output : 1, 2

In the first iteration, 1 printed and the last element (4) is deleted from the array. 
The modifed array is now [1,2,3].
Then 2 is printed in the second iteration and the last element (3) is deleted from the 
array and each stops iteration.

# Practice Problem 9
# Capitalise each word in the string.
words = "the flintstones rock" ==  "The Flintstones Rock"
words.split.map { |word| word.capitalize }.join(' ')

=begin
Practice Problem 10
Given the munsters hash below
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}


Modify the hash such that each member of the Munster family has an 
additional "age_group" key that has one of three values describing the 
age group the family member is in (kid, adult, or senior). 
Your solution should produce the hash below

{ "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
  "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
  "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
  "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
  "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }
  
=end

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, details|
  case details['age']
    when 0..19 then details['age_group'] = 'kid'
    when 20..59 then details['age_group'] = 'adult'
    else 
      details['age_group'] = 'senior'
  end
end