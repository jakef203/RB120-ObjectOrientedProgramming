
# My solution

# class GuessingGame
#   NUMBER_OF_GUESSES = 7
#   def initialize
#     @guesses_left = NUMBER_OF_GUESSES
#     @correct_num = rand(1..100)
#   end

#   def guess_correct?(guess)
#     guess == @correct_num
#   end

#   def play

#     until @guesses_left == 0
#       puts "You have #{@guesses_left} guesses remaining."
#       guess = nil
#       puts "Enter a number between 1 and 100: "
#       loop do
#         guess = gets.chomp.to_i
#         break if (1..100).include?(guess)
#         puts "Invalid guess. Enter a number between 1 and 100: "
#       end
#       break if guess_correct?(guess)
#       display_correction(guess)
#       @guesses_left -= 1
#     end

#     display_ending(guess)
#   end

#   def display_correction(guess)
#     if guess < @correct_num
#       puts "Your guess is too low."
#       puts ""
#     elsif guess > @correct_num 
#       puts "Your guess is too high."
#       puts ""
#     end
#   end

#   def display_ending(guess)
#     if guess_correct?(guess)
#       puts "That's the number!"
#       puts ""
#       puts "You won!"
#     else
#       puts "You have no more guesses. You lost!"
#     end
#   end
# end

# Their solution

class GuessingGame
  MAX_GUESSES = 7
  RANGE = 1..100

  RESULT_OF_GUESS_MESSAGE = {
    high:  "Your number is too high.",
    low:   "Your number is too low.",
    match: "That's the number!"
  }.freeze

  WIN_OR_LOSE = {
    high:  :lose,
    low:   :lose,
    match: :win
  }.freeze

  RESULT_OF_GAME_MESSAGE = {
    win:  "You won!",
    lose: "You have no more guesses. You lost!"
  }.freeze

  def initialize
    @secret_number = nil
  end

  def play
    reset
    game_result = play_game
    display_game_end_message(game_result)
  end

  private

  def reset
    @secret_number = rand(RANGE)
  end

  def play_game
    result = nil
    MAX_GUESSES.downto(1) do |remaining_guesses|
      display_guesses_remaining(remaining_guesses)
      result = check_guess(obtain_one_guess)
      puts RESULT_OF_GUESS_MESSAGE[result]
      break if result == :match
    end
    WIN_OR_LOSE[result]
  end

  def display_guesses_remaining(remaining)
    puts
    if remaining == 1
      puts 'You have 1 guess remaining.'
    else
      puts "You have #{remaining} guesses remaining."
    end
  end

  def obtain_one_guess
    loop do
      print "Enter a number between #{RANGE.first} and #{RANGE.last}: "
      guess = gets.chomp.to_i
      return guess if RANGE.cover?(guess)
      print "Invalid guess. "
    end
  end

  def check_guess(guess_value)
    return :match if guess_value == @secret_number
    return :low if guess_value < @secret_number
    :high
  end

  def display_game_end_message(result)
    puts "", RESULT_OF_GAME_MESSAGE[result]
  end
end

game = GuessingGame.new 
game.play





