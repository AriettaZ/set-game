#Author: Mike, Channing
#Create Date: 5/22

require_relative 'card'
class SetGame

def initialize
	@startTime = Time.now
end
attr_reader :startTime

=begin
	Author: Gail Chen
	Date: 5/26
	Edit: N/A
	Description:
		Prints menu to the screen. The menu shows choices of New Game, Tutorial,
		Load Game, Auto-Playing Game and Quit.
	Requires: N/A
	Updates: N/A
	Returns: Prints menu to screen.
=end
	def show_menu
		puts "\nMenu:"
		puts "[1] New Game"
		puts "[2] Tutorial"
		puts "[3] Load Game"
		puts "[4] Delete Saved Game"
		puts "[5] Auto-Playing Mode"
		puts "[6] Quit"
		puts "Choose an option from menu by typing the number of that option:"
	end

=begin
	Author: Gail Chen
	Date: 5/25
	Edit: 5/26 Gail added Auto-Playing Mode and called show_menu
	Description:
		Prints menu to the screen and get valid user's choice.
		The user must choose a valid option by typing the number of that option.
		The method returns an integer of corresponding user's choice.
	Requires: N/A
	Updates: N/A
	Returns: Integer where 1 <= Integer <= 6
=end
	def menu_get_choice
		show_menu
		user_choice = gets.chomp
		until valid_choice? user_choice
			show_menu
			user_choice = gets.chomp
		end
		user_choice.to_i
	end

=begin
	Author: Gail Chen
	Created: 5/25
	Edit: 5/26 Gail added a message to ask the user to enter a valid choice
	Description: This method checks that user enters an integer between 1 and 6.
	Requires: user_input.class == String
	Updates: N/A
	Returns: true if user_input is a string of an integer in range [1, 6]
		 false else
=end
	def valid_choice?(user_input)
		if user_input.length == 1 && user_input.to_i.to_s == user_input && user_input.to_i >= 1 && user_input.to_i <= 6
			return true
		else
			puts "You chose " + user_input +" -- I have no idea what to do with that."
			return false
		end
	end

=begin
	Author: Ariel
	Created: 5/26
	Edit: N/A
	Description: This method redirects user to different tracks
	Requires: choice.class == integer
	Updates: N/A
	Returns: N/A
=end
	def menu_redirect_choice(choice)
		case choice
		when 1
		  puts "===========New Game==========="
		  new_game
		when 2
		  puts "======Entering Tutorial======"
		  get_tutorial
		when 3
			puts "=========Load Game========="
			load_game
		when 4
			puts "=========Delete Saved Game========="
			delete_save_game
		when 5
			puts "=========Auto-playing Mode========="
			auto_game
		end
	end


	#Author: Mike
	#Create Date: 5/22
	#Edit: Ariel 5/26
	#Edit: Mike 5/26
	def new_game
		#generate 81 cards and shuffled
		puts "Select "
		deck = get_deck
		shuffle(deck)
		#top_card is the next card to be selected in deck
		hand, top_card = get_hand deck
		saved_time = 0
		num_of_hint = 0
		num_of_correct = 0

		continue_game top_card, deck, hand, num_of_hint,num_of_correct
	end

	#Author: Mike
	#Creation Date: 5/26
	def continue_game top_card, deck, hand, num_of_hint,num_of_correct
		until top_card==81 && find_set(hand).empty?
			show_hand hand

