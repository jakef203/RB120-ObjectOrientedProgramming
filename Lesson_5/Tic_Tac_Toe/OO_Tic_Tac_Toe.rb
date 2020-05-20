
require 'io/console'
class Board
  INITIAL_MARKER = ' '
  BOARD_BUFFER = 10

  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                  [[3, 5, 7], [1, 5, 9]] # diagonals

  attr_accessor :spaces
  def initialize
    reset
  end

  def reset
    @spaces = ['_'] + [INITIAL_MARKER] * 9
  end

  # rubocop: disable Metrics/AbcSize, Metrics/MethodLength
  def draw(buffer = BOARD_BUFFER)
    buffer = ' ' * buffer
    puts ""
    puts "#{'Main'.center(17)}#{buffer}#{'Key'.center(17)}"
    puts ""
    puts "     |     |     #{buffer}     |     |     "
    puts "  #{self[1]}  |  #{self[2]}  |  #{self[3]}  #{buffer}" \
         "  1  |  2  |  3  "
    puts "     |     |     #{buffer}     |     |     "
    puts "-----+-----+-----#{buffer}-----+-----+-----"
    puts "     |     |     #{buffer}     |     |     "
    puts "  #{self[4]}  |  #{self[5]}  |  #{self[6]}  #{buffer}" \
         "  4  |  5  |  6  "
    puts "     |     |     #{buffer}     |     |     "
    puts "-----+-----+-----#{buffer}-----+-----+-----"
    puts "     |     |     #{buffer}     |     |     "
    puts "  #{self[7]}  |  #{self[8]}  |  #{self[9]}  #{buffer}" \
         "  7  |  8  |  9  "
    puts "     |     |     #{buffer}     |     |     "
  end
  # rubocop: enable Metrics/AbcSize, Metrics/MethodLength

  def [](index)
    spaces[index]
  end

  def []=(space_number, marker)
    spaces[space_number] = marker
  end

  def empty_spaces
    empty_spaces_arr = []
    spaces.each_with_index do |space, idx|
      empty_spaces_arr << idx.to_s if space == INITIAL_MARKER
    end
    empty_spaces_arr
  end

  def joinor(array, delimiter = ', ', ending = 'or')
    if array.size == 1
      array[0]
    elsif array.size == 2
      "#{array[0]} #{ending} #{array[1]}"
    elsif array.size > 2
      "#{array[0..-2].join(delimiter)}#{delimiter[0]} #{ending} #{array[-1]}"
    end
  end

  def space_marked?(space)
    space != INITIAL_MARKER
  end

  def full?
    empty_spaces.empty?
  end
end

class Player
  attr_accessor :score
  attr_reader :marker, :name

  def mark_board(board, space)
    board[space] = marker
  end

  def win?(board)
    Board::WINNING_LINES.each do |line|
      if values_per_line(board, marker, line) == 3
        return true
      end
    end
    false
  end

  def values_per_line(board, marker, line)
    board.spaces.values_at(*line).count(marker)
  end
end

class Human < Player
  def initialize
    set_name
    set_marker
    @score = 0
  end

  def set_name
    n = nil
    loop do
      puts "What is your name?"
      n = gets.chomp
      break if n =~ /\w/ && n !~ /\s/
      puts "Invalid name.  Please enter only alphanumeric " \
           "characters and no whitespace."
    end
    @name = n
  end

  def set_marker
    choice = nil
    loop do
      puts "Choose a marker: 'X' or 'O'."
      choice = gets.chomp.upcase
      break if ['X', 'O'].include?(choice)
      puts "Invalid choice."
    end
    @marker = choice
  end

  def moves(board)
    choice = nil
    loop do
      puts "Choose a space: #{board.joinor(board.empty_spaces)}."
      choice = gets.chomp
      break if board.empty_spaces.include?(choice)
      puts "Invalid choice.  Please enter an available space."
    end
    mark_board(board, choice.to_i)
  end
end

