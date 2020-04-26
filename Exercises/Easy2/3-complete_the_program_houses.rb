
class House
  include Comparable
  attr_reader :price

  def initialize(price)
    @price = price
  end

  def <=>(other)
    price <=> other.price
  end

  def to_s
    "House cost: #{price}"
  end
end

home1 = House.new(150_000)
home2 = House.new(100_000)
home3 = House.new(170_000)
puts "Home 2 is cheaper" if home2 < home1
puts "Home 1 is more expensive" if home1 > home2
p home1.between?(home2, home3)
puts [home1, home2, home3].sort