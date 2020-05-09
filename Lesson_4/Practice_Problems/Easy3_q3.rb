
class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end

cat1 = AngryCat.new(23, "bob")
cat2 = AngryCat.new(4, "bebe")
p cat1.instance_variables
p cat2.instance_variable_get("@age")
