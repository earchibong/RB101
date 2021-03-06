# Problem 1
# How would you order this array of number strings by descending numeric value?

arr = ['10', '11', '9', '7', '8']
arr.sort_by { |el| el.to_i }.reverse

# Problem 2
# How would you order this array of hashes based on the year of publication of 
#each book, from the earliest to the latest?


books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

books.sort_by { |book| book[:published] }

# example 3
# For each of these collection objects demonstrate how you would reference 
# the letter 'g'.

arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]] == arr1[2][1][3]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']},
         {third: ['g', 'h', 'i']}] == arr2[1][:third][0]

arr3 = [['abc'], ['def'], {third: ['ghi']}] == arr3[2][:third][0][0]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'],
        'c' => ['h', 'i']} == hsh1['b'][1]

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1},
        third: {'g' => 0}} == hsh2[:third].key(0)
        
# example 4
#For each of these collection objects where the value 3 occurs, demonstrate 
#how you would change this to 4.

arr1 = [1, [2, 3], 4] => arr1[1][1] = 4

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3] => arr2[2] = 4

hsh1 = {first: [1, 2, [3]]} => hsh1[:first][2][0] = 4

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5} => hsh2[['a']][:a][2] = 4

# Problem 5
# Given this nested Hash:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# figure out the total age of just the male members of the family.

total_age = 0
details = munsters.values
  details.each do |detail|
    total_age += detail['age'] if detail['gender'] == 'male'
  end
total_age

=begin
 exercise 6
One of the most frequently used real-world string properties is that of 
"string substitution", where we take a hard-coded string and modify it with 
various parameters from our program.

Given this previously seen family hash, print out the name, age and gender 
of each family member:
=end
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

#like this: (Name) is a (age)-year-old (male or female).

munsters.each do |name, details|
  puts "#{name} is a #{details['age']}-year-old #{details['gender']}"
end

# problem 7
# Given this code, what would be the final values of a and b? Try to work this 
# out without running the code.

a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a

a = 2  b = [3, 8]
a points of object 2
b points to object array [5,8]
arr points to same objects that a and b are referencing

arr[0] is reassigned but a still points to object 2
arr[1][0] is modified but because it the array object is modified
so b is also modified.

# problem 8
# Using the each method, write some code to output all of the vowels 
# from the strings.

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], 
       fourth: ['over', 'the', 'lazy', 'dog']}
VOWELS = %w(a e i o u)
hsh.each_value do |value|
  value.each do |word|
    word.chars.each { |char| puts char if VOWELS.include?(char) }
  end
end

# problem 9
# Given this data structure, return a new array of the same structure but 
# with the sub arrays being ordered (alphabetically or numerically as 
# appropriate) in descending order.

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]
arr.map do |sub_arr|
  sub_arr.sort { |a, b| b <=> a }
end

# problem 10
# Given the following data structure and without modifying the original array, 
# use the map method to return a new array identical in structure to the 
# original but where the value of each integer is incremented by 1.

arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]
arr.map do |hash|
  hash.each_with_object({}) { |(key,value), hash| hash[key] = value += 1 }
end

# problem 11
# Given the following data structure use a combination of methods, including 
# either the select or reject method, to return a new array identical in 
# structure to the original but containing only the integers that are 
# multiples of 3.

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

arr.map do |sub_arr|
  sub_arr.select { |num| num % 3 == 0 }
end

# problem 12
# Given the following data structure, and without using the Array#to_h method, 
# write some code that will return a hash where the key is the first item in 
# each sub array and the value is the second item.

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

arr.each_with_object({}) do |sub_arr, hash|
  hash[sub_arr[0]] = sub_arr[1]
end

# problem 13
# Given the following data structure, return a new array containing the same 
#sub-arrays as the original but ordered logically by only taking into 
# consideration the odd numbers they contain.

arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]
# sorted array: [[1, 8, 3], [1, 5, 9], [6, 1, 7], [1, 6, 9]]

arr.sort_by do |sub_arr|
  sub_arr.select { |num| num.odd? }
end

# problem 14
# Given this data structure write some code to return an array containing the 
# colors of the fruits and the sizes of the vegetables. The sizes should be 
# uppercase and the colors should be capitalized.

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

# return value: [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]

hsh.each_with_object([]) do |(_, detail), array |
  if detail[:type] == 'fruit'
    capitalized = detail[:colors].map { |el| el.capitalize }
    array << capitalized
  elsif detail[:type] == 'vegetable'
    array << detail[:size].upcase
  end
end

# problem 15
# Given this data structure write some code to return an array which 
# contains only the hashes where all the integers are even.

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]
arr.select do |hash|
  hash.all? do |_, value|
    value.all? { |ele| ele.even? }
  end
end

