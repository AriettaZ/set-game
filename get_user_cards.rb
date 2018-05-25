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
Returns: [] || [Integer, Integer, Integer] where for all Integer : 0 < Integer < total_cards

=end

require_relative "valid_syntax?"

def get_user_cards total_cards
	user_array = [-1]
	until valid_syntax? user_array
		puts "Choose 3 cards from your hand using their # separated by ',' ."
		puts "Or type 'none' if you believe no set exists."
		user_array = gets.chomp.split(",").sort
		user_array = [] if user_array.to_s == "none"
	end
	user_array
end
