#Author: Mike
#Creation Date: 5/23
#Edit: Mike 5/25

require_relative "../set_game"
require "test/unit"

class TestSetExist < Test::Unit::TestCase

=begin
	$Colors=['red','purple','green']
	$Shadings=['striped','solid','open']
	$Symbols=['diamond','squiggle','oval']
	$Numbers=['1','2','3']

	Test Plan:
		1. hand_stat_table=
			[
				[[card1, card3, card4, card5],[],[card2, card6]],
				[[card2],[card1,card3,card5],[card4,card6]],
				[[card3,card4],[card1,card2],[card5,card6]]
				[[card3,card4,card6],[card2,card5],[card1]]
			]
			score = [["color",4],["shading",7],["symbol",8],["number",7]]

		2. hand_stat_table =
			[
				[[card1, card2],[card3,card4],[card5,card6,card7]],
				[[card3,card5,card6,card7],[card1,card2],[card4]],
				[[card5],[card1,card4,card6,card7],[card2,card3]]
				[[card1,card5],[card3,card4,card6],[card2,card7]]
			]
			score = [["color",15],["shading",12],["symbol",44],["number",13]]
=end

	def test_set_exist_1
		card1 = Card.new("red","solid","squiggle","3")
		card2 = Card.new("green","striped","squiggle","2")
		card3 = Card.new("red","solid","diamond","1")
		card4 = Card.new("red","open","diamond","1")
		card5 = Card.new("red","solid","oval","2")
		card6 = Card.new("green","open","oval","1")
		check_table = [[card1,card3,card4],[card1,card3,card5],[card1,card4,card5]]

		score = [["color",4],["shading",7],["symbol",8],["number",7]]

=begin
		hand_stat_table
		[
			[[card1, card3, card4, card5],[],[card2, card6]],
			[[card2],[card1,card3,card5],[card4,card6]],
			[[card3,card4],[card1,card2],[card5,card6]]
			[[card3,card4,card6],[card2,card5],[card1]]
		]
=end
<<<<<<< HEAD

		assert_equal([card1,card3,card5],set_exist(check_table,score))
=======
	
		assert_equal([card1,card3,card5],SetGame.new.set_exist(check_table,score))
>>>>>>> cb7bd44a56aa8a72c79f030a646779db23dfb12b
	end

	def test_set_exist_2
<<<<<<< HEAD
		card = Struct.new(:color,:shading,:symbol,:number)
		card1 = card.new("red","solid","squiggle","1")
		card2 = card.new("red","solid","oval","3")
		card3 = card.new("purple","striped","oval","2")
		card4 = card.new("purple","open","squiggle","2")
		card5 = card.new("green","striped","diamond","1")
		card6 = card.new("green","striped","squiggle","2")
		card7 = card.new("green","striped","squiggle","3")

=======
		card1 = Card.new("red","solid","squiggle","1")
		card2 = Card.new("red","solid","oval","3")
		card3 = Card.new("purple","striped","oval","2")
		card4 = Card.new("purple","open","squiggle","2")
		card5 = Card.new("green","striped","diamond","1")
		card6 = Card.new("green","striped","squiggle","2")
		card7 = Card.new("green","striped","squiggle","3")
		
>>>>>>> cb7bd44a56aa8a72c79f030a646779db23dfb12b
		check_table = [[card3,card5,card6],[card3,card5,card7],[card3,card6,card7],[card5,card6,card7],[card1,card3,card4],[card2,card3,card4],[card1,card4,card5],[card2,card4,card5],[card1,card4,card6],[card2,card4,card6],[card1,card4,card7],[card2,card4,card7]]

		score = [["color",15],["shading",12],["symbol",44],["number",13]]

=begin
		hand_stat_table
		[
			[[card1, card2],[card3,card4],[card5,card6,card7]],
			[[card3,card5,card6,card7],[card1,card2],[card4]],
			[[card5],[card1,card4,card6,card7],[card2,card3]]
			[[card1,card5],[card3,card4,card6],[card2,card7]]
		]
=end
<<<<<<< HEAD

		assert_equal([card2,card4,card5],set_exist(check_table,score))
=======
	
		assert_equal([card2,card4,card5],SetGame.new.set_exist(check_table,score))
>>>>>>> cb7bd44a56aa8a72c79f030a646779db23dfb12b
	end

end
