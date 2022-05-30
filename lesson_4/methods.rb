
# Practice Problem 1

# What is the return value of the select method below? Why?


[1, 2, 3].select do |num|
  num > 5
  'hi'
end

return value => [1, 2, 3]
`select` evaluates the truthiness of the return value of the block and performs
a seection based on that.
string `hi` is the last evaluated expression in the block and `Ruby` always
returns the last evaluated expression, so `hi` is the return value of the block.

`hi` is truthy because everything in `Ruby` except `false` and `nil` are truthy.
`select` will therefore return a new array containing all of the elements in 
the original array based on this.


#Practice Problem 2
#How does count treat the block's return value? How can we find out?

['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

`count` evaluates the truthiness of the return value of the block. It only 
counts an element if the return value of the block evaluates as truthy.


# Practice Problem 3
# What is the return value of reject in the following code? Why?

[1, 2, 3].reject do |num|
  puts num
end


since `puts` method always returns falsey, the return value of the block is falsey.
`reject` method evaluates the return value of the block and returns a new array 
containing elements where the return value of the
block is falsey. In otherwords, if the element was falsey or `nil`, it would
be selected.


#Practice Problem 4
# What is the return value of each_with_object in the following code? Why?


['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

When we invoke each_with_object, we pass in an object ({} here) as an argument. 
That object is then passed into the block and at the end of each iteration, its
value is updated and returned.

Once each_with_object has iterated over the calling collection, 
it returns the initially given object, which now contains all of the updates.


# Practice Problem 5
# What does shift do in the following code? How can we find out?

hash = { a: 'ant', b: 'bear' }
hash.shift

hash shift destructively removes the first key:value pair from the collection and 
returns it as a two item array.

check the docs for Hash#shift

# Practice Problem 6
# What is the return value of the following statement? Why

['ant', 'bear', 'caterpillar'].pop.size

return value = 11
`array#pop` destructively removes the last element in the collection and returns
it. `array#size` determines the length of the returned element by counting the number 
of characters


# Practice Problem 7
# What is the block's return value in the following code? 
#How is it determined? 
#Also, what is the return value of any? in this code and what does it output?

[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

return value of block = boolean
return value of any? = 'true'

the return value of the block is the last evaluated expression. In this case,
`num.odd?` is the last expression and it has a return value that is a boolean.

`any?` evaluates the evaluates the return value of the block and returns true 
if the block returns a value other than `false` or `nil`.

The block returns `true` on the first iteration so any? returns `true`. `any?` stops
iteration at this point, since there is no need to iterate the remaining items in the array.


# Practice Problem 8
# How does take work? Is it destructive? How can we find out?? 

arr = [1, 2, 3, 4, 5]
arr.take(2)

You can find out how `Array#take` works from the documentation or test it out in 
irb.
`Array#take` selects and returns a specified number of elements. It is
non destructive.


# Practice Problem 9
# What is the return value of map in the following code? Why? 

{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end

`map` method evaluates the return value of the block to make a transformation.
In this case, the block contains an if statement. In the first iteration,
the condition evaluates as false and `value` is not returned. When none  of the 
conditions in an if statement return true, the if statement ifself returns nil.
So the return value of the block is nil. 

In the 2nd iteration, the if condition evaluates as true and `value` is
returned.

So the return value of map is a new array with the elements - nil and bear : 
[nil, bear]


# Practice Problem 10
# What is the return value of the following code? Why?

[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

the return value of the block is the last evaluated expression and `map` 
evaluates the return value of the block to make a transformation.

However, in this case, the block contains an if statement, so the return value of
the block will either be num which is `truthy` or puts num which is 
nil because `puts method` always returns nil.

So, in the first iteration, the if condition evaluates as false, so, as num is the 
last expression, the element is returned as the value of the block. 

In the 2nd and 3rd iterations, the if statement evaluates as true, so puts num is the 
last expression and nil is returned both times. 

Map then returns a new array :  [1, nil, nil]

