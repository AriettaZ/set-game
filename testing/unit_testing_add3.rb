#Author: Gail
#Creation Date: 5/23

require_relative "../set_game"
require "test/unit"

class TestAdd3 < Test::Unit::TestCase

=begin
	Test plan for testing add3 method: (deck.size = 9)
	- Add 3 cards to an empty hand:
		1. use ordered deck, top_card = 0
		2. use ordered deck, top_card = 3
		3. use unordered deck, top_card = 0
		4. use unordered deck, top_card = 3
	- Add 3 cards to a hand with 3 cards:
		1. use ordered deck, consecutive cards in hand, top_card = 3
		2. use ordered deck, inconsecutive cards in hand, top_card = 6
		3. use unordered deck, consecutive cards in hand, top_card = 6
		4. use unordered deck, inconsecutive cards in hand, top_card = 6
=end

	CARD1 = Card.new('red','open','oval','1')
	CARD2 = Card.new('red','open','oval','2')
	CARD3 = Card.new('red','open','oval','3')
	CARD4 = Card.new('purple','open','oval','1')
	CARD5 = Card.new('purple','open','oval','2')
	CARD6 = Card.new('purple','open','oval','3')
	CARD7 = Card.new('green','open','oval','1')
	CARD8 = Card.new('green','open','oval','2')
	CARD9 = Card.new('green','open','oval','3')
	DECK_ORDERED = [CARD1, CARD2, CARD3, CARD4, CARD5, CARD6, CARD7, CARD8, CARD9]
	DECK_UNORDERED = [CARD3, CARD4, CARD1, CARD8, CARD2, CARD6, CARD5, CARD9, CARD7]

	def test_add3_to_empty_hand_1
		game = SetGame.new
		hand = []
		top_card = 0
		hand, top_card = game.add3 DECK_ORDERED, hand, top_card
		assert_equal 3, hand.size
		assert_equal 3, top_card
		assert_equal CARD1, hand[0]
		assert_equal CARD2, hand[1]
		assert_equal CARD3, hand[2]
	end

	def test_add3_to_empty_hand_2
		game = SetGame.new
		hand = []
		top_card = 3
		hand, top_card = game.add3 DECK_ORDERED, hand, top_card
		assert_equal 3, hand.size
		assert_equal 6, top_card
		assert_equal CARD4, hand[0]
		assert_equal CARD5, hand[1]
		assert_equal CARD6, hand[2]
	end

	def test_add3_to_empty_hand_3
		game = SetGame.new
		hand = []
		top_card = 0
		hand, top_card = game.add3 DECK_UNORDERED, hand, top_card
		assert_equal 3, hand.size
		assert_equal 3, top_card
		assert_equal CARD3, hand[0]
		assert_equal CARD4, hand[1]
		assert_equal CARD1, hand[2]
	end

	def test_add3_to_empty_hand_4
		game = SetGame.new
		hand = []
		top_card = 3
		hand, top_card = game.add3 DECK_UNORDERED, hand, top_card
		assert_equal 3, hand.size
		assert_equal 6, top_card
		assert_equal CARD8, hand[0]
		assert_equal CARD2, hand[1]
		assert_equal CARD6, hand[2]
	end

	def test_add3_to_hand_with_3cards_1
		game = SetGame.new
		hand = [CARD1, CARD2, CARD3]
		top_card = 3
		hand, top_card = game.add3 DECK_ORDERED, hand, top_card
		assert_equal 6, hand.size
		assert_equal 6, top_card
		assert_equal CARD1, hand[0]
		assert_equal CARD2, hand[1]
		assert_equal CARD3, hand[2]
		assert_equal CARD4, hand[3]
		assert_equal CARD5, hand[4]
		assert_equal CARD6, hand[5]
	end

	def test_add3_to_hand_with_3cards_2
		game = SetGame.new
		hand = [CARD1, CARD3, CARD5]
		top_card = 6
		hand, top_card = game.add3 DECK_ORDERED, hand, top_card
		assert_equal 6, hand.size
		assert_equal 9, top_card
		assert_equal CARD1, hand[0]
		assert_equal CARD3, hand[1]
		assert_equal CARD5, hand[2]
		assert_equal CARD7, hand[3]
		assert_equal CARD8, hand[4]
		assert_equal CARD9, hand[5]
	end

	def test_add3_to_hand_with_3cards_3
		game = SetGame.new
		hand = [CARD1, CARD8, CARD2]
		top_card = 6
		hand, top_card = game.add3 DECK_UNORDERED, hand, top_card
		assert_equal 6, hand.size
		assert_equal 9, top_card
		assert_equal CARD1, hand[0]
		assert_equal CARD8, hand[1]
		assert_equal CARD2, hand[2]
		assert_equal CARD5, hand[3]
		assert_equal CARD9, hand[4]
		assert_equal CARD7, hand[5]
	end

	def test_add3_to_hand_with_3cards_4
		game = SetGame.new
		hand = [CARD3, CARD1, CARD8]
		top_card = 6
		hand, top_card = game.add3 DECK_UNORDERED, hand, top_card
		assert_equal 6, hand.size
		assert_equal 9, top_card
		assert_equal CARD3, hand[0]
		assert_equal CARD1, hand[1]
		assert_equal CARD8, hand[2]
		assert_equal CARD5, hand[3]
		assert_equal CARD9, hand[4]
		assert_equal CARD7, hand[5]
	end
end
