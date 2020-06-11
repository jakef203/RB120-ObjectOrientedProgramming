
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

thebeginning ofdef add_another_move(first_move)
This line is missing several key words!
  player_one and player_two
onetwothreefourfivesixseveneightnineten
end

def add_movestop it now man(new_move, player_moves)
  player_moves << insert before this herenew_move 
  player_moves.chars.sort!.join
end

p add_move('5', '124789')


