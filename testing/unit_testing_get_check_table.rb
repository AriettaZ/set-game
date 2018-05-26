#Author: Mike
#Creation Date: 5/25

require_relative "../set_game"
require "test/unit"

class TestGetCheckTable < Test::Unit::TestCase
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

		score = [["color",4.0],["shading",7.0],["symbol",8.0],["number",7.0]]

		assert_equal([[card1, card3, card4],[card1, card3, card5], [card1, card4, card5], [card3, card4, card5]],SetGame.new.get_check_table(hand_stat, score))

	end
end