=begin
	Author: Gail
	Created: 5/23
	Editor: N/A
	Test Plan for testing replace3 method: (deck.size = 12)
	- Replace 3 cards in hand when top_card < deck.size
		1. hand.size = 3, cards have same order in hand as in deck
		2. hand.size = 3, cards have different order in hand as in deck
		3. hand.size = 6, replace first 3 consecutive cards in hand
		4. hand.size = 6, top_card = 6, replace 3 inconsecutive cards in hand
		5. hand.size = 6, top_card = 9, replace 3 inconsecutive cards in hand
		6. hand.size = 6, replace last 3 consecutive cards in hand
	- Remove 3 cards in hand when top_card >= deck.size
		1. hand.size = 3, cards have same order in hand as in deck
		2. hand.size = 3, cards have different order in hand as in deck
		3. hand.size = 6, remove first 3 consecutive cards in hand
		4. hand.size = 6, remove 3 inconsecutive cards in hand
		5. hand.size = 6, remove last 3 consecutive cards in hand
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
	DECK = [CARD3, CARD4, CARD1, CARD8, CARD2, CARD6, CARD5, CARD9, CARD7, CARD11, CARD10, CARD12]

	def test_replace_1
		game = SetGame.new
		hand = [CARD3, CARD4, CARD1]
		user_input = [0, 1, 2]
		top_card = 3
		hand, top_card = game.replace3 DECK, hand, user_input, top_card
		assert_equal 3, hand.size
		assert_equal 6, top_card
		assert_equal CARD8, hand[0]
		assert_equal CARD2, hand[1]
		assert_equal CARD6, hand[2]
	end

	def test_replace_2
		game = SetGame.new
		hand = [CARD1, CARD3, CARD4]
		user_input = [0, 1, 2]
		top_card = 6
		hand, top_card = game.replace3 DECK, hand, user_input, top_card
		assert_equal 3, hand.size
		assert_equal 9, top_card
		assert_equal CARD5, hand[0]
		assert_equal CARD9, hand[1]
		assert_equal CARD7, hand[2]
	end

	def test_replace_first3_1
		game = SetGame.new
		hand = [CARD1, CARD3, CARD4, CARD2, CARD8, CARD6]
		user_input = [0, 1, 2]
		top_card = 6
		hand, top_card = game.replace3 DECK, hand, user_input, top_card
		assert_equal 6, hand.size
		assert_equal 9, top_card
		assert_equal CARD5, hand[0]
		assert_equal CARD9, hand[1]
		assert_equal CARD7, hand[2]
		assert_equal CARD2, hand[3]
		assert_equal CARD8, hand[4]
		assert_equal CARD6, hand[5]
	end

	def test_replace_first3_2
		game = SetGame.new
		hand = [CARD4, CARD8, CARD2, CARD3, CARD1, CARD6]
		user_input = [0, 1, 2]
		top_card = 6
		hand, top_card = game.replace3 DECK, hand, user_input, top_card
		assert_equal 6, hand.size
		assert_equal 9, top_card
		assert_equal CARD5, hand[0]
		assert_equal CARD9, hand[1]
		assert_equal CARD7, hand[2]
		assert_equal CARD3, hand[3]
		assert_equal CARD1, hand[4]
		assert_equal CARD6, hand[5]
	end

	def test_replace_inconsecutive3_1
		game = SetGame.new
		hand = [CARD1, CARD3, CARD4, CARD2, CARD8, CARD6]
		user_input = [1, 2, 5]
		top_card = 6
		hand, top_card = game.replace3 DECK, hand, user_input, top_card
		assert_equal 6, hand.size
		assert_equal 9, top_card
		assert_equal CARD1, hand[0]
		assert_equal CARD5, hand[1]
		assert_equal CARD9, hand[2]
		assert_equal CARD2, hand[3]
		assert_equal CARD8, hand[4]
		assert_equal CARD7, hand[5]
	end

	def test_replace_inconsecutive3_2
		game = SetGame.new
		hand = [CARD1, CARD3, CARD4, CARD2, CARD8, CARD6]
		user_input = [1, 2, 5]
		top_card = 9
		hand, top_card = game.replace3 DECK, hand, user_input, top_card
		assert_equal 6, hand.size
		assert_equal 12, top_card
		assert_equal CARD1, hand[0]
		assert_equal CARD11, hand[1]
		assert_equal CARD10, hand[2]
		assert_equal CARD2, hand[3]
		assert_equal CARD8, hand[4]
		assert_equal CARD12, hand[5]
	end

	def test_replace_last3_1
		game = SetGame.new
		hand = [CARD1, CARD3, CARD4, CARD2, CARD8, CARD6]
		user_input = [3, 4, 5]
		top_card = 6
		hand, top_card = game.replace3 DECK, hand, user_input, top_card
		assert_equal 6, hand.size
		assert_equal 9, top_card
		assert_equal CARD1, hand[0]
		assert_equal CARD3, hand[1]
		assert_equal CARD4, hand[2]
		assert_equal CARD5, hand[3]
		assert_equal CARD9, hand[4]
		assert_equal CARD7, hand[5]
	end

	def test_replace_last3_2
		game = SetGame.new
		hand = [CARD2, CARD8, CARD6, CARD1, CARD3, CARD4]
		user_input = [3, 4, 5]
		top_card = 6
		hand, top_card = game.replace3 DECK, hand, user_input, top_card
		assert_equal 6, hand.size
		assert_equal 9, top_card
		assert_equal CARD2, hand[0]
		assert_equal CARD8, hand[1]
		assert_equal CARD6, hand[2]
		assert_equal CARD5, hand[3]
		assert_equal CARD9, hand[4]
		assert_equal CARD7, hand[5]
	end

	def test_remove_1
		game = SetGame.new
		hand = [CARD3, CARD8, CARD6]
		user_input = [0, 1, 2]
		top_card = 12
		hand, top_card = game.replace3 DECK, hand, user_input, top_card
		assert_equal 0, hand.size
		assert_equal 12, top_card
	end

	def test_remove_2
		game = SetGame.new
		hand = [CARD4, CARD6, CARD8]
		user_input = [0, 1, 2]
		top_card = 15
		hand, top_card = game.replace3 DECK, hand, user_input, top_card
		assert_equal 0, hand.size
		assert_equal 15, top_card
	end

	def test_remove_first3_1
		game = SetGame.new
		hand = [CARD1, CARD2, CARD3, CARD4, CARD5, CARD6]
		user_input = [0, 1, 2]
		top_card = 12
		hand, top_card = game.replace3 DECK, hand, user_input, top_card
		assert_equal 3, hand.size
		assert_equal 12, top_card
		assert_equal CARD4, hand[0]
		assert_equal CARD5, hand[1]
		assert_equal CARD6, hand[2]
	end

	def test_remove_first3_2
		game = SetGame.new
		hand = [CARD3, CARD1, CARD5, CARD8, CARD7, CARD6]
		user_input = [0, 1, 2]
		top_card = 12
		hand, top_card = game.replace3 DECK, hand, user_input, top_card
		assert_equal 3, hand.size
		assert_equal 12, top_card
		assert_equal CARD8, hand[0]
		assert_equal CARD7, hand[1]
		assert_equal CARD6, hand[2]
	end

	def test_remove_inconsecutive3_1
		game = SetGame.new
		hand = [CARD1, CARD2, CARD3, CARD4, CARD5, CARD6]
		user_input = [1, 3, 4]
		top_card = 12
		hand, top_card = game.replace3 DECK, hand, user_input, top_card
		assert_equal 3, hand.size
		assert_equal 12, top_card
		assert_equal CARD1, hand[0]
		assert_equal CARD3, hand[1]
		assert_equal CARD6, hand[2]
	end

	def test_remove_inconsecutive3_2
		game = SetGame.new
		hand = [CARD1, CARD2, CARD3, CARD4, CARD5, CARD6]
		user_input = [0, 2, 5]
		top_card = 12
		hand, top_card = game.replace3 DECK, hand, user_input, top_card
		assert_equal 3, hand.size
		assert_equal 12, top_card
		assert_equal CARD2, hand[0]
		assert_equal CARD4, hand[1]
		assert_equal CARD5, hand[2]
	end

	def test_remove_last3_1
		game = SetGame.new
		hand = [CARD1, CARD2, CARD3, CARD4, CARD5, CARD6]
		user_input = [3, 4, 5]
		top_card = 15
		hand, top_card = game.replace3 DECK, hand, user_input, top_card
		assert_equal 3, hand.size
		assert_equal 15, top_card
		assert_equal CARD1, hand[0]
		assert_equal CARD2, hand[1]
		assert_equal CARD3, hand[2]
	end

	def test_remove_last3_2
		game = SetGame.new
		hand = [CARD3, CARD1, CARD5, CARD8, CARD7, CARD6]
		user_input = [3, 4, 5]
		top_card = 15
		hand, top_card = game.replace3 DECK, hand, user_input, top_card
		assert_equal 3, hand.size
		assert_equal 15, top_card
		assert_equal CARD3, hand[0]
		assert_equal CARD1, hand[1]
		assert_equal CARD5, hand[2]
	end

end
