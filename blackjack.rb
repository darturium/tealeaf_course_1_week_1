
deck = {}

suits = ["clubs", "diamonds", "hearts", "spades"]

# populate deck hash with deck of cards and values
suits.each do |suit|
  deck["ace_#{suit}".to_sym] = 1
  
  (2..10).each do |num|
    deck["#{num}_#{suit}".to_sym] = num
  end

  deck["jack_#{suit}".to_sym] = 10
  deck["queen_#{suit}".to_sym] = 10
  deck["king_#{suit}".to_sym] = 10

end

dealer_cards = {}
card_number = rand(1..deck.length)
card = deck.select {|k, v| k = }
dealer_cards[card] = 

# player_cards = {}
