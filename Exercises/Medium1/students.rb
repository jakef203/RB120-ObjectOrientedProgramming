# Original

# class Student
#   def initialize(name, year)
#     @name = name
#     @year = year
#   end
# end

# class Graduate
#   def initialize(name, year, parking)
#   end
# end

# class Undergraduate
#   def initialize(name, year)
#   end
# end

# Updated

class Student
  def initialize(name, year)
    @name = name
    @year = year
  end
end

class Graduate < Student
  def initialize(name, year, parking)
    super(name, year)
    @parking = parking
  end
end

class Undergraduate < Student
  def initialize(name, year)
    super
  end
  # We can also delete the entire Undergraduate#initialize method; 
  # since it only calls Student#initialize with the same arguments and does nothing else, we can omit it.

end

grad = Graduate.new('Joe', 1999, true)
p grad
under = Undergraduate.new('john', 2005)
p under