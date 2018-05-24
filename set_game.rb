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
	def check_set?(card1, card2, card3, check_order)
		result=true
		for i in 0...check_order.length
			case check_order[i]
				when "color"
					result = result && check_attr?(:color, card1, card2, card3)
				when "shading"
					result = result && check_attr?(:shading, card1, card2, card3)
				when "symbol"
					result = result && check_attr?(:symbol, card1, card2, card3)
				when "number"
					result = result && check_attr?(:number, card1, card2, card3)
			end
			if(result==false)
				return false
			end
		end
		return result

	end

	#Author: Ariel
	def update(hand,user_input,top_card,deck)
		if hand.length<21 && user_input=='none' && top_card<81
			puts '3 cards will be added'
			add3(deck,hand,top_card)
		elsif (hand.length == 21||top_card==81)&&user_input=='none'
			puts 'At least one set'
		else
			# convert string to array
			user_input=eval(user_input)
			if check_set?(user_input[0], user_input[1],user_input[2],hand)
				puts 'Correct set! 3 cards will be replaced'
				replace3(deck,hand,user_input,top_card)
			else
				puts 'Wrong set'
			end
		end
	end

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
	end

	game = SetGame.new
	deck = game.get_deck
	game.shuffle(deck)
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

	# test update, user no set, hand add 3
	puts ""
	puts "show hand after user_input='none',hand.length<21,top_card< 81:"
	hand, top_card = game.update(hand,"none",top_card,deck)
	game.show_hand(hand)
	print "top_card is ",top_card
	puts ""
	print "hand.length is ",hand.length
	puts ""

	# test update, user wrong set, don't change hand
	puts ""
	puts "show hand after user_input='[2, 5, 9]',hand.length<21,top_card< 81:"
	game.update(hand,'[2,5,9]',top_card,deck)
	game.show_hand(hand)
	print "top_card is ",top_card
	puts ""
	print "hand.length is ",hand.length
	puts ""

	# test update, user correct set, replace 3 cards
	puts ""
	puts "show hand after user_input='[19, 20, 21]'(correct set),hand.length<21,top_card< 81:"
	card1=Card.new('red', 'solid', 'oval', '3')
	card2=Card.new('red', 'solid', 'oval', '2')
	card3=Card.new('red', 'solid', 'oval', '1')
	hand.push(card1)
	hand.push(card2)
	hand.push(card3)
	top_card=top_card+3
	game.update(hand,'[19, 20, 21]',top_card,deck)
	game.show_hand(hand)
	print "top_card is ",top_card
	puts ""
	print "hand.length is ",hand.length
	puts ""

	# test update,user no set and has 21 on hand, don't change hand
	puts ""
	puts "show hand after user_input='none',hand.length=21,top_card< 81:"
	game.update(hand,'none',top_card,deck)
	game.show_hand(hand)
	print "top_card is ",top_card
	puts ""
	print "hand.length is ",hand.length
	puts ""



	# hint=game.find_set(hand)
	# while(hand.length>0)
	# 	user_input = game.get_user_input
	# 	valid_set = game.check_set?user_input
	# 	top_card = update(hand,user_input,top_card)
	# end
	# print "Good Game"
end
