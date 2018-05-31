# Author: Channing, moved methods into module to clean up set_game.rb

module MainMenu

=begin
	Author: Gail Chen
	Created: 5/25
	Edit: Gail 5/26 created and used show_menu method
	Edit: Gail 5/29 shortened method and deleted show_menu method
	Description:
		Prints menu to the screen and get valid user's choice. The user must choose a valid option by typing
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
			puts "[7] Puzzle Mode"
			puts "[8] Quit"
			puts "Choose an option from menu by typing the number of that option:"
			user_choice = gets.chomp
			break if valid_choice? user_choice, 8
		end
		user_choice.to_i
	end

=begin
		Author: Gail Chen
		Created: 5/25
		Edit: Gail 5/26 added a message to ask the user to enter a valid choice
		Edit: Gail 5/27 modified the method to check valid menu option and valid level
		Description:
			Checks user enters an integer between 1 and max where max is the largest
			integer the user is allowed to enter.
		Requires:
			user_input.class == String, max == 8 if this method is called in
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
			Edit: Gail 5/26 Minor changes
			Edit: Channing 5/28 Updated to return a polar value.
			Edit: Ariel 5/29 Add choice 6 - game result history
			Edit: Channing 5/29 Add choice 7 - puzzle mode
			Description: This method redirects user to different tracks.
				A polar return value tracks whether the user wants to quit
				the game.
			Requires: choice.class == integer
			Updates: N/A
			Returns: false if user input 8 and true if user input∈[1..7]
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
					puts "=============Puzzle Mode============="
					puzzle_game
				when 8
					return false # indicates exit game
				end
				return true	# don't exit game
			end

=begin
								Author: Gail Chen
							    Created: 5/27
								Edit: Channing 5/29 Updated loop and shortened method
								Description:
									Selects difficulty level from easy, medium, hard.
									The easy level, the user can ask for hint 27 times at most.
									The medium level gives hints for 10 times at most.
									The hard level gives hints for 5 times at most.
								Require: N/A
								Updates: @total_hint
								Returns: N/A
=end
								def select_level
									level = nil
									loop do
										puts ""
										puts "Choose difficulty Level:"
										puts "[1] Easy"
										puts "[2] Medium"
										puts "[3] Hard"
										puts "Enter the number of the corresponding difficulty level:"
										level = gets.chomp
										break if valid_choice? level, 3
									end

									case level
									when "1" # Easy
										@total_hint = 27
									when "2" # Medium
										@total_hint = 10
									when "3" # Hard
										@total_hint = 5
									end
								end

end
