=begin
	Author: Gail Chen
	Date created: 5/23
	Edit: 5/24, 5/27 Gail Chen added more test cases
	Test plan for testing add3 method: (use deck.size = 21)
	- Add 3 cards to an empty hand:
		1. top_card = 0, use ordered deck
		2. top_card = 0, use unordered deck
		3. top_card = 6, use unordered deck
	- Add 3 cards to a hand with 6 cards:
		1. top_card = 6, use ordered deck
		2. top_card = 6, use unordered deck
		3. top_card = 12, use unordered deck
	- Add 3 cards to a hand with 12 cards:
		1. top_card = 12, use ordered deck
		2. top_card = 18, use ordered deck
	- Add 3 cards to a hand with 15 cards:
		1. top_card = 15, use ordered deck
		2. top_card = 18, use ordered deck
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
	CARD13 = Card.new('red','solid','oval','1')
	CARD14 = Card.new('red','solid','oval','2')
	CARD15 = Card.new('red','solid','oval','3')
	CARD16 = Card.new('purple','solid','oval','1')
	CARD17 = Card.new('purple','solid','oval','2')
	CARD18 = Card.new('purple','solid','oval','3')
	CARD19 = Card.new('purple','solid','oval','1')
	CARD20 = Card.new('purple','solid','oval','2')
	CARD21 = Card.new('purple','solid','oval','3')
	DECK_ORDERED = [CARD1, CARD2, CARD3, CARD4, CARD5, CARD6, CARD7, CARD8, CARD9, CARD10, CARD11, CARD12, CARD13, CARD14, CARD15, CARD16, CARD17, CARD18, CARD19, CARD20, CARD21]
  DECK_UNORDERED = [CARD3, CARD4, CARD1, CARD8, CARD2, CARD6, CARD5, CARD9, CARD7, CARD11, CARD10, CARD12, CARD15, CARD14, CARD16, CARD13, CARD19, CARD21, CARD17, CARD20, CARD18]

	def test_add3_to_empty_hand_1
		game = SetGame.new
		game.deck = DECK_ORDERED
		game.hand = []
		game.top_card = 0
		game.add3
		assert_equal 3, game.hand.size
		assert_equal 3, game.top_card
		assert_equal CARD1, game.hand[0]
		assert_equal CARD2, game.hand[1]
		assert_equal CARD3, game.hand[2]
	end

	def test_add3_to_empty_hand_2
		game = SetGame.new
		game.deck = DECK_UNORDERED
		game.hand = []
		game.top_card = 0
		game.add3
		assert_equal 3, game.hand.size
		assert_equal 3, game.top_card
		assert_equal CARD3, game.hand[0]
		assert_equal CARD4, game.hand[1]
		assert_equal CARD1, game.hand[2]
	end

	def test_add3_to_empty_hand_3
		game = SetGame.new
		game.deck = DECK_UNORDERED
		game.hand = []
		game.top_card = 6
		game.add3
		assert_equal 3, game.hand.size
		assert_equal 9, game.top_card
		assert_equal CARD5, game.hand[0]
		assert_equal CARD9, game.hand[1]
		assert_equal CARD7, game.hand[2]
	end

	def test_add3_to_hand_with_6cards_1
		game = SetGame.new
		game.deck = DECK_ORDERED
		game.hand = [CARD3, CARD4, CARD1, CARD5, CARD2, CARD6]
		game.top_card = 6
		game.add3
		assert_equal 9, game.hand.size
		assert_equal 9, game.top_card
		assert_equal CARD3, game.hand[0]
		assert_equal CARD4, game.hand[1]
		assert_equal CARD1, game.hand[2]
		assert_equal CARD5, game.hand[3]
		assert_equal CARD2, game.hand[4]
		assert_equal CARD6, game.hand[5]
		assert_equal CARD7, game.hand[6]
		assert_equal CARD8, game.hand[7]
		assert_equal CARD9, game.hand[8]
	end

	def test_add3_to_hand_with_6cards_2
		game = SetGame.new
		game.deck = DECK_UNORDERED
		game.hand = [CARD3, CARD4, CARD1, CARD8, CARD2, CARD6]
		game.top_card = 6
		game.add3
		assert_equal 9, game.hand.size
		assert_equal 9, game.top_card
		assert_equal CARD3, game.hand[0]
		assert_equal CARD4, game.hand[1]
		assert_equal CARD1, game.hand[2]
		assert_equal CARD8, game.hand[3]
		assert_equal CARD2, game.hand[4]
		assert_equal CARD6, game.hand[5]
		assert_equal CARD5, game.hand[6]
		assert_equal CARD9, game.hand[7]
		assert_equal CARD7, game.hand[8]
	end

	def test_add3_to_hand_with_6cards_3
		game = SetGame.new
		game.deck = DECK_UNORDERED
		game.hand = [CARD2, CARD4, CARD1, CARD3, CARD6, CARD8]
		game.top_card = 12
		game.add3
		assert_equal 9, game.hand.size
		assert_equal 15, game.top_card
		assert_equal CARD2, game.hand[0]
		assert_equal CARD4, game.hand[1]
		assert_equal CARD1, game.hand[2]
		assert_equal CARD3, game.hand[3]
		assert_equal CARD6, game.hand[4]
		assert_equal CARD8, game.hand[5]
		assert_equal CARD15, game.hand[6]
		assert_equal CARD14, game.hand[7]
		assert_equal CARD16, game.hand[8]
	end

	def test_add3_to_hand_with_12cards_1
		game = SetGame.new
		game.deck = DECK_ORDERED
		game.hand = [CARD3, CARD4, CARD1, CARD8, CARD2, CARD6, CARD5, CARD9, CARD7, CARD11, CARD10, CARD12]
		game.top_card = 12
		game.add3
		assert_equal 15, game.hand.size
		assert_equal 15, game.top_card
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
		assert_equal CARD13, game.hand[12]
		assert_equal CARD14, game.hand[13]
		assert_equal CARD15, game.hand[14]
	end

	def test_add3_to_hand_with_12cards_2
		game = SetGame.new
		game.deck = DECK_ORDERED
		game.hand = [CARD3, CARD4, CARD1, CARD8, CARD2, CARD6, CARD5, CARD9, CARD7, CARD11, CARD10, CARD12]
		game.top_card = 18
		game.add3
		assert_equal 15, game.hand.size
		assert_equal 21, game.top_card
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
		assert_equal CARD19, game.hand[12]
		assert_equal CARD20, game.hand[13]
		assert_equal CARD21, game.hand[14]
	end

	def test_add3_to_hand_with_15cards_1
		game = SetGame.new
		game.deck = DECK_ORDERED
		game.hand = [CARD3, CARD4, CARD1, CARD8, CARD2, CARD6, CARD5, CARD9, CARD7, CARD11, CARD10, CARD12, CARD15, CARD14, CARD13]
		game.top_card = 15
		game.add3
		assert_equal 18, game.hand.size
		assert_equal 18, game.top_card
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
		assert_equal CARD15, game.hand[12]
		assert_equal CARD14, game.hand[13]
		assert_equal CARD13, game.hand[14]
		assert_equal CARD16, game.hand[15]
		assert_equal CARD17, game.hand[16]
		assert_equal CARD18, game.hand[17]
	end

	def test_add3_to_hand_with_15cards_2
		game = SetGame.new
		game.deck = DECK_ORDERED
		game.hand = [CARD3, CARD4, CARD1, CARD8, CARD2, CARD6, CARD5, CARD9, CARD7, CARD11, CARD10, CARD12, CARD15, CARD14, CARD16]
		game.top_card = 18
		game.add3
		assert_equal 18, game.hand.size
		assert_equal 21, game.top_card
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
		assert_equal CARD15, game.hand[12]
		assert_equal CARD14, game.hand[13]
		assert_equal CARD16, game.hand[14]
		assert_equal CARD19, game.hand[15]
		assert_equal CARD20, game.hand[16]
		assert_equal CARD21, game.hand[17]
	end
end
