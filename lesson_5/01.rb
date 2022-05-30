# What's happening in this, seemingly simple, piece of code? 
# Take it apart and try to describe every interaction with precision.

[[1, 2], [3, 4]].each do |arr|
  puts arr.first
end
# 1
# 3
# => [[1, 2], [3, 4]]

`Array#each method` is called on nested array with a `do..end` block passed to it 
as an argument. Each sub_array of the calling object is passed to the block in 
turn and assigned to the variable `arr`

On `line 5` the `Array#first method` is  called on arr and returns the object 
at `index 0` of the current array - in this case integers `1` and `3` respectively.

The `puts method` then outputs a string representation of the integer. And, since
this is the last evaluated expression in the block, the return value of the block
is `nil`. 

`Array#each` does not do anything with the returned value of the block
and since the return value of `each` is the original calling object - in this case,
the nested array - this is what is ultimately returned.

=begin
What is the type of action being performed (method call, block, conditional, etc..)?
What is the object that action is being performed on?
What is the side-effect of that action (e.g. output or destructive action)?
What is the return value of that action?
Is the return value used by whatever instigated the action?
=end

# example 2:
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
end
# 1
# 3
# => [nil, nil]

`Array#map` is called on a multi-dimensional object with a `do..end` block
passed to it as an argument. Each sub_array of the calling object is passed 
to the block in turn and assigned to the variable `arr`

`Array#first` is called on arr and returns the object at `index 0` of the 
current array - which in this case is` 1` and `3`. 

The `puts method` is called on this return value and outputs a string
representation of the integer. Since `puts` is the last evaluated expression, 
the return value of the block is `nil`

`Array#map` evaluates the return value of the block to perform a transformation
on the calling object. In this case, since the return value of the block in turn
is `nil`, it will return a new array with two `nil` objects.

# example 3:

