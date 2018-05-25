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
		hand.length.times {|card|
			puts "#{card}: #{hand[card].color}, #{hand[card].shading}, #{hand[card].symbol}, #{hand[card].number}"
		}
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

	#Require: top_card and hand.size are multiples of 3
	#Author: Gail
	def replace3(deck, hand, user_input, top_card)
			delete_count = 0
			3.times{ |card|
				if top_card < deck.size
					hand[user_input[card]] = deck[top_card]
					top_card += 1
				else
					user_input.sort!
					hand.delete_at(user_input[card] - delete_count)
					delete_count += 1
				end
			}
		return hand, top_card
	end

	#Author: Gail
	def add3(deck,hand,top_card)
		3.times {
			hand.push(deck[top_card])
			top_card += 1
		}
		return hand, top_card
	end
end
