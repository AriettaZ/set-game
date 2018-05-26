#Author: Mike, Channing
#Create Date: 5/22
require_relative 'card'
class SetGame

=begin
	Author: Gail Chen
	Date: 5/25
	Edit: N/A
	Description:
		Prints menu to the screen and get user's choice.
		The menu includes New Game, Tutorial, Load Game.
		The user must choose a valid option by typing the number of that option.
		The method returns an integer of corresponding user's choice.
	Requires: N/A
	Updates: N/A
	Returns: Integer where 1 <= Integer <= 4

=end
	def menu_get_choice
		user_choice = ""
		puts "Menu:"
		puts "[1] New Game"
		puts "[2] Tutorial"
		puts "[3] Load Game"
		puts "[4] Quit"
		until valid_choice? user_choice
			puts "Choose an option from menu by typing the number of that option:"
			user_choice = gets.chomp
		end
		user_choice.to_i
	end

=begin
	Author: Gail Chen
	Created: 5/25
	Edit: N/A
	Description: This method checks that user enters an integer between 1 and 4.
	Requires: user_input.class == String
	Updates: N/A
	Returns: true if user_input is a string of an integer in range [1, 4]
		 false else
=end
	def valid_choice?(user_input)
		# user_input must be size 1
		return false if user_input.length != 1
		# user_input must be an integer between 1 and 4
		return user_input.to_i.to_s == user_input && user_input.to_i >= 1 && user_input.to_i <= 4
	end

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

=begin
	Author: Gail Chen
	Date created: 5/22
	Edit: 5/25 Gail Chen optimized the method
	Description:
		This method creates a hand with 12 top cards from deck.
		It returns the created hand and the index of the next top card in deck.
	Requires:
		deck != nil, deck.length >= 12
	Updates:
		New array variable named hand with 12 top cards from deck.
		New integer variable named top_card indicates the index of next top card in deck.
	Returns:
		hand, top_card
=end
	def get_hand(deck)
		hand = []
		top_card = 0
		12.times {
			hand.push(deck[top_card])
			top_card += 1
		}
		return hand, top_card
	end

=begin
		Author: Gail Chen
		Created: 5/22
		Edit: 5/24 Mike Lin modified the method to pretty print the details of cards
		Description:
			This method pretty prints #, color, shading, symbol and number of cards
			in hand to the screen for user.
		Requires: hand != nil
		Updates: N/A
		Returns: Pretty prints details of cards in hand to the screen.
=end
	def show_hand(hand)
		puts "#".center(5)+"Color".ljust(8)+"Shading".ljust(10)+"Symbol".ljust(10)+"Number"
		puts "----------------------------------------"
		hand.length.times{ |card|
			puts "#{card}".rjust(3)+": "+"#{hand[card].color}".ljust(8)+"#{hand[card].shading}".ljust(10)+"#{hand[card].symbol}".ljust(10)+" #{hand[card].number}".rjust(3)
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
		if hand.length<21 && user_input=='none' && top_card<deck.length
			puts '3 cards will be added'
			add3(deck,hand,top_card)
		elsif (hand.length == 21||top_card==81)&&user_input=='none' #hand.length<21 and top_card == 81
			puts 'At least one set'
		else
			if check_set?(hand[user_input[0]], hand[user_input[1]],hand[user_input[2]],hand)
				puts 'Correct set! 3 cards will be replaced'
				replace3(deck,hand,user_input,top_card)
			else
				puts 'Wrong set'
			end
		end
	end

=begin
	Author: Gail Chen
	Date created: 5/22
	Edit:
		5/24 Gail Chen optimized the method by replacing the for loop with user_input.each {}
		5/25 Gail Chen modified the method to pass failed tests
	Description:
		This method replaces 3 cards in hand chosen by user with top 3 cards in deck
		if there are exactly 12 cards in hand and there are cards in deck that
		haven't been placed in hand before. This method removes 3 cards chosen by
		user from hand if there are less than or more than 12 cards in hand,
		or all cards in deck have been placed in hand before.
	Requires:
		top_card and hand.size are multiples of 3,
		0 < hand.size <= 21, hand.size <= top_card <= deck.size,
		If hand.size < 12, then top_card must equals to deck.size.
	Updates:
		If hand.size == 12 and top_card < deck.size, replace 3 cards in hand as
		indicated by user_input, top_card += 3; otherwise, remove 3 cards from hand
		as indicated by user_input, hand.size -= 3.
	Returns: hand, top_card
=end
	def replace3(deck, hand, user_input, top_card)
			delete_count = 0
			user_input.each { |card|
				if hand.size == 12 && top_card < deck.size
					hand[card] = deck[top_card]
					top_card += 1
				else
					hand.delete_at(card - delete_count)
					delete_count += 1
				end
			}
		return hand, top_card
	end

=begin
	Author: Gail Chen
	Date created: 5/22
	Edit: 5/24 Gail Chen changed the for loop to 3.times
	Description: This method adds next 3 top cards from deck to the end of hand.
	Requires: deck != nil, top_card < deck.length, top_card >= hand.length
	Updates: hand.size += 3, top_card += 3, push 3 top cards from deck to hand
	Returns: hand, top_card
=end
	def add3(deck,hand,top_card)
		3.times {
			hand.push(deck[top_card])
			top_card += 1
		}
		return hand, top_card
	end
end
