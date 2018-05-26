#Author: Ariel
#Creation Date: 5/24
#Edit: Mike 5/25

#require file set_game.rb
#class name: SetGame
require_relative '../set_game'
require "test/unit"

class TestUpdate < Test::Unit::TestCase
=begin
	Test plan for testing show_hand method:
	1. user_input='none' and correct,hand.length<21,top_card< 81
	2. user_input='none' and wrong,hand.length=21,top_card< 81
	3. user_input='none' and wrong,hand.length=21,top_card= 81
  4. user_input='none' and wrong,hand.length<21,top_card= 81
  5. user_input is wrong set,hand.length<21,top_card< 81
	6. user_input is wrong set, hand.length=21,top_card< 81
	7. user_input is wrong set,hand.length=21,top_card= 81
  8. user_input is correct set,hand.length<21,top_card< 81
  9. user_input is correct set, hand.length=21,top_card< 81
  10. user_input is correct set,hand.length=21,top_card= 81
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
  CARD10 = Card.new('red','open','diamond','1')
  CARD11 = Card.new('red','open','diamond','2')
  CARD12 = Card.new('red','open','diamond','3')
  CARD13 = Card.new('red','solid','oval','3')
  CARD14 = Card.new('purple','open','diamond','1')
  CARD15 = Card.new('purple','open','diamond','2')
  CARD16 = Card.new('purple','open','diamond','3')
  CARD17 = Card.new('green','open','diamond','1')
  CARD18 = Card.new('green','open','diamond','2')
  CARD19 = Card.new('green','open','diamond','3')
  CARD20 = Card.new('green','solid','diamond','1')
  CARD21 = Card.new('green','solid','diamond','2')
  CARD22 = Card.new('green','solid','diamond','3')
  CARD_21CARDS= [CARD1, CARD2, CARD3, CARD4, CARD5, CARD6, CARD7, CARD8, CARD9,CARD10, CARD11, CARD12, CARD13, CARD14, CARD15, CARD16, CARD17, CARD18,CARD19, CARD20, CARD21]
  CORRECT_SET= [0, 1, 2]
  WRONG_SET=[0, 1, 3]
  CARD_18CARDS= [CARD1, CARD2, CARD3, CARD4, CARD5, CARD6, CARD7, CARD8, CARD9,CARD10, CARD11, CARD12, CARD13, CARD14, CARD15, CARD16, CARD17, CARD18]
  CARD_12CARDS= [CARD1, CARD2, CARD3, CARD4, CARD5, CARD6, CARD7, CARD8, CARD9,CARD10, CARD11, CARD12]

  def test_getdeck_1
    game = SetGame.new
    deck= game.get_deck
    hand = [CARD1, CARD2, CARD3, CARD4, CARD5, CARD6, CARD7, CARD8, CARD9,CARD10, CARD11, CARD12]
    top_card = 12
    hand, top_card = game.update hand,[],top_card,deck
    assert_equal deck[12], hand[12]
    assert_equal deck[13], hand[13]
    assert_equal deck[14], hand[14]
    assert_equal 15, hand.size
    assert_equal 15, top_card
  end
  def test_update_2
    game = SetGame.new
    deck= game.get_deck
    hand =[CARD1, CARD2, CARD3, CARD4, CARD5, CARD6, CARD7, CARD8, CARD9,CARD10, CARD11, CARD12, CARD13, CARD14, CARD15, CARD16, CARD17, CARD18]
    top_card = 54
    hand, top_card = game.update hand,[],top_card,deck
    assert_equal deck[54], hand[18]
    assert_equal deck[55], hand[19]
    assert_equal deck[56], hand[20]
    assert_equal 21, hand.size
    assert_equal 57, top_card
  end
  def test_update_3
    game = SetGame.new
    deck= game.get_deck
    hand = [CARD1, CARD2, CARD3, CARD4, CARD5, CARD6, CARD7, CARD8, CARD9,CARD10, CARD11, CARD12, CARD13, CARD14, CARD15, CARD16, CARD17, CARD18,CARD19, CARD20, CARD21]
    top_card = 57
    hand, top_card = game.update hand,[],top_card,deck
    assert_equal CARD19, hand[18]
    assert_equal CARD20, hand[19]
    assert_equal CARD21, hand[20]
    assert_equal 21, hand.size
    assert_equal 57, top_card
  end
  def test_update_4
    game = SetGame.new
    deck= game.get_deck
    hand = [CARD1, CARD2, CARD3, CARD4, CARD5, CARD6, CARD7, CARD8, CARD9,CARD10, CARD11, CARD12, CARD13, CARD14, CARD15, CARD16, CARD17, CARD18]
    top_card = 81
    assert_equal 18, hand.size
    hand, top_card = game.update hand,[],top_card,deck
    assert_equal CARD16, hand[15]
    assert_equal CARD17, hand[16]
    assert_equal CARD18, hand[17]
    assert_equal 18, hand.size
    assert_equal 81, top_card
  end

  def test_update_5
    game = SetGame.new
    deck= game.get_deck
    hand = [CARD1, CARD2, CARD3, CARD4, CARD5, CARD6, CARD7, CARD8, CARD9,CARD10, CARD11, CARD12]
    top_card = 12
    assert_equal false, game.check_set?(hand[WRONG_SET[0]], hand[WRONG_SET[1]],hand[WRONG_SET[2]],["color","shading","symbol","number"])
    hand, top_card = game.update hand,WRONG_SET,top_card,deck
    assert_equal 12, hand.size
    assert_equal 12, top_card
  end
  def test_update_6
    game = SetGame.new
    deck= game.get_deck
    hand =[CARD1, CARD2, CARD3, CARD4, CARD5, CARD6, CARD7, CARD8, CARD9,CARD10, CARD11, CARD12, CARD13, CARD14, CARD15, CARD16, CARD17, CARD18,CARD19, CARD20, CARD21]
    top_card = 54
    assert_equal false, game.check_set?(hand[WRONG_SET[0]], hand[WRONG_SET[1]],hand[WRONG_SET[2]],["color","shading","symbol","number"])
    hand, top_card = game.update hand,WRONG_SET,top_card,deck
    assert_equal 21, hand.size
    assert_equal 54, top_card
  end
  def test_update_7
    game = SetGame.new
    deck= game.get_deck
    hand = [CARD1, CARD2, CARD3, CARD4, CARD5, CARD6, CARD7, CARD8, CARD9,CARD10, CARD11, CARD12, CARD13, CARD14, CARD15, CARD16, CARD17, CARD18,CARD19, CARD20, CARD21]
    top_card = 81
    assert_equal false, game.check_set?(hand[WRONG_SET[0]], hand[WRONG_SET[1]],hand[WRONG_SET[2]],["color","shading","symbol","number"])
    hand, top_card = game.update hand,WRONG_SET,top_card,deck
    assert_equal 21, hand.size
    assert_equal 81, top_card
  end
  def test_update_8
    game = SetGame.new
    deck= game.get_deck
    hand = [CARD1, CARD2, CARD3, CARD4, CARD5, CARD6, CARD7, CARD8, CARD9,CARD10, CARD11, CARD12]
    top_card = 12
    assert_equal true, game.check_set?(hand[CORRECT_SET[0]], hand[CORRECT_SET[1]],hand[CORRECT_SET[2]],["color","shading","symbol","number"])
    hand, top_card = game.update hand,CORRECT_SET,top_card,deck
    assert_equal 12, hand.size
    assert_equal 15, top_card
  end
  def test_update_9
    game = SetGame.new
    deck= game.get_deck
    hand =[CARD1, CARD2, CARD3, CARD4, CARD5, CARD6, CARD7, CARD8, CARD9,CARD10, CARD11, CARD12, CARD13, CARD14, CARD15, CARD16, CARD17, CARD18,CARD19, CARD20, CARD21]
    top_card = 54
    assert_equal true, game.check_set?(hand[CORRECT_SET[0]], hand[CORRECT_SET[1]],hand[CORRECT_SET[2]],["color","shading","symbol","number"])
    hand, top_card = game.update hand,CORRECT_SET,top_card,deck
    assert_equal 21, hand.size
    assert_equal 57, top_card
  end
  def test_update_10
    game = SetGame.new
    deck= game.get_deck
    hand = [CARD1, CARD2, CARD3, CARD4, CARD5, CARD6, CARD7, CARD8, CARD9,CARD10, CARD11, CARD12, CARD13, CARD14, CARD15, CARD16, CARD17, CARD18,CARD19, CARD20, CARD21]
    top_card = 81
    assert_equal true, game.check_set?(hand[CORRECT_SET[0]], hand[CORRECT_SET[1]],hand[CORRECT_SET[2]],["color","shading","symbol","number"])
    hand, top_card = game.update hand,CORRECT_SET,top_card,deck
    assert_equal 18, hand.size
    assert_equal 81, top_card
  end
end
