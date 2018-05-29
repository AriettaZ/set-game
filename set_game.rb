#Author: Mike, Channing
#Create Date: 5/22

require_relative 'card'
require 'csv'
class SetGame

#Create: Ariel
#Create Date: 5/26
#Edit: Mike 5/27
#Edit: Ariel 5/29
def initialize
	@start_time = Time.now
	@end_time=Time.now
	@save_time = 0
	@top_card = 0
	@number_of_hint = 0
	@number_of_correct = 0
	@number_of_wrong= 0
	@deck = []
	@hand = []
	@username = ""
	@total_hint=0
	@is_end=false
end
attr_accessor :start_time
attr_accessor :end_time
attr_accessor :save_time
attr_accessor :top_card
attr_accessor :number_of_hint
attr_accessor :number_of_correct
attr_accessor :number_of_wrong
attr_accessor :deck
attr_accessor :hand
attr_accessor :username
attr_accessor :total_hint
attr_accessor :is_end

=begin
	Author: Gail Chen
	Date: 5/25
	Edit: 5/26 Gail created and used show_menu method
		  5/29 Gail shortened method and deleted show_menu method
	Description:
		Prints menu to the screen and get valid user's choice. The menu shows
		choices of New Game, Tutorial, Load Game, Delette Saved Game,
		Auto-Playing Game and Quit. The user must choose a valid option by typing
		the number of that option. The method returns an integer of corresponding
		user's choice.
	Requires: N/A
	Updates: N/A
	Returns: Integer where 1 <= Integer <= 6
=end
	def menu_get_choice
		user_choice = nil
		loop do
			puts "\nMenu:"
			puts "[1] New Game"
			puts "[2] Tutorial"
			puts "[3] Load Game"
			puts "[4] Delete Saved Game"
			puts "[5] Autoplay Mode"
			puts "[6] Game Result History"
			puts "[7] Quit"
			puts "Choose an option from menu by typing the number of that option:"
			user_choice = gets.chomp
			break if valid_choice? user_choice, 6
		end
		user_choice.to_i
	end

	#Create: Ariel
	#Created: 5/26
	#Edit: Mike 5/27
  #      Ariel	 5/29 move start_time setter to get_hand
	def clear
		@save_time = 0
		@top_card = 0
		@number_of_hint = 0
		@number_of_correct = 0
		@number_of_wrong= 0
		@deck = []
		@hand = []
		@username = ""
		@total_hint=0
		@is_end=false
	end

=begin
	Author: Gail Chen
	Created: 5/25
	Edit: 5/26 Gail added a message to ask the user to enter a valid choice
	      5/27 Gail modified the method to check valid menu option and valid level
	Description:
		Checks user enters an integer between 1 and max where max is the largest
		integer the user is allowed to enter.
	Requires:
		user_input.class == String, max == 6 if this method is called in
		menu_get_choice, max == 3 if this method is called in select_level.
	Updates: N/A
	Returns:
		true if user_input is a string of an integer in range [1, max], false else
=end
	def valid_choice?(user_input, max)
		if user_input.length == 1 && user_input.to_i.to_s == user_input && user_input.to_i >= 1 && user_input.to_i <= max
			return true
		else
			puts "You chose " + user_input +", I have no idea what to do with that."
			return false
		end
	end

=begin
	Author: Ariel
	Created: 5/26
	Edit: 5/26 Gail minor changes
	Edit: 5/28 Channing, Updated to return a polar value.
	Edit: 5/29 Ariel add choice 6
	Description: This method redirects user to different tracks.
	A polar return value tracks whether the user wants to quit
	the game.
	Requires: choice.class == integer
	Updates: N/A
	Returns: choice == 6 ? false : true
=end
	def menu_redirect_choice?(choice)
		case choice
		when 1
		  puts "===========New Game==========="
		  new_game
		when 2
		  puts "=========Enter Tutorial========"
		  get_tutorial
		when 3
			puts "=========Load Game========="
			load_game
		when 4
			puts "=========Delete Saved Game========="
			delete_game
		when 5
			puts "=========Autoplay Mode========="
			auto_game
		when 6
			puts "=========Game Result History========="
			show_result
		when 7
			return false	# indicates exit game
		end
		return true	# don't exit game
	end

