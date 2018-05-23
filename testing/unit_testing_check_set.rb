#Author: Mike
#Creation Date: 5/23

require_relative "../check_set"
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
		1. 3-3-1-3 True
		2. 1-3-3-3 True
		3. 3-2-1-3 False
		4. 2-3-2-3 False
		5. 1-1-1-1 True
		6. 2-2-2-2 False
=end
	
	$hand=[]
	i=0
	number_index=0
	$card = Struct.new(:color,:shading,:symbol,:number)
	for color_index in 0..1
		for shading_index in 0..1
			for symbol_index in 0..2
				$hand[i]=$card.new($Colors[color_index], $Shadings[shading_index], $Symbols[symbol_index], $Numbers[number_index])
				i += 1
			end
		end
	end
	$hand.push($card.new("green","open","oval","2"))
	$hand.push($card.new("purpul","solid","squiggle","3"))
	$hand.push($card.new("green","striped","diamond","1"))
	
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

	#Check 3-3-1-3 case
	def test_check_set_1
		#	0: red, striped, diamond, 1
		#	1: red, striped, squiggle, 1
		#	2: red, striped, oval, 1
		assert_true(check_set?([0,1,2],$hand))
	end
	
	#Check 1-3-3-3
	def test_check_set_2
		#	0: red, striped, diamond, 1
		#	6: purple, striped, diamond, 1
		#	14: green, striped, diamond, 1
		assert_true(check_set?([0,6,14],$hand))
	end
	
	#Check 3-2-1-3 case
	def test_check_set_3
		#	1: red, striped, squiggle, 1
		#	2: red, striped, oval, 1
		#	3: red, solid, diamond, 1
		assert_false(check_set?([1,2,3],$hand))
	end
	
	#Check 2-3-2-3 case
	def test_check_set_4
		#	1: red, striped, squiggle, 1
		#	7: purple, striped, squiggle, 1
		#	8: purple, striped, oval, 1
		assert_false(check_set?([1,7,8],$hand))
	end
	
	#Check 1-1-1-1 case
	def test_check_set_5
		#	0: red, striped, diamond, 1
		#	12: green, open, oval, 2
		#	13: purpul, solid, squiggle, 3
		assert_true(check_set?([0,12,13],$hand))
	end
	
	#Check 2-2-2-2 case
	def test_check_set_6
		#	0: red, striped, diamond, 1
		#	6: purple, striped, diamond, 1
		#	13: purpul, solid, squiggle, 3
		assert_false(check_set?([0,6,13],$hand))
	end
	
end
