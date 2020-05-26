
class Player

  def initialize
  end

  def hit
  end

  def stay
  end

  def busted?
  end

  def total
  end

class Dealer
  def initialize
  end
  
  def deal 
    # does the dealer or the deck deal?
  end

  def hit
  end

  def stay
  end

  def busted?
  end

  def total
  end
end

class Deck
  def initialize
    # obviously, we need some data structure to keep track of cards
    # array, hash, something else?
  end

  def deal
    # does the dealer or the deck deal?
  end
end

class Card
  def initialize
    # what are the "states" of a card?
  end
end

class Game
  def start
    # what's the sequence of steps to execute the game play?
  end
end

Game.new.start