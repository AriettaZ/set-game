=begin
	Author: Gail Chen
	Created: 5/23
	Edit: 5/25, 5/27 Gail Chen modified test cases corresponding to changes in get_hand method
	Test plan for testing get_hand method:
	1. deck.size = 12, use ordered deck
	2. deck.size = 12, use unordered deck
	3. deck.size = 18, use ordered deck
	4. deck.size = 18, use unordered deck
=end

require_relative "../set_game"
require "test/unit"

class TestGetHand < Test::Unit::TestCase

	CARD1 = Card.new('red','open','oval','1')
	CARD2 = Card.new('red','open','oval','2')
	CARD3 = Card.new('red','open','oval','3')
	CARD4 = Card.new('purple','open','oval','1')
	CARD5 = Card.new('purple','open','oval','2')
	CARD6 = Card.new('purple','open','oval','3')
	CARD7 = Card.new('green','open','oval','1')
	CARD8 = Card.new('green','open','oval','2')
	CARD9 = Card.new('green','open','oval','3')
	CARD10 = Card.new('red','solid','oval','1')
	CARD11 = Card.new('red','solid','oval','2')
	CARD12 = Card.new('red','solid','oval','3')
	CARD13 = Card.new('green','solid','oval','1')
	CARD14 = Card.new('green','solid','oval','2')
	CARD15 = Card.new('green','solid','oval','3')
	CARD16 = Card.new('green','solid','oval','1')
	CARD17 = Card.new('green','solid','oval','2')
	CARD18 = Card.new('green','solid','oval','3')
	DECK_ORDERED_12 = [CARD1, CARD2, CARD3, CARD4, CARD5, CARD6, CARD7, CARD8, CARD9, CARD10, CARD11, CARD12]
	DECK_UNORDERED_12 = [CARD3, CARD4, CARD13, CARD8, CARD2, CARD15, CARD5, CARD9, CARD12, CARD10, CARD7, CARD11]
	DECK_ORDERED_18 = [CARD1, CARD2, CARD3, CARD4, CARD5, CARD6, CARD7, CARD8, CARD9, CARD10, CARD11, CARD12, CARD13, CARD14, CARD15, CARD16, CARD17, CARD18]
	DECK_UNORDERED_18 = [CARD3, CARD4, CARD13, CARD8, CARD2, CARD15, CARD5, CARD9, CARD12, CARD10, CARD7, CARD11, CARD1, CARD14, CARD16, CARD6, CARD18, CARD17]

	# Case 1: deck.size = 12, use ordered deck
	def test_get_hand_ordered_deck12
		game = SetGame.new
		game.deck = DECK_ORDERED_12
		game.hand = []
		game.top_card = 0
		game.get_hand
		assert_equal 12, game.hand.size
		assert_equal 12, game.top_card
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
	end

	# Case 2: deck.size = 12, use ordered deck
	def test_get_hand_unordered_deck12
		game = SetGame.new
		game.deck = DECK_UNORDERED_12
		game.hand = []
		game.top_card = 0
		game.get_hand
		assert_equal 12, game.hand.size
		assert_equal 12, game.top_card
		assert_equal CARD3, game.hand[0]
		assert_equal CARD4, game.hand[1]
		assert_equal CARD13, game.hand[2]
		assert_equal CARD8, game.hand[3]
		assert_equal CARD2, game.hand[4]
		assert_equal CARD15, game.hand[5]
		assert_equal CARD5, game.hand[6]
		assert_equal CARD9, game.hand[7]
		assert_equal CARD12, game.hand[8]
		assert_equal CARD10, game.hand[9]
		assert_equal CARD7, game.hand[10]
		assert_equal CARD11, game.hand[11]
	end

	# Case 3: deck.size = 18, use ordered deck
	def test_get_hand_ordered_deck18
		game = SetGame.new
		game.deck = DECK_ORDERED_18
		game.hand = []
		game.top_card = 0
		game.get_hand
		assert_equal 12, game.hand.size
		assert_equal 12, game.top_card
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
	end

	# Case 4: deck.size = 18, use ordered deck
	def test_get_hand_unordered_deck18
		game = SetGame.new
		game.deck = DECK_UNORDERED_18
		game.hand = []
		game.top_card = 0
		game.get_hand
		assert_equal 12, game.hand.size
		assert_equal 12, game.top_card
		assert_equal CARD3, game.hand[0]
		assert_equal CARD4, game.hand[1]
		assert_equal CARD13, game.hand[2]
		assert_equal CARD8, game.hand[3]
		assert_equal CARD2, game.hand[4]
		assert_equal CARD15, game.hand[5]
		assert_equal CARD5, game.hand[6]
		assert_equal CARD9, game.hand[7]
		assert_equal CARD12, game.hand[8]
		assert_equal CARD10, game.hand[9]
		assert_equal CARD7, game.hand[10]
		assert_equal CARD11, game.hand[11]
	end

end
