#Author: Gail
#Creation Date: 5/23

#require file set_game.rb
#class name: SetGame

=begin
	Author: Gail
	Created: 5/23
	Editor: N/A
	Test plan for testing get_hand method: (use deck.size = 15)
	1. top_card = 0, use ordered deck
	2. top_card = 3, use ordered deck
	3. top_card = 0, use unordered deck
	4. top_card = 3, use unordered deck
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
	DECK_ORDERED = [CARD1, CARD2, CARD3, CARD4, CARD5, CARD6, CARD7, CARD8, CARD9, CARD10, CARD11, CARD12, CARD13, CARD14, CARD15]
	DECK_UNORDERED = [CARD3, CARD4, CARD13, CARD8, CARD2, CARD15, CARD5, CARD9, CARD12, CARD10, CARD7, CARD11, CARD1, CARD14, CARD6]

	def test_get_hand_1
		game = SetGame.new
		hand = []
		top_card = 0
		hand, top_card = game.get_hand DECK_ORDERED, top_card
		assert_equal 12, hand.size
		assert_equal 12, top_card
		assert_equal CARD1, hand[0]
		assert_equal CARD2, hand[1]
		assert_equal CARD3, hand[2]
		assert_equal CARD4, hand[3]
		assert_equal CARD5, hand[4]
		assert_equal CARD6, hand[5]
		assert_equal CARD7, hand[6]
		assert_equal CARD8, hand[7]
		assert_equal CARD9, hand[8]
		assert_equal CARD10, hand[9]
		assert_equal CARD11, hand[10]
		assert_equal CARD12, hand[11]
	end

	def test_get_hand_2
		game = SetGame.new
		hand = []
		top_card = 3
		hand, top_card = game.get_hand DECK_ORDERED, top_card
		assert_equal 12, hand.size
		assert_equal 15, top_card
		assert_equal CARD4, hand[0]
		assert_equal CARD5, hand[1]
		assert_equal CARD6, hand[2]
		assert_equal CARD7, hand[3]
		assert_equal CARD8, hand[4]
		assert_equal CARD9, hand[5]
		assert_equal CARD10, hand[6]
		assert_equal CARD11, hand[7]
		assert_equal CARD12, hand[8]
		assert_equal CARD13, hand[9]
		assert_equal CARD14, hand[10]
		assert_equal CARD15, hand[11]
	end

	def test_get_hand_3
		game = SetGame.new
		hand = []
		top_card = 0
		hand, top_card = game.get_hand DECK_UNORDERED, top_card
		assert_equal 12, hand.size
		assert_equal 12, top_card
		assert_equal CARD3, hand[0]
		assert_equal CARD4, hand[1]
		assert_equal CARD13, hand[2]
		assert_equal CARD8, hand[3]
		assert_equal CARD2, hand[4]
		assert_equal CARD15, hand[5]
		assert_equal CARD5, hand[6]
		assert_equal CARD9, hand[7]
		assert_equal CARD12, hand[8]
		assert_equal CARD10, hand[9]
		assert_equal CARD7, hand[10]
		assert_equal CARD11, hand[11]
	end

	def test_get_hand_4
		game = SetGame.new
		hand = []
		top_card = 3
		hand, top_card = game.get_hand DECK_UNORDERED, top_card
		assert_equal 12, hand.size
		assert_equal 15, top_card
		assert_equal CARD8, hand[0]
		assert_equal CARD2, hand[1]
		assert_equal CARD15, hand[2]
		assert_equal CARD5, hand[3]
		assert_equal CARD9, hand[4]
		assert_equal CARD12, hand[5]
		assert_equal CARD10, hand[6]
		assert_equal CARD7, hand[7]
		assert_equal CARD11, hand[8]
		assert_equal CARD1, hand[9]
		assert_equal CARD14, hand[10]
		assert_equal CARD6, hand[11]
	end

end
