#Author: Gail
#Creation Date: 5/23

#require file set_game.rb
#class name: SetGame
require_relative "../set_game"
require "test/unit"

class TestUpdate < Test::Unit::TestCase

=begin
	Test plan for testing show_hand method:
	1. hand.size = 0
	2. hand.size = 3
	3. hand.size = 6
	4. hand.size = 12
	5. hand.size = 15
=end

# test update, user no set, hand add 3
puts ""
puts "show hand after user_input='none',hand.length<21,top_card< 81:"
hand, top_card = game.update(hand,"none",top_card,deck)
game.show_hand(hand)
print "top_card is ",top_card
puts ""
print "hand.length is ",hand.length
puts ""

# test update, user wrong set, don't change hand
puts ""
puts "show hand after user_input='[2, 5, 9]',hand.length<21,top_card< 81:"
game.update(hand,'[2,5,9]',top_card,deck)
game.show_hand(hand)
print "top_card is ",top_card
puts ""
print "hand.length is ",hand.length
puts ""

# test update, user correct set, replace 3 cards
puts ""
puts "show hand after user_input='[19, 20, 21]'(correct set),hand.length<21,top_card< 81:"
card1=Card.new('red', 'solid', 'oval', '3')
card2=Card.new('red', 'solid', 'oval', '2')
card3=Card.new('red', 'solid', 'oval', '1')
hand.push(card1)
hand.push(card2)
hand.push(card3)
top_card=top_card+3
game.update(hand,'[19, 20, 21]',top_card,deck)
game.show_hand(hand)
print "top_card is ",top_card
puts ""
print "hand.length is ",hand.length
puts ""

# test update,user no set and has 21 on hand, don't change hand
puts ""
puts "show hand after user_input='none',hand.length=21,top_card< 81:"
game.update(hand,'none',top_card,deck)
game.show_hand(hand)
print "top_card is ",top_card
puts ""
print "hand.length is ",hand.length
puts ""



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
	def test_show_hand_1
	end

end
