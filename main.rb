#Author: Mike

require_relative "set_game"


require_relative "print_deck"


game = SetGame.new
#generate 81 cards and shuffled
deck = game.get_deck
game.shuffle(deck)
#top_card is the next card to be selected in deck
top_card = 0
hand, top_card = game.get_hand(deck,top_card)
game.show_hand(hand)

#    hint=game.find_set(hand)

#while(hand.length>0)
user_set = game.get_user_cards(deck.length)
#	 top_card = update(hand,user_input,top_card)
#end
#	 print "Good Game"
