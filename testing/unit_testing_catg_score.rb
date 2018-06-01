#Author: Mike
#Creation Date: 5/25

require_relative "../set_game"
require "test/unit"

=begin
	Test plan:
		1.catg_set from 6 cards
		2.catg_set from 12 cards
		3.catg_set from 21 cards
		4.catg_set from 21 cards, catg_score have 0 entry
=end

class TestGetScore < Test::Unit::TestCase
	def test_catg_set_1

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
		
		assert_equal([["color", 4.0], ["shading", 7.0], ["symbol", 8.0], ["number", 7.0]],SetGame.new.catg_set(hand_stat))
	end
	
	def test_catg_set_2
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
		
		hand_stat = {
			red: [card1, card2, card3, card4, card5,card6,card7,card8,card9,card10,card11,card12],
			purple: [],
			green: [],
			striped:[card1, card2, card3, card4, card5,card6,card7,card8,card9],
			solid: [card10,card11,card12],
			open: [],
			diamond:[card1,card2,card3,card10,card11,card12],
			squiggle:[card4,card5,card6],
			oval: [card7,card8,card9],
			"1":[card1,card4,card7,card10],
			"2":[card2,card5,card8,card11],
			"3":[card3,card6,card9,card12]
		}
		assert_equal([["color", 220.0],["shading", 85.0], ["symbol", 76.0], ["number", 76.0]],SetGame.new.catg_set(hand_stat))
	end
	
	def test_catg_set_3
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
		card13 = Card.new('purple','solid','diamond','3')
		card14 = Card.new('green','solid','diamond','1')
		card15 = Card.new('green','solid','diamond','3')
		card16 = Card.new('green','solid','oval','2')
		card17 = Card.new('purple','open','diamond','3')
		card18 = Card.new('purple','solid','squiggle','3')
		card19 = Card.new('purple','open','diamond','1')
		card20 = Card.new('green','open','squiggle','3')
		card21 = Card.new('green','solid','oval','3')
		
		
		hand_stat = {
			red: [card1, card2, card3, card4, card5,card6,card7,card8,card9,card10,card11,card12],
			purple: [card13, card17, card18, card19],
			green: [card14, card15, card16, card20, card21],
			striped:[card1, card2, card3, card4, card5,card6,card7,card8,card9],
			solid: [card10,card11,card12, card13, card14, card15, card16, card18, card21],
			open: [card19, card20],
			diamond:[card1,card2,card3,card10,card11,card12,card13, card14, card15, card17, card19],
			squiggle:[card4,card5,card6, card18, card20],
			oval: [card7,card8,card9,card16,card21],
			"1":[card1,card4,card7,card10,card14, card19],
			"2":[card2,card5,card8,card11, card16],
			"3":[card3,card6,card9,card12, card13, card15, card17, card18, card20, card21]
		}
		assert_equal([["color", 474.0],["shading", 330.0], ["symbol", 460.0], ["number", 450.0]],SetGame.new.catg_set(hand_stat))
	end
	
	def test_catg_set_4

		card1 = Card.new("red","solid","squiggle","3")
		card2 = Card.new("green","striped","squiggle","2")
		card3 = Card.new("red","solid","diamond","1")
		card6 = Card.new("green","open","oval","1")
		
		hand_stat = {
			red: [card1,card3],
			purple: [],
			green: [card2,card6],
			striped: [card2],
			solid: [card1,card3],
			open: [card6],
			diamond: [card3],
			squiggle: [card1,card2],
			oval: [card6],
			'1': [card3,card6],
			'2': [card2],
			'3': [card1]
		}
		
		assert_equal([["color", 0.0], ["shading", 2.0], ["symbol", 2.0], ["number", 2.0]],SetGame.new.catg_set(hand_stat))
	end

end