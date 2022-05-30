=begin

9. Fibonacci (Procedural)

In the previous exercise, we developed a recursive solution to calculating the 
nth Fibonacci number. 

In a language that is not optimized for recursion, some (not all) recursive 
methods can be extremely slow and require massive quantities of memory 
and/or stack space.

Ruby does a reasonably good job of handling recursion, but it isn't designed 
for heavy recursion; as a result, the Fibonacci solution is only useful up to 
about fibonacci(40). With higher values of nth, the recursive solution is 
impractical. 
(Our tail recursive solution did much better, but even that failed at 
around fibonacci(8200).)

Fortunately, every recursive method can be rewritten as a non-recursive 
(procedural) method.

Rewrite your recursive fibonacci method so that it computes its results 
without recursion.
=end

def fibonacci(n)
  a = 0
  b = 1
  
  n.times do
    c = a
    a = b
    b = c + a
  end
  return a
end

#fibonacci(20) == 6765
#fibonacci(100) == 354224848179261915075
#fibonacci(100_001) # => 4202692702.....8285979669707537501

=begin

10. Fibonacci (Last digit)

In the previous exercise, we developed a procedural method for computing the 
value of the nth Fibonacci numbers. This method was really fast, computing 
the 20899 digit 100,001st Fibonacci sequence almost instantly.

In this exercise, you are going to compute a method that returns the 
last digit of the nth Fibonacci number.
=end

def fibonacci_last(n)
  nth_number = fibonacci(n)
  digits = nth_number.to_s.chars
  digits.pop.to_i
end

p fibonacci_last(15)         == 0  #(the 15th Fibonacci number is 610)
p fibonacci_last(20)        == 5 #(the 20th Fibonacci number is 6765)
p fibonacci_last(100)       == 5 #(the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   == 1 #(this is a 20899 digit number)
p fibonacci_last(1_000_007) == 3 #(this is a 208989 digit number)
p fibonacci_last(123456789) == 4
