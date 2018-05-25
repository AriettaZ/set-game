#Author: Ariel
#Creation Date: 5/24

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
  CARD_3CARDS= [CARD1, CARD4, CARD5]
  CARD_18CARDS= [CARD1, CARD2, CARD3, CARD4, CARD5, CARD6, CARD7, CARD8, CARD9,CARD10, CARD11, CARD12, CARD13, CARD14, CARD15, CARD16, CARD17, CARD18]
  CARD_12CARDS= [CARD1, CARD2, CARD3, CARD4, CARD5, CARD6, CARD7, CARD8, CARD9,CARD10, CARD11, CARD12]

  def test_update_1
    game = SetGame.new
    deck= game.get_deck
    hand = CARD_12CARDS
    top_card = 12
    hand, top_card = game.update hand,"none",top_card,deck
    assert_equal deck[12], hand[12]
    assert_equal deck[13], hand[13]
    assert_equal deck[14], hand[14]
    assert_equal 15, hand.size
    assert_equal 15, top_card
  end
  def test_update_2
    game = SetGame.new
    deck= game.get_deck
    hand = CARD_18CARDS
    top_card = 54
    hand, top_card = game.update hand,"none",top_card,deck
    assert_equal deck[54], hand[18]
    assert_equal deck[55], hand[19]
    assert_equal deck[56], hand[20]
    assert_equal 21, hand.size
    assert_equal 57, top_card
  end
  def test_update_3
    game = SetGame.new
    deck= game.get_deck
    hand = CARD_21CARDS
    top_card = 57
    hand, top_card = game.update hand,"none",top_card,deck
    assert_equal CARD19, hand[18]
    assert_equal CARD20, hand[19]
    assert_equal CARD21, hand[20]
    assert_equal 21, hand.size
    assert_equal 57, top_card
  end
  def test_update_4
    game = SetGame.new
    deck= game.get_deck
    hand = CARD_18CARDS
    top_card = 81
    hand, top_card = game.update hand,"none",top_card,deck
    assert_equal CARD16, hand[15]
    assert_equal CARD17, hand[16]
    assert_equal CARD18, hand[17]
    assert_equal 18, hand.size
    assert_equal 81, top_card
  end


=begin
	Test plan for testing show_hand method:
	1. user_input='none' and correct,hand.length<21,top_card< 81
	2. user_input='none' and wrong,hand.length=21,top_card< 81
	3. user_input='none' and wrong,hand.length=21,top_card= 81
  4. user_input is wrong set,hand.length<21,top_card< 81
	5. user_input is wrong set, hand.length=21,top_card< 81
	6. user_input is wrong set,hand.length=21,top_card= 81
  7. user_input is correct set,hand.length<21,top_card< 81
  8. user_input is correct set, hand.length=21,top_card< 81
  9. user_input is correct set,hand.length=21,top_card= 81
=end
# test update, user no set, hand add 3
# puts ""
# puts "show hand after user_input='none',hand.length<21,top_card< 81:"
# hand, top_card = game.update(hand,"none",top_card,deck)
# game.show_hand(hand)
# print "top_card is ",top_card
# puts ""
# print "hand.length is ",hand.length
# puts ""
#
# # test update, user wrong set, don't change hand
# puts ""
# puts "show hand after user_input='[2, 5, 9]',hand.length<21,top_card< 81:"
# game.update(hand,'[2,5,9]',top_card,deck)
# game.show_hand(hand)
# print "top_card is ",top_card
# puts ""
# print "hand.length is ",hand.length
# puts ""
#
# # test update, user correct set, replace 3 cards
# puts ""
# puts "show hand after user_input='[19, 20, 21]'(correct set),hand.length<21,top_card< 81:"
# card1=Card.new('red', 'solid', 'oval', '3')
# card2=Card.new('red', 'solid', 'oval', '2')
# card3=Card.new('red', 'solid', 'oval', '1')
# hand.push(card1)
# hand.push(card2)
# hand.push(card3)
# top_card=top_card+3
# game.update(hand,'[19, 20, 21]',top_card,deck)
# game.show_hand(hand)
# print "top_card is ",top_card
# puts ""
# print "hand.length is ",hand.length
# puts ""
#
# # test update, user no set, hand add 3
# puts ""
# puts "show hand after user_input='none',hand.length<21,top_card< 81:"
# hand, top_card = game.update(hand,"none",top_card,deck)
# game.show_hand(hand)
# print "top_card is ",top_card
# puts ""
# print "hand.length is ",hand.length
# puts ""
#
# # test update, user wrong set, don't change hand
# puts ""
# puts "show hand after user_input='[2, 5, 9]',hand.length<21,top_card< 81:"
# game.update(hand,'[2,5,9]',top_card,deck)
# game.show_hand(hand)
# print "top_card is ",top_card
# puts ""
# print "hand.length is ",hand.length
# puts ""
#
# # test update, user correct set, replace 3 cards
# puts ""
# puts "show hand after user_input='[19, 20, 21]'(correct set),hand.length<21,top_card< 81:"
# card1=Card.new('red', 'solid', 'oval', '3')
# card2=Card.new('red', 'solid', 'oval', '2')
# card3=Card.new('red', 'solid', 'oval', '1')
# hand.push(card1)
# hand.push(card2)
# hand.push(card3)
# top_card=top_card+3
# game.update(hand,'[19, 20, 21]',top_card,deck)
# game.show_hand(hand)
# print "top_card is ",top_card
# puts ""
# print "hand.length is ",hand.length
# puts ""
#
# # test update,user no set and has 21 on hand, don't change hand
# puts ""
# puts "show hand after user_input='none',hand.length=21,top_card< 81:"
# game.update(hand,'none',top_card,deck)
# game.show_hand(hand)
# print "top_card is ",top_card
# puts ""
# print "hand.length is ",hand.length
# puts ""
#




end
