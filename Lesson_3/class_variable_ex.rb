
class Shape
  @@sides = nil

  def self.sides
    @@sides
  end

  def sides
    @@sides
  end
end

class Triangle < Shape
  def initialize
    @@sides = 3
  end
end

class Quadrilateral < Shape
  def initialize
    @@sides = 4
  end
end

tri = Triangle.new
p Triangle.sides
p tri.sides
quad = Quadrilateral.new 
p Quadrilateral.sides
p quad.sides 
p Triangle.sides
p tri.sides
