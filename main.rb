#Author: Mike

require_relative "set_game"


require_relative "print_deck"


game = SetGame.new
choice = game.menu_get_choice
puts choice.class
puts "choice #{choice}"
#generate 81 cards and shuffled
# deck = game.get_deck
# game.shuffle(deck)
# #top_card is the next card to be selected in deck
# hand, top_card = game.get_hand(deck)
# game.show_hand(hand)

#    hint=game.find_set(hand)

#while(hand.length>0)
#	 user_input = game.get_user_input
#	 valid_set = game.check_set?user_input
#	 top_card = update(hand,user_input,top_card)
#end
#	 print "Good Game"
