=begin
<<<<<<< HEAD
	Author: Gail Chen
	Date created: 5/23
	Edit: 5/24 Gail Chen added more test cases
	Test plan for testing add3 method: (use deck.size = 21)
=======
	Author: Gail
	Created: 5/23
	Editor: Mike 5/25
	Test plan for testing add3 method: (use deck.size = 12)
>>>>>>> cb7bd44a56aa8a72c79f030a646779db23dfb12b
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
		top_card = 0
		hand, top_card = game.add3 DECK_UNORDERED, hand, top_card
		assert_equal 3, hand.size
		assert_equal 3, top_card
		assert_equal CARD3, hand[0]
		assert_equal CARD4, hand[1]
		assert_equal CARD1, hand[2]
	end

	def test_add3_to_empty_hand_3
		game = SetGame.new
		hand = []
		top_card = 6
		hand, top_card = game.add3 DECK_UNORDERED, hand, top_card
		assert_equal 3, hand.size
		assert_equal 9, top_card
		assert_equal CARD5, hand[0]
		assert_equal CARD9, hand[1]
		assert_equal CARD7, hand[2]
	end

	def test_add3_to_hand_with_6cards_1
		game = SetGame.new
		hand = [CARD3, CARD4, CARD1, CARD5, CARD2, CARD6]
		top_card = 6
		hand, top_card = game.add3 DECK_ORDERED, hand, top_card
		assert_equal 9, hand.size
		assert_equal 9, top_card
		assert_equal CARD3, hand[0]
		assert_equal CARD4, hand[1]
		assert_equal CARD1, hand[2]
		assert_equal CARD5, hand[3]
		assert_equal CARD2, hand[4]
		assert_equal CARD6, hand[5]
		assert_equal CARD7, hand[6]
		assert_equal CARD8, hand[7]
		assert_equal CARD9, hand[8]
	end

	def test_add3_to_hand_with_6cards_2
		game = SetGame.new
		hand = [CARD3, CARD4, CARD1, CARD8, CARD2, CARD6]
		top_card = 6
		hand, top_card = game.add3 DECK_UNORDERED, hand, top_card
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

	def test_add3_to_hand_with_6cards_3
		game = SetGame.new
		hand = [CARD2, CARD4, CARD1, CARD3, CARD6, CARD8]
		top_card = 12
		hand, top_card = game.add3 DECK_UNORDERED, hand, top_card
		assert_equal 9, hand.size
		assert_equal 15, top_card
		assert_equal CARD2, hand[0]
		assert_equal CARD4, hand[1]
		assert_equal CARD1, hand[2]
		assert_equal CARD3, hand[3]
		assert_equal CARD6, hand[4]
		assert_equal CARD8, hand[5]
		assert_equal CARD15, hand[6]
		assert_equal CARD14, hand[7]
		assert_equal CARD16, hand[8]
	end

	def test_add3_to_hand_with_12cards_1
		game = SetGame.new
		hand = [CARD3, CARD4, CARD1, CARD8, CARD2, CARD6, CARD5, CARD9, CARD7, CARD11, CARD10, CARD12]
		top_card = 12
		hand, top_card = game.add3 DECK_ORDERED, hand, top_card
		assert_equal 15, hand.size
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
		assert_equal CARD11, hand[9]
		assert_equal CARD10, hand[10]
		assert_equal CARD12, hand[11]
		assert_equal CARD13, hand[12]
		assert_equal CARD14, hand[13]
		assert_equal CARD15, hand[14]
	end

	def test_add3_to_hand_with_12cards_2
		game = SetGame.new
		hand = [CARD3, CARD4, CARD1, CARD8, CARD2, CARD6, CARD5, CARD9, CARD7, CARD11, CARD10, CARD12]
		top_card = 18
		hand, top_card = game.add3 DECK_ORDERED, hand, top_card
		assert_equal 15, hand.size
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
		assert_equal CARD11, hand[9]
		assert_equal CARD10, hand[10]
		assert_equal CARD12, hand[11]
		assert_equal CARD19, hand[12]
		assert_equal CARD20, hand[13]
		assert_equal CARD21, hand[14]
	end

	def test_add3_to_hand_with_15cards_1
		game = SetGame.new
		hand = [CARD3, CARD4, CARD1, CARD8, CARD2, CARD6, CARD5, CARD9, CARD7, CARD11, CARD10, CARD12, CARD15, CARD14, CARD13]
		top_card = 15
		hand, top_card = game.add3 DECK_ORDERED, hand, top_card
		assert_equal 18, hand.size
		assert_equal 18, top_card
		assert_equal CARD3, hand[0]
		assert_equal CARD4, hand[1]
		assert_equal CARD1, hand[2]
		assert_equal CARD8, hand[3]
		assert_equal CARD2, hand[4]
		assert_equal CARD6, hand[5]
		assert_equal CARD5, hand[6]
		assert_equal CARD9, hand[7]
		assert_equal CARD7, hand[8]
		assert_equal CARD11, hand[9]
		assert_equal CARD10, hand[10]
		assert_equal CARD12, hand[11]
		assert_equal CARD15, hand[12]
		assert_equal CARD14, hand[13]
		assert_equal CARD13, hand[14]
		assert_equal CARD16, hand[15]
		assert_equal CARD17, hand[16]
		assert_equal CARD18, hand[17]
	end

	def test_add3_to_hand_with_15cards_2
		game = SetGame.new
		hand = [CARD3, CARD4, CARD1, CARD8, CARD2, CARD6, CARD5, CARD9, CARD7, CARD11, CARD10, CARD12, CARD15, CARD14, CARD16]
		top_card = 18
		hand, top_card = game.add3 DECK_ORDERED, hand, top_card
		assert_equal 18, hand.size
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
		assert_equal CARD11, hand[9]
		assert_equal CARD10, hand[10]
		assert_equal CARD12, hand[11]
		assert_equal CARD15, hand[12]
		assert_equal CARD14, hand[13]
		assert_equal CARD16, hand[14]
		assert_equal CARD19, hand[15]
		assert_equal CARD20, hand[16]
		assert_equal CARD21, hand[17]
	end
end
