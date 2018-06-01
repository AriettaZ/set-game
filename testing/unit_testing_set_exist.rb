#Author: Mike
#Creation Date: 5/23
#Edit: Mike 5/25

require_relative "../set_game"
require "test/unit"

class TestSetExist < Test::Unit::TestCase

=begin
	Test Plan:
		1. set_exist on check_table with 4 entries.
		2. set_exist on check_table with 12 entries
		3. set_exist on check_table with 11 entries but no set
		4. set_exist on check_table with 1 entry but no set
		5. set_exist on check_table with 2 entry and form a set
=end

	def test_set_exist_1
		card1 = Card.new("red","solid","squiggle","3")
		card2 = Card.new("green","striped","squiggle","2")
		card3 = Card.new("red","solid","diamond","1")
		card4 = Card.new("red","open","diamond","1")
		card5 = Card.new("red","solid","oval","2")
		card6 = Card.new("green","open","oval","1")

		check_table = [[card1,card3,card4],[card1,card3,card5],[card1,card4,card5],[card3,card4,card5]]
		catg_score = [["color",4],["shading",7],["symbol",8],["number",7]]

		assert_equal([card1,card3,card5],SetGame.new.set_exist(check_table,catg_score))
	end

	def test_set_exist_2

		card1 = Card.new("red","solid","squiggle","1")
		card2 = Card.new("red","solid","oval","3")
		card3 = Card.new("purple","striped","oval","2")
		card4 = Card.new("purple","open","squiggle","2")
		card5 = Card.new("green","striped","diamond","1")
		card6 = Card.new("green","striped","squiggle","2")
		card7 = Card.new("green","striped","squiggle","3")

		check_table = [[card3,card5,card6],[card3,card5,card7],[card3,card6,card7],[card5,card6,card7],[card1,card3,card4],[card2,card3,card4],[card1,card4,card5],[card2,card4,card5],[card1,card4,card6],[card2,card4,card6],[card1,card4,card7],[card2,card4,card7]]

		catg_score = [["color",15],["shading",12],["symbol",44],["number",13]]

		assert_equal([card2,card4,card5],SetGame.new.set_exist(check_table,catg_score))
	end

	def test_set_exist_3

		card1 = Card.new("red","solid","squiggle","3")
		card2 = Card.new("green","striped","squiggle","2")
		card3 = Card.new("red","solid","diamond","1")
		card4 = Card.new("purple","open","diamond","2")
		card5 = Card.new("red","solid","oval","2")
		card6 = Card.new("green","open","oval","1")
		card7 = Card.new("red","open","squiggle","2")

		catg_score = [["color", 12.0], ["shading", 11.0], ["symbol", 13.0], ["number", 12.0]]

		check_table = [[card1,card3,card5],[card4,card6,card7],[card2,card1,card4],[card2,card1,card6],[card2,card1,card7],[card2,card3,card4],[card2,card3,card6],[card2,card3,card7],[card2,card5,card4],[card2,card5,card6],[card2,card5,card7]]

		assert_equal([card1,card3,card5],SetGame.new.set_exist(check_table,catg_score))
	end

	def test_set_exist_4

		card1 = Card.new("red","solid","squiggle","3")
		card2 = Card.new("green","striped","squiggle","2")
		card3 = Card.new("red","solid","diamond","1")
		card6 = Card.new("green","open","oval","1")

		catg_score = [["color", 0.0], ["shading", 2.0], ["symbol", 2.0], ["number", 2.0]]
		check_table = []
		assert_equal([],SetGame.new.set_exist(check_table,catg_score))
	end

	def test_set_exist_5

		card1 = Card.new("red","solid","squiggle","3")
		card2 = Card.new("green","striped","oval","2")
		card3 = Card.new("red","solid","diamond","1")
		card4 = Card.new("red","open","diamond","2")

		catg_score = [["color", 1.0], ["shading", 2.0], ["symbol", 2.0], ["number", 2.0]]
		check_table = [[card1,card3,card4]]

		assert_equal([],SetGame.new.set_exist(check_table,catg_score))
	end

	def test_set_exist_6

		card1 = Card.new("red","solid","squiggle","3")
		card2 = Card.new("green","striped","oval","1")
		card3 = Card.new("red","solid","diamond","1")
		card4 = Card.new("purple","open","diamond","2")

		catg_score = [["color", 2.0], ["shading", 2.0], ["symbol", 2.0], ["number", 2.0]]
		check_table = [[card1,card4,card2],[card3,card4,card2]]

		assert_equal([card1,card4,card2],SetGame.new.set_exist(check_table,catg_score))
	end
end
