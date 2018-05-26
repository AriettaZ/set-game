=begin
	Author: Gail Chen
	Created: 5/23
	Edit: 5/24 Gail Chen modified contents in expected output text files
				corresponding to changes in show_hand method
	Test plan:
	1. hand.size = 0
	2. hand.size = 3
	3. hand.size = 6
	4. hand.size = 12
	5. hand.size = 18
=end

require_relative "../set_game"
require "test/unit"

class TestShowHand < Test::Unit::TestCase

	CARD1 = Card.new('red','open','oval','1')
	CARD2 = Card.new('red','open','oval','2')
	CARD3 = Card.new('red','open','oval','3')
	CARD4 = Card.new('purple','open','oval','1')
	CARD5 = Card.new('purple','open','oval','2')
	CARD6 = Card.new('purple','open','oval','3')
	CARD7 = Card.new('green','open','oval','1')
	CARD8 = Card.new('green','open','oval','2')
	CARD9 = Card.new('green','open','oval','3')
	CARD10 = Card.new('green','solid','oval','1')
	CARD11 = Card.new('green','solid','oval','2')
	CARD12 = Card.new('green','solid','oval','3')
	CARD13 = Card.new('red','solid','oval','1')
	CARD14 = Card.new('red','solid','oval','2')
	CARD15 = Card.new('red','solid','oval','3')
	CARD16 = Card.new('purple','solid','oval','1')
	CARD17 = Card.new('purple','solid','oval','2')
	CARD18 = Card.new('purple','solid','oval','3')

	# Case 1: hand.size = 0
	def test_show_hand_1
		actual_output = File.new 'show_hand_output/actual_output1.txt', 'w'
		$stdout = actual_output
		game = SetGame.new
		hand = []
		game.show_hand hand
		actual_output.close
		assert_true FileUtils.compare_file('show_hand_output/expected_output1.txt', 'show_hand_output/actual_output1.txt')
	end

	# Case 2: hand.size = 3
	def test_show_hand_2
		actual_output = File.new 'show_hand_output/actual_output2.txt', 'w'
		$stdout = actual_output
		game = SetGame.new
		hand = [CARD1, CARD3, CARD9]
		game.show_hand hand
		actual_output.close
		assert_true FileUtils.compare_file('show_hand_output/expected_output2.txt', 'show_hand_output/actual_output2.txt')
	end

	# Case 3: hand.size = 6
	def test_show_hand_3
		actual_output = File.new 'show_hand_output/actual_output3.txt', 'w'
		$stdout = actual_output
		game = SetGame.new
		hand = [CARD1, CARD3, CARD9, CARD2, CARD8, CARD5]
		game.show_hand hand
		actual_output.close
		assert_true FileUtils.compare_file('show_hand_output/expected_output3.txt', 'show_hand_output/actual_output3.txt')
	end

	# Case 4: hand.size = 12
	def test_show_hand_4
		actual_output = File.new 'show_hand_output/actual_output4.txt', 'w'
		$stdout = actual_output
		game = SetGame.new
		hand = [CARD1, CARD2, CARD15, CARD4, CARD6, CARD9, CARD3, CARD10, CARD7, CARD12, CARD14, CARD8]
		game.show_hand hand
		actual_output.close
		assert_true FileUtils.compare_file('show_hand_output/expected_output4.txt', 'show_hand_output/actual_output4.txt')
	end

	# Case 5: hand.size = 18
	def test_show_hand_5
		actual_output = File.new 'show_hand_output/actual_output5.txt', 'w'
		$stdout = actual_output
		game = SetGame.new
		hand = [CARD1, CARD8, CARD5, CARD4, CARD13, CARD6, CARD7, CARD2, CARD9, CARD10, CARD11, CARD12, CARD3, CARD14, CARD17, CARD16, CARD17, CARD15]
		game.show_hand hand
		actual_output.close
		assert_true FileUtils.compare_file('show_hand_output/expected_output5.txt', 'show_hand_output/actual_output5.txt')
	end

end
