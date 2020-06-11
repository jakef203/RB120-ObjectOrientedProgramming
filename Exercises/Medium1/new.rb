# def func 
#   a = []
#   a << 5
# end

# puts func.is_a?(Array)

# def print_val
#   val = 5 
#   puts val
# end

# puts print_val.is_a?(NilClass)

class Klass
  def func1(ending)
    puts "Hello #{ending}"
  end
end

k = Klass.new

k.send('FUNC1'.downcase, "there")

