
class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("bye")
  end
end

Hello.new.hi
bae = Goodbye.new
bae.bye

