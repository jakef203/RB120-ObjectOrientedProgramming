
module Mailable
  def print_address
    puts "#{name}"
    puts "#{address}"
    puts "#{city}, #{state} #{zipcode}"
  end
end

class Customer
  include Mailable
  attr_reader :name, :address, :city, :state, :zipcode
  def initialize(name, address, city, state, zipcode)
    @name = name
    @address = address 
    @city = city 
    @state = state
    @zipcode = zipcode
  end
end

class Employee
  include Mailable
  attr_reader :name, :address, :city, :state, :zipcode
  def initialize(name, address, city, state, zipcode)
    @name = name
    @address = address 
    @city = city 
    @state = state
    @zipcode = zipcode
  end
end

betty = Customer.new("Betty", '905 honey', 'crowley', 'tx', '636387')
bob = Employee.new("Bob", '2345', 'southern', 'nh', '736')
betty.print_address
bob.print_address