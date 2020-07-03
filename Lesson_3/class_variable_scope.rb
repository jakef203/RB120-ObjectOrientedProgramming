
class Person
  @@total_people = 0

  def initialize 
    @@total_people += 1 
  end
  
  def self.total_people 
    @@total_people 
  end

  def total_people 
    @@total_people 
  end 
end

puts Person.total_people
Person.new 
Person.new 
puts Person.total_people

bob = Person.new 
puts bob.total_people 
puts Person.total_people 

joe = Person.new 
puts bob.total_people 
puts joe.total_people 
puts Person.total_people
