
WINNING_COMBOS = ['123', '456', '789', '147', '258', '369',
                  '159', '357']

player_moves = '134789'

def player_win?(player_moves)
  WINNING_COMBOS.each do |combo|
    count = 0
    player_moves.each_char do |move|
      count += 1 if combo.include?(move)
      return true if count == 3
    end
  end
  false
end

p player_win?(player_moves)

def add_move(new_move, player_moves)
  player_moves << new_move 
  player_moves.chars.sort!.join
end

p add_move('5', '124789')


