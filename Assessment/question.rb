
class Person
  @@total_people = 0
  attr_accessor :name, :weight, :height

  def initialize(name, weight, height)
    @name = name
    @weight = weight
    @height = height
    @@total_people += 1
  end

  def self.total_people
    @@total_people
  end

  def change_info(name, weight, height)
    self.name = name
    self.weight = weight
    self.height = height
  end
end

bob = Person.new('bob', 175, 58)
puts bob.weight
bob.change_info('lou', 190, 44)
puts bob.name