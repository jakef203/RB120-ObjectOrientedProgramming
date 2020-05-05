
class Dog
  attr_reader :value
  def initialize
    @value = 'dogeeeee'
  end

  def to_s
    @value
  end
end

class Human
  attr_reader :value
  def initialize
    @value = 'huawe'
  end

  def to_s
    @value
  end
end

human = Human.new
dog = Dog.new
arr = [human, dog]

a = (arr.max_by { |x| x.value.length }).to_s
p a
names = arr.map { |x| x.value }
puts names