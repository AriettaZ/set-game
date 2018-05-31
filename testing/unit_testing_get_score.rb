=begin
	Author: Gail Chen
	Created: 5/30
  Edit: N/A
	Test plan for testing get_score method:
  1. save_time = 0.0, number_of_currect = 0, number_of_hint = 0, current game duration = 30 seconds
  2. save_time = 65.5, number_of_currect = 0, number_of_hint = 0, current game duration = 30 seconds
  3. save_time = 0.0, number_of_currect = 0, number_of_hint = 1, current game duration = 30 seconds
  4. save_time = 65.5, number_of_currect = 0, number_of_hint = 1, current game duration = 30 seconds
  5. save_time = 0.0, number_of_currect = 0, number_of_hint = 1, current game duration = 5 minutes
  6. save_time = 0.0, number_of_currect = 1, number_of_hint = 0, current game duration = 30 seconds
  7. save_time = 0.0, number_of_currect = 1, number_of_hint = 0, current game duration = 5 minutes
  8. save_time = 65.5, number_of_currect = 1, number_of_hint = 0, current game duration = 5 minutes
  9. save_time = 0.0, number_of_currect = 1, number_of_hint = 1, current game duration = 30 seconds
  10. save_time = 65.5, number_of_currect = 1, number_of_hint = 1, current game duration = 30 seconds
  11. save_time = 0.0, number_of_currect = 5, number_of_hint = 0, current game duration = 30 seconds
  12. save_time = 65.5, number_of_currect = 5, number_of_hint = 0, current game duration = 30 seconds
  13. save_time = 0.0, number_of_currect = 5, number_of_hint = 0, current game duration = 5 minutes
  14. save_time = 0.0, number_of_currect = 5, number_of_hint = 0, current game duration = 2 hours
  15. save_time = 0.0, number_of_currect = 5, number_of_hint = 1, current game duration = 30 seconds
  16. save_time = 65.5, number_of_currect = 5, number_of_hint = 1, current game duration = 30 seconds
  17. save_time = 0.0, number_of_currect = 5, number_of_hint = 3, current game duration = 30 seconds
  18. save_time = 65.5, number_of_currect = 5, number_of_hint = 3, current game duration = 30 seconds
  19. save_time = 0.0, number_of_currect = 5, number_of_hint = 5, current game duration = 30 minutes
  20. save_time = 65.5, number_of_currect = 5, number_of_hint = 5, current game duration = 30 minutes
  21. save_time = 0.0, number_of_currect = 25, number_of_hint = 0, current game duration = 30 seconds
  22. save_time = 65.5, number_of_currect = 25, number_of_hint = 0, current game duration = 30 seconds
  23. save_time = 0.0, number_of_currect = 25, number_of_hint = 0, current game duration = 10 minutes
  24. save_time = 0.0, number_of_currect = 25, number_of_hint = 0, current game duration = 30 minutes
  25. save_time = 0.0, number_of_currect = 25, number_of_hint = 10, current game duration = 30 minutes
  26. save_time = 65.5, number_of_currect = 25, number_of_hint = 10, current game duration = 30 minutes
  27. save_time = 0.0, number_of_currect = 25, number_of_hint = 20, current game duration = 30 minutes
  28. save_time = 0.0, number_of_currect = 25, number_of_hint = 27, current game duration = 30 minutes
=end
require_relative "../set_game"
require "test/unit"

