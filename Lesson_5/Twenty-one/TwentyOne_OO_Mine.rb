
require 'io/console'
require 'pry'
class Participant
  attr_accessor :cards, :name

  def initialize
    @cards = []
    set_name
  end

  def busted?
    total > Game::GAME_MAX
  end

  def total
    total = 0
    aces_with11 = 0
    cards.each do |card|
      total += card.value
      aces_with11 += 1 if card.rank == 'A'
      if total > Game::GAME_MAX && aces_with11 > 0
        total -= 10
        aces_with11 -= 1
      end
    end
    total
  end

  def joinand(array, punc = ', ', ending = 'and')
    if array.size == 1
      array[0].to_s
    elsif array.size == 2
      "#{array[0]} #{ending} #{array[1]}"
    else
      "#{array[0..-2].join(punc)}#{punc[0]} #{ending} #{array[-1]}"
    end
  end
end

class Player < Participant
  def set_name
    name = ''
    loop do
      puts "What's your name?"
      name = gets.chomp
      break unless name.empty?
      puts "Sorry, must enter a value."
    end
    self.name = name
  end

  def show_cards
    puts "#{name} cards: #{joinand(cards)} "
    puts "#{name} total: #{total}"
  end
end

class Dealer < Participant
  ROBOTS = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5']

  def set_name
    self.name = ROBOTS.sample
  end

  def show_cards(dealer_show_full = false)
    if dealer_show_full == false
      puts "Dealer cards: #{cards[0]} and ?."
      puts "Dealer total: #{cards[0].value}"
    else
      puts "Dealer cards: #{joinand(cards)}"
      puts "Dealer total: #{total}"
    end
  end
end

class Deck
  attr_reader :cards
  def initialize
    reset
  end

  def reset
    @cards = []
    Card::SUITS.each do |suit|
      Card::VALUES.keys.each do |rank|
        @cards << Card.new(suit, rank)
      end
    end
    @cards.shuffle!
  end

  def deal_card(participant)
    participant.cards << cards.pop
    # participant.calculate_total
  end
end

class Card
  attr_reader :suit, :rank
  attr_accessor :value
  SUITS = ['clubs', 'diamonds', 'hearts', 'spades']
  VALUES = { '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6,
             '7' => 7, '8' => 8, '9' => 9, '10' => 10, 'J' => 10,
             'Q' => 10, 'K' => 10, 'A' => 11 }
  def initialize(suit, rank)
    @suit = suit
    @rank = rank
    @value = VALUES[@rank]
  end

  def to_s
    "[#{rank}, #{suit}]"
  end
end

class Game
  GAME_MAX = 21
  attr_accessor :result_status, :deck
  attr_reader :player, :dealer
  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
    @result_status = nil # not sure if I need this
  end

  def reset
    self.deck = Deck.new
    player.cards = []
    dealer.cards = []
  end

  def clear
    system('clear')
  end

  def continue_game
    STDIN.getch
    print "              \r"
  end

  def display_welcome_message
    clear
    puts "Welcome to Twenty-one!!"
    puts "(Press any button to continue during game unless otherwise prompted.)"
    continue_game
  end

  def first_deal(deck)
    puts "Dealing cards..."
    puts continue_game
    deck.deal_card(player)
    deck.deal_card(dealer)
    deck.deal_card(player)
    deck.deal_card(dealer)
    # [player, dealer].each(&:calculate_total)
  end

  def show_participant_cards(participants_shown = 'both', full_dealer = false)
    puts ""
    player.show_cards unless participants_shown == 'dealer'
    dealer.show_cards(full_dealer) unless participants_shown == 'player'
    continue_game
  end

  def hit_or_stay
    puts "Hit or stay?  Enter 'h' to hit or 's' to stay: "
    answer = nil
    loop do
      answer = gets.chomp.downcase
      break if ['h', 's'].include?(answer)
      puts "Invalid entry.  Enter 'h' to hit or 's' to stay: "
    end
    puts "#{player.name} stays at #{player.total}." if answer == 's'
    answer == 'h' ? 'hit' : 'stay'
  end

  # def dealer_hits?
  #   return false if dealer.busted?

  def detect_result
    case
    when player.busted? then :player_busted
    when dealer.busted? then :dealer_busted
    when player.total > dealer.total then :player_higher
    when dealer.total > player.total then :dealer_higher
    else :tie
    end
  end

  def display_final_totals
    puts ""
    puts "----------"
    puts "Final results:"
    player.show_cards
    dealer.show_cards(true)
    puts "----------"
  end

  def display_game_result
    display_final_totals
    result = detect_result
    case result
    when :player_busted
      puts "#{player.name} busted. Dealer is the winner!"
    when :dealer_busted
      puts "Dealer busted.  #{player.name} is the winner!"
    when :player_higher
      puts "#{player.name} beats dealer.  #{player.name} is the winner!"
    when :dealer_higher
      puts "Dealer beats #{player.name}.  Dealer is the winner!"
    else
      puts "It's a tie!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if ['y', 'n'].include? answer
      puts "Sorry, must be y or n."
    end

    answer == 'y'
  end

  def display_goodbye_message
    puts "Thanks for playing Twenty-One!!"
  end

  def start
    loop do
      display_welcome_message
      first_deal(deck)
      show_participant_cards('both')
      loop do
        break if hit_or_stay == 'stay'
        deck.deal_card(player)
        show_participant_cards('player')
        break if player.busted?
      end
      unless player.busted?
        puts "Dealer's turn."
        continue_game
        loop do
          show_participant_cards('dealer', true)
          if dealer.busted? || dealer.total > player.total || dealer.total >= 17
            break
          end
          puts "Dealing card..."
          continue_game
          deck.deal_card(dealer)
        end
      end
      display_game_result
      play_again? ? reset : break
    end
    display_goodbye_message
  end
end

Game.new.start