=begin
	Author: Mike
	Date created: 5/28
	Edit: N/A
	Description: Get username from user
	Require: N/A
	Updates: @username
	Returns: N/A
=end
	def get_username mode="new"
		puts "Please enter your username:"
		@username = gets.chomp
	#	case mode
	#		when "exist"
	#			unless Dir.exist? "stat/"+username+".setgame.stat" || Dir.exist
	#				puts "Sorry, the user name. Please enter another one."
	#				@username = gets.chomp
	#			end
	#		when "new"
	#			while Dir.exist? "stat/"+username+".setgame.stat"
	#				puts "Sorry, the user name has taken. Please enter another one."
	#				@username = gets.chomp
	#			end

	end

=begin
	Author: Mike
	Create Date: 5/26
	Edit: 5/26 Ariel, Mike
		  5/27 Gail added select_level
	Description: Starts a new game.
	Require: N/A
	Updates:
		@start_time, @save_time, @top_card, @number_of_hint,@number_of_correct,
		@number_of_wrong, @deck, @hand, @username, @total_hint
	Returns: N/A
=end
	def new_game
		clear
		get_username
		select_level
		get_deck
		shuffle
		get_hand
		continue_game
	end

=begin
	Author: Gail Chen
  Date created: 5/27
	Edit: Channing, Updated loop and shortened method
	Description:
		Selects difficulty level from easy, medium, hard. In the easy level,
		the user can ask for hint 27 times at most and the specific cards in a
		set wil be given. The medium level gives hints for 10 times at most and
		tells two of the three cards in the set. The hard level gives hints for
		5 times at most with one of the three cards in the set.
	Require: N/A
	Updates: @total_hint
	Returns: N/A
=end
	def select_level
		mode = nil
		loop do
			puts ""
			puts "Choose difficulty Level:"
			puts "[1] Easy"
			puts "[2] Medium"
			puts "[3] Hard"
			puts "Enter the number of the corresponding difficulty level:"
			mode = gets.chomp
			break if valid_choice? mode, 3
		end

		case mode
		when "1"
			@total_hint = 27
		when "2"
			@total_hint = 10
		when "3"
			@total_hint = 5
		end
	end


=begin
	Author: Mike
	Date created: 5/26
	Edit: Gail 5/27
	Description:Continue the game from new_game or load_game
			by showing the user current hand and let user find a set.
	Require: SetGame object has all instance variable set up
	Updates: N/A
	Returns: N/A
=end

	#Author: Mike
	#Edit: Channing, moved user save input handling to get_user_cards & added sleep
	#Edit: Ariel: comment out sleep since time measurement, add handle_no_set
	#Creation Date: 5/26
	#Edit: Gail 5/27 added update call after the loop to show the result of game
	def continue_game
		handle_no_set
		until @is_end
			# sleep(1) # wait 1 second
			show_hand
			user_input = get_user_cards
			update user_input
			handle_no_set
		end
	end

=begin
	Author: Mike
	Date created: 5/26
	Edit: N/A
	Description:Delete game archive from saved games
	Require: N/A
	Updates: Selected game file.
	Returns: N/A
=end
	def delete_game
		clear
		get_username
		file_name = get_saved_games
		puts "Are you sure you want to delete the game: "+File.basename(file_name,".setgame")+"?"
		File.delete(file_name) if gets.chomp.downcase[0]=="y"
	end

=begin
	Author: Mike
	Date created: 5/26
	Edit: Mike 5/27
	Description:Save a game archive by creating a .setgame file under stored_game directory
	Require: N/A
	Updates: N/A
	Returns: N/A
=end
	def save_game
		file_name = get_save_information
		File.write file_name,Marshal.dump({
			save_time: (Time.now - @start_time) + @save_time.to_i,
			top_card: @top_card,
			number_of_hint: @number_of_hint,
			number_of_correct: @number_of_correct,
			number_of_wrong: @number_of_wrong,
			deck: @deck,
			hand: @hand,
			username: @username,
			total_hint: @total_hint
			})
		puts "Your game #{File.basename file_name,'.setgame'} is saved successfully."
	end

