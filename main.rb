#Author: Mike
#Date: 5/24

require_relative "set_game"

game = SetGame.new
#generate 81 cards and shuffled
deck = game.get_deck
#game.shuffle(deck)
#top_card is the next card to be selected in deck
top_card = 0
hand, top_card = game.get_hand(deck,top_card)

CARD1 = Card.new('red','striped','diamond','1')
CARD2 = Card.new('red','striped','diamond','2')
CARD3 = Card.new('red','striped','diamond','3')
CARD4 = Card.new('red','striped','squiggle','1')
CARD5 = Card.new('red','striped','squiggle','2')
CARD6 = Card.new('red','striped','squiggle','3')
CARD7 = Card.new('red','striped','oval','1')
CARD8 = Card.new('red','striped','oval','2')
CARD9 = Card.new('red','striped','oval','3')
CARD10 = Card.new('red','solid','diamond','1')
CARD11 = Card.new('red','solid','diamond','2')
CARD12 = Card.new('red','solid','diamond','3')
hand = [CARD1, CARD2, CARD3, CARD4, CARD5, CARD6, CARD7, CARD8, CARD9,CARD10, CARD11, CARD12]

#    hint=game.find_set(hand)

while(hand.length>0)
	game.show_hand(hand)
	user_input = [0,1,2] #game.get_user_input
	hand, top_card = game.update(hand,user_input,top_card,deck)
end
	print "All Clear! Good Game!"
