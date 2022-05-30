# first problem is to determine hours/minutes
# need both of these to express it in the format
# to get the hours divide by 60, the whole number format will be the hours
# to get the minutes do % 60 that will give the minutes, the left over

def hours_and_minutes(total_minutes)
  hours = total_minutes / 60
  minutes = total_minutes % 60
  [hours, minutes]
end

# next problem is how to handle when the minutes go over days
# this will be hour % 24, this will take out all of the extra hours

def hours_that_day(total_hours)
  total_hours % 24
end

# next just format the time

def format_time(total_minutes)
  time_arr = hours_and_minutes(total_minutes)
  hours = hours_that_day(time_arr[0])
  minutes = time_arr[1]
  formatted_hours = hours <= 9 ? hours.to_s.prepend('0') : hours.to_s
  formatted_minutes = minutes <= 9 ? minutes.to_s.prepend('0') : minutes.to_s
  [formatted_hours, formatted_minutes]
end

def time_of_day(total_minutes)
  "#{format_time(total_minutes)[0]}:#{format_time(total_minutes)[1]}"
end


def time_of_day_alt1(number)
  hours, minutes = number.divmod(60)
  hours = hours % 24
  format('%02d:%02d', hours, minutes)
end
