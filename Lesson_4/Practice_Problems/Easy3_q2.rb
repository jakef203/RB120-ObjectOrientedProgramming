
class Greeting
  def self.greet(message)
    puts message
  end
  
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end

  def self.tester(message)
    puts "This is a test: #{message}"
  end

  def self.hi 
    tester("Test")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

Hello.hi
