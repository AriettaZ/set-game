#Author: Gail
#Creation Date: 5/23

require_relative "../set_game"
require "test/unit"

class TestReplace3 < Test::Unit::TestCase

=begin
	Test Plan for testing replace3 method: (deck.size = 9)
	- Replace 3 cards in hand when top_card < deck.size
		1. hand.size = 3, ordered cards in hand, orderd user input
		2. hand.size = 3, ordered cards in hand, unordered user input
		3. hand.size = 3, unordered cards in hand, ordered user input
		4. hand.size = 3, unordered cards in hand, unordered user input
		5. hand.size = 6, ordered cards in hand, orderd user input
		6. hand.size = 6, ordered cards in hand, unordered user input
		7. hand.size = 6, unordered cards in hand, ordered user input
		8. hand.size = 6, unordered cards in hand, unordered user input
	- Remove 3 cards in hand when top_card = deck.size
		- hand.size = 3
			1. hand.size = 3, ordered cards in hand, ordered user input
			2. hand.size = 3, ordered cards in hand, unordered user input
			3. hand.size = 3, unordered cards in hand, ordered user input
			4. hand.size = 3, unordered cards in hand, unordered user input
		- hand.size > 3, remove first 3 cards, random cards in the middle, last 3 cards
			5. hand.size = 6, ordered cards in hand, ordered user input
			6. hand.size = 6, ordered cards in hand, unordered user input
			7. hand.size = 6, unordered cards in hand, ordered user input
			8. hand.size = 6, unordered cards in hand, unordered user input
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
	CARD10 = Card.new('green','solid','oval','1')
	CARD11 = Card.new('green','solid','oval','2')
	CARD12 = Card.new('green','solid','oval','3')
	DECK_ORDERED = [CARD1, CARD2, CARD3, CARD4, CARD5, CARD6, CARD7, CARD8, CARD9]
	DECK_RANDOM = [CARD3, CARD4, CARD1, CARD8, CARD2, CARD6, CARD5, CARD9, CARD7]

	def test_replace_1
		game = SetGame.new
		hand = [CARD1, CARD2, CARD3]
		user_input = [1, 2, 3]
		top_card = 3
		hand, top_card = game.replace3 DECK_ORDERED, hand, user_input, top_card
		assert_equal 3, hand.size
		assert_equal 6, top_card
		assert_equal CARD4, hand[0]
		assert_equal CARD5, hand[1]
		assert_equal CARD6, hand[2]
	end

	def test_replace_2
		game = SetGame.new
		hand = [CARD1, CARD2, CARD3]
		user_input = [1, 3, 2]
		top_card = 3
		hand, top_card = game.replace3 DECK_ORDERED, hand, user_input, top_card
		assert_equal 3, hand.size
		assert_equal 6, top_card
		assert_equal CARD4, hand[0]
		assert_equal CARD6, hand[1]
		assert_equal CARD5, hand[2]
	end

	def test_replace_3
		game = SetGame.new
		hand = [CARD1, CARD2, CARD3]
		user_input = [2, 1, 3]
		top_card = 3
		hand, top_card = game.replace3 DECK_ORDERED, hand, user_input, top_card
		assert_equal 3, hand.size
		assert_equal 6, top_card
		assert_equal CARD5, hand[0]
		assert_equal CARD4, hand[1]
		assert_equal CARD6, hand[2]
	end

	def test_remove_1
		game = SetGame.new
		hand = [CARD1, CARD2, CARD3]
		user_input = [1, 2, 3]
		top_card = 9
		hand, top_card = game.replace3 DECK_ORDERED, hand, user_input, top_card
		assert_equal 0, hand.size
		assert_equal 9, top_card
	end

	def test_remove_2
		game = SetGame.new
		hand = [CARD1, CARD2, CARD3]
		user_input = [2, 3, 1]
		top_card = 9
		hand, top_card = game.replace3 DECK_ORDERED, hand, user_input, top_card
		assert_equal 0, hand.size
		assert_equal 9, top_card
	end

	def test_remove_3
		game = SetGame.new
		hand = [CARD3, CARD1, CARD2]
		user_input = [1, 2, 3]
		top_card = 9
		hand, top_card = game.replace3 DECK_ORDERED, hand, user_input, top_card
		assert_equal 0, hand.size
		assert_equal 9, top_card
	end

	def test_remove_4
		game = SetGame.new
		hand = [CARD3, CARD1, CARD2]
		user_input = [2, 3, 1]
		top_card = 9
		hand, top_card = game.replace3 DECK_ORDERED, hand, user_input, top_card
		assert_equal 0, hand.size
		assert_equal 9, top_card
	end

	def test_remove_5_first3
		game = SetGame.new
		hand = [CARD1, CARD2, CARD3, CARD4, CARD5, CARD6]
		user_input = [1, 2, 3]
		top_card = 9
		hand, top_card = game.replace3 DECK_ORDERED, hand, user_input, top_card
		assert_equal 3, hand.size
		assert_equal 9, top_card
		assert_equal CARD4, hand[0]
		assert_equal CARD5, hand[1]
		assert_equal CARD6, hand[2]
	end

	def test_remove_5_middle3
		game = SetGame.new
		hand = [CARD1, CARD2, CARD3, CARD4, CARD5, CARD6]
		user_input = [1, 3, 4]
		top_card = 9
		hand, top_card = game.replace3 DECK_ORDERED, hand, user_input, top_card
		assert_equal 3, hand.size
		assert_equal 9, top_card
		assert_equal CARD2, hand[0]
		assert_equal CARD5, hand[1]
		assert_equal CARD6, hand[2]
	end

	def test_remove_5_last3
		game = SetGame.new
		hand = [CARD1, CARD2, CARD3, CARD4, CARD5, CARD6]
		user_input = [4, 5, 6]
		top_card = 9
		hand, top_card = game.replace3 DECK_ORDERED, hand, user_input, top_card
		assert_equal 3, hand.size
		assert_equal 9, top_card
		assert_equal CARD1, hand[0]
		assert_equal CARD2, hand[1]
		assert_equal CARD3, hand[2]
	end

	def test_remove_6_first3
		game = SetGame.new
		hand = [CARD1, CARD2, CARD3, CARD4, CARD5, CARD6]
		user_input = [3, 1, 2]
		top_card = 9
		hand, top_card = game.replace3 DECK_ORDERED, hand, user_input, top_card
		assert_equal 3, hand.size
		assert_equal 9, top_card
		assert_equal CARD4, hand[0]
		assert_equal CARD5, hand[1]
		assert_equal CARD6, hand[2]
	end

	def test_remove_6_middle3
		game = SetGame.new
		hand = [CARD1, CARD2, CARD3, CARD4, CARD5, CARD6]
		user_input = [2, 5, 4]
		top_card = 9
		hand, top_card = game.replace3 DECK_ORDERED, hand, user_input, top_card
		assert_equal 3, hand.size
		assert_equal 9, top_card
		assert_equal CARD1, hand[0]
		assert_equal CARD3, hand[1]
		assert_equal CARD6, hand[2]
	end

	def test_remove_6_last3
		game = SetGame.new
		hand = [CARD1, CARD2, CARD3, CARD4, CARD5, CARD6]
		user_input = [4, 6, 5]
		top_card = 9
		hand, top_card = game.replace3 DECK_ORDERED, hand, user_input, top_card
		assert_equal 3, hand.size
		assert_equal 9, top_card
		assert_equal CARD1, hand[0]
		assert_equal CARD2, hand[1]
		assert_equal CARD3, hand[2]
	end

	def test_remove_7
		game = SetGame.new
		hand = [CARD3, CARD7, CARD5, CARD4, CARD9, CARD2]
		user_input = [1, 3, 5]
		top_card = 9
		hand, top_card = game.replace3 DECK_ORDERED, hand, user_input, top_card
		assert_equal 3, hand.size
		assert_equal 9, top_card
		assert_equal CARD7, hand[0]
		assert_equal CARD4, hand[1]
		assert_equal CARD2, hand[2]
	end

	def test_remove_8
		game = SetGame.new
		hand = [CARD3, CARD7, CARD5, CARD4, CARD9, CARD2]
		user_input = [5, 1, 3]
		top_card = 9
		hand, top_card = game.replace3 DECK_ORDERED, hand, user_input, top_card
		assert_equal 3, hand.size
		assert_equal 9, top_card
		assert_equal CARD7, hand[0]
		assert_equal CARD4, hand[1]
		assert_equal CARD2, hand[2]
	end
end
