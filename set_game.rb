#Author: Mike, Channing
#Create Date: 5/22
<<<<<<< HEAD
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
=======
class SetGame

	def get_deck
		print(valid_syntax? true)
		return (1..81).to_a
>>>>>>> 354780f082354f06aa42392bc3aa70970c19905f
	end

	def shuffle(deck)
		deck.shuffle!
	end

<<<<<<< HEAD
	#Author: Gail
	def get_hand(deck, top_card)
		hand = []
		for top_card in 0..11
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
=======
	#change
	def get_hand(deck, top_card)
	end

	def show_hand(hand)
>>>>>>> 354780f082354f06aa42392bc3aa70970c19905f
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

<<<<<<< HEAD
	#Author: Gail
	def replace3(deck,hand,user_input,top_card)
		for card in 0..2
	    hand[user_input[card] - 1] = deck[top_card]
	    top_card += 1
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
=======
	def replace3(hand,user_input,top_card)
	end

	def add3(hand,top_card)
>>>>>>> 354780f082354f06aa42392bc3aa70970c19905f
	end

	game = SetGame.new
	deck = game.get_deck
	game.shuffle(deck)
<<<<<<< HEAD
	top_card = 0
	hand, top_card = game.get_hand(deck,top_card)
	game.show_hand(hand)

	#test replace3
	puts ""
	puts "show hand after replace card 2, 5, 9:"
	user_input = [2, 5, 9]
	hand, top_card = game.replace3(deck, hand, user_input, top_card)
	game.show_hand(hand)
	puts top_card

	#test add3
	puts ""
	puts "show hand after add 3 cards:"
	hand, top_card = game.add3(deck, hand, top_card)
	game.show_hand(hand)
	puts top_card

	# hint=game.find_set(hand)
	# while(hand.length>0)
	# 	user_input = game.get_user_input
	# 	valid_set = game.check_set?user_input
	# 	top_card = update(hand,user_input,top_card)
	# end
	# print "Good Game"
end
=======
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

>>>>>>> 354780f082354f06aa42392bc3aa70970c19905f
