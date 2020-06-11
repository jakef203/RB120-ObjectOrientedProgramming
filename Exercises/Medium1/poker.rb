 # Their solution

class PokerHand
  def initialize(cards)
    @cards = []
    @rank_count = Hash.new(0)

    5.times do
      card = cards.draw
      @cards << card
      @rank_count[card.rank] += 1
    end
  end

  def print
    puts @cards
  end

  def evaluate
    if    royal_flush?     then 'Royal flush'
    elsif straight_flush?  then 'Straight flush'
    elsif four_of_a_kind?  then 'Four of a kind'
    elsif full_house?      then 'Full house'
    elsif flush?           then 'Flush'
    elsif straight?        then 'Straight'
    elsif three_of_a_kind? then 'Three of a kind'
    elsif two_pair?        then 'Two pair'
    elsif pair?            then 'Pair'
    else 'High card'
    end
  end

  private

  def flush?
    suit = @cards.first.suit
    @cards.all? { |card| card.suit == suit }
  end

  def straight?
    return false if @rank_count.any? { |_, count| count > 1 }

    @cards.min.value == @cards.max.value - 4
  end

  def n_of_a_kind?(number)
    @rank_count.one? { |_, count| count == number }
  end

  def straight_flush?
    flush? && straight?
  end

  def royal_flush?
    straight_flush? && @cards.min.rank == 10
  end

  def four_of_a_kind?
    n_of_a_kind?(4)
  end

  def full_house?
    n_of_a_kind?(3) && n_of_a_kind?(2)
  end

  def three_of_a_kind?
    n_of_a_kind?(3)
  end

  def two_pair?
    @rank_count.select { |_, count| count == 2 }.size == 2
  end

  def pair?
    n_of_a_kind?(2)
  end
end

# My solution

class PokerHand
  attr_reader :starting_cards, :hand
  def initialize(starting_cards)
    @hand = []
    if starting_cards.is_a?(Deck)
      @starting_cards = starting_cards.deck_cards
      5.times { |i| @hand << @starting_cards.draw}
    else
      @hand = starting_cards
    end
  end

  def print
    puts hand
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  def rank_counts
    rank_counts = Hash.new(0)
    hand.each { |card| rank_counts[card.rank] += 1 } 
    rank_counts
  end

  private

  def royal_flush?
    sorted_hand = hand.sort 
    flush? && straight? && sorted_hand[4].rank == 'Ace' 
  end

  def straight_flush?
    flush? && straight?
  end

  def four_of_a_kind?
    return true if rank_counts.key(4)
  end

  def full_house?
    return true if rank_counts.key(3) && rank_counts.key(2)
  end

  def flush?
    map_hand = hand.map(&:suit)
    map_hand.uniq.size == 1
  end

  def straight?
    sorted = hand.sort
    1.upto(4) do |card_num|
      return false if sorted[card_num].rank_value != sorted[card_num - 1].rank_value + 1
    end
    # if
    true
  end

  def three_of_a_kind?
    return true if rank_counts.key(3)
  end

  def two_pair?
    counts_array = rank_counts.to_a
    counts = 0
    counts_array.each { |rank| counts += 1 if rank[1] == 2 }
    counts == 2
  end

  def pair?
    return true if rank_counts.key(2)
  end
end

class Array
  alias_method :draw, :pop
end

class Card 
  include Comparable
  attr_reader :rank, :suit

  RANKS = ((2..10).to_a + %w(Jack Queen King Ace))
  RANK_VALUES = { 'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14 } 
  SUITS = %w(Diamonds Clubs Hearts Spades)
  ranks_and_suits = RANKS.product(SUITS).map { |rank, suit| [rank, suit] }
  CARD_VALUES = ranks_and_suits.zip(1..52).to_h

  # VALUES = { 'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14 } # used in their solution
  def initialize(rank, suit)
    @rank = rank 
    @suit = suit
  end 
  
  def rank_value # rank_value will just return value from 2 to 14 based on rank
    RANK_VALUES.fetch(rank, rank)
  end

  def card_value # card_value will return value from 1 to 52 based on rank and suit
                 # i.e. [2, 'Diamonds'] => 1, [2, 'Clubs'] => 2 ... ['Ace', 'Hearts'] => 51, ['Ace', 'Spades'] => 52
    CARD_VALUES[[rank, suit]]
  end

  def <=>(other)
    card_value <=> other.card_value
  end

  def to_s 
    "#{rank} of #{suit}"
  end
end

class Deck
  attr_reader :deck_cards
  # RANKS = ((2..10).to_a + %w(Jack Queen King Ace))
  # SUITS = %w(Hearts Clubs Spades Diamonds)

  def initialize 
    reset
  end 

  def draw 
    reset if @deck_cards.empty?
    @deck_cards.pop
  end

  private

  def reset # using product makes it easier than what I did above
    @deck_cards = Card::RANKS.product(Card::SUITS).map do |rank, suit|
      Card.new(rank, suit)
    end
  
    @deck_cards.shuffle!
  end

end

# a = Deck.new
# puts a.is_a?(Deck)
hand = PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new(8, 'Spades'),
  Card.new(9, 'Diamonds'),
  Card.new(10, 'Spades'),
  Card.new('Ace', 'Clubs')
])
puts hand.rank_counts
puts hand.evaluate
hand.print
# hand2 = PokerHand.new(Deck.new)
# puts hand2.starting_cards
# puts ""
# hand2.print
