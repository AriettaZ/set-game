=begin
	Author: Gail Chen
	Created: 5/25
	Edit: Mike Lin
	Test plan for testing get_score method:
  Save_time = 30
  2. Time =
=end
require_relative "../set_game"
require "test/unit"

class TestGetScore < Test::Unit::TestCase
  def test_get_score
    game = SetGame.new
    game.save_time = 0
    game.start_time = Time.new(2018, 05, 29, 11, 10, 53, "-04:00")
    game.end_time = Time.new(2018, 05, 29, 11, 20, 53, "-04:00")
    game.number_of_correct = 1
    game.number_of_hint = 0
    assert_equal 300, game.get_score
  end
end


# def get_score
#   return ((360000/(@end_time - @start_time + @save_time))*((@number_of_correct-@number_of_hint)/(@number_of_correct+1)))
# end
