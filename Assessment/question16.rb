
module Full_time
  def take_vacation(days_taken)
    @vacation_days -= days_taken 
  end
end


class Employee 
  attr_accessor :vacation_days
  def initialize(name, serial_num)
    @name = name
    @serial_num = serial_num
  end

  def to_s 
    "Name: #{@name}\n" \
    "Type: #{self.class}\n" \
    "Serial number: #{@serial_num}\n" \
    "Vacation days: #{@vacation_days}\n" \
    "Desk: #{@desk_location}"
  end
end

class Part_time < Employee
  def initialize(name, serial_num)
    super(name, serial_num)
    @vacation_days = 0
    @desk_location = "open workspace"
  end
end

class Executive < Employee 
  include Full_time
  
  def initialize(name, serial_num)
    super(name, serial_num)
    @vacation_days = 20
    @desk_location = "corner office"
  end

  def delegate 
    puts "Delegate work"
  end
end

class Manager < Employee
  include Full_time

  def initialize(name, serial_num)
    super(name, serial_num)
    @vacation_days = 14
    @desk_location = "private office"
  end
    
  def delegate
    puts "Delegate work"
  end
end

class Regular < Employee 
  include Full_time

  def initialize(name, serial_num)
    super(name, serial_num)
    @vacation_days = 10
    @desk_location = "cubicle farm"
  end
end

man = Manager.new("Dave", '1234')
exe = Executive.new("Excel", '14532')
reg = Regular.new("Regis", '53263')
pt = Part_time.new("Philip", '235235')

puts reg
reg.take_vacation(5)
puts reg.vacation_days