# This will order cards based on suit and rank
# This uses a <rank_value> and <suit_value> instance method, still trying to figure out how
# to do this, <=> method not working
require 'pry'
class Card 
  include Comparable
  attr_reader :rank, :suit

  RANK_VALUES = { 'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14 } # used in their solution
  SUIT_VALUES = { 'Diamonds' => 1, 'Clubs' => 2, 'Hearts' => 3, 'Spades' => 4 }
  def initialize(rank, suit)
    @rank = rank 
    @suit = suit
  end 

  def rank_value 
    RANK_VALUES.fetch(rank, rank)
  end

  def suit_value 
    SUIT_VALUES.fetch(suit)
  end

  def <=>(other) 
    binding.pry
    self <=> other 
  end

  def <(other)
    return true if rank_value < other.rank_value 
    if rank_value == other.rank_value
      return true if suit_value < other.suit_value
    end
    false
  end

  def <=(other)
    self < other || self == other 
  end

  def >(other)
    return true if rank_value > other.rank_value 
    if rank_value == other.rank_value
      return true if suit_value > other.suit_value
    end
    false
  end

  def >=(other)
    self > other || self == other 
  end

  def ==(other)
    rank_value == other.rank_value && suit_value == other.suit_value 
  end

  def to_s 
    "#{rank} of #{suit}"
  end
end

c1 = Card.new(8, 'Spades')
c2 = Card.new(4, 'Spades')
# c2 = Card.new(10, 'Diamonds')
# c3 = Card.new(2, 'Clubs')
# c4 = Card.new(2, 'Hearts')
# c5 = Card.new(2, 'Diamonds')
# c6 = Card.new(4, 'Hearts')
# puts c1 < c3
# puts c2 > c1
# puts c3 > c1
# puts c1 <= c5
# puts c1 > c3

cards = [c1, c2]
puts cards.min 
# puts cards.max
# cards = [Card.new(2, 'Hearts'),
#          Card.new(10, 'Diamonds'),
#          Card.new('Ace', 'Clubs')]
# puts cards
# puts cards.min == Card.new(2, 'Hearts')
# puts cards.min == c1
# puts cards.min == c4
# puts cards.min.equal?(c1)
# puts cards.min.equal?(c4)
# puts cards.max == Card.new('Ace', 'Clubs')

# cards = [Card.new(5, 'Hearts')]
# puts cards.min == Card.new(5, 'Hearts')
# puts cards.max == Card.new(5, 'Hearts')

# cards = [Card.new(4, 'Hearts'),
#          Card.new(4, 'Diamonds'),
#          Card.new(10, 'Clubs')]
# puts cards.min.rank == 4
# puts cards.max == Card.new(10, 'Clubs')

# cards = [Card.new(7, 'Diamonds'),
#          Card.new('Jack', 'Diamonds'),
#          Card.new('Jack', 'Spades')]
# puts cards.min == Card.new(7, 'Diamonds')
# puts cards.max.rank == 'Jack'

# cards = [Card.new(8, 'Diamonds'),
#          Card.new(8, 'Clubs'),
#          Card.new(8, 'Spades')]
# puts cards.min.rank == 8
# puts cards.max.rank == 8
