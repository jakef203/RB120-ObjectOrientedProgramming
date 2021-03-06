
class Player
  attr_accessor :move, :name
  
  def initialize(player_type = :human)
    @player_type = player_type
    @move = nil
    # @name = nil
    set_name  ## They use set_name when initializing human and computer objects
  end

  ## They use set_name as instance function in Player
  def set_name
    if human?
      n = nil
      loop do 
        puts "What's your name?"
        n = gets.chomp
        break unless n.empty?
        puts "You must enter a name: " 
      end
      self.name = n  
    else
      self.name = ['R2D2', 'Wallie', 'C3PO', 'Chappie', 'Eva'].sample
    end
  end

  def choose
    if human?
      choice = nil
      loop do
        puts "#{name}, please choose rock, paper, or scissors."
        choice = gets.chomp
        break if ['rock', 'paper', 'scissors'].include?(choice)
        puts "Sorry, invalid choice."
      end
      self.move = choice
    else
      self.move = ['rock', 'paper', 'scissors'].sample
    end
  end

  def human?
    @player_type == :human
  end
end

class RPSGame
  attr_accessor :human, :computer
  def initialize
    @human = Player.new
    @computer = Player.new(:computer)
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors!"
  end

  # def set_player_names  ## I set name as part of RPS
  #   puts "Please enter your name: "
  #   n = nil
  #   loop do 
  #     n = gets.chomp
  #     break unless n.empty?
  #     puts "You must enter a name: " 
  #   end
  #   human.name = n  
  #   computer.name = ['R2D2', 'Wallie', 'C3PO', 'Chappie', 'Eva'].sample
  # end

  def display_winner
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."

    case human.move
    when 'rock'
      puts "It's a tie!" if computer.move == 'rock'
      puts "#{human.name} wins!"    if computer.move == 'scissors'
      puts "#{computer.name} wins!" if computer.move == 'paper'
    when 'scissors'
      puts "It's a tie!" if computer.move == 'scissors'
      puts "#{human.name} win!"    if computer.move == 'paper'
      puts "#{computer.name} wins!" if computer.move == 'rock'
    when 'paper'
      puts "It's a tie!" if computer.move == 'paper'
      puts "#{human.name} win!"    if computer.move == 'rock'
      puts "#{computer.name} wins!" if computer.move == 'scissors'
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
    # set_player_names  ## I used set_player_names as an instance function from RPS class
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