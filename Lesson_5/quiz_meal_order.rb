
# class ValidateAgeError < StandardError; end


# def validate_age(age, num)
#   raise ValidateAgeError, "invalid age" unless (0..105).include?(age)
#   # raise ZeroDivisionError, "divide by zero" unless num != 0
#   5 / 0
# end


# begin
#   validate_age(106, 0)
# rescue ValidateAgeError => e
#   puts e.message              #=> "invalid age"
# rescue ZeroDivisionError => f 
#   puts f.message
# end

# def c_to_f(degrees_c:, h:)
#   ((9.0/5) * degrees_c) + 32 + h
# end

# p c_to_f(degrees_c: 100, h: 10)

class Customer

  attr_reader :order
  def place_order
    @order = Order.new
  end
end

class Order

  attr_reader :burger, :side, :drink
  def initialize
    @burger = Burger.new
    @side = Side.new
    @drink = Drink.new
  end
  
  def meal
    [@burger, @side, @drink]
  end 

  def total
    total_cost = @burger.cost + @side.cost + @drink.cost
    format("$%.2f", total_cost) # #format formats the cost to two decimal places
  end

  def to_s
    meal.map(&:to_s).join(', ')
  end
end

class MealItem
  def initialize
    @option = choose_option
  end
  
  def choose_option
    puts "Please choose a #{self.class} option:"
    choice = nil
    loop do 
      puts item_options
      choice = gets.chomp
      break if self.class::OPTIONS.keys.include?(choice)
      puts "Please choose a valid option."
    end
    choice
  end

  def item_options 
    self.class::OPTIONS.map do |option, details|
      "Option #{option}, #{details[:name]}, cost is #{format("$%.2f", details[:cost])}"
    end
  end


  def cost 
    self.class::OPTIONS[@option][:cost]
  end

  def to_s
    self.class::OPTIONS[@option][:name]
  end
end

class Burger < MealItem

  OPTIONS = {
    '1' => { name: 'LS Burger', cost: 3.00 },
    '2' => { name: 'LS Cheeseburger', cost: 3.50 },
    '3' => { name: 'LS Chicken Burger', cost: 4.50 },
    '4' => { name: 'LS Double Deluxe Burger', cost: 6.00 }
  }
end

class Side < MealItem

  OPTIONS = {
    '1' => { name: 'Fries', cost: 0.99 },
    '2' => { name: 'Onion Rings', cost: 1.50 }
  }
end

class Drink < MealItem

  OPTIONS = {
    '1' => { name: 'Cola', cost: 1.50 },
    '2' => { name: 'Lemonade', cost: 1.50 },
    '3' => { name: 'Vanilla Shake', cost: 2.00 },
    '4' => { name: 'Chocolate Shake', cost: 2.00 },
    '5' => { name: 'Strawberry Shake', cost: 2.00 }
  }
end

c1 = Customer.new
c1.place_order  
puts c1.order
puts c1.order.burger
puts c1.order.burger.cost
puts c1.order.total
# p c1.order.burger
# Drink::OPTIONS.each do |option, details|
#   puts "option is #{option}, details is #{details}"
#   details.each do |label, val|
#     puts "label is #{label}, val is #{val}"
#   end
#   puts ""
# end