# Author: Channing
# Date: 5/25
#
require "test/unit"
require_relative "../card.rb"
require_relative "../set_game.rb"

class OrganizeTest < Test::Unit::TestCase
	
CARD1 = Card.new("red", "striped", "diamond", "1")
CARD2 = Card.new("red", "striped", "diamond", "2")
CARD3 = Card.new("red", "striped", "diamond", "3")
CARD4 = Card.new("red", "striped", "solid", "1")
CARD5 = Card.new("red", "striped", "solid", "2")
CARD6 = Card.new("red", "striped", "solid", "3")

	def test_empty_hand
		game = SetGame.new
		hand = []
		hash = Hash.new {|k,v| k[v] = []}
		attrs = $Colors + $Shadings + $Symbols + $Numbers
		attrs.each {|attr| hash[attr.intern]}
		assert_equal(game.organize(hand), hash)
	end

	def test_one_card_hand
		game = SetGame.new
		hand = [CARD1]
		hash = Hash.new {|k,v| k[v] = []}
		attrs = $Colors + $Shadings + $Symbols + $Numbers
		attrs.each {|attr| hash[attr.intern]}
		[:color,:shading, :symbol, :number].each {|val| hash[CARD1[val].intern].push(CARD1)}		
		#hash[:red].push(CARD1)
		#hash[:striped].push(CARD1)
		#hash[:diamond].push(CARD1)
		#hash[:"1"].push(CARD1)
		assert_equal(game.organize(hand), hash)
	end


	def test_two_card_hand
		game = SetGame.new
		hand = [CARD1, CARD2]
		hash = Hash.new {|k,v| k[v] = []}
		attrs = $Colors + $Shadings + $Symbols + $Numbers
		attrs.each {|attr| hash[attr.intern]}
		[:color,:shading, :symbol, :number].each {|val| hash[CARD1[val].intern].push(CARD1)}
	[:color,:shading, :symbol, :number].each {|val| hash[CARD2[val].intern].push(CARD2)}		
		#hash[:red].push(CARD1)
		#hash[:striped].push(CARD1)
		#hash[:diamond].push(CARD1)
		#hash[:"1"].push(CARD1)
		assert_equal(game.organize(hand), hash)
	end
end
