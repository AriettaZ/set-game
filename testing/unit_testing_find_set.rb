#Author: Mike
#Creation Date: 5/25

require_relative "../set_game"
require "test/unit"

class TestGetFindSet < Test::Unit::TestCase
	def test_find_set_1
		hand = []
#		puts SetGame.new.find_set(hand).to_s

	end

	def test_find_set_2
			card1 = Card.new("red","solid","squiggle","3")
			card2 = Card.new("green","striped","squiggle","2")
			card3 = Card.new("red","solid","diamond","1")
			card4 = Card.new("red","open","diamond","1")
			card5 = Card.new("red","solid","oval","2")
			card6 = Card.new("green","open","oval","1")

			hand = [card1, card2, card3, card4, card5, card6]

=begin
		hand_stat_table
		[
			[[card1, card3, card4, card5],[],[card2, card6]],
			[[card2],[card1,card3,card5],[card4,card6]],
			[[card3,card4],[card1,card2],[card5,card6]]
			[[card3,card4,card6],[card2,card5],[card1]]
		]

		[card1,card3,card5]
=end

#			puts SetGame.new.find_set(hand).to_s
#			puts [card1,card3,card5].to_s
	end

	def test_find_set_3
			card1 = Card.new('red','striped','diamond','1')
			card2 = Card.new('red','striped','diamond','2')
			card3 = Card.new('red','striped','diamond','3')
			card4 = Card.new('red','striped','squiggle','1')
			card5 = Card.new('red','striped','squiggle','2')
			card6 = Card.new('red','striped','squiggle','3')
			card7 = Card.new('red','striped','oval','1')
			card8 = Card.new('red','striped','oval','2')
			card9 = Card.new('red','striped','oval','3')
			card10 = Card.new('red','solid','diamond','1')
			card11 = Card.new('red','solid','diamond','2')
			card12 = Card.new('red','solid','diamond','3')
			hand = [card1, card2, card3, card4, card5, card6, card7, card8, card9,card10, card11, card12]

=begin
		hand_stat_table
		[
			[[card1, card3, card4, card5],[],[card2, card6]],
			[[card2],[card1,card3,card5],[card4,card6]],
			[[card3,card4],[card1,card2],[card5,card6]]
			[[card3,card4,card6],[card2,card5],[card1]]
		]

		[card1,card3,card5]
=end

#			puts SetGame.new.find_set(hand).to_s
	end

	def test_find_set_4
		game = SetGame.new
		deck = game.get_deck
		top_card = 0
		game.shuffle(deck)
#		hand, top_card = game.get_hand(deck,top_card)
		game.show_hand deck

		puts game.find_set(deck).to_s
	end

	def test_find_set_5
		card1 = Card.new('red','striped','diamond','1')
		card2 = Card.new('red','striped','diamond','2')
		card5 = Card.new('red','striped','squiggle','2')
		hand = [card1, card2, card5]

#		puts SetGame.new.find_set(hand).length
	end
end
