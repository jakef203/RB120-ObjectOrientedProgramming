
module Describable
  def describe_shape
    "I am a #{self.class} and have #{SIDES} sides." # changing from SIDES to #{self.class::SIDES} will make line 28 work
  end
end

class Shape
  include Describable

  def self.sides
    self::SIDES # changing this to self::SIDES will make line 26 work
  end
end

class Quadrilateral < Shape
  SIDES = 4

  # def sides  # Adding these three lines is related to L27 below
  #   SIDES 
  # end
end

class Square < Quadrilateral; end

p Square.sides # => 4
# p Square.new.sides # => 4
# p Square.new.describe_shape # => "I am a Square and have 4 sides."