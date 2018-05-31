#Author: Mike
#Creation Date: 5/25

require_relative "../set_game"
require "test/unit"

class TestGetCheckTable < Test::Unit::TestCase

=begin
	Test Plan:
		1. find_set from a game with 6 cards in hand
		2. find_set from a game with known 7 cards in hand
		3. find_set from a game with 3 cards in hand, no check_table entry
		3. find_set from a game with 4 cards in hand, 1 check_table entry
=end
	def test_get_Check_Table_1
		card1 = Card.new("red","solid","squiggle","3")
		card2 = Card.new("green","striped","squiggle","2")
		card3 = Card.new("red","solid","diamond","1")
		card4 = Card.new("red","open","diamond","1")
		card5 = Card.new("red","solid","oval","2")
		card6 = Card.new("green","open","oval","1")

		hand_stat = {
			red: [card1,card3,card4,card5],
			purple: [],
			green: [card2,card6],
			striped: [card2],
			solid: [card1,card3,card5],
			open: [card4, card6],
			diamond: [card3,card4],
			squiggle: [card1,card2],
			oval: [card5,card6],
			'1': [card3,card4,card6],
			'2': [card2,card5],
			'3': [card1]
		}

		catg_score = [["color",4.0],["shading",7.0],["symbol",8.0],["number",7.0]]

		check_table = SetGame.new.get_check_table(hand_stat, catg_score)
		assert_equal 4,check_table.length
		assert_true check_table.include?([card1, card3, card4])
		assert_true check_table.include?([card1, card3, card5])
		assert_true check_table.include?([card1, card4, card5])
		assert_true check_table.include?([card3, card4, card5])
	end
	
	def test_get_Check_Table_2
		card1 = Card.new("red","solid","squiggle","3")
		card2 = Card.new("green","striped","squiggle","2")
		card3 = Card.new("red","solid","diamond","1")
		card4 = Card.new("purple","open","diamond","2")
		card5 = Card.new("red","solid","oval","2")
		card6 = Card.new("green","open","oval","1")
		card7 = Card.new("red","open","squiggle","2")

		hand_stat = {
			red: [card1,card3,card5,card7],
			purple: [card4],
			green: [card2,card6],
			striped: [card2],
			solid: [card1,card3,card5],
			open: [card4, card6,card7],
			diamond: [card3,card4],
			squiggle: [card1,card2,card7],
			oval: [card5,card6],
			'1': [card3,card6],
			'2': [card2,card4,card5,card7],
			'3': [card1]
		}
		catg_score = [["color", 12.0], ["shading", 11.0], ["symbol", 13.0], ["number", 12.0]]

		check_table = SetGame.new.get_check_table(hand_stat,catg_score)
		assert_equal 11,check_table.length
		assert_true check_table.include?([card1,card3,card5])
		assert_true check_table.include?([card4,card6,card7])
		assert_true check_table.include?([card2,card1,card4])
		assert_true check_table.include?([card2,card1,card6])
		assert_true check_table.include?([card2,card1,card7])
		assert_true check_table.include?([card2,card3,card4])
		assert_true check_table.include?([card2,card3,card6])
		assert_true check_table.include?([card2,card3,card7])
		assert_true check_table.include?([card2,card5,card4])
		assert_true check_table.include?([card2,card5,card6])
		assert_true check_table.include?([card2,card5,card7])
	end
	
	def test_get_Check_Table_3
		card1 = Card.new("red","solid","squiggle","3")
		card2 = Card.new("green","striped","squiggle","2")
		card3 = Card.new("red","solid","diamond","1")

		hand_stat = {
			red: [card1,card3],
			purple: [],
			green: [card2],
			striped: [card2],
			solid: [card1,card3],
			open: [],
			diamond: [card3],
			squiggle: [card1,card2],
			oval: [],
			'1': [card3],
			'2': [card2],
			'3': [card1]
		}
		catg_score = [["color", 0], ["shading", 0], ["symbol", 0.0], ["number", 1.0]]

		check_table = SetGame.new.get_check_table(hand_stat,catg_score)
		assert_equal 0,check_table.length
	end
	
	def test_get_Check_Table_4
		card1 = Card.new("red","solid","squiggle","3")
		card2 = Card.new("green","striped","oval","2")
		card3 = Card.new("red","solid","diamond","1")
		card4 = Card.new("red","open","diamond","2")

		hand_stat = {
			red: [card1,card3,card4],
			purple: [],
			green: [card2],
			striped: [card2],
			solid: [card1,card3],
			open: [card4],
			diamond: [card3,card4],
			squiggle: [card1],
			oval: [card2],
			'1': [card3],
			'2': [card2,card4],
			'3': [card1]
		}
		catg_score = [["color", 1.0], ["shading", 2.0], ["symbol", 2.0], ["number", 2.0]]

		check_table = SetGame.new.get_check_table(hand_stat,catg_score)
		assert_equal 1,check_table.length
		assert_true check_table.include?([card1,card3,card4])
	end

end
