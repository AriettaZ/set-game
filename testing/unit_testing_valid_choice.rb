=begin
	Author: Gail Chen
	Created: 5/25
	Edit: N/A
	Test plan for testing valid_choice method:
	- Return true
		1. max = 3, user_input = "1"
		2. max = 3, user_input = "3"
		3. max = 8, user_input = "4"
		3. max = 8, user_input = "8"
	- max = 8, Return false
		1. max = 3, user_input = "0"
		2. max = 3, user_input = "4"
		3. max = 3, user_input = "a"
		4. max = 8, user_input = "9"
		5. max = 8, user_input = "s"
		6. max = 8, user_input = "10"
		8. max = 8, user_input = "3a"
		8. max = 8, user_input = "b2b"
		9. max = 8, user_input = "abc"
		10. max = 8, user_input = "3ab"
=end

require_relative "../set_game"
require "test/unit"

class TestGetHand < Test::Unit::TestCase

	# True Case 1. max = 3, user_input = "1"
	def test_valid_choice_true_1
		game = SetGame.new
		user_input = "1"
		assert_equal true, game.valid_choice?(user_input, 3)
	end

	# True Case 2. max = 3, user_input = "3"
	def test_valid_choice_true_2
		game = SetGame.new
		user_input = "3"
		assert_equal true, game.valid_choice?(user_input, 3)
	end

	# True Case 3. max = 8, user_input = "4"
	def test_valid_choice_true_3
		game = SetGame.new
		user_input = "4"
		assert_equal true, game.valid_choice?(user_input, 8)
	end

	# True Case 4. max = 8, user_input = "8"
	def test_valid_choice_true_4
		game = SetGame.new
		user_input = "8"
		assert_equal true, game.valid_choice?(user_input, 8)
	end

	# False Case 1. max = 3, user_input = "0"
	def test_valid_choice_false_1
		game = SetGame.new
		user_input = "0"
		assert_equal false, game.valid_choice?(user_input, 3)
	end

	# False Case 2. max = 3, user_input = "4"
	def test_valid_choice_false_2
		game = SetGame.new
		user_input = "4"
		assert_equal false, game.valid_choice?(user_input, 3)
	end

	# False Case 3. max = 3, user_input = "a"
	def test_valid_choice_false_3
		game = SetGame.new
		user_input = "a"
		assert_equal false, game.valid_choice?(user_input, 3)
	end

	# False Case 4. max = 8, user_input = "9"
	def test_valid_choice_false_4
		game = SetGame.new
		user_input = "9"
		assert_equal false, game.valid_choice?(user_input, 8)
	end

	# False Case 5. max = 8, user_input = "s"
	def test_valid_choice_false_5
		game = SetGame.new
		user_input = "s"
		assert_equal false, game.valid_choice?(user_input, 8)
	end

	# False Case 6. max = 8, user_input = "10"
	def test_valid_choice_false_6
		game = SetGame.new
		user_input = "10"
		assert_equal false, game.valid_choice?(user_input, 8)
	end

	# False Case 8. max = 8, user_input = "3a"
	def test_valid_choice_false_7
		game = SetGame.new
		user_input = "3a"
		assert_equal false, game.valid_choice?(user_input, 8)
	end

	# False Case 8. max = 8, user_input = "b2b"
	def test_valid_choice_false_8
		game = SetGame.new
		user_input = "b2b"
		assert_equal false, game.valid_choice?(user_input, 8)
	end

	# False Case 9. max = 8, user_input = "abc"
	def test_valid_choice_false_9
		game = SetGame.new
		user_input = "abc"
		assert_equal false, game.valid_choice?(user_input, 8)
	end

	# False Case 10. max = 8, user_input = "3ab"
	def test_valid_choice_false_10
		game = SetGame.new
		user_input = "3ab"
		assert_equal false, game.valid_choice?(user_input, 8)
	end

end
