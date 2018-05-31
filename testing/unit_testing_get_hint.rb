#Author: Channing
#Creation Date: 5/29

require_relative "../set_game"
require "test/unit"

class TestGetHint < Test::Unit::TestCase

=begin
	Test Plan:
		1. get_hint from a game with 0 hints used out of 5 hint total  (game hard difficulty)
		2. get_hint from a game with 0 hints used out of 10 hint total  (game medium difficulty)
		3. get_hint from a game with 0 hints used out of 27 hint total  (game easy difficulty)

		4. get_hint from a game with 1 hints used out of 5 hint total  (game hard difficulty)
		5. get_hint from a game with 1 hints used out of 10 hint total  (game medium difficulty)
		6. get_hint from a game with 1 hints used out of 27 hint total  (game easy difficulty)

		7. get_hint from a game with 4 hints used out of 5 hint total  (game hard difficulty)
		8. get_hint from a game with 4 hints used out of 10 hint total  (game medium difficulty)
		9. get_hint from a game with 4 hints used out of 27 hint total  (game easy difficulty)

		10. get_hint from a game with 5 hints used out of 5 hint total  (game hard difficulty)
		11. get_hint from a game with 10 hints used out of 10 hint total  (game medium difficulty)
		12. get_hint from a game with 27 hints used out of 27 hint total  (game easy difficulty)
=end

	def test_get_hint_1
		actual_output = File.new 'get_hint_output/actual_output1.txt', 'w'
		$stdout = actual_output
		game = SetGame.new
		game.total_hint = 5
		game.get_hint
		actual_output.close
		assert_true FileUtils.compare_file('get_hint_output/expected_output1.txt', 'get_hint_output/actual_output1.txt')
		assert_true (game.number_of_hint == 1)
	end

	def test_get_hint_2
		actual_output = File.new 'get_hint_output/actual_output2.txt', 'w'
		$stdout = actual_output
		game = SetGame.new
		game.total_hint = 10
		game.get_hint
		actual_output.close
		assert_true FileUtils.compare_file('get_hint_output/expected_output2.txt', 'get_hint_output/actual_output2.txt')
		assert_true (game.number_of_hint == 1)
	end

	def test_get_hint_3
		actual_output = File.new 'get_hint_output/actual_output3.txt', 'w'
		$stdout = actual_output
		game = SetGame.new
		game.total_hint = 27
		game.get_hint
		actual_output.close
		assert_true FileUtils.compare_file('get_hint_output/expected_output3.txt', 'get_hint_output/actual_output3.txt')
		assert_true (game.number_of_hint == 1)
	end

	def test_get_hint_4
		actual_output = File.new 'get_hint_output/actual_output4.txt', 'w'
		$stdout = actual_output
		game = SetGame.new
		game.total_hint = 5
		game.number_of_hint = 1
		game.get_hint
		actual_output.close
		assert_true FileUtils.compare_file('get_hint_output/expected_output4.txt', 'get_hint_output/actual_output4.txt')
		assert_true (game.number_of_hint == 2)
	end

	def test_get_hint_5
		actual_output = File.new 'get_hint_output/actual_output5.txt', 'w'
		$stdout = actual_output
		game = SetGame.new
		game.total_hint = 10
		game.number_of_hint = 1
		game.get_hint
		actual_output.close
		assert_true FileUtils.compare_file('get_hint_output/expected_output5.txt', 'get_hint_output/actual_output5.txt')
		assert_true (game.number_of_hint == 2)
	end

	def test_get_hint_6
		actual_output = File.new 'get_hint_output/actual_output6.txt', 'w'
		$stdout = actual_output
		game = SetGame.new
		game.total_hint = 27
		game.number_of_hint = 1
		game.get_hint
		actual_output.close
		assert_true FileUtils.compare_file('get_hint_output/expected_output6.txt', 'get_hint_output/actual_output6.txt')
		assert_true (game.number_of_hint == 2)
	end

	def test_get_hint_7
		actual_output = File.new 'get_hint_output/actual_output7.txt', 'w'
		$stdout = actual_output
		game = SetGame.new
		game.total_hint = 5
		game.number_of_hint = 4
		game.get_hint
		actual_output.close
		assert_true FileUtils.compare_file('get_hint_output/expected_output7.txt', 'get_hint_output/actual_output7.txt')
		assert_true (game.number_of_hint == 5)
	end

	def test_get_hint_8
		actual_output = File.new 'get_hint_output/actual_output8.txt', 'w'
		$stdout = actual_output
		game = SetGame.new
		game.total_hint = 10
		game.number_of_hint = 4
		game.get_hint
		actual_output.close
		assert_true FileUtils.compare_file('get_hint_output/expected_output8.txt', 'get_hint_output/actual_output8.txt')
		assert_true (game.number_of_hint == 5)
	end

	def test_get_hint_9
		actual_output = File.new 'get_hint_output/actual_output9.txt', 'w'
		$stdout = actual_output
		game = SetGame.new
		game.total_hint = 27
		game.number_of_hint = 4
		game.get_hint
		actual_output.close
		assert_true FileUtils.compare_file('get_hint_output/expected_output9.txt', 'get_hint_output/actual_output9.txt')
		assert_true (game.number_of_hint == 5)
	end

	def test_get_hint_10
		actual_output = File.new 'get_hint_output/actual_output10.txt', 'w'
		$stdout = actual_output
		game = SetGame.new
		game.total_hint = 5
		game.number_of_hint = 5
		game.get_hint
		actual_output.close
		assert_true FileUtils.compare_file('get_hint_output/expected_output10.txt', 'get_hint_output/actual_output10.txt')
		assert_true (game.number_of_hint == 5)
	end

	def test_get_hint_11
		actual_output = File.new 'get_hint_output/actual_output11.txt', 'w'
		$stdout = actual_output
		game = SetGame.new
		game.total_hint = 10
		game.number_of_hint = 10
		game.get_hint
		actual_output.close
		assert_true FileUtils.compare_file('get_hint_output/expected_output11.txt', 'get_hint_output/actual_output11.txt')
		assert_true (game.number_of_hint == 10)
	end

	def test_get_hint_12
		actual_output = File.new 'get_hint_output/actual_output12.txt', 'w'
		$stdout = actual_output
		game = SetGame.new
		game.total_hint = 27
		game.number_of_hint = 27
		game.get_hint
		actual_output.close
		assert_true FileUtils.compare_file('get_hint_output/expected_output12.txt', 'get_hint_output/actual_output12.txt')
		assert_true (game.number_of_hint == 27)
	end
end
