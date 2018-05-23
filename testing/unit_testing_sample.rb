#Author: Mike, Channing
#Creation Date: 5/22

#require file set_game.rb
#class name: SetGame
require_relative "../set_game"
require "test/unit"

class TestSetGame < Test::Unit::TestCase
	def test_get_deck
		assert_equal(81,SetGame.new.get_deck.length)
	end
end
