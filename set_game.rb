#Author: Mike, Channing
#Create Date: 5/22
class SetGame

	def get_deck
		print(valid_syntax? true)
		return (1..81).to_a
	end

	def shuffle(deck)
		deck.shuffle!
	end

	#change
	def get_hand(deck, top_card)
	end

	def show_hand(hand)
	end

	def find_set(hand)
	end

	#change
	#contains valid_syntax?
	def get_user_input
	end

	#change
	def valid_syntax? (user_input)
		false
	end

	#change
	def check_set?(user_input, hand)
	end

	def update(hand,user_input,top_card)
	end

	def replace3(hand,user_input,top_card)
	end

	def add3(hand,top_card)
	end

	game = SetGame.new
	deck = game.get_deck
	game.shuffle(deck)
	hand, top_card=game.get_hand(deck,top_card)
	game.show_hand(hand)
	hint=game.find_set(hand)
	while(hand.length>0)
		user_input = game.get_user_input
		valid_set = game.check_set?user_input
		top_card = update(hand,user_input,top_card)
	end
	print "Good Game"
end