=begin
	Author: Mike
	Date created: 5/26
	Edit: Channing (pending on channing_dev #=> allowing for overwriting of files)
	Description:Get file name for the game to save
	Require: N/A
	Updates: N/A
	Returns: File name for the game to save
=end
	def get_save_information
		puts "Please enter file name:"
		path="stored_game/"+@username+"/"
		Dir.mkdir path unless Dir.exist? path
		file_name = path+gets.chomp+".setgame"
		while File.exist?(file_name) || file_name.downcase.include?("menu")
			puts "File name exist, please enter a new name."
			puts "(Enter \"saved\" to see the saved games)"
			file_name = gets.chomp
			if file_name=="saved"
				show_saved_games
				puts "Please enter a different file name to save the game: "
				file_name = path+gets.chomp+".setgame"
			else
				file_name = path+file_name+".setgame"
			end
		end
		file_name
	end

=begin
	Author: Mike
	Date created: 5/26
	Edit: Mike 5/27 Output message to give more information about the progress
	Description: Load all instance variables of a game, output a message and let the user continue the game.
	Require: N/A
	Updates: N/A
	Returns: N/A
	#TODO handle bugs in loading games - Talk with Channing
=end
	def load_game
		get_username
		file_name = get_saved_games
		return if file_name=="menu"
		load = Marshal.load File.read(file_name)
		#Load the game
		@start_time = 0
		@save_time = load[:save_time]
		@top_card = load[:top_card]
		@number_of_hint = load[:number_of_hint]
		@number_of_correct = load[:number_of_correct]
		@number_of_wrong= load[:number_of_correct]
		@deck = load[:deck]
		@hand = load[:hand]
		@username = load[:username]
		@total_hint=load[:total_hint]

		msg = "You have completed #{@number_of_correct} sets (roughly #{@number_of_correct/27.0*100}%) and have #{@total_hint-@number_of_hint} hints left. Lets Continue!"
		puts
		(msg.length+10).times {print "*"}
		puts "\n**** "+msg+" ****"
		(msg.length+10).times {print "*"}

		sleep(2)

		continue_game

	end

=begin
	Author: Mike
	Date created: 5/28
	Edit: N/A
	Description: Output saved games with current username
	Require: N/A
	Updates: N/A
	Returns: N/A
=end
	def show_saved_games
		puts "\n=========Saved Game========="
		path = "stored_game/"+@username+"/"
		if !Dir.exist?(path) || Dir.empty?(path)
			puts "You don't have saved games.\n\n"
			return "menu"
		end
		Dir.foreach(path) do
			|file_name|
			puts File.basename(file_name,'.setgame')+"  "+File.new(path+file_name).ctime.strftime("%F %T") if File.extname(file_name)==".setgame"
		end
		puts
	end

=begin
	Author: Mike
	Date created: 5/26
	Edit: Mike 5/28
	Description: Output a list of saved game and let the user to choose which game to load from.
	Require: N/A
	Updates: N/A
	Returns: File name for the game to load or "menu" if the user want to go back to menu
=end
	def get_saved_games
		return "menu" if show_saved_games=="menu"

		puts "Please enter file name:(Enter \"menu\" to return menu)"
		file_name = gets.chomp
		path="stored_game/"+@username+"/"
		return "menu" if file_name=="menu"
		file_name = path+file_name+".setgame"

		until File.exist? file_name
			puts "File name does not exist."
			puts
			puts "=========Saved Game========="

			Dir.foreach(path) do
				|file_name|
				puts File.basename(file_name,'.setgame')+"  "+File.new(path+file_name).ctime.strftime("%F %T") if File.extname(file_name)==".setgame"
			end

			puts
			puts "Please enter file name to load:(Enter \"menu\" to return menu)"
			file_name = gets.chomp
			return "menu" if file_name=="menu"
			file_name = path+file_name+".setgame"
		end
		file_name
	end

=begin
	Author: Ariel
	Date created: 5/29
	Edit:
	Description:
	Require: N/A
	Updates: N/A
	Returns:
=end
def save_game_result
	path="game_result/"
	Dir.mkdir path unless Dir.exist? path
	file_name = path+"#{@username}.csv"
	if File.file?(file_name)
		CSV.open(file_name, "a+") do |csv|
			csv << [@start_time, @end_time-@start_time+@save_time,get_score,@number_of_correct,@number_of_wrong,@total_hint,@number_of_hint]
		end
	else
		CSV.open(file_name, "a+",	:write_headers => true,
				:headers => ["Start Time","Time Spent(secs)","Score","Number of Correct Sets","Number of Wrong Sets","Number of Total Hints","Number of Used Hints"]) do |csv|
			csv << [@start_time, @end_time-@start_time+@save_time,get_score,@number_of_correct,@number_of_wrong,@total_hint,@number_of_hint]
		end
	end
end
=begin
	Author: Mike
	Date created: 5/26
	Edit: Ariel 5/26
	Edit: Gail 5/27
	Edit: Ariel 5/29
	Description: Enter auto_game mode to let the machine play the game.
	Require: N/A
	Updates: N/A
	Returns: N/A
=end
	def auto_game
	  #generate 81 cards and shuffled
	  clear
	  get_deck
	  shuffle
	  #top_card is the next card to be selected in deck
	  get_hand
		handle_no_set
		until @is_end
			# sleep(1) # wait 1 second
			show_hand
			hint = []
			find_set.each do |card| hint.push(@hand.index(card)) end
			puts hint.to_s
	  	update hint
			handle_no_set
		end
	end

=begin
	Author: Ariel
	Date created: 5/21
	Edit: Mike 5/24
	Edit: Mike 5/25
	Edit: Mike 5/27
	Description: Create a deck of 81 Card objects. ∀x,y∈deck(x.color!=y.color;x.shading!=y.shading;x.symbol!=y.symbol;x.number!=y.number)
	Require: N/A
	Updates: @deck
	Returns: N/A
=end
	def get_deck
		for color,shading,symbol,number in $Colors.product($Shadings,$Symbols, $Numbers)
			@deck.push Card.new(color, shading, symbol, number)
		end
	end

=begin
	Author: Mike
	Date created: 5/22
	Description: Shuffle the deck
	Requires: deck != nil
	Updates: deck
	Returns: Shuffled deck
=end
	def shuffle
		@deck.shuffle!
	end

=begin
	Author: Gail Chen
	Date created: 5/22
	Edit: 5/25 Gail Chen optimized the method
	5/29 Ariel add start_time
	Description:
		This method adds 12 top cards from deck to @deck array.
	Requires:
		@deck != nil, @deck.length >= 12, @hand != nil, @top_card == 0
	Updates: @hand.length += 12, @top_card += 12
	Returns: N/A
=end
	def get_hand
		12.times {
			@hand.push(@deck[@top_card])
			@top_card += 1
		}
		@start_time = Time.now
	end

=begin
		Author: Gail Chen
		Created: 5/22
		Edit: 5/24 Mike Lin modified the method to pretty print the details of cards
		Edit: 5/28 Channing, added clearing of screen to make output easier to read
		Description:
			This method pretty prints #, color, shading, symbol and number of cards
			in hand to the screen for user.
		Requires: @hand != nil
		Updates: N/A
		Returns: Pretty prints details of cards in hand to the screen.
=end
	def show_hand hand=@hand
		system('clear'); system('cls')
		puts "#".center(5)+"Color".ljust(8)+"Shading".ljust(10)+"Symbol".ljust(10)+"Number"
		puts "----------------------------------------"
		hand.length.times{ |card|
			puts "#{card}".rjust(3)+": "+"#{hand[card].color}".ljust(8)+"#{hand[card].shading}".ljust(10)+"#{hand[card].symbol}".ljust(10)+" #{hand[card].number}".rjust(3)
		}

		hint = []
		find_set.each do |card| hint.push(@hand.index(card)) end
		puts hint.to_s
	end


def handle_no_set
	while find_set.empty? && !@is_end
		if @top_card<81
			add3
			puts "No sets on hand, add three cards"
		else
			puts "No sets on hand, no cards in deck, game is cleared"
			puts "=============Game Over============="+""
			@is_end=true
			@end_time=Time.now()
			show_stat
			save_game_result
		end
	end
end
=begin
	Author: Channing, Mike
	Date: 5/25
	Editor: Mike 5/27
	Description: Finds 1 or all valid sets in hand.
=end
	def find_set(mode = 'hint')
		# Create a hash to represent the number of cards in each section of the table
		hand_stat  = organize

		# Score the catgories to find the one that contains the least possible sets
		catg_score = catg_set(hand_stat)

		# Get all the possible sets from the catgory with lowest catg_score
		check_table = get_check_table(hand_stat, catg_score)

		# Use catg_score and card_table to find one valid sets
		set_exist(check_table, catg_score)
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
	def organize
		# create hash
		hand_stat = Hash.new {|k,v| k[v] = []}
		# create keys based on card attr, set to default [] value
		card_attrs = $Colors + $Shadings + $Symbols + $Numbers
		card_attrs.each {|attr| hand_stat[attr.intern]}
		# add cards to hash
		for card in @hand
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
def catg_set(hand_stat)
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
	Date: 2/24 (heavily revised on 2/28)
	Editor: 5/29 Ariel (change return value of quit)

	Description: Handles user input. Non-return cases: handles tutorial display,
	hint display, save_game call, and will show_hand.
	When user enters card related input, the method will do the following.
	Returns a valid array representation of user's chosen
	cards. The user must choose 3 valid cards by writing them as a comma
	separated list "int,int,int" or enter "none". The function returns an
	array such as [int, int, int] or [] (an empty array) if the user enters
	"none".

	Requires: N/A
	Updates: N/A
	Returns: [] || [Integer, Integer, Integer]
		 where for all Integer : 0 < Integer < total_cards

=end

def get_user_cards
	loop do
		print "\nEnter your set or type 'help': "
		case user_array = gets.chomp.downcase.split(",")
		when ["help"]
			system('clear'); system('cls')
			puts "Command list:" +
			"\n\thelp\tRedisplay this help menu." +
			"\n\thint\tDisplay a correct set. Removes one hint from the hint counter." +
			"\n\tnone\tDraw 3 cards (can't find a set). Maximum of 21 cards in hand." +
			"\n\tquit\tQuit to main menu without saving." +
			"\n\tsave\tSave the game. Game continues." +
			"\n\tshow\tRedisplay the current hand. Useful if screen is full."
			puts "Valid set:" +
			"\n\tInteger,Integer,Integer" +
			"\n\tInteger must be between min and max card number in hand to be valid."
			puts "\nHit enter to continue."
			gets
			show_hand
		when ["hint"]
			puts get_hint # returns hint (+ number left) or "No more hints available."
		when ["none"]
			return []
		when ["quit"]
			# setting up conditions to allow for quiting
			@top_card = 81
			@hand = []
			return ["quit"]
		when ["save"]
			save_game
			show_hand
			print ">>>[Game saved]<<<"
		when ["show"]
			show_hand
		else
			if good_set_syntax? user_array
				# return user defined set in ascending card order
				return user_array.map {|card_num| card_num.to_i}.sort
			end
			puts "Invalid command or set syntax."
		end
	end
end
=begin
	user_array = [-1]
	until valid_syntax?(user_array, @hand.size)
		puts "\nChoose 3 cards from your hand using their # separated by ','."
		puts "Or type 'none' if you believe no set exists."
		user_array = gets.chomp.split(",")
		user_array = [-1] if user_array == [] #user hit enter
		user_array = [] if user_array.to_s == "[\"none\"]"
	end
	user_array.map{|str| str.to_i}.sort
end
=end


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
	def good_set_syntax? user_input
		# user input must have length 0 or 3
		return true if user_input.length == 0
		return false if user_input.length != 3
		# user input must only contain integers (between 0 and hand.length)
		return (user_input.all? {|i| (i.to_i.to_s == i && i.to_i <= @hand.length-1 && i.to_i >= 0 && user_input.count(i) < 2)})
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
	def update(user_input)
	  # when user_input==[] && hand.length<21 && top_card<81
		if user_input==["quit"]
			@is_end=true
			@end_time=Time.now()
			puts "=============Game Over============="+""
			puts ""
			show_stat
		# elsif user_input.empty? && @hand.length<21 && @top_card<81
		# 	puts "You entered no set. 3 cards will be added."
		# 	add3
		# # when user_input==[] && top_card==81 && no sets on hand
		# elsif user_input.empty? && @top_card==81 && find_set.empty?
		# 	puts "Congrats! No set on hand and no card in deck. Game is cleared."
		# 	puts "All Clear! Good Game!"
		# 	@is_end=true
		# 	show_stat
		# # when user_input==[] && (hand.length==21) or hand.length<21 && top_card==81 && has set on hand)
		# elsif user_input.empty?
		# 	puts "You entered no set but at least one set exist."
		# when user_input!=[] && user_input is a correct set
		elsif check_set?(@hand[user_input[0]], @hand[user_input[1]],@hand[user_input[2]],["color","shading","symbol","number"])
			@number_of_correct += 1
			puts "Congrats! You entered a correct set!"
			replace3(user_input)
		# when user_input!=[] && user_input is not a correct set
		else
			@number_of_wrong += 1
			puts "Sorry. Wrong set."
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
		@top_card and @hand.size are multiples of 3,
		0 < @hand.size <= 21, @hand.size <= @top_card <= @deck.size,
		If @hand.size < 12, then @top_card must equals to @deck.size.
	Updates:
		If @hand.size == 12 and @top_card < @deck.size, replace 3 cards in @hand as
		indicated by user_input, top_card += 3; otherwise, remove 3 cards from @hand
		as indicated by user_input, @hand.size -= 3.
	Returns: N/A
=end
	def replace3(user_input)
		delete_count = 0
		user_input.each { |card|
			if @hand.size == 12 && @top_card < @deck.size
				@hand[card] = @deck[@top_card]
				@top_card += 1
			else
				@hand.delete_at(card - delete_count)
				delete_count += 1
			end
		}
	end

=begin
	Author: Gail Chen
	Date created: 5/22
	Edit: 5/24 Gail Chen changed the for loop to 3.times
	Description: This method adds next 3 top cards from deck to the end of hand.
	Requires: @deck != nil, @hand.length <= @top_card < @deck.length
	Updates: @hand.size += 3, @top_card += 3, push 3 top cards from @deck to @hand
	Returns: N/A
=end
	def add3
		3.times {
			@hand.push(@deck[@top_card])
			@top_card += 1
		}
	end

=begin
	Author: Gail Chen
	Date created: 5/27
	Edit: 5/27
	Edit: 5/29 Ariel add score, change format of hint calculation
	Description:
		This method prints statistics of this game including total time spend, score,
		number of hints used, percentage of using hint to find a correct set.
	Requires: N/A
	Updates: N/A
	Returns: N/A
=end
	def show_stat
		puts "=============Statistics============"
		puts "Score: "+ "%0.2f"%(get_score)
		puts "Total time: #{@end_time - @start_time + @save_time} seconds"
		puts "Number of sets: #{@number_of_correct}"
		puts "Number of hints used: #{@number_of_hint}"
		# puts "% of hint used to find set: " + "%0.2f" %(@number_of_hint.fdiv(@number_of_correct) * 100) + "%"
		puts  "#{@number_of_hint}/#{@total_hint} hints used"
	end

	#Author: Mike
	#Create Date: 5/23
	#Edit: 5/24 by Mike, minor changes
	#Edit: 5/27 Mike, minor changes
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
			return combination if check_set?(combination[0],combination[1],combination[2],order)
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
			puts "","cards #0, #1 and #2 form a set: "
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

	# Author: Channing Jacobs
	# Date: 5/29
	# Hint difficulties may need to be changed. No "magic" numbers.
	def get_hint
		if @number_of_hint != @total_hint
			@number_of_hint += 1
			hint = find_set
			case @total_hint
			when 5
				@hand.each_index {|i| hint.each {|card| print " #{i} " if card == @hand[i]}}
				puts"\nYou have #{@total_hint - @number_of_hint} hints left."
			when 10
				@hand.each_index {|i| hint.each {|card| print " #{i} " if card == @hand[i]}}
				puts"\nYou have #{@total_hint - @number_of_hint} hints left."
			when 27
				@hand.each_index {|i| hint.each {|card| print " #{i} " if card == @hand[i]}}
				puts"\nYou have #{@total_hint - @number_of_hint} hints left."
			else
				puts "Error. Number of total_hints is invalid."
			end
		else
			puts "You are out of hints. #{@number_of_hint} have been used."
		end
	end
	#Author: Ariel
	#Create Date: 5/29
	#Edit:
=begin
	Requires: N/A
	Returns:  N/A
	Description: Give user score
=end
	def get_score
		return ((360000/(@end_time - @start_time + @save_time))*((@number_of_correct-@number_of_hint)/@number_of_correct))
	end
end

#Author: Ariel
#Create Date: 5/29
#Edit:
=begin
Requires: N/A
Returns:  N/A
Description: Give user score
=end
def show_result
	get_username
	path="game_result/#{@username}.csv"
	
end
