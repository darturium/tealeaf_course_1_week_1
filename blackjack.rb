
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
      deck["#{numbers[num]}_of_#{suit}".to_sym] = num
    end

    deck["jack_of_#{suit}".to_sym] = 10
    deck["queen_of_#{suit}".to_sym] = 10
    deck["king_of_#{suit}".to_sym] = 10

  end
  
  return deck

end

def deal_cards(num, deck)
  cards = []
  keys = deck.keys 
  num.times do
    card_number = rand(0...deck.length)
    cards << "#{keys[card_number]}".to_sym
  end
  return cards
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
  end
  sum
end

# start game logic ------------------------->
print "Hi, welcome to this blackjack game. What is your name? "
name = gets.chomp

play = true
while play
 
  deck = populate_deck
 
  dealer_cards = deal_cards(2, deck) 
  player_cards = deal_cards(2, deck)
  
  puts "\n"
  puts "Dealer has the following cards:"
  puts "A card facing down"
  puts "#{dealer_cards[1]}"

  puts "\n"
  puts "#{name} has the following cards: "
  player_cards.each_with_index {|card, index| puts "#{index + 1}) #{card}"}
  puts "#{name}'s cards value: #{get_value(player_cards, deck)}"
  puts "\nWhat do you want to do?"
  puts "1) Hit"
  puts "2) Stay"
  print "Enter your choice: "

  action = gets.chomp

  while action != "1" && action != "2"
    print "You need to enter either 1 or 2: "
    action = gets.chomp
  end


  case action
  when "1"
    deal_cards(1, deck).each {|card| player_cards << card }

    dealer_value = get_value(dealer_cards, deck)
    player_value = get_value(player_cards, deck)

    puts "\nDealer has the following cards: "
    dealer_cards.each_with_index {|card, index| puts "#{index + 1}) #{card}"}
    puts "Dealer's card value: #{dealer_value}"
    puts "\n#{name} now has the folling cards: "
    player_cards.each_with_index {|card, index| puts "#{index + 1}) #{card}"}
    puts "#{name}'s cards value: #{player_value}"

    if player_value == 21
      puts "\n#{name} wins!"
    elsif player_value > 21
      puts "\n#{name} looses"
    elsif player_value < 21
      if player_value > dealer_value
        puts "\n#{name} wins!"
      elsif dealer_value > player_value
        puts "\n#{name} looses"
      end
    end
  when "2"
    dealer_value = get_value(dealer_cards, deck)
    player_value = get_value(player_cards, deck)

    puts "\nDealer has the following cards: "
    dealer_cards.each_with_index {|card, index| puts "#{index + 1}) #{card}"}
    puts "Dealer's card value: #{dealer_value}"
    puts "\n#{name} now has the folling cards: "
    player_cards.each_with_index {|card, index| puts "#{index + 1}) #{card}"}
    puts "#{name}'s card value: #{player_value}"

    if player_value > 21
      puts "#\n{name} looses"
    elsif player_value >= dealer_value 
      puts "\n#{name} wins!"
    else
      puts "\n#{name} looses"
    end
  end

  print "Play again? (y OR n): "
  continue = gets.chomp

  while continue != "y" && continue != "n"
    print "What? Please enter 'y' or 'n': "
    continue = gets.chomp
  end

  play = (continue == "y")
end