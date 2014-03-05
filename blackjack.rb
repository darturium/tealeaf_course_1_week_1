require "pry"

def populate_deck
  suits = ["clubs", "diamonds", "hearts", "spades"]
  deck = {}
  # this array will serve only to convert an integer to its word representation to avoid
  # starting a symbol's name with a number
  numbers = ["", "", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten"]

  # populate deck hash with deck of cards and values
  suits.each do |suit|

    deck["ace_of_#{suit}".to_sym] = 11
  
    (2..10).each do |num|
      deck["#{numbers[num]}_of_#{suit}".to_sym] = num
    end

    deck["jack_of_#{suit}".to_sym] = 10
    deck["queen_of_#{suit}".to_sym] = 10
    deck["king_of_#{suit}".to_sym] = 10

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

  cards = []
  keys = deck.keys 
  num.times do
    card_number = rand(0...deck.length)
    # cards["#{keys[card_number]}".to_sym] = deck[keys[card_number]]
    cards << "#{keys[card_number]}".to_sym

  cards = {}
  keys = deck.keys 
  num.times do
    card_number = rand(0...deck.length)
    cards ["#{keys[card_number]}".to_sym] = deck[keys[card_number]]

  end
  cards
end


def get_value(cards, deck)
  sum = 0
  ace = false
  cards.each do |card| 
    if card == :ace_of_clubs or card == :ace_of_diamonds or 
      card == :ace_of_hearts or card == :ace_of_spades
      ace = true
    end
    sum += deck[card]  
  end
  if ace and sum > 21
    sum -= 10

def get_value cards
  sum = 0
  cards.each do |card, value| 
    #unless card == :ace_clubs or card == :ace_diamonds or 
    # card == :ace_hearts or card == :ace_spades
    sum += value   

  end
  sum 
end


print "Hi, welcome to this blackjack game. What is your name? "
name = gets.chomp

play = true
while play
 
  deck = populate_deck
 
  dealer_cards = deal_cards(2, deck) 
  player_cards = deal_cards(2, deck)
  
  puts "\n"
  puts "The dealer has the following cards:"
  puts "One card face-down"
  puts "#{dealer_cards[1]}"

  puts "\n"
  puts "#{name} has the following cards: "
  player_cards.each {|card| puts card}
  puts "Your value is: #{get_value(player_cards, deck)}"
  puts "\nWhat do you want to do?"
  puts "1) Hit"
  puts "2) Stay"

  action = gets.chomp

  binding.pry

  while action != "1" && action != "2"
    print "You need to enter either 1 or 2: "
    action = gets.chomp
  end

  case action
  when 1
    player_cards << deal_cards(1, deck)

    dealer_value = get_value(dealer_cards, deck)
    player_value = get_value(player_cards, deck)

    puts "\nDealer has the following cards: "
    dealer_cards.each {|card| puts "#{card}"}
    puts "Dealer's cards value: #{dealer_value}"
    puts "\n#{name} now has the folling cards: "
    player_cards.each {|card| puts "#{card}" }
    puts "#{name}'s cards value: #{player_value}"

    if player_value == 21
      puts "#{name} wins!"
    elsif player_value > 21
      if player_value > dealer_value
        puts "#{name} wins!"
      elsif dealer_value > player_value
        puts "#{name} looses"
      end
    end
  when 2
  
  end

  play = false
end