[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end

`Array#map` is called on a multi-dimensional object with a `do..end` block
passed to it as an argument. Each sub_array of the calling object is passed 
to the block in turn and assigned to the variable `arr`

`Array#first` is called on arr and returns the object at `index 0` of the 
current array - which in this case is` 1` and `3`. 

The `puts method` is called on this return value of `Array#first` and outputs 
a string representation of the integer. 

`Array#first` is called again on arr and returns the object at `index 0` of the 
current array - which in this case is` 1` and `3`. Since `Array#first` is the 
last evaluated expression of the block, its return value of `1` and `3` is also
the return value of the block

`Array#map` evaluates the return value of the block to perform a transformation
on the calling object. In this case, since the return value of the block in turn
is `1` and `3`, it will return a new array with these 2 objects. [1, 3].


# example 4
my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end

`Array#each` is called on a multi-dimensional object with a `do..end` block
passed to it as an argument and  is referenced by local variable `my_arr`

Each sub_array of the calling object is passed to the block in turn and 
assigned to the variable `arr`.

On `line 85` `Array#each` is called on each sub_array. Each object in the 
sub_array is passed to the block in turn and assigned to the variable `num`.

On `line 88` `the puts method` is called on `num` if the condition on 
`line 87` evaluates as `true`. In this case, it will output a string 
representation of the integer - which is : `18, 7, 12.`

Since `puts` is the last evaluated expression, the return value of this inner 
block is `nil`

`Array#each` does nothing with the returned value of the block (`nil`)
and since the return value of `each` is the original calling object - in this case,
the current sub_array - this is what is ultimately returned 

 the sub_arrays returned by `Array#each` on `line 86`: [18,7], [3,12] become
 the return value of the outer block

`Array#each` again for the outer expression does not do anything with the 
returned value of the block (`nil`) and since the return value of `each` is the 
original calling object - in this case,the nested_array - this is what is 
ultimately returned: [[18, 7], [3, 12]]


# example: 5
[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end

`Array#map` is called on a multi-dimensional object with a `do..end` block
passed to it as an argument. Each sub_array of the calling object is passed 
to the block in turn and assigned to the variable `arr`

on `line 124` `Array#map` is called again on each sub_array object referenced
by variable `arr`. Each object of integer is passed to an inner block in turn 
and assigned to the variable `num`

on `line 125` the last evaluated expression of the block is `num * 2` which 
outputs: `2, 4, 6, 8` and has a `truthy` return value.

`Array#map` evaluates the return value of the inner block to perform a transformation
on the calling object - which in this case is the current sub_array. In this 
case, it will return a new arrays: [2,4], [6,8]

the new arrays returned by `Array#map` on `line 124`:[2,4], [6,8] become the 
return values of the outer block.

`Array#map` then evaluates the return value of the outer block to perform 
a transformation on the calling object - which in this case is the nested array. 
In this case, it will return a new multi-dimensional array: [[2,4], [6,8]]

# example 6
[{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
  hash.all? do |key, value|
    value[0] == key.to_s
  end
end
# => [{ :c => "cat" }]

`Enumerable#select` is called on a multi-dimensional object with a do..end
block passed to it as an argument. The objects within the array are passed to
block and assigned to variable `hash`.

on `line 153` `Enumerable#all?` is called on `hash` with a do..end block passed
to it as an argument.

key-value objects within `hash` are passed into the inner block and assigned to
variables ` key` and `value`. and on `line 154` the expression, outputs and 
returns a boolean value of `true` or `false` based on the `key-value` pair passed 
into the block.

As the expression on `line 154` is the last evaluated expression in the block,
its return value -which in this case are: `true, false, true` are also the 
return value of the inner block.

`Enumerable#all?`  evaluates the return value of the block and only returns
`true` if the block never evaluates to `false` or `nil` for all the objects 
passed into it. In this case, `Enumerable#all?` will return : `false` and `true`

Since `all?` evaluates to 'false' and 'true' the return value of the outer block
will also be: `false` and `true` for each object passed to it.

`Enumerable#Select` evaluates the return value of the outer block and only 
selects and returns in a new array, objects that evaluate to `true` when passed 
into the block. In this case, the first object is not selected because it 
evaluates to `false`. So the return value is: [{c: 'cat'}]

#example 10

[[[1, 2], [3, 4]], [5, 6]].map do |arr|
  arr.map do |el|
    if el.to_s.size == 1    # it's an integer
      el + 1
    else                    # it's an array
      el.map do |n|
        n + 1
      end
    end
  end
end

`Array#map` is called on a multi-dimensional object with a `do..end` block
passed to it as an argument. Each sub_array of the calling object is passed 
to the block in turn and assigned to the variable `arr`

`Array#map` is called on `arr` and the sub_arrays within are passed to the
inner block in turn and assigned to variable 'el'

On the first iteration, the expression on `line 191` evaluates to `false`, so
map is called on the object and its elements are passed into a block in turn and
assigned to the variable `n`

In this case, the last evaluated expression on `line 195` will be the return
value of the inner block. It will output : `2, 3, 4, 5.`

`Array#map` evaluates the return value of the block to perform a transformation
on the calling object - which in this case is the current sub_array. In this 
case, it will return a new arrays: `[2,3], [4,5]` so the retrun value of block 2 
in the first iteration will be `[2,3], [4,5]`

`Array#map` evaluates the return value block 2 and retruns a new nested array
[[2,3], [4,5]]. This value becomes the return value of the main block.
`map` uses this value to return another new array: [[[2,3], [4,5]]]

On the second iteration, the if expression on `line 191` evaluates to `true.` 
`line 192` becomes the last evaluated expression. In this case, it outputs and 
returns: integers `6, 7`

`Array#map` evaluates the return value block 2 and retruns a new nested array
[6,7] in the second iteration. This value becomes the return value of the main block.
`map` uses this value to return another new array: [[6,7]]

The return and output for this expression once iteration is complete becomes:
[[[2,3], [4,5]], [6,7] ]
