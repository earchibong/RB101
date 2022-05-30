=begin

You have a bank of switches before you, numbered from 1 to n. 
Each switch is connected to exactly one light that is initially off. 
You walk down the row of switches and toggle every one of them. 

You go back to the beginning, and on this second pass, 
you toggle switches 2, 4, 6, and so on. 

On the third pass, you go back again to the beginning and 
toggle switches 3, 6, 9, and so on. 

You repeat this process and keep going until you have been through n repetitions.

Write a method that takes one argument, the total number of switches, 
and returns an Array that identifies which lights are on after n repetitions.


Problem

inputs:
- integer: total number of switches - n

outputs:
- method that:
    - returns an array
      - that identies which lights are of after n repetitions



implicit:
- return an array

Examples:
Example with n = 5 lights:

round 1: every light is turned on
round 2: lights 2 and 4 are now off; 1, 3, 5 are on
round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
round 5: lights 2, 3, and 5 are now off; 1 and 4 are on
The result is that 2 lights are left on, lights 1 and 4. 
The return value is [1, 4].

With 10 lights, 3 lights are left on: lights 1, 4, and 9. 
The return value is [1, 4, 9].


data structure:

array

algorithm
range of lights (1..n)
n total number of iterations

- switch off all lights
  - iterate through the range and turn all lights off

=end

def initialise_lights(n)
  (1..n).each_with_object({}) { |num, hash| hash[num] = 'off' }
end

def lights_on(lights)
  lights.select { |_key , value | value == 'on' }.keys
end

def toggle_nth_light(lights, n)
  lights.each do |switch, state|
    lights[switch] = !state if switch % n == 0
  end
end

def toggle_lights(n)
  lights = initialise_lights(n)
  1.upto(n) do |number|
    toggle_nth_light(lights, number)
  end
  lights_on(lights)
end
  
p toggle_lights(5)