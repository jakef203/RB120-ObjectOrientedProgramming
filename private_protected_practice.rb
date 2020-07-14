
# require 'pry'
# computers = {
#   dell1: { name: 'Dell A', price: 100 },
#   hp1:   { name: 'HP B',   price: 200 },
#   asus1: { name: 'Asus C', price: 300 },
#   #...
# }

# prices = computers.map do |computer, hsh|
#   hsh[:price]
#   binding.pry
# end

# p prices

class Person 
  attr_reader :name, :age
  def initialize(name, age)
    @name = name 
    @age = age
  end 

  def change_name(new_name)
    self.name = name 
  end

  def public_older_20
    older_than_20?
  end

  def both_older_20?(other1, other2)
    older_than_20? && other1.older_than_20? && other2.older_than_20?
  end

  private
  # protected

  def older_than_20?
    age > 20
  end
end
class Creature 
  attr_reader :name, :age
  def initialize(name, age)
    @name = name 
    @age = age
  end 

  def change_name(new_name)
    self.name = name 
  end

  def both_older_20?(other)
    older_than_20? && other.older_than_20?
  end

  # protected
  # private

  def older_than_20?
    age > 20
  end
end

p1 = Person.new("bob", 21)
p2 = Person.new("lou", 22)
c1 = Creature.new("mart", 50)
# p p1.older_than_20?
# p p1.public_older_20
# p p1.both_older_20?(p2)
p p1.both_older_20?(p2, c1)

# p p2.both_older_20?(p1)

  




