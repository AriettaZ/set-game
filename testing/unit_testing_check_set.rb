#Author: Mike
#Creation Date: 5/23
#Edit: Mike 5/25
#Edit: Mike 5/27

require_relative "../set_game"
require "test/unit"

class TestCheckSet < Test::Unit::TestCase

=begin
	Notation:
		a-b-c-d
		where a is the number of cards with same color
		where b is the number of cards with same shading
		where a is the number of cards with same symbol
		where a is the number of cards with same number

	Test Plan:
		order = ["color","shading","symbol","number"]
			1. 3-3-1-3 True
			2. 1-3-3-3 True
			3. 3-2-1-3 False
			4. 2-3-2-3 False
			5. 1-1-1-1 True
			6. 2-2-2-2 False
		order = ["shading","number","color","symbol"]
			7. 3-3-1-3 True
			8. 1-1-1-1 True
		order = ["color"]
			9. 3-2-1-3 True
		order = ["number"]
			10. 3-3-1-2 False
			11. 2-2-2-3 True
=end
	$test_set=[]
	for color,shading,symbol in ["red","purple"].product(["striped","solid"],$Symbols)
		$test_set.push Card.new(color, shading, symbol, "1")
	end

	$test_set.push(Card.new("green","open","oval","2"))
	$test_set.push(Card.new("purpul","solid","squiggle","3"))
	$test_set.push(Card.new("green","striped","diamond","1"))
	$test_set.push(Card.new("green","striped","quiggle","2"))

	#	0: red, striped, diamond, 1
	#	1: red, striped, squiggle, 1
	#	2: red, striped, oval, 1
	#	3: red, solid, diamond, 1
	#	4: red, solid, squiggle, 1
	#	5: red, solid, oval, 1
	#	6: purple, striped, diamond, 1
	#	7: purple, striped, squiggle, 1
	#	8: purple, striped, oval, 1
	#	9: purple, solid, diamond, 1
	#	10: purple, solid, squiggle, 1
	#	11: purple, solid, oval, 1
	#	12: green, open, oval, 2
	#	13: purpul, solid, squiggle, 3
	#	14: green, striped, diamond, 1
	#	15: green, striped, squiggle, 2

	#Check 3-3-1-3 case
	def test_check_set_1
		order = ["color","shading","symbol","number"]
		card1 = Card.new("red","striped","diamond","1")
		card2 = Card.new("red","striped","squiggle","1")
		card3 = Card.new("red","striped","oval","1")
		assert_true(SetGame.new.check_set?(card1,card2,card3,order))
	end

	#Check 1-3-3-3
	def test_check_set_2
		order = ["color","shading","symbol","number"]
		card1 = Card.new("red","striped","diamond","1")
		card2 = Card.new("purple","striped","diamond","1")
		card3 = Card.new("green","striped","diamond","1")
		assert_true(SetGame.new.check_set?(card1,card2,card3,order))
	end

	#Check 3-2-1-3 case
	def test_check_set_3
		order = ["color","shading","symbol","number"]
		card1 = Card.new("red","striped","squiggle","1")
		card2 = Card.new("red","striped","oval","1")
		card3 = Card.new("red","solid","diamond","1")
		assert_false(SetGame.new.check_set?(card1,card2,card3,order))
	end

	#Check 2-3-2-3 case
	def test_check_set_4
		order = ["color","shading","symbol","number"]
		card1 = Card.new("red","striped","squiggle","1")
		card2 = Card.new("purple","striped","squiggle","1")
		card3 = Card.new("purple","striped","oval","1")
		assert_false(SetGame.new.check_set?(card1,card2,card3,order))
	end

	#Check 1-1-1-1 case
	def test_check_set_5
		order = ["color","shading","symbol","number"]
		card1 = Card.new("red","striped","diamond","1")
		card2 = Card.new("green","open","oval","2")
		card3 = Card.new("purple","solid","squiggle","3")
		assert_true(SetGame.new.check_set?(card1,card2,card3,order))
	end

	#Check 2-2-2-2 case
	def test_check_set_6
		order = ["color","shading","symbol","number"]
		card1 = Card.new("red","striped","diamond","1")
		card2 = Card.new("purple","striped","diamond","1")
		card3 = Card.new("purple","solid","squiggle","3")
		assert_false(SetGame.new.check_set?(card1,card2,card3,order))
	end

	#Check 3-3-1-3 case
	def test_check_set_7
		order = ["shading","number","color","symbol"]
		card1 = Card.new("red","striped","diamond","1")
		card2 = Card.new("red","striped","oval","1")
		card3 = Card.new("red","striped","squiggle","1")
		assert_true(SetGame.new.check_set?(card1,card2,card3,order))
	end

	#Check 1-1-1-1 case
	def test_check_set_8
		order = ["shading","number","color","symbol"]
		card1 = Card.new("red","striped","diamond","1")
		card2 = Card.new("green","open","oval","2")
		card3 = Card.new("purpul","solid","squiggle","3")
		assert_true(SetGame.new.check_set?(card1,card2,card3,order))
	end

	#Check 3-2-1-3 case
	def test_check_set_9
		order = ["color"]
		card1 = Card.new("red","striped","squiggle","1")
		card2 = Card.new("red","striped","oval","1")
		card3 = Card.new("red","solid","diamond","1")
		assert_true(SetGame.new.check_set?(card1,card2,card3,order))
	end

	#Check 3-3-1-2 case
	def test_check_set_10
		order = ["number"]
		card1 = Card.new("red","striped","squiggle","1")
		card2 = Card.new("red","striped","diamond","1")
		card3 = Card.new("red","striped","oval","3")
		assert_false(SetGame.new.check_set?(card1,card2,card3,order))
	end

	#Check 2-2-2-3 case
	def test_check_set_10
		order = ["number"]
		card1 = Card.new("red","striped","diamon","2")
		card2 = Card.new("red","solid","diamond","2")
		card3 = Card.new("purple","striped","oval","2")
		assert_true(SetGame.new.check_set?(card1,card2,card3,order))
	end

end
