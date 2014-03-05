
def populate_deck
  suits = ["clubs", "diamonds", "hearts", "spades"]
  deck = {}
  # this array will serve only to convert an integer to its word representation to avoid
  # starting a symbol's name with a number
  numbers = ["", "", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten"]

  # populate deck hash with deck of cards and values
  suits.each do |suit|
    deck["ace_#{suit}".to_sym] = 1
  
    (2..10).each do |num|
      deck["#{numbers[num]}_#{suit}".to_sym] = num
    end

    deck["jack_#{suit}".to_sym] = 10
    deck["queen_#{suit}".to_sym] = 10
    deck["king_#{suit}".to_sym] = 10
  end
  
  return deck

end

def deal_cards num, deck
  cards = {}
  keys = deck.keys 
  num.times do
    card_number = rand(0...deck.length)
    cards ["#{keys[card_number]}".to_sym] = deck[keys[card_number]]
  end
  cards
end

def get_value cards
  sum = 0
  cards.each do |card, value| 
    #unless card == :ace_clubs or card == :ace_diamonds or 
    # card == :ace_hearts or card == :ace_spades
    sum += value   
  end
  sum 
end

play = true
while play
  print "Hi, welcome to this blackjack game. What is your name?: "
  name = gets.chomp

  deck = populate_deck
 
  dealer_cards = deal_cards 2, deck 
  player_cards = deal_cards 2, deck
  
  puts "The dealer has the following cards:"
  dealer_cards.each {|card, value| }

  dealer_value = get_value dealer_cards
  puts dealer_value
