
## Tic Tac Toe is a 2-player board game played on a 3x3 grid.  Players take turns
## marking a square.  The first player to mark 3 squares in a row wins.

# Nouns: board, player, square, grid
# Verbs: play, mark

# Board
# Square
# Player 
# - mark
# -play

class Board
  def initialize
    # we need some way to model the 3x3 grid.  Maybe "squares"?
    # what data structure should we use?
    # - array/hash of Square objects?
    # - array/hash of strings or integers?
  end
end

class Square
  def initialize
    # maybe a "status" to keep track of this square's mark?
  end
end

class Player
  def initialize
    # maybe a "marker" to keep track of this player's symbol (ie, 'X' or 'O')
  end

  def mark

  end

end

class TTTGame
  def play
    display_welcome_message
    loop do 
      display_board
      first_player_moves
      break if player_wins? || board_full?
      second_player_moves
      break if player_wins? || board_full?
    end
    display_result
    display_goodbye_message
  end
end

game = TTTGame.new
game.play