class TestGetScore < Test::Unit::TestCase
  def test_get_score_1
    game = SetGame.new
    game.save_time = 0.0
    game.start_time = Time.new(2018, 05, 29, 11, 10, 00, "-04:00")
    game.end_time = Time.new(2018, 05, 29, 11, 10, 30, "-04:00")
    game.number_of_correct = 0
    game.number_of_hint = 0
    assert_equal 0, game.get_score
  end

  def test_get_score_2
    game = SetGame.new
    game.save_time = 65.5
    game.start_time = Time.new(2018, 05, 29, 11, 10, 00, "-04:00")
    game.end_time = Time.new(2018, 05, 29, 11, 10, 30, "-04:00")
    game.number_of_correct = 0
    game.number_of_hint = 0
    assert_equal 0, game.get_score
  end

  def test_get_score_3
    game = SetGame.new
    game.save_time = 0
    game.start_time = Time.new(2018, 05, 29, 11, 10, 00, "-04:00")
    game.end_time = Time.new(2018, 05, 29, 11, 10, 30, "-04:00")
    game.number_of_correct = 0
    game.number_of_hint = 1
    assert_equal 0, game.get_score
  end

  def test_get_score_4
    game = SetGame.new
    game.save_time = 65.5
    game.start_time = Time.new(2018, 05, 29, 11, 10, 00, "-04:00")
    game.end_time = Time.new(2018, 05, 29, 11, 10, 30, "-04:00")
    game.number_of_correct = 0
    game.number_of_hint = 1
    assert_equal 0, game.get_score
  end

  def test_get_score_5
    game = SetGame.new
    game.save_time = 0
    game.start_time = Time.new(2018, 05, 29, 11, 10, 53, "-04:00")
    game.end_time = Time.new(2018, 05, 29, 11, 15, 53, "-04:00")
    game.number_of_correct = 0
    game.number_of_hint = 1
    assert_equal 0, game.get_score
  end

  def test_get_score_6
    game = SetGame.new
    game.save_time = 0
    game.start_time = Time.new(2018, 05, 29, 11, 10, 00, "-04:00")
    game.end_time = Time.new(2018, 05, 29, 11, 10, 30, "-04:00")
    game.number_of_correct = 1
    game.number_of_hint = 0
    assert_equal 6000, game.get_score
  end

  def test_get_score_7
    game = SetGame.new
    game.save_time = 0
    game.start_time = Time.new(2018, 05, 29, 11, 10, 00, "-04:00")
    game.end_time = Time.new(2018, 05, 29, 11, 15, 00, "-04:00")
    game.number_of_correct = 1
    game.number_of_hint = 0
    assert_equal 600, game.get_score
  end

  def test_get_score_8
    game = SetGame.new
    game.save_time = 65.5
    game.start_time = Time.new(2018, 05, 29, 11, 10, 00, "-04:00")
    game.end_time = Time.new(2018, 05, 29, 11, 15, 00, "-04:00")
    game.number_of_correct = 1
    game.number_of_hint = 0
    assert_equal 492.47, game.get_score
  end

  def test_get_score_9
    game = SetGame.new
    game.save_time = 0
    game.start_time = Time.new(2018, 05, 29, 11, 10, 00, "-04:00")
    game.end_time = Time.new(2018, 05, 29, 11, 10, 30, "-04:00")
    game.number_of_correct = 1
    game.number_of_hint = 1
    assert_equal 0, game.get_score
  end

  def test_get_score_10
    game = SetGame.new
    game.save_time = 65.5
    game.start_time = Time.new(2018, 05, 29, 11, 10, 00, "-04:00")
    game.end_time = Time.new(2018, 05, 29, 11, 10, 30, "-04:00")
    game.number_of_correct = 1
    game.number_of_hint = 1
    assert_equal 0, game.get_score
  end

  def test_get_score_11
    game = SetGame.new
    game.save_time = 0
    game.start_time = Time.new(2018, 05, 29, 11, 10, 00, "-04:00")
    game.end_time = Time.new(2018, 05, 29, 11, 10, 30, "-04:00")
    game.number_of_correct = 5
    game.number_of_hint = 0
    assert_equal 10000, game.get_score
  end

  def test_get_score_12
    game = SetGame.new
    game.save_time = 65.5
    game.start_time = Time.new(2018, 05, 29, 11, 10, 00, "-04:00")
    game.end_time = Time.new(2018, 05, 29, 11, 10, 30, "-04:00")
    game.number_of_correct = 5
    game.number_of_hint = 0
    assert_equal 3141.36, game.get_score
  end

  def test_get_score_13
    game = SetGame.new
    game.save_time = 0
    game.start_time = Time.new(2018, 05, 29, 11, 10, 00, "-04:00")
    game.end_time = Time.new(2018, 05, 29, 11, 15, 00, "-04:00")
    game.number_of_correct = 5
    game.number_of_hint = 0
    assert_equal 1000, game.get_score
  end

  def test_get_score_14
    game = SetGame.new
    game.save_time = 0
    game.start_time = Time.new(2018, 05, 29, 11, 10, 00, "-04:00")
    game.end_time = Time.new(2018, 05, 29, 13, 10, 00, "-04:00")
    game.number_of_correct = 5
    game.number_of_hint = 0
    assert_equal 41.66, game.get_score
  end

  def test_get_score_15
    game = SetGame.new
    game.save_time = 0
    game.start_time = Time.new(2018, 05, 29, 11, 10, 00, "-04:00")
    game.end_time = Time.new(2018, 05, 29, 11, 10, 30, "-04:00")
    game.number_of_correct = 5
    game.number_of_hint = 1
    assert_equal 8000, game.get_score
  end

  def test_get_score_16
    game = SetGame.new
    game.save_time = 65.5
    game.start_time = Time.new(2018, 05, 29, 11, 10, 00, "-04:00")
    game.end_time = Time.new(2018, 05, 29, 11, 10, 30, "-04:00")
    game.number_of_correct = 5
    game.number_of_hint = 1
    assert_equal 2513.08, game.get_score
  end

  def test_get_score_17
    game = SetGame.new
    game.save_time = 0
    game.start_time = Time.new(2018, 05, 29, 11, 10, 00, "-04:00")
    game.end_time = Time.new(2018, 05, 29, 11, 10, 30, "-04:00")
    game.number_of_correct = 5
    game.number_of_hint = 3
    assert_equal 4000, game.get_score
  end

  def test_get_score_18
    game = SetGame.new
    game.save_time = 65.5
    game.start_time = Time.new(2018, 05, 29, 11, 10, 00, "-04:00")
    game.end_time = Time.new(2018, 05, 29, 11, 10, 30, "-04:00")
    game.number_of_correct = 5
    game.number_of_hint = 3
    assert_equal 1256.54, game.get_score
  end

  def test_get_score_19
    game = SetGame.new
    game.save_time = 0
    game.start_time = Time.new(2018, 05, 29, 11, 10, 00, "-04:00")
    game.end_time = Time.new(2018, 05, 29, 11, 10, 30, "-04:00")
    game.number_of_correct = 5
    game.number_of_hint = 5
    assert_equal 0, game.get_score
  end

  def test_get_score_20
    game = SetGame.new
    game.save_time = 65.5
    game.start_time = Time.new(2018, 05, 29, 11, 10, 00, "-04:00")
    game.end_time = Time.new(2018, 05, 29, 11, 10, 30, "-04:00")
    game.number_of_correct = 5
    game.number_of_hint = 5
    assert_equal 0, game.get_score
  end

  def test_get_score_21
    game = SetGame.new
    game.save_time = 0
    game.start_time = Time.new(2018, 05, 29, 11, 10, 00, "-04:00")
    game.end_time = Time.new(2018, 05, 29, 11, 10, 30, "-04:00")
    game.number_of_correct = 25
    game.number_of_hint = 0
    assert_equal 11538.46, game.get_score
  end

  def test_get_score_22
    game = SetGame.new
    game.save_time = 65.5
    game.start_time = Time.new(2018, 05, 29, 11, 10, 00, "-04:00")
    game.end_time = Time.new(2018, 05, 29, 11, 10, 30, "-04:00")
    game.number_of_correct = 25
    game.number_of_hint = 0
    assert_equal 3624.64, game.get_score
  end

  def test_get_score_23
    game = SetGame.new
    game.save_time = 0
    game.start_time = Time.new(2018, 05, 29, 11, 10, 00, "-04:00")
    game.end_time = Time.new(2018, 05, 29, 11, 20, 00, "-04:00")
    game.number_of_correct = 25
    game.number_of_hint = 0
    assert_equal 576.92, game.get_score
  end

  def test_get_score_24
    game = SetGame.new
    game.save_time = 0
    game.start_time = Time.new(2018, 05, 29, 11, 10, 00, "-04:00")
    game.end_time = Time.new(2018, 05, 29, 11, 40, 00, "-04:00")
    game.number_of_correct = 25
    game.number_of_hint = 0
    assert_equal 192.30, game.get_score
  end

  def test_get_score_25
    game = SetGame.new
    game.save_time = 0
    game.start_time = Time.new(2018, 05, 29, 11, 10, 00, "-04:00")
    game.end_time = Time.new(2018, 05, 29, 11, 40, 00, "-04:00")
    game.number_of_correct = 25
    game.number_of_hint = 10
    assert_equal 115.38, game.get_score
  end

  def test_get_score_26
    game = SetGame.new
    game.save_time = 65.5
    game.start_time = Time.new(2018, 05, 29, 11, 10, 00, "-04:00")
    game.end_time = Time.new(2018, 05, 29, 11, 40, 00, "-04:00")
    game.number_of_correct = 25
    game.number_of_hint = 10
    assert_equal 111.33, game.get_score
  end

  def test_get_score_27
    game = SetGame.new
    game.save_time = 0
    game.start_time = Time.new(2018, 05, 29, 11, 10, 00, "-04:00")
    game.end_time = Time.new(2018, 05, 29, 11, 40, 00, "-04:00")
    game.number_of_correct = 25
    game.number_of_hint = 20
    assert_equal 38.46, game.get_score
  end

  def test_get_score_28
    game = SetGame.new
    game.save_time = 0
    game.start_time = Time.new(2018, 05, 29, 11, 10, 00, "-04:00")
    game.end_time = Time.new(2018, 05, 29, 11, 40, 00, "-04:00")
    game.number_of_correct = 25
    game.number_of_hint = 27
    assert_equal 0, game.get_score
  end

end


# def get_score
#   return ((360000/(@end_time - @start_time + @save_time))*((@number_of_correct-@number_of_hint)/(@number_of_correct+1)))
# end
