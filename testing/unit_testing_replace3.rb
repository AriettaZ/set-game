=begin
	Author: Gail Chen
	Created: 5/23
	Edit: 5/24, 5/25 Gail Chen added more test cases to test modified replace3 method
	Unit testing for replace3 method:
	Requires:
		top_card and hand.size are multiples of 3,
		0 < hand.size <= 21, hand.size <= top_card <= deck.size,
		If hand.size < 12, then top_card must equals to deck.size.
	Updates:
		If hand.size == 12 and top_card < deck.size, replace 3 cards in hand as
		indicated by user_input, top_card += 3; otherwise, remove 3 cards from hand
		as indicated by user_input, hand.size -= 3.
	Returns: hand, top_card

	Test Plan (use deck.size = 24):
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
		8. hand.size = 15, top_card = 18, remove first 3 consecutive cards in hand
		9. hand.size = 15, top_card = 18, remove 3 inconsecutive cards in hand
		10. hand.size = 15, top_card = 24, remove 3 inconsecutive cards in hand
		11. hand.size = 15, top_card = 18, remove last 3 consecutive cards in hand
		12. hand.size = 18, top_card = 18, remove first 3 consecutive cards in hand
		13. hand.size = 18, top_card = 18, remove 3 inconsecutive cards in hand
		14. hand.size = 18, top_card = 21, remove 3 inconsecutive cards in hand
		15. hand.size = 18, top_card = 24, remove last 3 consecutive cards in hand
=end

require_relative "../set_game"
require "test/unit"

