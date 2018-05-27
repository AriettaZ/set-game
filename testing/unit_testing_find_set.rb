#Author: Mike
#Creation Date: 5/25
#Edit: Mike 5/27

require_relative "../set_game"
require "test/unit"

class TestGetFindSet < Test::Unit::TestCase

=begin
	Test Plan:
		1. find_set from a game with 0 cards in hand
		2. find_set from a game with known 6 cards in hand
		3. find_set from a game with known 12 cards in hand
		4. find_set from a game with random 12 cards in hand and check they form a set
		5. find_set from a game with random 12 cards in hand and check they form a set
=end
	def test_find_set_1
		game = SetGame.new
		game.hand = []
		assert_equal([],game.find_set)

	end

	def test_find_set_2
			card1 = Card.new("red","solid","squiggle","3")
			card2 = Card.new("green","striped","squiggle","2")
			card3 = Card.new("red","solid","diamond","1")
			card4 = Card.new("red","open","diamond","1")
			card5 = Card.new("red","solid","oval","2")
			card6 = Card.new("green","open","oval","1")
			game = SetGame.new
			game.hand = [card1, card2, card3, card4, card5, card6]

=begin
		hand_stat
		{
			red: [card1, card3, card4, card5],
			purple: [],
			green: [card2, card6],
			striped:[card2],
			solid: [card1,card3,card5],
			open: [card4,card6],
			diamond:[card3,card4],
			squiggle:[card1,card2],
			oval: [card5,card6],
			"1":[card3,card4,card6],
			"2":[card2,card5],
			"3":[card1]
		}
=end
		assert_equal [card1,card3,card5],game.find_set
	end

	def test_find_set_3
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
			game = SetGame.new
			game.hand = [card1, card2, card3, card4, card5, card6, card7, card8, card9,card10, card11, card12]

=begin
		hand_stat_table
		{
			red: [card1, card3, card4, card5,card6,card7,card8,card9,card10,card11,card12],
			purple: [],
			green: [],
			striped:[card1, card3, card4, card5,card6,card7,card8,card9],
			solid: [card10,card11,card12],
			open: [],
			diamond:[card1,card2,card3,card10,card11,card12],
			squiggle:[card4,card5,card6],
			oval: [card7,card8,card9],
			"1":[card1,card4,card7,card10],
			"2":[card2,card5,card8,card11],
			"3":[card3,card6,card9,card12]
		}
=end

		assert_equal [card1,card2,card3],game.find_set
	end

	def test_find_set_4
		game = SetGame.new
		game.get_deck
		game.top_card = 0
		game.shuffle
		game.get_hand
		
		set_card1,set_card2,set_card3 = game.find_set
		
		[:color,:shading,:shape,:number].each do
			|attr|
			if set_card1[attr]==set_card2[attr]
				assert_true set_card2[attr]==set_card3[attr]
			else
				assert_false set_card1[attr]==set_card2[attr]
				assert_false set_card2[attr]==set_card3[attr]
				assert_false set_card1[attr]==set_card3[attr]
			end
		end
	end
	
	def test_find_set_5
		game = SetGame.new
		game.get_deck
		game.top_card = 0
		game.shuffle
		game.get_hand
		
		set_card1,set_card2,set_card3 = game.find_set
		
		[:color,:shading,:shape,:number].each do
			|attr|
			if set_card1[attr]==set_card2[attr]
				assert_true set_card2[attr]==set_card3[attr]
			else
				assert_false set_card1[attr]==set_card2[attr]
				assert_false set_card2[attr]==set_card3[attr]
				assert_false set_card1[attr]==set_card3[attr]
			end
		end
	end
end
