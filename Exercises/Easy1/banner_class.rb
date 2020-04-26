
#Original problem solution
class Banner
  def initialize(message)
    @message = message
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def empty_line
    "| #{' ' * (@message.size)} |"
  end

  def horizontal_rule
    "+-#{'-' * (@message.size)}-+"
  end

  def message_line
    "| #{@message} |"
  end
end

#Bonus solution

class Banner
  def initialize(message, banner_width = nil)
    @message = message
    @length = message.length
    @banner_width = banner_width
    if @banner_width && @banner_width < @length
      loop do
        puts "Banner width must be longer than or equal to message length."
        puts "Please enter a number >= #{@length}."
        @banner_width = gets.chomp.to_i
        break if @banner_width >= @length
      end
    end
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  attr_reader :message, :length, :banner_width


  def horizontal_rule
    banner_width ? "+-#{'-' * banner_width}-+" : "+-#{'-' * length}-+"
  end

  def empty_line
    banner_width ? "| #{' ' * banner_width} |" : "| #{' ' * length} |"
  end

  def message_line
    banner_width ? "| #{message.center(banner_width)} |" : "| #{message} |"
  end
end

banner1 = Banner.new("To boldy go where no one has gone before.", 20)
puts banner1
banner2 = Banner.new('', 50)
puts banner2

