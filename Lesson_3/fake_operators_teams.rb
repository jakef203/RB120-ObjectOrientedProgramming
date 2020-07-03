
class Person
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def >(other_person)
    age > other_person.age
  end

  def to_s
    "#{name}, #{age} years old"
  end
end

class Team
  attr_accessor :name, :members
  def initialize(name)
    @name = name
    @members = []
  end

  def <<(person)
    members.push person
  end

  def +(other_team, new_team_name = "Temporary Team")
    temp_team = Team.new(new_team_name)
    temp_team.members = members + other_team.members
    temp_team
  end

  def [](idx)
    members[idx]
  end

  def []=(idx, obj)
    members[idx] = obj
  end

  def display_team
    puts "-------------"
    puts "#{name}"
    puts "-------------"
    members.map(&:to_s).each { |member|  puts member }
    puts ""
  end

end

cowboys = Team.new("Dallas Cowboys")
cowboys << Person.new("Troy Aikman", 48)
cowboys << Person.new("Emmitt Smith", 46)
cowboys << Person.new("Michael Irvin", 49)
# cowboys.display_team
# puts cowboys.[](0)
# puts cowboys[0]
puts cowboys.members
cowboys[2] = Person.new("Jerry Jones", 55)
puts cowboys.members


niners = Team.new("San Francisco 49ers")
niners << Person.new("Joe Montana", 59)
niners << Person.new("Jerry Rice", 52)
niners << Person.new("Deion Sanders", 47)
# niners.display_team
dream_team = cowboys + niners
# dream_team = cowboys.+(niners, "Dream TEam") #+ "Dream Team"
# dream_team.display_team

dream_team.name = "Dream Team"
# dream_team.display_team

# p dream_team[4]
dream_team[] = Person.new("JJ", 72)

puts dream_team.inspect