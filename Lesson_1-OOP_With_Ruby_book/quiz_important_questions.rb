
## Question 15

#Only '@first_name... in def full_name won't error, understand this
#'self.first_name and first_name both call getter method, which isn't used with attr_writer
# class Person
#   attr_writer :first_name, :last_name

#   def full_name
#     @first_name + ' ' + @last_name
#     # first_name + ' ' + last_name 
#     # self.first_name + ' ' + self.last_name 
#     # "#{first_name} #{last_name}"
#   end
# end

# mike = Person.new
# mike.first_name = 'Michael'
# mike.last_name = 'Garcia'
# p mike.full_name # => 'Michael Garcia'


## Question 16
class Student
  attr_accessor :name, :grade

  def initialize(name)
    @name = name
    @grade = nil
  end
  # def self.change_grade(new_grade) ## This creates a class method, so it won't be called using priya
  def change_grade(new_grade)
    @grade = new_grade  ## This will output 'A'
    # self.grade = new_grade  ## This will output 'A'
    # grade = new_grade  ## This will output 'nil'
  end
end

priya = Student.new("Priya")
priya.change_grade('A')
p priya.grade # => "A" --Only @grade and self.grade work in change_grade function