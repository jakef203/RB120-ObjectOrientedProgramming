class Card 
  include Comparable
  attr_reader :rank, :suit

  VALUES = { 'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14 } # used in their solution
  def initialize(rank, suit)
    @rank = rank 
    @suit = suit
  end 

  def value 
    VALUES.fetch(rank, rank)
  end

  def <=>(other)
    value <=> other.value
  end

  def to_s 
    "#{rank} of #{suit}"
  end
end

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace))
  SUITS = %w(Hearts Clubs Spades Diamonds)

  def initialize 
    reset
  end 

  def draw 
    reset if @cards.empty?
    @cards.pop
  end

  # def reset
  #   @cards = []
  #   RANKS.each do |rank|
  #     SUITS.each do |suit|
  #       @cards << Card.new(rank, suit)
  #     end
  #   end

  private

  def reset # using product makes it easier than what I did above
    @cards = RANKS.product(SUITS).map do |rank, suit|
      Card.new(rank, suit)
    end
  
    @cards.shuffle!
  end

end

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
puts drawn
puts drawn.count { |card| card.rank == 5 } == 4
puts drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
puts drawn != drawn2 # Almost always.



