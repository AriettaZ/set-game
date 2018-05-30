#Author: Channing
#Creation Date: 5/30

require_relative "../set_game"
require "test/unit"

=begin
	Test Plan:
	

	Author: Ariel
	Created: 5/29
	Edit: N/A
	Description: Add 3 cards to hand if hand don't have a set. 
					Check and handle the end of game.
	Requires: @hand != nil, @deck != nil
	Updates: @end_time, @is_end, @top_card, @hand
	Returns: N/A

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
=end

class TestSetGame < Test::Unit::TestCase

	def test_handle_no_set1
		game = SetGame.new
		game.get_deck
		game.get_hand
		time_before = Time.now
		game.handle_no_set
		time_after = Time.now
		
		assert_true(game.end_time <= time_after)
		assert_equal(game.is_end, false)
		#assert_false(game.find_set.empty?)
	end

	def test_handle_no_set2
		game = SetGame.new
		game.get_deck
		game.hand = []
		game.top_card = 81
		time_before = Time.now
		game.handle_no_set
		time_after = Time.now
		
		assert_true(game.end_time <= time_after)
		assert_equal(game.is_end, true)
		assert_true(game.find_set.empty?)
	end

	def test_handle_no_set3
		game = SetGame.new
		game.get_deck
		game.get_hand
		game.top_card = 81
		time_before = Time.now()
		sleep 1
		game.handle_no_set
		sleep 1
		time_after = Time.now()

		assert_true(game.end_time <= time_before)
		assert_true(game.end_time <= time_after)
		assert_equal(game.is_end, true)
		#assert_true(game.find_set.empty?)
	end
end