class TestReplace3 < Test::Unit::TestCase

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

	# Replace Case 1: hand.size = 12, top_card = 12, replace first 3 consecutive cards in hand
	def test_replace_first3_1
		game = SetGame.new
		hand = [CARD3, CARD4, CARD1, CARD8, CARD2, CARD6, CARD5, CARD9, CARD7, CARD11, CARD10, CARD12]
		user_input = [0, 1, 2]
		top_card = 12
		hand, top_card = game.replace3 DECK, hand, user_input, top_card
		assert_equal 12, hand.size
		assert_equal 15, top_card
		assert_equal CARD13, hand[0]
		assert_equal CARD14, hand[1]
		assert_equal CARD15, hand[2]
		assert_equal CARD8, hand[3]
		assert_equal CARD2, hand[4]
		assert_equal CARD6, hand[5]
		assert_equal CARD5, hand[6]
		assert_equal CARD9, hand[7]
		assert_equal CARD7, hand[8]
		assert_equal CARD11, hand[9]
		assert_equal CARD10, hand[10]
		assert_equal CARD12, hand[11]
	end

	# Replace Case 2: hand.size = 12, top_card = 15, replace first 3 consecutive cards in hand
	def test_replace_first3_2
		game = SetGame.new
		hand = [CARD3, CARD4, CARD1, CARD8, CARD2, CARD6, CARD5, CARD9, CARD7, CARD11, CARD10, CARD12]
		user_input = [0, 1, 2]
		top_card = 15
		hand, top_card = game.replace3 DECK, hand, user_input, top_card
		assert_equal 12, hand.size
		assert_equal 18, top_card
		assert_equal CARD16, hand[0]
		assert_equal CARD17, hand[1]
		assert_equal CARD18, hand[2]
		assert_equal CARD8, hand[3]
		assert_equal CARD2, hand[4]
		assert_equal CARD6, hand[5]
		assert_equal CARD5, hand[6]
		assert_equal CARD9, hand[7]
		assert_equal CARD7, hand[8]
		assert_equal CARD11, hand[9]
		assert_equal CARD10, hand[10]
		assert_equal CARD12, hand[11]
	end

	# Replace Case 3: hand.size = 12, top_card = 15, replace 3 inconsecutive cards in hand
	def test_replace_inconsecutive3_1
		game = SetGame.new
		hand = [CARD3, CARD4, CARD1, CARD8, CARD2, CARD6, CARD5, CARD9, CARD7, CARD11, CARD10, CARD12]
		user_input = [2, 5, 9]
		top_card = 15
		hand, top_card = game.replace3 DECK, hand, user_input, top_card
		assert_equal 12, hand.size
		assert_equal 18, top_card
		assert_equal CARD3, hand[0]
		assert_equal CARD4, hand[1]
		assert_equal CARD16, hand[2]
		assert_equal CARD8, hand[3]
		assert_equal CARD2, hand[4]
		assert_equal CARD17, hand[5]
		assert_equal CARD5, hand[6]
		assert_equal CARD9, hand[7]
		assert_equal CARD7, hand[8]
		assert_equal CARD18, hand[9]
		assert_equal CARD10, hand[10]
		assert_equal CARD12, hand[11]
	end

	# Replace Case 4: hand.size = 12, top_card = 18, replace 3 inconsecutive cards in hand
	def test_replace_inconsecutive3_2
		game = SetGame.new
		hand = [CARD3, CARD4, CARD1, CARD8, CARD2, CARD6, CARD5, CARD9, CARD7, CARD11, CARD10, CARD12]
		user_input = [3, 7, 11]
		top_card = 18
		hand, top_card = game.replace3 DECK, hand, user_input, top_card
		assert_equal 12, hand.size
		assert_equal 21, top_card
		assert_equal CARD3, hand[0]
		assert_equal CARD4, hand[1]
		assert_equal CARD1, hand[2]
		assert_equal CARD19, hand[3]
		assert_equal CARD2, hand[4]
		assert_equal CARD6, hand[5]
		assert_equal CARD5, hand[6]
		assert_equal CARD20, hand[7]
		assert_equal CARD7, hand[8]
		assert_equal CARD11, hand[9]
		assert_equal CARD10, hand[10]
		assert_equal CARD21, hand[11]
	end

	# Replace Case 5: hand.size = 12, top_card = 12, replace last 3 consecutive cards in hand
	def test_replace_last3_1
		game = SetGame.new
		hand = [CARD3, CARD4, CARD1, CARD8, CARD2, CARD6, CARD5, CARD9, CARD7, CARD11, CARD10, CARD12]
		user_input = [9, 10, 11]
		top_card = 12
		hand, top_card = game.replace3 DECK, hand, user_input, top_card
		assert_equal 12, hand.size
		assert_equal 15, top_card
		assert_equal CARD3, hand[0]
		assert_equal CARD4, hand[1]
		assert_equal CARD1, hand[2]
		assert_equal CARD8, hand[3]
		assert_equal CARD2, hand[4]
		assert_equal CARD6, hand[5]
		assert_equal CARD5, hand[6]
		assert_equal CARD9, hand[7]
		assert_equal CARD7, hand[8]
		assert_equal CARD13, hand[9]
		assert_equal CARD14, hand[10]
		assert_equal CARD15, hand[11]
	end

	# Replace Case 6: hand.size = 12, top_card = 18, replace last 3 consecutive cards in hand
	def test_replace_last3_2
		game = SetGame.new
		hand = [CARD3, CARD4, CARD1, CARD8, CARD2, CARD6, CARD5, CARD9, CARD7, CARD11, CARD10, CARD12]
		user_input = [9, 10, 11]
		top_card = 18
		hand, top_card = game.replace3 DECK, hand, user_input, top_card
		assert_equal 12, hand.size
		assert_equal 21, top_card
		assert_equal CARD3, hand[0]
		assert_equal CARD4, hand[1]
		assert_equal CARD1, hand[2]
		assert_equal CARD8, hand[3]
		assert_equal CARD2, hand[4]
		assert_equal CARD6, hand[5]
		assert_equal CARD5, hand[6]
		assert_equal CARD9, hand[7]
		assert_equal CARD7, hand[8]
		assert_equal CARD19, hand[9]
		assert_equal CARD20, hand[10]
		assert_equal CARD21, hand[11]
	end

	# Remove Case 1: hand.size = 3, top_card = 24, remove all 3 cards
	def test_remove_size3
		game = SetGame.new
		hand = [CARD3, CARD8, CARD6]
		user_input = [0, 1, 2]
		top_card = 24
		hand, top_card = game.replace3 DECK, hand, user_input, top_card
		assert_equal 0, hand.size
		assert_equal 24, top_card
	end

	# Remove Case 2: hand.size = 9, top_card = 24, remove first 3 consecutive cards in hand
	def test_remove_size9_first3
		game = SetGame.new
		hand = [CARD3, CARD4, CARD1, CARD8, CARD2, CARD7, CARD11, CARD10, CARD12]
		user_input = [0, 1, 2]
		top_card = 24
		hand, top_card = game.replace3 DECK, hand, user_input, top_card
		assert_equal 6, hand.size
		assert_equal 24, top_card
		assert_equal CARD8, hand[0]
		assert_equal CARD2, hand[1]
		assert_equal CARD7, hand[2]
		assert_equal CARD11, hand[3]
		assert_equal CARD10, hand[4]
		assert_equal CARD12, hand[5]
	end

	# Remove Case 3: hand.size = 9, top_card = 24, remove 3 inconsecutive cards in hand
	def test_remove_size9_inconsecutive3
		game = SetGame.new
		hand = [CARD3, CARD4, CARD1, CARD8, CARD2, CARD7, CARD11, CARD10, CARD12]
		user_input = [1, 3, 7]
		top_card = 24
		hand, top_card = game.replace3 DECK, hand, user_input, top_card
		assert_equal 6, hand.size
		assert_equal 24, top_card
		assert_equal CARD3, hand[0]
		assert_equal CARD1, hand[1]
		assert_equal CARD2, hand[2]
		assert_equal CARD7, hand[3]
		assert_equal CARD11, hand[4]
		assert_equal CARD12, hand[5]
	end

	# Remove Case 4: hand.size = 9, top_card = 24, remove last 3 consecutive cards in hand
	def test_remove_size9_last3
		game = SetGame.new
		hand = [CARD3, CARD4, CARD1, CARD8, CARD2, CARD7, CARD11, CARD10, CARD12]
		user_input = [6, 7, 8]
		top_card = 24
		hand, top_card = game.replace3 DECK, hand, user_input, top_card
		assert_equal 6, hand.size
		assert_equal 24, top_card
		assert_equal CARD3, hand[0]
		assert_equal CARD4, hand[1]
		assert_equal CARD1, hand[2]
		assert_equal CARD8, hand[3]
		assert_equal CARD2, hand[4]
		assert_equal CARD7, hand[5]
	end

	# Remove Case 5: hand.size = 12, top_card = 24, remove first 3 consecutive cards in hand
	def test_remove_size12_first3
		game = SetGame.new
		hand = [CARD3, CARD4, CARD1, CARD8, CARD2, CARD7, CARD11, CARD10, CARD12, CARD14, CARD9, CARD20]
		user_input = [0, 1, 2]
		top_card = 24
		hand, top_card = game.replace3 DECK, hand, user_input, top_card
		assert_equal 9, hand.size
		assert_equal 24, top_card
		assert_equal CARD8, hand[0]
		assert_equal CARD2, hand[1]
		assert_equal CARD7, hand[2]
		assert_equal CARD11, hand[3]
		assert_equal CARD10, hand[4]
		assert_equal CARD12, hand[5]
		assert_equal CARD14, hand[6]
		assert_equal CARD9, hand[7]
		assert_equal CARD20, hand[8]
	end

	# Remove Case 6: hand.size = 12, top_card = 24, remove 3 inconsecutive cards in hand
	def test_remove_size12_inconsecutive3
		game = SetGame.new
		hand = [CARD3, CARD4, CARD1, CARD8, CARD2, CARD7, CARD11, CARD10, CARD12, CARD14, CARD9, CARD20]
		user_input = [3, 6, 10]
		top_card = 24
		hand, top_card = game.replace3 DECK, hand, user_input, top_card
		assert_equal 9, hand.size
		assert_equal 24, top_card
		assert_equal CARD3, hand[0]
		assert_equal CARD4, hand[1]
		assert_equal CARD1, hand[2]
		assert_equal CARD2, hand[3]
		assert_equal CARD7, hand[4]
		assert_equal CARD10, hand[5]
		assert_equal CARD12, hand[6]
		assert_equal CARD14, hand[7]
		assert_equal CARD20, hand[8]
	end

	# Remove Case 7: hand.size = 12, top_card = 24, remove last 3 consecutive cards in hand
	def test_remove_size12_last3
		game = SetGame.new
		hand = [CARD3, CARD4, CARD1, CARD8, CARD2, CARD7, CARD11, CARD10, CARD12, CARD14, CARD9, CARD20]
		user_input = [9, 10, 11]
		top_card = 24
		hand, top_card = game.replace3 DECK, hand, user_input, top_card
		assert_equal 9, hand.size
		assert_equal 24, top_card
		assert_equal CARD3, hand[0]
		assert_equal CARD4, hand[1]
		assert_equal CARD1, hand[2]
		assert_equal CARD8, hand[3]
		assert_equal CARD2, hand[4]
		assert_equal CARD7, hand[5]
		assert_equal CARD11, hand[6]
		assert_equal CARD10, hand[7]
		assert_equal CARD12, hand[8]
	end

	# Remove Case 8: hand.size = 15, top_card = 18, remove first 3 consecutive cards in hand
	def test_remove_size15_first3
		game = SetGame.new
		hand = [CARD3, CARD4, CARD1, CARD8, CARD2, CARD7, CARD11, CARD10, CARD12, CARD5, CARD17, CARD15, CARD6, CARD9, CARD14]
		user_input = [0, 1, 2]
		top_card = 18
		hand, top_card = game.replace3 DECK, hand, user_input, top_card
		assert_equal 12, hand.size
		assert_equal 18, top_card
		assert_equal CARD8, hand[0]
		assert_equal CARD2, hand[1]
		assert_equal CARD7, hand[2]
		assert_equal CARD11, hand[3]
		assert_equal CARD10, hand[4]
		assert_equal CARD12, hand[5]
		assert_equal CARD5, hand[6]
		assert_equal CARD17, hand[7]
		assert_equal CARD15, hand[8]
		assert_equal CARD6, hand[9]
		assert_equal CARD9, hand[10]
		assert_equal CARD14, hand[11]
	end

	# Remove Case 9: hand.size = 15, top_card = 18, remove 3 inconsecutive cards in hand
	def test_remove_size15_inconsecutive3_1
		game = SetGame.new
		hand = [CARD3, CARD4, CARD1, CARD8, CARD2, CARD7, CARD11, CARD10, CARD12, CARD5, CARD17, CARD15, CARD6, CARD9, CARD14]
		user_input = [2, 8, 13]
		top_card = 18
		hand, top_card = game.replace3 DECK, hand, user_input, top_card
		assert_equal 12, hand.size
		assert_equal 18, top_card
		assert_equal CARD3, hand[0]
		assert_equal CARD4, hand[1]
		assert_equal CARD8, hand[2]
		assert_equal CARD2, hand[3]
		assert_equal CARD7, hand[4]
		assert_equal CARD11, hand[5]
		assert_equal CARD10, hand[6]
		assert_equal CARD5, hand[7]
		assert_equal CARD17, hand[8]
		assert_equal CARD15, hand[9]
		assert_equal CARD6, hand[10]
		assert_equal CARD14, hand[11]
	end

	# Remove Case 10: hand.size = 15, top_card = 24, remove 3 inconsecutive cards in hand
	def test_remove_size15_inconsecutive3_2
		game = SetGame.new
		hand = [CARD3, CARD4, CARD1, CARD8, CARD2, CARD7, CARD11, CARD10, CARD12, CARD5, CARD17, CARD15, CARD6, CARD9, CARD14]
		user_input = [3, 9, 13]
		top_card = 24
		hand, top_card = game.replace3 DECK, hand, user_input, top_card
		assert_equal 12, hand.size
		assert_equal 24, top_card
		assert_equal CARD3, hand[0]
		assert_equal CARD4, hand[1]
		assert_equal CARD1, hand[2]
		assert_equal CARD2, hand[3]
		assert_equal CARD7, hand[4]
		assert_equal CARD11, hand[5]
		assert_equal CARD10, hand[6]
		assert_equal CARD12, hand[7]
		assert_equal CARD17, hand[8]
		assert_equal CARD15, hand[9]
		assert_equal CARD6, hand[10]
		assert_equal CARD14, hand[11]
	end

	# Remove Case 11: hand.size = 15, top_card = 18, remove last 3 consecutive cards in hand
	def test_remove_size15_last3
		game = SetGame.new
		hand = [CARD3, CARD4, CARD1, CARD8, CARD2, CARD7, CARD11, CARD10, CARD12, CARD5, CARD17, CARD15, CARD6, CARD9, CARD14]
		user_input = [12, 13, 14]
		top_card = 18
		hand, top_card = game.replace3 DECK, hand, user_input, top_card
		assert_equal 12, hand.size
		assert_equal 18, top_card
		assert_equal CARD3, hand[0]
		assert_equal CARD4, hand[1]
		assert_equal CARD1, hand[2]
		assert_equal CARD8, hand[3]
		assert_equal CARD2, hand[4]
		assert_equal CARD7, hand[5]
		assert_equal CARD11, hand[6]
		assert_equal CARD10, hand[7]
		assert_equal CARD12, hand[8]
		assert_equal CARD5, hand[9]
		assert_equal CARD17, hand[10]
		assert_equal CARD15, hand[11]
	end

	# Remove Case 12: hand.size = 18, top_card = 18, remove first 3 consecutive cards in hand
	def test_remove_size18_first3
		game = SetGame.new
		hand = [CARD3, CARD4, CARD1, CARD8, CARD2, CARD7, CARD11, CARD10, CARD12, CARD5, CARD17, CARD15, CARD6, CARD9, CARD14, CARD13, CARD18, CARD16]
		user_input = [0, 1, 2]
		top_card = 18
		hand, top_card = game.replace3 DECK, hand, user_input, top_card
		assert_equal 15, hand.size
		assert_equal 18, top_card
		assert_equal CARD8, hand[0]
		assert_equal CARD2, hand[1]
		assert_equal CARD7, hand[2]
		assert_equal CARD11, hand[3]
		assert_equal CARD10, hand[4]
		assert_equal CARD12, hand[5]
		assert_equal CARD5, hand[6]
		assert_equal CARD17, hand[7]
		assert_equal CARD15, hand[8]
		assert_equal CARD6, hand[9]
		assert_equal CARD9, hand[10]
		assert_equal CARD14, hand[11]
		assert_equal CARD13, hand[12]
		assert_equal CARD18, hand[13]
		assert_equal CARD16, hand[14]
	end

	# Remove Case 13: hand.size = 18, top_card = 18, remove 3 inconsecutive cards in hand
	def test_remove_size18_inconsecutive3
		game = SetGame.new
		hand = [CARD3, CARD4, CARD1, CARD8, CARD2, CARD7, CARD11, CARD10, CARD12, CARD5, CARD17, CARD15, CARD6, CARD9, CARD14, CARD13, CARD18, CARD16]
		user_input = [4, 7, 12]
		top_card = 18
		hand, top_card = game.replace3 DECK, hand, user_input, top_card
		assert_equal 15, hand.size
		assert_equal 18, top_card
			assert_equal CARD3, hand[0]
			assert_equal CARD4, hand[1]
			assert_equal CARD1, hand[2]
			assert_equal CARD8, hand[3]
			assert_equal CARD7, hand[4]
			assert_equal CARD11, hand[5]
			assert_equal CARD12, hand[6]
			assert_equal CARD5, hand[7]
			assert_equal CARD17, hand[8]
			assert_equal CARD15, hand[9]
			assert_equal CARD9, hand[10]
			assert_equal CARD14, hand[11]
			assert_equal CARD13, hand[12]
			assert_equal CARD18, hand[13]
			assert_equal CARD16, hand[14]
	end

	# Remove Case 14: hand.size = 18, top_card = 21, remove 3 inconsecutive cards in hand
	def test_remove_size18_inconcsecutive3
		game = SetGame.new
		hand = [CARD3, CARD4, CARD1, CARD8, CARD2, CARD7, CARD11, CARD10, CARD12, CARD5, CARD17, CARD15, CARD6, CARD9, CARD14, CARD20, CARD18, CARD16]
		user_input = [5, 11, 16]
		top_card = 21
		hand, top_card = game.replace3 DECK, hand, user_input, top_card
		assert_equal 15, hand.size
		assert_equal 21, top_card
		assert_equal CARD3, hand[0]
		assert_equal CARD4, hand[1]
		assert_equal CARD1, hand[2]
		assert_equal CARD8, hand[3]
		assert_equal CARD2, hand[4]
		assert_equal CARD11, hand[5]
		assert_equal CARD10, hand[6]
		assert_equal CARD12, hand[7]
		assert_equal CARD5, hand[8]
		assert_equal CARD17, hand[9]
		assert_equal CARD6, hand[10]
		assert_equal CARD9, hand[11]
		assert_equal CARD14, hand[12]
		assert_equal CARD20, hand[13]
		assert_equal CARD16, hand[14]
	end

	# Remove Case 15: hand.size = 18, top_card = 24, remove last 3 consecutive cards in hand
	def test_remove_size18_last3
		game = SetGame.new
		hand = [CARD3, CARD4, CARD1, CARD8, CARD2, CARD7, CARD11, CARD10, CARD12, CARD5, CARD17, CARD15, CARD6, CARD9, CARD14, CARD20, CARD18, CARD16]
		user_input = [15, 16, 17]
		top_card = 24
		hand, top_card = game.replace3 DECK, hand, user_input, top_card
		assert_equal 15, hand.size
		assert_equal 24, top_card
		assert_equal CARD3, hand[0]
		assert_equal CARD4, hand[1]
		assert_equal CARD1, hand[2]
		assert_equal CARD8, hand[3]
		assert_equal CARD2, hand[4]
		assert_equal CARD7, hand[5]
		assert_equal CARD11, hand[6]
		assert_equal CARD10, hand[7]
		assert_equal CARD12, hand[8]
		assert_equal CARD5, hand[9]
		assert_equal CARD17, hand[10]
		assert_equal CARD15, hand[11]
		assert_equal CARD6, hand[12]
		assert_equal CARD9, hand[13]
		assert_equal CARD14, hand[14]
	end

end
