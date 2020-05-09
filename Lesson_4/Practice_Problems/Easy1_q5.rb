
class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

apple = Fruit.new('apple')
pep = Pizza.new('pepper')
p apple.instance_variables
p pep.instance_variables