=begin
	Author: Ariel
	Created: 5/22
	Edit: Gail 5/30
	Test Plan (use deck.size = 24):
	- User chooses to quit the game (user_input = ["quit"])
	- Replace 3 cards in hand when hand.size == 12 and top_card < deck.size
		1. hand.size = 12, top_card = 12, replace first 3 consecutive cards in hand
		2. hand.size = 12, top_card = 15, replace first 3 consecutive cards in hand
		3. hand.size = 12, top_card = 15, replace 3 inconsecutive cards in hand
		4. hand.size = 12, top_card = 18, replace 3 inconsecutive cards in hand
		5. hand.size = 12, top_card = 12, replace last 3 consecutive cards in hand
		6. hand.size = 12, top_card = 18, replace last 3 consecutive cards in hand
	- Remove 3 cards in hand when hand.size != 12 or top_card == deck.size
		1. hand.size = 3, top_card = 24
		2. hand.size = 9, top_card = 24, remove first 3 consecutive cards in hand
		3. hand.size = 9, top_card = 24, remove 3 inconsecutive cards in hand
		4. hand.size = 9, top_card = 24, remove last 3 consecutive cards in hand
		5. hand.size = 12, top_card = 24, remove first 3 consecutive cards in hand
		6. hand.size = 12, top_card = 24, remove 3 inconsecutive cards in hand
		7. hand.size = 12, top_card = 24, remove last 3 consecutive cards in hand
		8. hand.size = 18, top_card = 18, remove first 3 consecutive cards in hand
		9. hand.size = 18, top_card = 18, remove 3 inconsecutive cards in hand
		10. hand.size = 18, top_card = 21, remove 3 inconsecutive cards in hand
		11. hand.size = 18, top_card = 24, remove last 3 consecutive cards in hand
=end

require_relative "../set_game"
require "test/unit"

