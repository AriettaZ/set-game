#Author: Mike
#Creation Date: 5/23
#Edit: Mike 5/

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
			10. 4. 2-3-2-3 False
=end

	$hand=[]
	i=0
	number_index=0
	for color in ["red","purple"]
		for shading in ["striped","solid"]
			for symbol in $Symbols
				$hand[i]=Card.new(color, shading, symbol, "1")
				i += 1
			end
		end
	end

	$hand.push(Card.new("green","open","oval","2"))
	$hand.push(Card.new("purpul","solid","squiggle","3"))
	$hand.push(Card.new("green","striped","diamond","1"))
	$hand.push(Card.new("green","striped","quiggle","2"))

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
		#	0: red, striped, diamond, 1
		#	1: red, striped, squiggle, 1
		#	2: red, striped, oval, 1
		assert_true(SetGame.new.check_set?($hand[0],$hand[1],$hand[2],order))
	end

	#Check 1-3-3-3
	def test_check_set_2
		order = ["color","shading","symbol","number"]
		#	0: red, striped, diamond, 1
		#	6: purple, striped, diamond, 1
		#	14: green, striped, diamond, 1
		assert_true(SetGame.new.check_set?($hand[0],$hand[6],$hand[14],order))
	end

	#Check 3-2-1-3 case
	def test_check_set_3
		order = ["color","shading","symbol","number"]
		#	1: red, striped, squiggle, 1
		#	2: red, striped, oval, 1
		#	3: red, solid, diamond, 1
		assert_false(SetGame.new.check_set?($hand[1],$hand[2],$hand[3],order))
	end

	#Check 2-3-2-3 case
	def test_check_set_4
		order = ["color","shading","symbol","number"]
		#	1: red, striped, squiggle, 1
		#	7: purple, striped, squiggle, 1
		#	8: purple, striped, oval, 1
		assert_false(SetGame.new.check_set?($hand[1],$hand[7],$hand[8],order))
	end

	#Check 1-1-1-1 case
	def test_check_set_5
		order = ["color","shading","symbol","number"]
		#	0: red, striped, diamond, 1
		#	12: green, open, oval, 2
		#	13: purpul, solid, squiggle, 3
		assert_true(SetGame.new.check_set?($hand[0],$hand[12],$hand[13],order))
	end

	#Check 2-2-2-2 case
	def test_check_set_6
		order = ["color","shading","symbol","number"]
		#	0: red, striped, diamond, 1
		#	6: purple, striped, diamond, 1
		#	13: purpul, solid, squiggle, 3
		assert_false(SetGame.new.check_set?($hand[0],$hand[6],$hand[13],order))
	end

	#Check 3-3-1-3 case
	def test_check_set_7
		order = ["shading","number","color","symbol"]
		#	0: red, striped, diamond, 1
		#	1: red, striped, squiggle, 1
		#	2: red, striped, oval, 1
		assert_true(SetGame.new.check_set?($hand[0],$hand[1],$hand[2],order))
	end

	#Check 1-1-1-1 case
	def test_check_set_8
		order = ["shading","number","color","symbol"]
		#	0: red, striped, diamond, 1
		#	12: green, open, oval, 2
		#	13: purpul, solid, squiggle, 3
		assert_true(SetGame.new.check_set?($hand[0],$hand[12],$hand[13],order))
	end

	#Check 3-2-1-3 case
	def test_check_set_9
		order = ["color"]
		#	1: red, striped, squiggle, 1
		#	2: red, striped, oval, 1
		#	3: red, solid, diamond, 1
		assert_true(SetGame.new.check_set?($hand[1],$hand[2],$hand[3],order))
	end

	#Check 2-3-2-3 case
	def test_check_set_10
		order = ["color"]
		#	1: red, striped, squiggle, 1
		#	7: purple, striped, squiggle, 1
		#	8: purple, striped, oval, 1
		assert_false(SetGame.new.check_set?($hand[1],$hand[7],$hand[8],order))
	end

end
