module UpdateGame
=begin
  	Author: Ariel
  	Created: 5/22
  	Edit: Ariel 5/24 add test cases
  	Edit: Ariel 5/26 Minor changes, add documentation
  	Edit: Channing 5/25 added case for finding set with > 12 cards in hand
  	Description: after user give the valid input, update will
  				give feedback on users choice and change the hand, deck hand
  				top_card according to user's input
  	Requires: hand,user_input,top_card,deck
  	Updates: @is_end, @end_time, @number_of_correct, @number_of_wrong
  	Returns: N/A
=end
  	def update(user_input)
  		system('clear'); system('cls')
  		#When user want to quit to main menu
  		if user_input==["quit"]
  			@is_end=true
  			@end_time=Time.now()
  			puts "=============Game Over============="+""
  			puts ""
  			show_stat
  		#Check the user input form a set and display the correcponding message
  		elsif check_set?(@hand[user_input[0]], @hand[user_input[1]],@hand[user_input[2]],["color","shading","symbol","number"])
  			puts "You entered " + user_input[0].to_s+","+user_input[1].to_s+","+user_input[2].to_s
  			puts
  			@number_of_correct += 1
  			puts "Congrats! You entered a correct set!"
  			replace3(user_input)
  		else
  			puts "You entered " + user_input[0].to_s+","+user_input[1].to_s+","+user_input[2].to_s
  			puts
  			@number_of_wrong += 1
  			puts "Sorry. Wrong set.",""
  		end
  	end

=begin
  	Author: Gail Chen
  	Created: 5/22
  	Edit: Gail 5/24 optimized the method by replacing the for loop with user_input.each {}
  	Edit: Gail 5/25 modified the method to pass failed tests
  	Edit: Ariel 5/26 Change formal parameter to instance variables
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
  			#Replace 3 cards
  			if @hand.size == 12 && @top_card < @deck.size
  				@hand[card] = @deck[@top_card]
  				@top_card += 1
  			#Remove 3 cards
  			else
  				@hand.delete_at(card - delete_count)
  				delete_count += 1
  			end
  		}
  	end

=begin
  	Author: Gail Chen
  	Created: 5/22
  	Edit: Gail 5/24 changed the for loop to 3.times
  	Edit: Ariel 5/26 Change formal parameter to instance variables
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
    	Author: Ariel
    	Created: 5/29
    	Edit: N/A
    	Description: Add 3 cards to hand if hand don't have a set.
    					Check and handle the end of game.
    	Requires: @hand != nil, @deck != nil
    	Updates: @end_time, @is_end, @top_card, @hand
    	Returns: N/A
=end
    def handle_no_set
    	while find_set.empty? && !@is_end
    		if @top_card<81
    			add3
    			puts "\nNo sets on hand, add three cards"
    		else
    			puts "No sets on hand, no cards in deck, game is cleared"
    			puts "=============Game Over=============\n\n"
    			@is_end=true
    			@end_time=Time.now()
    			show_stat
    			save_game_result
    		end
    	end
    end

end
