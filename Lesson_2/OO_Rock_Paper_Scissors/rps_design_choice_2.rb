
class Move
  VALUES = ['rock', 'paper', 'scissors']
  attr_reader :value

  def initialize(value)
    @value = value
  end

  # def scissors?
  #   @value == 'scissors'
  # end

  # def rock?
  #   @value == 'rock'
  # end

  # def paper?
  #   @paper == 'paper'
  # end

  def >(other_move)
    case value
    when 'rock' #rock? 
      return true if other_move.value == 'scissors'
      # return true if other_move.scissors? 
      return false
    when 'scissors' #scissors?
      return true if other_move.value == 'paper'
      # return true if other_move.paper?
      return false
    when 'paper' #paper?
      return true if other_move.value == 'rock'
      # return true if other_move.rock?
      return false
    end
  end

  def <(other_move)
    case value
    when 'rock' #rock? 
      return true if other_move.value == 'paper'
      # return true if other_move.paper? 
      return false
    when 'scissors' #scissors?
      return true if other_move.value == 'rock'
      # return true if other_move.rock?
      return false
    when 'paper' #paper?
      return true if other_move.value == 'scissors'
      # return true if other_move.scissors?
      return false
    end
  end
end

class Player
  attr_accessor :move, :name
  
  def initialize
    set_name
  end
end

class Human < Player 
  def set_name
    n = nil
    loop do 
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "You must enter a name: " 
    end
    self.name = n 
  end

  def choose 
    choice = nil
    loop do
      puts "#{name}, please choose rock, paper, or scissors."
      choice = gets.chomp
      break if Move::VALUES.include?(choice)
      puts "Sorry, invalid choice."
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player 
  def set_name 
    self.name = ['R2D2', 'Wallie', 'C3PO', 'Chappie', 'Eva'].sample
  end

  def choose 
    self.move = Move.new(Move::VALUES.sample)
  end
end

class RPSGame
  attr_accessor :human, :computer
  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors!"
  end

  def display_winner
    puts "#{human.name} chose #{human.move.value}."
    puts "#{computer.name} chose #{computer.move.value}."

    if human.move > computer.move
      puts "#{human.name} wins!"
    elsif human.move < computer.move
    # elsif computer.move > human.move
      puts "#{computer.name} wins!"
    else
      puts "It's a tie!"
    end
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors.  Good bye!"
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (Y/N)"
      answer = gets.chomp
      break if ['y', 'n'].include?(answer)
      puts "Invalid answer.  Please enter y or n."
    end
    return true if answer == 'y'
    return false
  end

  def play 
    display_welcome_message
    loop do
      human.choose 
      computer.choose 
      display_winner 
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play