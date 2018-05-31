#Author: Mike, Channing
#Create Date: 5/22

require_relative 'card'
require_relative 'main_menu'
require_relative 'tutorial'
require_relative 'save_load_game'
require_relative 'find_set'
require_relative 'update_game'
require 'csv'

class SetGame
	include MainMenu
	include Tutorial
	include SaveLoadGame
	include FindSet
	include UpdateGame

=begin
	Author: Ariel
	Created: 5/26
	Edit: Mike 5/27 Change @save_time to 0.0
	Edit: Ariel 5/29 Add @end_time and @is_end
	Description: Initialize the instance variables.
	Requires: N/A
	Updates: @start_time, @end_time, @save_time, @top_card, @number_of_hint, @number_of_correct, @number_of_wrong, @deck, @hand, @username, @total_hint, @is_end
	Returns: N/A
=end
def initialize
	@start_time = Time.now
	@end_time = Time.now
	@save_time = 0.0
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
	Author: Ariel
	Created: 5/26
	Edit: Mike 5/27 change save_time to 0
	Edit: Ariel 5/29 move start_time setter to get_hand
	Description: Reinitialize the variables.
	Requires: N/A
	Updates: @save_time, @top_card, @number_of_hint, @number_of_correct, @number_of_wrong, @deck, @hand, @username, @total_hint, @is_end
	Returns: N/A
=end
	def clear
		@save_time = 0.0
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
	Author: Mike
	Created: 5/28
	Edit: Ariel 5/30 add name filter
	Description: Ask user to enter their username.
	Require: N/A
	Updates: @username
	Returns: N/A
=end
	def get_username mode="new"
		puts "Please enter your username:"
		input = gets.chomp
		until !input.empty? && input[0,1]!='.'
			puts "","The username can't be empty or start with '.'. ","Please enter another username:"
			input = gets.chomp
		end
		@username = input
	end

=begin
	Author: Mike
	Created: 5/26
	Edit: Ariel, Mike 5/26
	Edit: Gail 5/27 added select_level
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
	Author: Mike
	Created: 5/26
	Edit: Channing 5/29 moved user save input handling to get_user_cards
	Edit: Ariel 5/29 add handle_no_set
	Description:Continue the game from new_game or load_game
				by showing the user current hand and let user find a set.
	Require: SetGame object has all instance variable set up
	Updates: N/A
	Returns: N/A
=end
	def continue_game
		handle_no_set
		until @is_end
			show_progress
			show_hand
			user_input = get_user_cards
			update user_input
			handle_no_set
		end
	end

=begin
	Author: Mike
	Created: 5/26
	Edit: N/A
	Description: Delete game archive from stored_game/@username/ folder
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
	Created: 5/26
	Edit: Ariel 5/26 Change formal parameter to instance variables
	Edit: Gail 5/29 Add incrementation of @number_of_hint and @total_hint
	Edit: Ariel 5/29 Add handle_no_set
	Description: Enter auto_game mode to let the machine play the game.
	Require: N/A
	Updates: @start_time, @end_time, @save_time, @top_card, @number_of_hint, @number_of_correct, @number_of_wrong, @deck, @hand, @username, @total_hint, @is_end
	Returns: N/A
=end
	def auto_game
	  clear
	  get_deck
	  shuffle
	  get_hand
		handle_no_set
		until @is_end
			show_progress
			show_hand
			hint = []
			find_set.each do |card| hint.push(@hand.index(card)) end
			@number_of_hint += 1
			@total_hint += 1
			puts hint.to_s
			update hint
			handle_no_set
		end
	end

=begin
		Author: Channing Jacobs
		Created: 5/29
		Edit: N/A
		Description: Sets up puzzle mode game. Game generated only one solution.
					Game can't be saved, scored or use hint.
		Requires: N/A
		Updates: @start_time, @end_time, @save_time, @top_card, @number_of_hint, @number_of_correct, @number_of_wrong, @deck, @hand, @username, @total_hint, @is_end
		Returns: N/A
