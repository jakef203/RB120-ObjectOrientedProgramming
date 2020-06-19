
# class Person 
#   attr_accessor :first_name, :last_name
#   def initialize(first_name, last_name = '')
#     @first_name = first_name 
#     @last_name = last_name 
#   end 

#   def name 
#     @last_name == '' ? @first_name : "#{@first_name} #{@last_name}"
#   end

# end

class Person 
  attr_accessor :first_name, :last_name
  def initialize(name)
    parts = name.split
    @first_name = parts.first 
    @last_name = parts.size > 1 ? parts.last : ''
  end 

  def name 
    "#{first_name} #{last_name}".strip
  end

  def name=(name)
    parts = name.split
    self.first_name = parts.first 
    self.last_name = parts.split > 1 ? parts.last : ''
  end

  def to_s 
    name 
  end

end


bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')
# p rob.name == bob.name
puts "The person's name is: #{bob}"
# p bob.name                  # => 'Robert'
# p bob.first_name            # => 'Robert'
# p bob.last_name             # => ''
# bob.last_name = 'Smith'
# p bob.name                  