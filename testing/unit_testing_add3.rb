=begin
	Author: Gail
	Created: 5/23
	Editor: N/A
	Test plan for testing add3 method: (use deck.size = 12)
	- Add 3 cards to an empty hand:
		1. top_card = 0
		2. top_card = 3
		3. top_card = 6
	- Add 3 cards to a hand with 3 cards:
		1. top_card = 3, cards have same order in hand as in deck
		2. top_card = 3, cards have different order in hand as in deck
		3. top_card = 6, cards have same order in hand as in deck
		4. top_card = 6, cards have different order in hand as in deck
	- Add 3 cards to a hand with 6 cards:
		1. top_card = 6, cards have same order in hand as in deck
		2. top_card = 6, cards have different order in hand as in deck
		3. top_card = 9, cards have same order in hand as in deck
		4. top_card = 9, cards have different order in hand as in deck
=end

require_relative "../set_game"
require "test/unit"

class TestAdd3 < Test::Unit::TestCase

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

	def test_add3_to_empty_hand_1
		game = SetGame.new
		hand = []
		top_card = 0
		hand, top_card = game.add3 DECK, hand, top_card
		assert_equal 3, hand.size
		assert_equal 3, top_card
		assert_equal CARD3, hand[0]
		assert_equal CARD4, hand[1]
		assert_equal CARD1, hand[2]
	end

	def test_add3_to_empty_hand_2
		game = SetGame.new
		hand = []
		top_card = 3
		hand, top_card = game.add3 DECK, hand, top_card
		assert_equal 3, hand.size
		assert_equal 6, top_card
		assert_equal CARD8, hand[0]
		assert_equal CARD2, hand[1]
		assert_equal CARD6, hand[2]
	end

	def test_add3_to_empty_hand_3
		game = SetGame.new
		hand = []
		top_card = 6
		hand, top_card = game.add3 DECK, hand, top_card
		assert_equal 3, hand.size
		assert_equal 9, top_card
		assert_equal CARD5, hand[0]
		assert_equal CARD9, hand[1]
		assert_equal CARD7, hand[2]
	end

	def test_add3_to_hand_with_3cards_1
		game = SetGame.new
		hand = [CARD3, CARD4, CARD1]
		top_card = 3
		hand, top_card = game.add3 DECK, hand, top_card
		assert_equal 6, hand.size
		assert_equal 6, top_card
		assert_equal CARD3, hand[0]
		assert_equal CARD4, hand[1]
		assert_equal CARD1, hand[2]
		assert_equal CARD8, hand[3]
		assert_equal CARD2, hand[4]
		assert_equal CARD6, hand[5]
	end

	def test_add3_to_hand_with_3cards_2
		game = SetGame.new
		hand = [CARD1, CARD3, CARD4]
		top_card = 3
		hand, top_card = game.add3 DECK, hand, top_card
		assert_equal 6, hand.size
		assert_equal 6, top_card
		assert_equal CARD1, hand[0]
		assert_equal CARD3, hand[1]
		assert_equal CARD4, hand[2]
		assert_equal CARD8, hand[3]
		assert_equal CARD2, hand[4]
		assert_equal CARD6, hand[5]
	end

	def test_add3_to_hand_with_3cards_3
		game = SetGame.new
		hand = [CARD3, CARD1, CARD2]
		top_card = 6
		hand, top_card = game.add3 DECK, hand, top_card
		assert_equal 6, hand.size
		assert_equal 9, top_card
		assert_equal CARD3, hand[0]
		assert_equal CARD1, hand[1]
		assert_equal CARD2, hand[2]
		assert_equal CARD5, hand[3]
		assert_equal CARD9, hand[4]
		assert_equal CARD7, hand[5]
	end

	def test_add3_to_hand_with_3cards_4
		game = SetGame.new
		hand = [CARD2, CARD4, CARD8]
		top_card = 6
		hand, top_card = game.add3 DECK, hand, top_card
		assert_equal 6, hand.size
		assert_equal 9, top_card
		assert_equal CARD2, hand[0]
		assert_equal CARD4, hand[1]
		assert_equal CARD8, hand[2]
		assert_equal CARD5, hand[3]
		assert_equal CARD9, hand[4]
		assert_equal CARD7, hand[5]
	end

	def test_add3_to_hand_with_6cards_1
		game = SetGame.new
		hand = [CARD3, CARD4, CARD1, CARD8, CARD2, CARD6]
		top_card = 6
		hand, top_card = game.add3 DECK, hand, top_card
		assert_equal 9, hand.size
		assert_equal 9, top_card
		assert_equal CARD3, hand[0]
		assert_equal CARD4, hand[1]
		assert_equal CARD1, hand[2]
		assert_equal CARD8, hand[3]
		assert_equal CARD2, hand[4]
		assert_equal CARD6, hand[5]
		assert_equal CARD5, hand[6]
		assert_equal CARD9, hand[7]
		assert_equal CARD7, hand[8]
	end

	def test_add3_to_hand_with_6cards_2
		game = SetGame.new
		hand = [CARD2, CARD4, CARD1, CARD3, CARD6, CARD8]
		top_card = 6
		hand, top_card = game.add3 DECK, hand, top_card
		assert_equal 9, hand.size
		assert_equal 9, top_card
		assert_equal CARD2, hand[0]
		assert_equal CARD4, hand[1]
		assert_equal CARD1, hand[2]
		assert_equal CARD3, hand[3]
		assert_equal CARD6, hand[4]
		assert_equal CARD8, hand[5]
		assert_equal CARD5, hand[6]
		assert_equal CARD9, hand[7]
		assert_equal CARD7, hand[8]
	end

	def test_add3_to_hand_with_6cards_3
		game = SetGame.new
		hand = [CARD3, CARD4, CARD8, CARD6, CARD9, CARD7]
		top_card = 9
		hand, top_card = game.add3 DECK, hand, top_card
		assert_equal 9, hand.size
		assert_equal 12, top_card
		assert_equal CARD3, hand[0]
		assert_equal CARD4, hand[1]
		assert_equal CARD8, hand[2]
		assert_equal CARD6, hand[3]
		assert_equal CARD9, hand[4]
		assert_equal CARD7, hand[5]
		assert_equal CARD11, hand[6]
		assert_equal CARD10, hand[7]
		assert_equal CARD12, hand[8]
	end

	def test_add3_to_hand_with_6cards_4
		game = SetGame.new
		hand = [CARD2, CARD4, CARD1, CARD3, CARD6, CARD8]
		top_card = 9
		hand, top_card = game.add3 DECK, hand, top_card
		assert_equal 9, hand.size
		assert_equal 12, top_card
		assert_equal CARD2, hand[0]
		assert_equal CARD4, hand[1]
		assert_equal CARD1, hand[2]
		assert_equal CARD3, hand[3]
		assert_equal CARD6, hand[4]
		assert_equal CARD8, hand[5]
		assert_equal CARD11, hand[6]
		assert_equal CARD10, hand[7]
		assert_equal CARD12, hand[8]
	end
end