#			hint = []
#			find_set(hand).each do |card| hint.push(hand.index(card)) end
#			puts hint.to_s
#			puts "Want to save game?"
#			if gets.chomp==="yes"
#				save_game(Time.new - startTime,0,0,top_card,deck,hand)
#				break
#			end

	  		user_input = get_user_cards hand.length
	  		hand, top_card = update(hand,user_input,top_card,deck)
		end
		puts "All Clear! Good Game!"
		puts "You get #{Time.now-startTime} scores. (Lower score is better)"
	end

	#Author: Mike
	#Creation Date: 5/26
	def delete_game
		file_name = get_stored_games
		puts "Are you sure you want to delete the game: "+File.basename(file_name,".setgame")+"?"
		File.delete(file_name) if gets.chomp.downcase[0]=="y"
	end


	#Author: Mike
	#Creation Date: 5/26
	def save_game(time,num_of_hint,num_of_correct,top_card,deck,hand)
		file_name = get_save_information
		File.write file_name,Marshal.dump({time: time,num_of_hint: num_of_hint,num_of_correct: num_of_correct,top_card: top_card,deck: deck,hand: hand})
	end

	#Author: Mike
	#Creation Date: 5/26
	def get_save_information
		puts "Please enter file name"
		file_name = "stored_game/"+gets.chomp+".setgame"
		while File.exist? file_name
			puts "File name exist, please enter a new name."
			file_name = "stored_game/"+gets.chomp+".setgame"
		end
		file_name
	end

	#Author: Mike
	#Creation Date: 5/26
	def load_game
		file_name = get_stored_games
		load = Marshal.load File.read(file_name)
		  #Load the game
		  	saved_time = load[:time]
			num_of_hint = load[:num_of_hint]
			num_of_correct = load[:num_of_correct]
			top_card = load[:top_card]
			deck = load[:deck]
			hand = load[:hand]

			continue_game top_card, deck, hand, num_of_hint,num_of_correct

	end

	#Author: Mike
	#Creation Date: 5/26
	def get_stored_games
		Dir.foreach("stored_game/") do
			|file_name|
			puts File.basename(file_name,'.setgame')+"  "+File.new("stored_game/"+file_name).ctime.strftime("%F %T") if File.extname(file_name)==".setgame"
		end
		puts
		puts "Please enter file name"
		file_name = "stored_game/"+gets.chomp+".setgame"
		unless File.exist? file_name
			puts "File name not exist, please enter another name."
			Dir.foreach("stored_game/") do
				|file_name|
				puts file_name+"  "+File.new(file_name).ctime.strftime("%F %T")
			end
		end
		file_name
	end

	#Author: Mike
	#Create Date: 5/26
	#Edit: Ariel 5/26
	def auto_game
	  #generate 81 cards and shuffled
	  deck = get_deck
	  shuffle(deck)
	  #top_card is the next card to be selected in deck
	  hand, top_card = get_hand(deck)
		until top_card== 81 && find_set(hand).empty?
			show_hand hand
			hint = []
			find_set(hand).each do |card| hint.push(hand.index(card)) end
	  		hand, top_card = update(hand,hint,top_card,deck)
		end
	  puts "All Clear! Good Game!"
		puts "You get #{Time.now-startTime} scores. (Lower score is better)"
	end

 	#Author: Ariel
	#Create date: 5/21
	#Edit: Mike 5/24
	#Edit: Mike 5/25
	def get_deck
		deck = []
		$Colors.each{ |color|
			$Shadings.each {|shading|
				$Symbols.each{|symbol|
					$Numbers.each{|number|
					deck.push(Card.new(color, shading, symbol, number)) }}}}
		deck
	end

=begin
		Author: Mike
		Date created: 5/22
		Description: Shuffle the deck
		Requires: deck != nil
		Updates: deck
		Returns: Shuffled deck
=end
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
		puts ""
		puts "#".center(5)+"Color".ljust(8)+"Shading".ljust(10)+"Symbol".ljust(10)+"Number"
		puts "----------------------------------------"
		hand.length.times{ |card|
			puts "#{card}".rjust(3)+": "+"#{hand[card].color}".ljust(8)+"#{hand[card].shading}".ljust(10)+"#{hand[card].symbol}".ljust(10)+" #{hand[card].number}".rjust(3)
		}

		hint = []
		find_set(hand).each do |card| hint.push(hand.index(card)) end
		puts hint.to_s
	end

=begin
	Author: Channing, Mike
	Date: 5/25
	Editor: N/A
	Description: Finds 1 or all valid sets in hand.
=end
	def find_set(hand, mode = 'hint')
		# Create a hash to represent the number of cards in each section of the table
		hand_stat  = organize(hand)

		# Score the subarrays to find the one that contains the least possible sets
		score = get_score(hand_stat) # set of sets returned

		check_table = get_check_table(hand_stat, score)

		# Use scores and card_table to find one or all valid sets
		set_exist(check_table, score)
	end