class Testupdate < Test::Unit::TestCase

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
	CARD19 = Card.new('purple','solid','oval','1')
	CARD20 = Card.new('purple','solid','oval','2')
	CARD21 = Card.new('purple','solid','oval','3')
	CARD22 = Card.new('purple','solid','diamond','1')
	CARD23 = Card.new('purple','solid','diamond','2')
	CARD24 = Card.new('purple','solid','diamond','3')
	DECK = [CARD1, CARD2, CARD3, CARD4, CARD5, CARD6, CARD7, CARD8, CARD9, CARD10, CARD11, CARD12, CARD13, CARD14, CARD15, CARD16, CARD17, CARD18, CARD19, CARD20, CARD21, CARD22, CARD23, CARD24]
	HAND12 = [CARD1, CARD2, CARD3, CARD4, CARD5, CARD6, CARD7, CARD8, CARD9, CARD10, CARD11, CARD12]
	HAND15 = [CARD1, CARD2, CARD3, CARD4, CARD5, CARD6, CARD7, CARD8, CARD9, CARD10, CARD11, CARD12, CARD13, CARD14, CARD15, CARD16, CARD17, CARD18]

	# User chooses to quit the game (user_input = ["quit"])
	def test_quit_1
		game = SetGame.new
		actual_output = File.new 'update_output/actual_quit_output1.txt', 'w'
		$stdout = actual_output
		game.deck = DECK
		game.hand = [CARD3, CARD4, CARD1, CARD8, CARD2, CARD6, CARD5, CARD9, CARD7, CARD11, CARD10, CARD12]
		user_input = ["quit"]
		game.top_card = 12
		game.number_of_hint = 0
		game.number_of_correct = 0
		game.number_of_wrong = 0
		game.username = "name"
		game.total_hint = 0
		game.is_end = false
		game.update user_input
		assert_equal 12, game.hand.size
		assert_equal 12, game.top_card
		actual_output.close
		assert_true FileUtils.compare_file('update_output/expected_quit_output1.txt', 'update_output/actual_quit_output1.txt')
		assert_equal CARD3, game.hand[0]
		assert_equal CARD4, game.hand[1]
		assert_equal CARD1, game.hand[2]
		assert_equal CARD8, game.hand[3]
		assert_equal CARD2, game.hand[4]
		assert_equal CARD6, game.hand[5]
		assert_equal CARD5, game.hand[6]
		assert_equal CARD9, game.hand[7]
		assert_equal CARD7, game.hand[8]
		assert_equal CARD11, game.hand[9]
		assert_equal CARD10, game.hand[10]
		assert_equal CARD12, game.hand[11]
		assert_equal true, game.is_end
	end

	# Replace Case 1: hand.size = 12, top_card = 12, replace first 3 consecutive cards in hand
	def test_replace_first3_1
		game = SetGame.new
		actual_output = File.new 'update_output/actual_replace_output1.txt', 'w'
		$stdout = actual_output
		game.deck = DECK
		game.hand = [CARD1, CARD2, CARD3, CARD4, CARD5, CARD6, CARD7, CARD8, CARD9, CARD10, CARD11, CARD12]
		user_input = [0,1,2]
		game.top_card = 12
		game.update user_input
		assert_equal 12, game.hand.size
		assert_equal 15, game.top_card
		actual_output.close
		assert_true FileUtils.compare_file('update_output/expected_replace_output1.txt', 'update_output/actual_replace_output1.txt')
		assert_equal CARD13, game.hand[0]
		assert_equal CARD14, game.hand[1]
		assert_equal CARD15, game.hand[2]
		assert_equal CARD4, game.hand[3]
		assert_equal CARD5, game.hand[4]
		assert_equal CARD6, game.hand[5]
		assert_equal CARD7, game.hand[6]
		assert_equal CARD8, game.hand[7]
		assert_equal CARD9, game.hand[8]
		assert_equal CARD10, game.hand[9]
		assert_equal CARD11, game.hand[10]
		assert_equal CARD12, game.hand[11]
		assert_equal false, game.is_end
	end

	# Replace Case 2: hand.size = 12, top_card = 15, replace first 3 consecutive cards in hand
	def test_replace_first3_2
		game = SetGame.new
		actual_output = File.new 'update_output/actual_replace_output2.txt', 'w'
		$stdout = actual_output
		game.deck = DECK
		game.hand = [CARD1, CARD2, CARD3, CARD4, CARD5, CARD6, CARD7, CARD8, CARD9, CARD10, CARD11, CARD12]
		user_input = [0,1,2]
		game.top_card = 15
		game.update user_input
		assert_equal 12, game.hand.size
		assert_equal 18, game.top_card
		actual_output.close
		assert_true FileUtils.compare_file('update_output/expected_replace_output2.txt', 'update_output/actual_replace_output2.txt')
		assert_equal CARD16, game.hand[0]
		assert_equal CARD17, game.hand[1]
		assert_equal CARD18, game.hand[2]
		assert_equal CARD4, game.hand[3]
		assert_equal CARD5, game.hand[4]
		assert_equal CARD6, game.hand[5]
		assert_equal CARD7, game.hand[6]
		assert_equal CARD8, game.hand[7]
		assert_equal CARD9, game.hand[8]
		assert_equal CARD10, game.hand[9]
		assert_equal CARD11, game.hand[10]
		assert_equal CARD12, game.hand[11]
		assert_equal false, game.is_end
	end

	# Replace Case 3: hand.size = 12, top_card = 15, replace 3 inconsecutive cards in hand
	def test_replace_inconsecutive3_1
		game = SetGame.new
		actual_output = File.new 'update_output/actual_replace_output3.txt', 'w'
		$stdout = actual_output
		game.deck = DECK
		game.hand = [CARD1, CARD2, CARD3, CARD4, CARD5, CARD6, CARD7, CARD8, CARD9, CARD10, CARD11, CARD12]
		user_input = [1,4,7]
		game.top_card = 15
		game.update user_input
		assert_equal 12, game.hand.size
		assert_equal 18, game.top_card
		actual_output.close
		assert_true FileUtils.compare_file('update_output/expected_replace_output3.txt', 'update_output/actual_replace_output3.txt')
		assert_equal CARD1, game.hand[0]
		assert_equal CARD16, game.hand[1]
		assert_equal CARD3, game.hand[2]
		assert_equal CARD4, game.hand[3]
		assert_equal CARD17, game.hand[4]
		assert_equal CARD6, game.hand[5]
		assert_equal CARD7, game.hand[6]
		assert_equal CARD18, game.hand[7]
		assert_equal CARD9, game.hand[8]
		assert_equal CARD10, game.hand[9]
		assert_equal CARD11, game.hand[10]
		assert_equal CARD12, game.hand[11]
		assert_equal false, game.is_end
	end

	# Replace Case 4: hand.size = 12, top_card = 18, replace 3 inconsecutive cards in hand
	def test_replace_inconsecutive3_2
		game = SetGame.new
		actual_output = File.new 'update_output/actual_replace_output4.txt', 'w'
		$stdout = actual_output
		game.deck = DECK
		game.hand = [CARD1, CARD2, CARD3, CARD4, CARD5, CARD6, CARD7, CARD8, CARD9, CARD10, CARD11, CARD12]
		user_input = [0,3,6]
		game.top_card = 18
		game.update user_input
		assert_equal 12, game.hand.size
		assert_equal 21, game.top_card
		actual_output.close
		assert_true FileUtils.compare_file('update_output/expected_replace_output4.txt', 'update_output/actual_replace_output4.txt')
		assert_equal CARD19, game.hand[0]
		assert_equal CARD2, game.hand[1]
		assert_equal CARD3, game.hand[2]
		assert_equal CARD20, game.hand[3]
		assert_equal CARD5, game.hand[4]
		assert_equal CARD6, game.hand[5]
		assert_equal CARD21, game.hand[6]
		assert_equal CARD8, game.hand[7]
		assert_equal CARD9, game.hand[8]
		assert_equal CARD10, game.hand[9]
		assert_equal CARD11, game.hand[10]
		assert_equal CARD12, game.hand[11]
		assert_equal false, game.is_end
	end

	# Replace Case 5: hand.size = 12, top_card = 12, replace last 3 consecutive cards in hand
	def test_replace_last3_1
		game = SetGame.new
		actual_output = File.new 'update_output/actual_replace_output5.txt', 'w'
		$stdout = actual_output
		game.deck = DECK
		game.hand = [CARD1, CARD2, CARD3, CARD4, CARD5, CARD6, CARD7, CARD8, CARD9, CARD10, CARD11, CARD12]
		user_input = [9,10,11]
		game.top_card = 12
		game.update user_input
		assert_equal 12, game.hand.size
		assert_equal 15, game.top_card
		actual_output.close
		assert_true FileUtils.compare_file('update_output/expected_replace_output5.txt', 'update_output/actual_replace_output5.txt')
		assert_equal CARD1, game.hand[0]
		assert_equal CARD2, game.hand[1]
		assert_equal CARD3, game.hand[2]
		assert_equal CARD4, game.hand[3]
		assert_equal CARD5, game.hand[4]
		assert_equal CARD6, game.hand[5]
		assert_equal CARD7, game.hand[6]
		assert_equal CARD8, game.hand[7]
		assert_equal CARD9, game.hand[8]
		assert_equal CARD13, game.hand[9]
		assert_equal CARD14, game.hand[10]
		assert_equal CARD15, game.hand[11]
		assert_equal false, game.is_end
	end

	# Replace Case 6: hand.size = 12, top_card = 18, replace last 3 consecutive cards in hand
	def test_replace_last3_2
		game = SetGame.new
		actual_output = File.new 'update_output/actual_replace_output6.txt', 'w'
		$stdout = actual_output
		game.deck = DECK
		game.hand = [CARD1, CARD2, CARD3, CARD4, CARD5, CARD6, CARD7, CARD8, CARD9, CARD10, CARD11, CARD12]
		user_input = [9,10,11]
		game.top_card = 18
		game.update user_input
		assert_equal 12, game.hand.size
		assert_equal 21, game.top_card
		actual_output.close
		assert_true FileUtils.compare_file('update_output/expected_replace_output6.txt', 'update_output/actual_replace_output6.txt')
		assert_equal CARD1, game.hand[0]
		assert_equal CARD2, game.hand[1]
		assert_equal CARD3, game.hand[2]
		assert_equal CARD4, game.hand[3]
		assert_equal CARD5, game.hand[4]
		assert_equal CARD6, game.hand[5]
		assert_equal CARD7, game.hand[6]
		assert_equal CARD8, game.hand[7]
		assert_equal CARD9, game.hand[8]
		assert_equal CARD19, game.hand[9]
		assert_equal CARD20, game.hand[10]
		assert_equal CARD21, game.hand[11]
		assert_equal false, game.is_end
	end

	# Remove Case 1: hand.size = 3, top_card = 24, remove 3 consecutive cards
	def test_remove_size3
		game = SetGame.new
		actual_output = File.new 'update_output/actual_remove_output1.txt', 'w'
		$stdout = actual_output
		game.deck = DECK
		game.hand = [CARD1, CARD2, CARD3]
		user_input = [0, 1, 2]
		game.top_card = 24
		game.update user_input
		assert_equal 0, game.hand.size
		assert_equal 24, game.top_card
		actual_output.close
		assert_true FileUtils.compare_file('update_output/expected_remove_output1.txt', 'update_output/actual_remove_output1.txt')
		assert_equal false, game.is_end
	end

	# Remove Case 2: hand.size = 3, top_card = 12,  remove 3 cards
	def test_remove_size3_1
		game = SetGame.new
		actual_output = File.new 'update_output/actual_remove_output2.txt', 'w'
		$stdout = actual_output
		game.deck = DECK
		game.hand = [CARD1, CARD2, CARD3,CARD4, CARD5, CARD6,CARD7, CARD8, CARD9,CARD10, CARD11, CARD12]
		user_input = [0, 3, 6]
		game.top_card = 12
		game.update user_input
		assert_equal 12, game.hand.size
		assert_equal 15, game.top_card
		actual_output.close
		assert_true FileUtils.compare_file('update_output/expected_remove_output2.txt', 'update_output/actual_remove_output2.txt')
		assert_equal CARD13, game.hand[0]
		assert_equal CARD2, game.hand[1]
		assert_equal CARD3, game.hand[2]
		assert_equal CARD14, game.hand[3]
		assert_equal CARD5, game.hand[4]
		assert_equal CARD6, game.hand[5]
		assert_equal CARD15, game.hand[6]
		assert_equal CARD8, game.hand[7]
		assert_equal CARD9, game.hand[8]
		assert_equal CARD10, game.hand[9]
		assert_equal CARD11, game.hand[10]
		assert_equal CARD12, game.hand[11]
		assert_equal false, game.is_end
	end

	# Same Case 1: hand.size = 12, top_card = 12, remain hand and top_of_card the same
	def test_remain_same_1
		game = SetGame.new
		actual_output = File.new 'update_output/actual_remain_same1.txt', 'w'
		$stdout = actual_output
		game.deck = DECK
		game.hand = [CARD1, CARD2, CARD3, CARD4, CARD5, CARD6, CARD7, CARD8, CARD9, CARD10, CARD11, CARD12]
		user_input = [9,7,8]
		game.top_card = 12
		game.update user_input
		assert_equal 12, game.hand.size
		assert_equal 12, game.top_card
		actual_output.close
		assert_true FileUtils.compare_file('update_output/expected_remain_same1.txt', 'update_output/actual_remain_same1.txt')
		assert_equal CARD1, game.hand[0]
		assert_equal CARD2, game.hand[1]
		assert_equal CARD3, game.hand[2]
		assert_equal CARD4, game.hand[3]
		assert_equal CARD5, game.hand[4]
		assert_equal CARD6, game.hand[5]
		assert_equal CARD7, game.hand[6]
		assert_equal CARD8, game.hand[7]
		assert_equal CARD9, game.hand[8]
		assert_equal CARD10, game.hand[9]
		assert_equal CARD11, game.hand[10]
		assert_equal CARD12, game.hand[11]
		assert_equal false, game.is_end
	end

	# Same case 2: hand.size = 3, top_card = 21, remain hand and top_of_card the same
	def test_remain_same_2
		game = SetGame.new
		actual_output = File.new 'update_output/actual_remain_same2.txt', 'w'
		$stdout = actual_output
		game.deck = DECK
		game.hand = [CARD1, CARD2, CARD3, CARD4, CARD5, CARD6, CARD7, CARD8, CARD9]
		user_input = [8,7,0]
		game.top_card = 24
		game.update user_input
		assert_equal 9, game.hand.size
		assert_equal 24, game.top_card
		actual_output.close
		assert_true FileUtils.compare_file('update_output/expected_remain_same2.txt', 'update_output/actual_remain_same2.txt')
		assert_equal CARD1, game.hand[0]
		assert_equal CARD2, game.hand[1]
		assert_equal CARD3, game.hand[2]
		assert_equal CARD4, game.hand[3]
		assert_equal CARD5, game.hand[4]
		assert_equal CARD6, game.hand[5]
		assert_equal CARD7, game.hand[6]
		assert_equal CARD8, game.hand[7]
		assert_equal CARD9, game.hand[8]
		assert_equal false, game.is_end
	end
end
