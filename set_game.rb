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
		puts "#".center(5)+"Color".ljust(8)+"Shading".ljust(10)+"Symbol".ljust(10)+"Number"
		puts "----------------------------------------"
		hand.length.times{ |card|
			puts "#{card+1}".rjust(3)+": "+"#{hand[card].color}".ljust(8)+"#{hand[card].shading}".ljust(10)+"#{hand[card].symbol}".ljust(10)+" #{hand[card].number}".center(5)
		}
	end

	def find_set(hand)
	end

=begin
	Author: Channing Jacobs
	Date: 2/24
	Editor:

	Description: Returns a valid array representation of user's chosen
	cards. The user must choose 3 valid cards by writing them as a comma
	separated list "int,int,int" or enter "none". The function returns an
	array such as [int, int, int] or [] (an empty array) if the user enters
	"none".

	Requires: N/A
	Updates: N/A
	Returns: [] || [Integer, Integer, Integer] 
		 where for all Integer : 0 < Integer < total_cards

=end

def get_user_cards hand_size
	user_array = [-1]
	until valid_syntax?(user_array hand_size)
		puts "Choose 3 cards from your hand using their # separated by ',' ."
		puts "Or type 'none' if you believe no set exists."
		user_array = gets.chomp.split(",").sort
		user_array = [] if user_array.to_s == "none"
	end
	user_array
end


=begin 
	Author: Channing Jacobs
	Created: 5/24
	Editor: Mike, Gail 5/24
	Description: This method checks that user_input meets the requirement
	of conforming to being a string representation of an array. The array 
	of integers represents the cards that were picked from the user's hand. 
	Thus they are indicies of the hand array. There should be 3 cards to 
	form a set. [] indicates that the user believes there is no possible set 
	and the hand may need to be updated. All other inputs are invalid.
	Requires: user_input.class == Array, hand != nil, 0<=hand.length<=21
	Updates: N/A
	Returns: true if (user_input === 
			[0..$hand.length, 0..$hand.length, 0..$hand.length] ||
			user_input === [])
		 false else
	
	TODO make returns clause correct
	TODO MUST CHANGE THE HARDCODED 2 to $hand.lenght
	TODO remove comment on the require of main method (or hand...class vars)
	TODO missing check that integers must be unique
=end
	def valid_syntax?(user_input,hand_length)
		# user input must be 0 or 3; done if 0 case
		return true if user_input.length == 0
		return false if user_input.length != 3
		# user input must only contain integers (between 0 and hand.length)
		user_input.all? {|i| (i.is_a?(Integer) && i <= hand_length-1 && i >= 0)}
	end

	
#Author: Mike
#Create Date: 5/23
#Edit: 5/24 by Mike, Minor changes, add documentation
=begin
	Requires: card1.class=card2.class=card3.class=Card, 
				attr∈Set(:color,:shading,:symbol,:number)
	Returns: True if the provided attribute and cards follow set convention and false otherwise
	Description: Check whether the provided attribute and cards follows Set convention
=end

	def check_attr?(attr,card1,card2,card3)
		if(card1[attr]==card2[attr])
			if(card2[attr]!=card3[attr])
				return false
			end
		else
			if(card1[attr]==card3[attr] || card2[attr]==card3[attr])
				return false
			end
		end
		return true
	end


#Author: Mike
#Create Date: 5/23
#Edit: 5/24 by Mike, Minor changes, add documentation
=begin
	Requires: card1.class=card2.class=card3.class=Card, 0<=check_order.length<=4, 
				∀x∈check_order, x∈Set("color","shading","symbol","number")
	Returns: True if the provided cards form a set, false otherwise
	Description: Check in order, whether the provided cards form a set
=end

	def check_set?(card1, card2, card3, check_order)	
		for order in check_order
			case order
				when "color"
					result = check_attr?(:color, card1, card2, card3)
				when "shading"
					result = check_attr?(:shading, card1, card2, card3)
				when "symbol"
					result = check_attr?(:symbol, card1, card2, card3)
				when "number"
					result = check_attr?(:number, card1, card2, card3)
			end
			if(result==false)
				return false
			end
		end
		return true
		
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
	
	#Author: Mike
	#Create Date: 5/23
	#Edit: 5/24 by Mike, minor changes
=begin
	Requires: check_table.class = Array, 
				for combination in check_table, combination.class = Array, combination.length = 3,
				∀x∈combination, x.class=Card
			  score.class = Array
				for element in score, element.class = Array, element.length = 2
				for a,b in element[0] element[1], a∈Set("color","shading","symbol","number"), 0<=b<=220
	Returns: True if there is at least a set in check_table combinations and false otherwise
	Description: Check if there exist a set in the check_table
=end
	def set_exist(check_table,score)

		sortedScore = score.sort{|a,b| a[1]<=>b[1]}
		order = [sortedScore[1][0]]+[sortedScore[2][0]]+[sortedScore[3][0]]
		
		for combination in check_table
			if check_set?(combination[0],combination[1],combination[2],order)
				return combination
			end
		end
		return []
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