=begin
	Author: Channing
	Date: 5/25
	Editor:
	Description: Create a hash to hold statistics (counts) of the number of each card
	attribute found within the hand.
	Require: hand.class == Array; for each element in hand, element.class == Card
	Updates: N/A
	Returns: hash with keys representing card attributes: {$Colors + $Shadings + $Symbols + $Numbers}
		 and values corresponding to number of cards with this attribute in hand.
		 hash { this_card_attr : [hand.each {|card| card.has(this_card_attr)}]

=end
	def organize hand
		# create hash
		hand_stat = Hash.new {|k,v| k[v] = []}
		# create keys based on card attr, set to default [] value
		card_attrs = $Colors + $Shadings + $Symbols + $Numbers
		card_attrs.each {|attr| hand_stat[attr.intern]}
		# add cards to hash
		for card in hand
			[:color, :shading, :symbol, :number].each {|catg|
				hand_stat[card[catg].intern] << card
			}
		end
		hand_stat
	end



=begin
	Author: Mike
	Date: 5/25
	Editor: N/A

	Description: Return a valid array of categories and their scores.

	Requires: hand_Stat filled up
	Updates: N/A
	Returns: [["color",color_score],["shading",shading_score],["symbol",symbol_score],["number",number_score]]
		 where for all scores, 0<=scores<=220
=end
def get_score(hand_stat)
	score=[['color',0],['shading',0],['symbol',0],['number',0]]

	score[0][1] = $Colors.reduce 1 do|product, feature| product * hand_stat[feature.intern].length end
	score[0][1] += $Colors.reduce 0 do
		|sum, feature|
		len = hand_stat[feature.intern].length
		sum + (len*(len-1)*(len-2).to_f/6)
	end

	score[1][1] = $Shadings.reduce 1 do |product, feature| product * hand_stat[feature.intern].length end
	score[1][1] += $Shadings.reduce 0 do
		|sum, feature|
		len = hand_stat[feature.intern].length
		sum+(len*(len-1)*(len-2).to_f/6)
	end

	score[2][1] =  $Symbols.reduce 1 do |product, feature| product * hand_stat[feature.intern].length end
	score[2][1] += $Symbols.reduce 0 do
		|sum, feature|
		len = hand_stat[feature.intern].length
		sum+(len*(len-1)*(len-2).to_f/6)
	end

	score[3][1] =  $Numbers.reduce 1 do |product, feature| product * hand_stat[feature.intern].length end
	score[3][1] += $Numbers.reduce 0 do
		|sum, feature|
		len = hand_stat[feature.intern].length
		sum+(len*(len-1)*(len-2).to_f/6)
	end
	score
end

=begin
	Author: Mike
	Date: 5/25
	Editor:

	Description: Return a check table consists of possible combinations of set from hand.
	Requires: |hand_stat| = |hand|*3
				for all attribute ∈ ($Colors, $Shadings, $Symbols, $Numbers)
				for all card in hand_stat[:attribute], card has attribute
				hand_stat = {
								attribute1:[Card, Card, Card]
								attribute2:[Card, Card, Card]
								...
								attribute3:[Card, Card, Card]
							}

				score.class = Array
					for element in score, element.class = Array, element.length = 2
					for a,b in element[0] element[1], a∈Set("color","shading","symbol","number"), 0<=b<=220
	Updates: N/A
	Returns: [[Card, Card, Card],[Card,Card,Card],...,[Card,Card,Card]]
		 where each [Card,Card,Card] is a possible combination of set from hand.

=end

def get_check_table(hand_stat,score)
	sortedScore = score.sort{|a,b| a[1]<=>b[1]}
	category = sortedScore[0][0]
	check_catg = []
	case category
		when "color"
			category = $Colors
		when "shading"
			category = $Shadings
		when "symbol"
			category = $Symbols
		when "number"
			category = $Numbers
	end

	check_table = []

	category.each {
		|attr|
		check_table.push(*hand_stat[attr.intern].combination(3).to_a)
	}

	attr_card_table = category.map do
		|attr|
		hand_stat[attr.intern]
	end

	check_table.push *(attr_card_table[0].product(attr_card_table[1],attr_card_table[2]))
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
	until valid_syntax?(user_array, hand_size)
		puts "\nChoose 3 cards from your hand using their # separated by ','."
		puts "Or type 'none' if you believe no set exists."
		user_array = gets.chomp.split(",")
		user_array = [-1] if user_array == [] #user hit enter
		user_array = [] if user_array.to_s == "[\"none\"]"
	end
	user_array.map{|str| str.to_i}.sort
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
		# user input must have length 0 or 3
		return true if user_input.length == 0
		return false if user_input.length != 3
		# user input must only contain integers (between 0 and hand.length)
		return (user_input.all? {|i| (i.to_i.to_s == i && i.to_i <= hand_length-1 && i.to_i >= 0 && user_input.count(i) < 2)})
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
			return false if(card2[attr]!=card3[attr])
		else
			return false if(card1[attr]==card3[attr] || card2[attr]==card3[attr])
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

			return false if(result==false)
		end
		return true
	end

	#Author: Ariel
	#Create Date: 5/22
	#Edit: 5/24 by Ariel, add test cases
	#Edit: 5/26 by Ariel, Minor changes, add documentation
	#Edit: 5/25 by Channing, added case for finding set with > 12 cards in hand
	# TODO update test cases according to changes
=begin
	Requires: hand,user_input,top_card,deck
	Returns:  hand, top_card
	Description: after user give the valid input, update will
	give feedback on users choice and change the hand, deck hand
	top_card according to user's input
=end
	def update(hand,user_input,top_card,deck)
	  # when user_input==[] && hand.length<21 && top_card<81
		if user_input.empty? && hand.length<21 && top_card<81
			puts "You entered no set. 3 cards will be added."
			hand, top_card = add3(deck,hand,top_card)
		# when user_input==[] && top_card==81 && no sets on hand
		elsif user_input.empty? && top_card==81 && find_set(hand).empty?
				puts "Congrats! No set on hand and no card in deck. Game is cleared."
		# when user_input==[] && (hand.length==21) or hand.length<21 && top_card==81 && has set on hand)
		elsif user_input.empty?
				puts "You entered no set but at least one set exist."
		# when user_input!=[] && user_input is a correct set
		elsif check_set?(hand[user_input[0]], hand[user_input[1]],hand[user_input[2]],["color","shading","symbol","number"])
				puts "Congrats! You entered a correct set!"
				hand, top_card = replace3(deck,hand,user_input,top_card)
		# when user_input!=[] && user_input is not a correct set
		else
				puts "Sorry. Wrong set."
		end
		return hand, top_card
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

	#Author: Ariel
	#Create Date: 5/26
	#Edit:
=begin
	Requires: N/A
	Returns:  N/A
	Description: Give user tutorial about how to play set game
=end
	def get_tutorial()
		puts "Welcome to Sets tutorial!","You have a deck of 81 cards varying in four features:","Number (one, two, or three)",
		"Symbol (diamond, squiggle, oval)","Shading (solid, striped, or open)","and Color (red, green, or purple)","Each possible combination of features (e.g., a card with three striped green diamonds) appears precisely once in the deck.",
		"Please press Enter to continue Tutorial or other keys to quit",""
		if gets =="\n"
			puts "=============================","A set consists of three cards satisfying all of these conditions:", "They all have the same number or have three different numbers.",
			"They all have the same symbol or have three different symbols.","They all have the same shading or have three different shadings.",
			"And they all have the same color or have three different colors."
			cardA = Card.new('red','striped','diamond','1')
			cardB = Card.new('red','striped','diamond','2')
			cardC = Card.new('red','striped','diamond','3')
			cardD = Card.new('green','solid','diamond','2')
			cardE = Card.new('green','solid','squiggle','2')
			cardF = Card.new('purple','open','diamond','3')
			puts "","This is an example of a 6 cards: "
			show_hand [cardA, cardB, cardC,cardD,cardE,cardF]
			puts "","card #0, #1 and #2 are a set: "
			show_hand [cardA, cardB, cardC]
			puts "To choose this set, enter their card numbers separated by ',': 0,1,2"

			puts "","card #0, #3 and #4 are another set: "
			show_hand [cardA, cardD, cardF]
			puts "To choose this set, enter their card numbers separated by ',': 0,3,5","Please press Enter to continue Tutorial to other keys to quit",""
			if gets =="\n"
				puts "=============================","You're given 12 cards in the first round as below",""

				card1 = Card.new('red','striped','diamond','1')
				card2 = Card.new('red','striped','diamond','2')
				card3 = Card.new('red','striped','diamond','3')
				card4 = Card.new('red','striped','squiggle','1')
				card5 = Card.new('red','striped','squiggle','2')
				card6 = Card.new('red','striped','squiggle','3')
				card7 = Card.new('red','striped','oval','1')
				card8 = Card.new('red','striped','oval','2')
				card9 = Card.new('red','striped','oval','3')
				card10 = Card.new('red','solid','diamond','1')
				card11 = Card.new('red','solid','diamond','2')
				card12 = Card.new('red','solid','diamond','3')
				show_hand [card1, card2, card3, card4, card5, card6, card7, card8, card9,card10, card11, card12]

				puts "","If there's a set, enter their card numbers separated by ','","If set is correct, 3 cards will be replaced. If not, the cards will remain the same","If no set exist, simply push Enter key and 3 new cards will be added",
				"If 21 cards available in the table or no cards in deck, no card will be added to the table","", "Please press Enter to quit Tutorial",""
				if gets=="\n"
				end
			end
		end
	end
end
