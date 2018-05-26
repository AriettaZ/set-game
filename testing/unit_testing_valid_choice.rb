=begin
	Author: Gail Chen
	Created: 5/25
	Edit: N/A
	Test plan for testing valid_choice method:
	- Return true
		1. user_input = "1"
		2. user_input = "3"
		3. user_input = "6"
	- Return false
		1. user_input = "0"
		2. user_input = "7"
		3. user_input = "a"
		4. user_input = "s"
		5. user_input = "10"
		6. user_input = "3a"
		7. user_input = "b2b"
		8. user_input = "abc"
		9. user_input = "3ab"
=end

require_relative "../set_game"
require "test/unit"

class TestGetHand < Test::Unit::TestCase

	# True Case 1. user_input = "1"
	def test_valid_choice_true_1
		game = SetGame.new
		user_input = "1"
		assert_equal true, game.valid_choice?(user_input)
	end

	# True Case 2. user_input = "3"
	def test_valid_choice_true_2
		game = SetGame.new
		user_input = "3"
		assert_equal true, game.valid_choice?(user_input)
	end

	# True Case 3. user_input = "6"
	def test_valid_choice_true_3
		game = SetGame.new
		user_input = "6"
		assert_equal true, game.valid_choice?(user_input)
	end

	# False Case 1. user_input = "0"
	def test_valid_choice_false_1
		game = SetGame.new
		user_input = "0"
		assert_equal false, game.valid_choice?(user_input)
	end

	# False Case 2. user_input = "7"
	def test_valid_choice_false_2
		game = SetGame.new
		user_input = "7"
		assert_equal false, game.valid_choice?(user_input)
	end

	# False Case 3. user_input = "a"
	def test_valid_choice_false_3
		game = SetGame.new
		user_input = "a"
		assert_equal false, game.valid_choice?(user_input)
	end

	# False Case 4. user_input = "s"
	def test_valid_choice_false_4
		game = SetGame.new
		user_input = "s"
		assert_equal false, game.valid_choice?(user_input)
	end

	# False Case 5. user_input = "10"
	def test_valid_choice_false_5
		game = SetGame.new
		user_input = "10"
		assert_equal false, game.valid_choice?(user_input)
	end

	# False Case 6. user_input = "3a"
	def test_valid_choice_false_6
		game = SetGame.new
		user_input = "3a"
		assert_equal false, game.valid_choice?(user_input)
	end

	# False Case 7. user_input = "b2b"
	def test_valid_choice_false_7
		game = SetGame.new
		user_input = "b2b"
		assert_equal false, game.valid_choice?(user_input)
	end

	# False Case 8. user_input = "abc"
	def test_valid_choice_false_8
		game = SetGame.new
		user_input = "abc"
		assert_equal false, game.valid_choice?(user_input)
	end

	# False Case 9. user_input = "3ab"
	def test_valid_choice_false_9
		game = SetGame.new
		user_input = "3ab"
		assert_equal false, game.valid_choice?(user_input)
	end

end
