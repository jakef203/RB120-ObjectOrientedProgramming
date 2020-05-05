require 'io/console'

class Move

  attr_reader :value, :moves_beat_by

  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def spock?
    @value == 'spock'
  end
  
  def lizard?
    @value == 'lizard'
  end
  
  def >(other_move)
    other_move.moves_beat_by.include?(value)
  end

  def to_s
    @value
  end
end

class Rock < Move
  def initialize
    super('rock')
    @moves_beat_by = ['paper', 'spock']
  end
end

class Paper < Move
  def initialize
    super('paper')
    @moves_beat_by = ['scissors', 'lizard']
  end
end

class Scissors < Move
  def initialize
    super('scissors')
    @moves_beat_by = ['rock', 'spock']
  end
end

class Lizard < Move
  def initialize
    super('lizard')
    @moves_beat_by = ['rock', 'scissors']
  end
end

class Spock < Move
  def initialize
    super('spock')
    @moves_beat_by = ['paper', 'lizard']
  end
end



class Player
  MOVE_VALUES = { 'r' => Rock,
  'p' => Paper, 
  'sc' => Scissors,
  'sp' => Spock,
  'l'  => Lizard }
  attr_accessor :move, :name, :score
  def initialize
    @score = 0
    set_name
  end
end

class Human < Player
  def set_name
    n = nil
    print "What's your name? "
    loop do
      n = gets.chomp
      break unless n.empty?
      print "You must enter a name: "
    end
    self.name = n
  end

  def display_choices
    message = <<-MSG
Please choose one of the following:
    'r' for rock
    'p' for paper
    'sc' for scissors
    'sp' for spock
    'l' for lizard
    MSG
    puts message
  end

  def choose(game)

    choice = nil
    loop do
      display_choices
      choice = gets.chomp
      break if MOVE_VALUES.keys.include?(choice)
      game.display_score
      puts "Sorry, invalid choice."
    end
    game.display_score
    self.move = Player::MOVE_VALUES[choice].new
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Wallie', 'C3PO', 'Chappie', 'Eva'].sample
  end

  def choose
    self.move = Player::MOVE_VALUES.values.sample.new
  end
end

class RPSGame
  SCORE_TO_WIN = 3

  attr_accessor :human, :computer
  def initialize
    clear
    @human = Human.new
    @computer = Computer.new
  end

  def clear
    system('clear') # system('cls')
  end

  def continue_game
    puts "(Press any button to continue)"
    STDIN.getch
    print "              \r"
  end

  def display_welcome_message
    clear
    puts "Welcome to Rock, Paper, Scissors, Spock, Lizard!"
    puts "First to win #{SCORE_TO_WIN} games will be the grand winner!"
  end

  def display_score
    clear
    puts "The score is #{human.name} -  #{human.score} : " \
         "#{computer.name} - #{computer.score}"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def win?(player1, player2)
    player1.move > player2.move
  end
  
  def display_game_winner
    if win?(human, computer)
      puts "#{human.name} wins!"
    elsif win?(computer, human)
      puts "#{computer.name} wins!"
    else
      puts "It's a tie!"
    end
  end

  def update_score
    if win?(human, computer)
      human.score += 1
    elsif win?(computer, human)
      computer.score += 1
    end
  end

  def grand_winner?
    human.score == SCORE_TO_WIN || computer.score == SCORE_TO_WIN
  end

  def display_grand_winner
    if human.score == SCORE_TO_WIN
      puts "#{human.name} is the first to #{SCORE_TO_WIN} games!"
    else
      puts "#{computer.name} is the first to #{SCORE_TO_WIN} games!"
    end
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors, Spock, Lizard.  Good bye!"
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (Y/N)"
      answer = gets.chomp
      break if ['y', 'n'].include?(answer)
      puts "Invalid answer.  Please enter y or n."
    end
    if answer == 'y'
      human.score = 0
      computer.score = 0
      true
    else
      false
    end
  end
  
  def play_single_game
    display_score
    human.choose(self)
    computer.choose
    update_score
  end

  def display_final_results
    display_score
    display_moves
    display_game_winner
    display_grand_winner
  end

  def play
    display_welcome_message
    continue_game
    loop do
      loop do
        play_single_game
        break if grand_winner?
        display_moves
        display_game_winner
        continue_game
      end
      display_final_results
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
# current_game.play
