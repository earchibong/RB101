=begin
Cute angles
Write a method that takes a floating point number that represents an angle 
between 0 and 360 degrees and returns a String that represents that angle in 
degrees, minutes and seconds. You should use a degree symbol (°) to represent 
degrees, a single quote (') to represent minutes, and a double quote (") to 
represent seconds. A degree has 60 minutes, while a minute has 60 seconds.

Examples:
dms(30) == %(30°00'00")
dms(76.73) == %(76°43'48")
dms(254.6) == %(254°36'00")
dms(93.034773) == %(93°02'05")
dms(0) == %(0°00'00")
dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

Problem
input = float that == angle btw 0 and 360 degrees

output = string that...
 - represents the angle in degrees, mins and secs
 


rules
- use a degree symbol (°) to represent degrees
- use a single quote (') to represent minutes
- use a double quote (") to represent seconds
- A degree has 60 minutes, while a minute has 60 seconds.
- use two digit numbers with leading zeros when formatting the minutes and 
  seconds, e.g., 321°03'07".
- DEGREE = "\xC2\xB0"

 
data structure = string
algorithm
- initialise constanst
  - degree = 60 mins
  - min = 60 secs
  - degree / sec = 60 * 60 
- convert the input degree to seconds
- using divmod, get the whole number of degrees and the remaining seconds
- use divmod again to split the reaminder into minutes and seconds
- format it 
=end

DEGREE = "\xC2\xB0"
MINUTE_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60
SECONDS_PER_DEGREE = MINUTE_PER_DEGREE * SECONDS_PER_MINUTE

def dms(degree_float)
  total_seconds = (degree_float * SECONDS_PER_DEGREE).round
  degrees, remainder = total_seconds.divmod(SECONDS_PER_DEGREE)
  minutes, seconds = remainder.divmod(SECONDS_PER_MINUTE)
  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
end
  

p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
