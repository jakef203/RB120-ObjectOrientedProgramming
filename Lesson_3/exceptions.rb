
# begin
#   a = 1 / 0
#   # code at risk of failing here
# rescue StandardError => e   # storing the exception object in e
#   puts e.message            # output error message
#   puts e.backtrace
#   puts e.class
# end

def validate_age(age)
  raise TypeError.new("invalid age") unless (0..105).include?(age)
end

validate_age(200)