=end

		def puzzle_game
			loop do
				#Set up deck and hand
				clear
				get_deck
				shuffle
				get_hand

				#Set up a single solution game
				solution = find_set
				next if (solution == [])
				solution.each {|card_in_set| removed_card = @hand.delete(card_in_set); break if (find_set != []); @hand << removed_card}
				next if @hand.length < 12
				@hand.shuffle!

				#Display message and ask user for input
				loop do
					show_hand
					print "\nEnter your set or type 'quit': "
					case user_input = gets.chomp.downcase.split(",")
					when ["quit"]
						return
					else
						if good_set_syntax? user_input
							# return user defined set in ascending card order
							if (user_input.map {|card| card.to_i}.sort == solution.map {|card| @hand.find_index(card)}.sort)
								puts "Great job! You found the only set.\nHit enter to go back to main menu."
								gets
								return
							end
							puts "Incorrect set. There is only one soltuion. Try again.",""
						else
							puts "Invalid command or set syntax."
						end
					end
				end
				puts "Error in execution."
				break
			end
		end

=begin
	Author: Ariel
	Created: 5/21
	Edit: Mike 5/24 Simplify the index to for-in loop
	Edit: Mike 5/25 Simplify deck[x] to deck.push
	Edit: Ariel 5/26 Change formal parameter to instance variables
	Edit: Mike 5/27 Simplify for-in loop
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
	Created: 5/22
	Edit: Ariel 5/26 Change formal parameter to instance variables
	Description: Shuffle the @deck
	Requires: @deck != nil
	Updates: @deck
	Returns: N/A
=end
	def shuffle
		@deck.shuffle!
	end

=begin
	Author: Gail Chen
	Created: 5/22
	Edit: 5/25 Gail Chen optimized the method
	Edit: 5/29 Ariel add start_time
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
		#Output the title
		puts "#".center(5)+"Color".ljust(8)+"Shading".ljust(10)+"Symbol".ljust(10)+"Number"
		puts "----------------------------------------"

		#Output the cards
		hand.length.times{ |card|
			puts "#{card}".rjust(3)+": "+"#{hand[card].color}".ljust(8)+"#{hand[card].shading}".ljust(10)+"#{hand[card].symbol}".ljust(10)+" #{hand[card].number}".rjust(3)
		}

		#Gives hint for easy development/testing
		hint = []
		find_set.each do |card| hint.push(@hand.index(card)) end
		puts hint.to_s
	end

=begin
	Author: Channing Jacobs
	Created: 5/24
	Edit: Channing 5/28 Add help list and add hint, quit, save, show functionality
	Edit: Ariel 5/29 change return value of quit

	Description: Handles user input. Non-return cases: handles tutorial display,
	hint display, save_game call, and will show_hand.
	When user enters card related input, the method will do the following.
	Returns a valid array representation of user's chosen
	cards. The user must choose 3 valid cards by writing them as a comma
	separated list "int,int,int" or enter "none". The function returns an
	array such as [int, int, int] or [] (an empty array) if the user enters
	"none".

	Requires: N/A
	Updates: @top_card, @hand
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
		when ["quit"]
			# setting up conditions to allow for quiting
			@top_card = 81
			@hand = []
			return ["quit"]
		when ["save"]
			save_game
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
	Author: Channing Jacobs
	Created: 5/24
	Editor: Mike, Gail 5/24
	Description: This method checks that user_input meets the requirement
	of conforming to being a string representation of an array. The array
	of integers represents the cards that were picked from the user's hand.
	Thus they are indicies of the hand array. There should be 3 cards to
	form a set. All other inputs are invalid.
	Requires: user_input.class == Array, hand != nil, 0<=hand.length<=21
	Updates: N/A
	Returns: true if (user_input ===
			[0...$hand.length, 0...$hand.length, 0...$hand.length])
		 false other wise
=end
	def good_set_syntax? user_input
		return false if user_input.length != 3
		# user input must only contain integers (between 0 and hand.length-1)
		return (user_input.all? {|i| (i.to_i.to_s == i && i.to_i <= @hand.length-1 && i.to_i >= 0 && user_input.count(i) < 2)})
	end

=begin
    Author: Channing Jacobs
    Created: 5/29
	Edit: Mike, Gail 5/30 Format output
    Description: Displays the progress of the current game.
    Requires: @top_card != nil, @deck != nil
    Updates: N/A
    Returns: N/A
