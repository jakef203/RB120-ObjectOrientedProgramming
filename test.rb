
# class ValidateAgeError < StandardError; end


# def validate_age(age, num)
#   raise ValidateAgeError, "invalid age" unless (0..105).include?(age)
#   # raise ZeroDivisionError, "divide by zero" unless num != 0
#   5 / 0
# end


# begin
#   validate_age(106, 0)
# rescue ValidateAgeError => e
#   puts e.message              #=> "invalid age"
# rescue ZeroDivisionError => f 
#   puts f.message
# end

# def c_to_f(degrees_c:, h:)
#   ((9.0/5) * degrees_c) + 32 + h
# end

# p c_to_f(degrees_c: 100, h: 10)

