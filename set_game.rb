#Author: Mike, Channing
#Create Date: 5/22
require_relative 'card'
class SetGame

	#Author: Ariel
	def get_deck
		deck = []
		colors=['red','purple','green']
		shadings=['striped','solid','open']
		symbols=['diamond','squiggle','oval']
		numbers=['1','2','3']
		for color_index in 0..2
			for shading_index in 0..2
				for symbol_index in 0..2
					for number_index in 0..2
						deck.push(Card.new(colors[color_index], shadings[shading_index], symbols[symbol_index], numbers[number_index]))
					end
				end
			end
	  	end
		deck
	end

	def shuffle(deck)
		deck.shuffle!
	end

	#Author: Gail
	def get_hand(deck, top_card)
		hand = []
		start = top_card
		for top_card in start..start+11
			hand.push(deck[top_card])
		end
		top_card += 1
		return hand, top_card
	end

	#Author: Gail
	def show_hand(hand)
		for card in 0..hand.size-1
			puts "#{card+1}: #{hand[card].color}, #{hand[card].shading}, #{hand[card].symbol}, #{hand[card].number}"
		end
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

	#Author: Gail
	def replace3(deck,hand,user_input,top_card)
		if top_card < deck.size
			for card in 0..2
				hand[user_input[card] - 1] = deck[top_card]
				top_card += 1
			end
		else
			delete_count = 0
			user_input.sort!
			for card in 0..2
				hand.delete_at(user_input[card] - 1 - delete_count)
				delete_count += 1
			end
		end
		return hand, top_card
	end

	#Author: Gail
	def add3(deck,hand,top_card)
		for card in 0..2
			hand.push(deck[top_card])
			top_card += 1
		end
		return hand, top_card
	end

	# game = SetGame.new
	# deck = game.get_deck
	# game.shuffle(deck)
	# top_card = 0
	# hand, top_card = game.get_hand(deck,top_card)
	# game.show_hand(hand)
	# puts top_card
	#
	# #test replace3
	# puts ""
	# puts "show hand after replace card 2, 5, 9:"
	# user_input = [2, 5, 9]
	# top_card = 81
	# hand, top_card = game.replace3(deck, hand, user_input, top_card)
	# game.show_hand(hand)
	# puts top_card

	# #test add3
	# puts ""
	# puts "show hand after add 3 cards:"
	# hand, top_card = game.add3(deck, hand, top_card)
	# game.show_hand(hand)
	# puts top_card

	# hint=game.find_set(hand)
	# while(hand.length>0)
	# 	user_input = game.get_user_input
	# 	valid_set = game.check_set?user_input
	# 	top_card = update(hand,user_input,top_card)
	# end
	# print "Good Game"
end