=end
    def show_progress
	# bar_size is between 0 and 38
      finish_size = (((@top_card-12).to_f / (@deck.length-11).to_f) * 30).to_i
			remain_size = 30 - finish_size
			print "\nProgress: "
			finish_size.times {print '▓' }
			remain_size.times {print '░'}
			puts
			puts
    end

=begin
	Author: Channing Jacobs
	Created: 5/29
	Edit: Mike 5/30 Format output
	Description: Output a set to user if they have hint left and show the remaining number of hints
					Output a message if the user is out of hint
	Requires: @hand != nil, there exist a set in hint
	Updates: @number_of_hint
	Returns: N/A
=end
	def get_hint
		if @number_of_hint != @total_hint
			@number_of_hint += 1
			hint = find_set
#			@hand.each_index {|i| hint.each {|card| print "#{i}," if card == @hand[i]}}
			hint = hint.map {|card| @hand.find_index(card)}.sort
			puts "Hint: " + hint[0].to_s+","+hint[1].to_s+","+hint[2].to_s
			puts"\nYou have #{@total_hint - @number_of_hint} hints left."
		else
			puts "You are out of hints. #{@number_of_hint} have been used."
		end
	end

=begin
	Author: Ariel
	Created: 5/29
	Edit: Gail 5/30 added if-else statement to return score
	Description: Give user score calculated by the following function:
		((360000/((@end_time - @start_time) + @save_time))*((@number_of_correct-@number_of_hint)/(@number_of_correct+1)))
		If the calculated score is negative, then return 0;
		otherwise, return the calculated score (accurate to 2 decimal places).
	Requires: N/A
	Updates: N/A
	Returns: score
=end
	def get_score
		score = ((360000/((@end_time - @start_time).to_f + @save_time.to_f))*((@number_of_correct-@number_of_hint).fdiv(@number_of_correct+1))).truncate(2)
		if score < 0
			return 0
		else
			return score
		end
	end
end

=begin
  	Author: Gail Chen
  	Created: 5/27
  	Edit: Ariel 5/26 Change formal parameter to instance variables
  	Edit: Ariel 5/29 add score, change format of hint calculation
  	Description:
  		This method prints statistics of this game including total time spend, score,
  		number of hints used, percentage of using hint to find a correct set.
  	Requires: @total_hint != 0
  	Updates: N/A
  	Returns: N/A
=end
  	def show_stat
  		puts "=============Statistics============"
  		puts "Score: #{get_score}"
  		puts "Total time:" + "%0.2f" %(@end_time - @start_time + @save_time) + " seconds"
  		puts "Number of sets found: #{@number_of_correct}"
  		puts  "#{@number_of_hint}/#{@total_hint} hints used"
  	end

=begin
	Author: Ariel
	Created: 5/29
	Edit: N/A
	Description: Show the statistics for current user
	Requires: N/A
	Updates: @username
	Returns:  N/A
=end
def show_result
	get_username
	file_name="game_result/#{@username}.csv"
	puts ""
	if File.file?(file_name)
		CSV.foreach(file_name) do |row|
			puts "#{row[0][0..19]}".center(20)+"|"+"#{row[1]}".center(20)+"|"+"#{row[2]}".center(15)+"|"+"#{row[3]}".center(15)+"|"+"#{row[4]}".center(15)+"|"+"#{row[5]}".center(15)+"|"+"#{row[6]}".center(15)
			puts "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
		end
		vars=[]
		7.times do |var|
			vars.unshift(0)
		end
		CSV.foreach(file_name,:headers => false) do |row|
			vars[0]+=1
			(1..6).each do |pos|
				vars[pos]+=row[pos].to_i
		end
		end
		vars[0]-=1
		puts "Average".center(20)+"|"+"#{vars[1]/vars[0]}".center(20)+"|"+"#{vars[2]/vars[0]}".center(15)+"|"+"#{vars[3]/vars[0]}".center(15)+"|"+"#{vars[4]/vars[0]}".center(15)+"|"+"#{vars[5]/vars[0]}".center(15)+"|"+"#{vars[6]/vars[0]}".center(15)
		puts "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
		puts "","If the table is not shown peoperly, please expand the terminal to 125*40 to get the best user experience"
	else
		puts "Sorry. No game history available for #{@username}. The game history is auto-saved at the end of each game."
	end
end


# def send_email

# end
