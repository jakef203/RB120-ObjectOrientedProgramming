require 'io/console'

class Move
  MOVE_VALUES = { 'r' => 'rock',
                  'p' => 'paper',
                  'sc' => 'scissors',
                  'sp' => 'spock',
                  'l'  => 'lizard' }
  WHAT_BEATS_WHAT = { 'rock' => ['scissors', 'lizard'],
                      'paper' => ['spock', 'rock'],
                      'scissors' => ['lizard', 'paper'],
                      'spock' => ['rock', 'scissors'],
                      'lizard' => ['paper', 'spock'] }
  attr_reader :value

  def initialize(val)
    @value = val
  end

  def >(other_move)
    WHAT_BEATS_WHAT[value].include?(other_move.value)
  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :move, :name, :score, :move_history
  def initialize
    @move_history = { 'rock' => 0,
                      'paper' => 0,
                      'scissors' => 0,
                      'spock' => 0,
                      'lizard' => 0 }
    @score = 0
    set_name
  end

  def to_s
    @name
  end
end

class Human < Player
  def set_name
    n = nil
    print "What's your name? "
    loop do
      n = gets.chomp
      break if n !~ /\s/ && n =~ /\w/
      print "You must enter a valid name " \
            "(must have a letter or digit, no spaces): "
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
      choice = gets.chomp.downcase
      break if Move::MOVE_VALUES.keys.include?(choice)
      game.display_score
      puts "Sorry, invalid choice."
    end
    game.display_score
    update_move(choice)
  end

  def update_move(choice)
    final_move = Move::MOVE_VALUES[choice]
    self.move = Move.new(final_move)
    move_history[final_move] += 1
  end
end

class Computer < Player
  COMPUTER_MOVES = { 'R2D2' => { 'rock' => 5, 'scissors' => 5 },
                     'Wallie' => { 'paper' => 3, 'spock' => 3, 'lizard' => 3 },
                     'C3PO' => { 'paper' => 10 },
                     'Chappie' => { 'spock' => 7, 'lizard' => 3 },
                     'Eva' => { 'lizard' => 10 } }

  def set_name
    self.name = ['R2D2', 'Wallie', 'C3PO', 'Chappie', 'Eva'].sample
  end

  def choose
    possible_moves = []
    COMPUTER_MOVES[name].each do |move, counts|
      counts.times { possible_moves << move }
    end
    update_move(possible_moves)
  end

  def update_move(possible_moves)
    final_move = possible_moves.sample
    self.move = Move.new(final_move)
    move_history[final_move] += 1
  end
end

class RPSGame
  SCORE_TO_WIN = 10

  attr_accessor :human, :computer
  def initialize
    clear
    @human = Human.new
    @computer = Computer.new
  end

  def clear
    system('clear')
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
    continue_game
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

  def calculate_winner
    if human.move > computer.move
      human
    elsif computer.move > human.move
      computer
    else
      "tie"
    end
  end

  def show_move_history?
    puts "Display move history?"
    puts "(Y to display, any other key to continue)"
    answer = gets.chomp.downcase
    answer == 'y'
  end

  def display_game_winner(winner)
    case winner
    when human
      puts "#{human.name} wins!"
    when computer
      puts "#{computer.name} wins!"
    else
      puts "It's a tie!"
    end
    puts
    calculate_move_history unless grand_winner? || !show_move_history?
  end

  def calculate_move_history
    length = [human.name, computer.name].max_by(&:length).length + 6
    [human, computer].each do |player|
      move_list = []
      player.move_history.each do |move, count|
        move_list << "#{move}: #{count}"
      end
      display_move_history(player, move_list, length)
    end
    continue_game
  end

  def display_move_history(player, move_list, length)
    puts "#{player.name} moves".ljust(length) +
         " - #{move_list.join(', ')}"
  end

  def update_score(winner)
    return unless [human, computer].include?(winner)
    winner.score += 1
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
      answer = gets.chomp.downcase
      break if ['y', 'n'].include?(answer)
      puts "Invalid answer.  Please enter y or n."
    end
    reset_score
    answer == 'y'
  end

  def reset_score
    human.score = 0
    computer.score = 0
  end

  def play_individual_games
    loop do
      display_score
      human.choose(self)
      computer.choose
      update_score(calculate_winner)
      return if grand_winner?
      display_moves
      display_game_winner(calculate_winner)
    end
  end

  def display_final_results
    display_score
    display_moves
    display_game_winner(calculate_winner)
    display_grand_winner
  end

  def play
    display_welcome_message
    loop do
      play_individual_games
      display_final_results
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
