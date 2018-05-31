#Author: Channing
#Creation Date: 5/30

require_relative "../set_game"
require "test/unit"

class TestSetGame < Test::Unit::TestCase

	def test_handle_no_set1
		game = SetGame.new
		game.get_deck
		game.get_hand
		game.handle_no_set
		time_after = Time.now

		assert_true(game.end_time <= time_after)
		assert_equal(game.is_end, false)
		assert_true(game.find_set.empty?)
	end

	def test_handle_no_set2
		game = SetGame.new
		game.get_deck
		game.hand = []
		time_after = Time.now

		assert_true(game.end_time <= time_after)
		assert_equal(game.is_end, true)
		assert_true(game.find_set.empty?)
	end
end