class Computer < Player
  attr_reader :opponent_marker

  def initialize(opponent_marker)
    @name = ['R2D2', 'C3PO', 'Wallie', 'Eva', 'Johnny 5'].sample
    @marker, @opponent_marker = opponent_marker == 'X' ? ['O', 'X'] : ['X', 'O']
    @score = 0
  end

  # rubocop: disable Metrics/MethodLength
  def moves(board)
    choice =
      if winning_move?(board)
        winning_move?(board)
      elsif block_player?(board)
        block_player?(board)
      elsif board[5] == Board::INITIAL_MARKER
        5
      else
        board.empty_spaces.sample
      end
    mark_board(board, choice.to_i)
  end
  # rubocop: enable Metrics/MethodLength

  def winning_move?(board)
    Board::WINNING_LINES.each do |line|
      if values_per_line(board, marker, line) == 2 &&
         values_per_line(board, Board::INITIAL_MARKER, line) == 1
        line.each do |pos|
          return pos if board[pos] == Board::INITIAL_MARKER
        end
      end
    end
    false
  end

  def block_player?(board)
    Board::WINNING_LINES.each do |line|
      if values_per_line(board, opponent_marker, line) == 2 &&
         values_per_line(board, Board::INITIAL_MARKER, line) == 1
        line.each do |pos|
          return pos if board[pos] == Board::INITIAL_MARKER
        end
      end
    end
    false
  end
end

class TTTGame
  SCORE_TO_WIN = 5
  GO_FIRST = 'choose' # can also set this to 'human' or 'computer'
  attr_accessor :current_player, :first_move
  attr_reader :board, :human, :computer
  def initialize
    @board = Board.new
    @current_player = GO_FIRST
    @winner = nil
    @first_move = nil
  end

  def clear
    system('clear')
  end

  def continue_game
    puts "(Press any button to continue)"
    STDIN.getch
    print "              \r"
  end

  def display_beginning_sequence
    clear
    puts "Welcome to Tic Tac Toe!"
    configure_settings
    puts "#{current_player.name} will go first."
    puts "First to win #{SCORE_TO_WIN} games will be the grand winner!"
    continue_game
    clear
  end

  def configure_settings
    @human = Human.new
    @computer = Computer.new(human.marker)
    if current_player == 'choose'
      choice = who_goes_first?
      self.current_player = choice == '1' ? human : computer
    else
      self.current_player = GO_FIRST == 'human' ? human : computer
    end
    self.first_move = current_player
  end

  def who_goes_first?
    puts "Who will go first, #{human.name} or #{computer.name}?"
    loop do
      puts "Enter '1' for #{human.name}, '2' for #{computer.name}."
      choice = gets.chomp
      return choice if ['1', '2'].include?(choice)
      puts "Invalid entry."
    end
  end

  def clear_and_display_layout
    clear
    display_header
    board.draw
  end

  def display_layout
    display_header
    board.draw
  end

  def display_header
    puts "The score is #{human.name}: #{human.score}, " \
         "#{computer.name}: #{computer.score}"
    puts "#{human.name} is a #{human.marker}. " \
         "#{computer.name} is a #{computer.marker}."
  end

  def alternate_player
    self.current_player = current_player == human ? computer : human
  end

  def display_result
    # current_player.score += 1 if current_player.win?(board)
    clear_and_display_layout
    if current_player.win?(board) # board.someone_win?
      puts "#{current_player.name} is the winner!"
      current_player.score += 1
    else
      puts "It's a tie!"
    end
  end

  def grand_winner?
    human.score == SCORE_TO_WIN || computer.score == SCORE_TO_WIN
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include?(answer)
      puts "Sorry, must be a y or n"
    end
    reset(full_reset: true) if answer == 'y'
    answer == 'y'
  end

  def reset(full_reset = false)
    board.reset
    self.current_player = first_move
    if full_reset
      score_reset
      display_play_again_message
    else
      continue_game
      clear
    end
  end

  def score_reset
    human.score = 0
    computer.score = 0
  end

  def display_play_again_message
    clear
    puts "Let's play again!"
    puts ""
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe!  Goodbye!"
  end

  # rubocop: disable Metrics/MethodLength, Metrics/AbcSize
  def play
    display_beginning_sequence
    loop do
      loop do
        display_layout
        loop do
          current_player.moves(board)
          break if current_player.win?(board) || board.full?
          alternate_player
          clear_and_display_layout
        end
        display_result
        break if grand_winner?
        reset
      end
      puts "#{current_player.name} is the Grand Winner!!"
      break unless play_again?
    end
    display_goodbye_message
  end
end
# rubocop: enable Metrics/MethodLength, Metrics/AbcSize

game = TTTGame.new
game.play
