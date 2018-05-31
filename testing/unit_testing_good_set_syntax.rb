#Author: Channing
#Creation Date: 5/30

require_relative "../set_game"
require "test/unit"

=begin
	Test Plan:
	hand.length == 0
		1. test good_set_syntax? on game with user input: []
		2. test good_set_syntax? on game with user input: ["nil"]
		3. test good_set_syntax? on game with user input: ["\""]
		4. test good_set_syntax? on game with user input: ["q"]
		5. test good_set_syntax? on game with user input: ["true", "true"]
		6. test good_set_syntax? on game with user input: ["true", "true", "true"]
		7. test good_set_syntax? on game with user input: ["0", "0", "0"]
		8. test good_set_syntax? on game with user input: ["0", "0", "1"]
		9. test good_set_syntax? on game with user input: ["0", "1", "2"]
		10. test good_set_syntax? on game with user input: ["2", "1", "0"]
		11. test good_set_syntax? on game with user input: ["3", "0", "2"]
		12. test good_set_syntax? on game with user input: ["-1", "0", "2"]
		13. test good_set_syntax? on game with user input: ["1", "0s", "2"]
		14. test good_set_syntax? on game with user input: ["1", "0", "s2"]
	hand.length == 3
		15. test good_set_syntax? on game with user input: []
		16. test good_set_syntax? on game with user input: ["nil"]
		17. test good_set_syntax? on game with user input: ["\""]
		18. test good_set_syntax? on game with user input: ["q"]
		19. test good_set_syntax? on game with user input: ["true", "true"]
		20. test good_set_syntax? on game with user input: ["true", "true", "true"]
		21. test good_set_syntax? on game with user input: ["0", "0", "0"]
		22. test good_set_syntax? on game with user input: ["0", "0", "1"]
		23. test good_set_syntax? on game with user input: ["0", "1", "2"]
		24. test good_set_syntax? on game with user input: ["2", "1", "0"]
		25. test good_set_syntax? on game with user input: ["3", "0", "2"]
		26. test good_set_syntax? on game with user input: ["-1", "0", "2"]
		27. test good_set_syntax? on game with user input: ["1", "0s", "2"]
		28. test good_set_syntax? on game with user input: ["1", "0", "s2"]
		29. test good_set_syntax? on game with user input: ["3", "0", "4"]
	hand.length == 12
		30. test good_set_syntax? on game with user input: []
		31. test good_set_syntax? on game with user input: ["nil"]
		32. test good_set_syntax? on game with user input: ["\""]
		33. test good_set_syntax? on game with user input: ["q"]
		34. test good_set_syntax? on game with user input: ["true", "true"]
		35. test good_set_syntax? on game with user input: ["true", "true", "true"]
		36. test good_set_syntax? on game with user input: ["0", "0", "0"]
		37. test good_set_syntax? on game with user input: ["0", "0", "1"]
		38. test good_set_syntax? on game with user input: ["0", "1", "2"]
		39. test good_set_syntax? on game with user input: ["2", "1", "0"]
		40. test good_set_syntax? on game with user input: ["3", "0", "2"]
		41. test good_set_syntax? on game with user input: ["-1", "0", "2"]
		42. test good_set_syntax? on game with user input: ["1", "0s", "2"]
		43. test good_set_syntax? on game with user input: ["1", "0", "s2"]
		44. test good_set_syntax? on game with user input: ["3", "0", "4"]
		45. test good_set_syntax? on game with user input: ["7", "4", "11"]
		46. test good_set_syntax? on game with user input: ["12", "0", "5"]
	hand.length == 21
		47. test good_set_syntax? on game with user input: []
		48. test good_set_syntax? on game with user input: ["nil"]
		49. test good_set_syntax? on game with user input: ["\""]
		50. test good_set_syntax? on game with user input: ["q"]
		51. test good_set_syntax? on game with user input: ["true", "true"]
		52. test good_set_syntax? on game with user input: ["true", "true", "true"]
		53. test good_set_syntax? on game with user input: ["0", "0", "0"]
		54. test good_set_syntax? on game with user input: ["0", "0", "1"]
		55. test good_set_syntax? on game with user input: ["0", "1", "2"]
		56. test good_set_syntax? on game with user input: ["2", "1", "0"]
		57. test good_set_syntax? on game with user input: ["3", "0", "2"]
		58. test good_set_syntax? on game with user input: ["-1", "0", "2"]
		59. test good_set_syntax? on game with user input: ["1", "0s", "2"]
		60. test good_set_syntax? on game with user input: ["1", "0", "s2"]
		61. test good_set_syntax? on game with user input: ["3", "0", "4"]
		62. test good_set_syntax? on game with user input: ["7", "4", "11"]
		63. test good_set_syntax? on game with user input: ["12", "0", "5"]
		64. test good_set_syntax? on game with user input: ["18", "3", "20"]
		65. test good_set_syntax? on game with user input: ["14", "0", "21"]
=end

class TestSetGame < Test::Unit::TestCase
	# hand.length == 0 cases
	def test_good_set_syntax1
		game = SetGame.new
		game.hand = []
		assert_false (game.good_set_syntax? [])
	end

	def test_good_set_syntax2
		game = SetGame.new
		game.hand = []
		assert_false (game.good_set_syntax? ["nil"])
	end

	def test_good_set_syntax3
		game = SetGame.new
		game.hand = []
		assert_false (game.good_set_syntax? ["\""])
	end

	def test_good_set_syntax4
		game = SetGame.new
		game.hand = []
		assert_false (game.good_set_syntax? ["q"])
	end

	def test_good_set_syntax5
		game = SetGame.new
		game.hand = []
		assert_false (game.good_set_syntax? ["true", "true"])
	end

	def test_good_set_syntax6
		game = SetGame.new
		game.hand = []
		assert_false (game.good_set_syntax? ["true", "true", "true"])
	end

	def test_good_set_syntax7
		game = SetGame.new
		game.hand = []
		assert_false (game.good_set_syntax? ["0", "0", "0"])
	end

	def test_good_set_syntax8
		game = SetGame.new
		game.hand = []
		assert_false (game.good_set_syntax? ["0", "0", "1"])
	end

	def test_good_set_syntax9
		game = SetGame.new
		game.hand = []
		assert_false (game.good_set_syntax? ["0", "1", "2"])
	end

	def test_good_set_syntax10
		game = SetGame.new
		game.hand = []
		assert_false (game.good_set_syntax? ["2", "1", "0"])
	end

	def test_good_set_syntax11
		game = SetGame.new
		game.hand = []
		assert_false (game.good_set_syntax? ["3", "0", "2"])
	end

	def test_good_set_syntax12
		game = SetGame.new
		game.hand = []
		assert_false (game.good_set_syntax? ["-1", "0", "2"])
	end

	def test_good_set_syntax13
		game = SetGame.new
		game.hand = []
		assert_false (game.good_set_syntax? ["1", "0s", "2"])
	end

	def test_good_set_syntax14
		game = SetGame.new
		game.hand = []
		assert_false (game.good_set_syntax? ["1", "0", "s2"])
	end


	# hand.length == 3
	def test_good_set_syntax15
		game = SetGame.new
		game.hand = Array.new 3
		assert_false (game.good_set_syntax? [])
	end

	def test_good_set_syntax16
		game = SetGame.new
		game.hand = Array.new 3
		assert_false (game.good_set_syntax? ["nil"])
	end

	def test_good_set_syntax17
		game = SetGame.new
		game.hand = Array.new 3
		assert_false (game.good_set_syntax? ["\""])
	end

	def test_good_set_syntax18
		game = SetGame.new
		game.hand = Array.new 3
		assert_false (game.good_set_syntax? ["q"])
	end

	def test_good_set_syntax19
		game = SetGame.new
		game.hand = Array.new 3
		assert_false (game.good_set_syntax? ["true", "true"])
	end

	def test_good_set_syntax20
		game = SetGame.new
		game.hand = Array.new 3
		assert_false (game.good_set_syntax? ["true", "true", "true"])
	end

	def test_good_set_syntax21
		game = SetGame.new
		game.hand = Array.new 3
		assert_false (game.good_set_syntax? ["0", "0", "0"])
	end

	def test_good_set_syntax22
		game = SetGame.new
		game.hand = Array.new 3
		assert_false (game.good_set_syntax? ["0", "0", "1"])
	end

	def test_good_set_syntax23
		game = SetGame.new
		game.hand = Array.new 3
		assert_true (game.good_set_syntax? ["0", "1", "2"])
	end

	def test_good_set_syntax24
		game = SetGame.new
		game.hand = Array.new 3
		assert_true (game.good_set_syntax? ["2", "1", "0"])
	end

	def test_good_set_syntax25
		game = SetGame.new
		game.hand = Array.new 3
		assert_false (game.good_set_syntax? ["3", "0", "2"])
	end

	def test_good_set_syntax26
		game = SetGame.new
		game.hand = Array.new 3
		assert_false (game.good_set_syntax? ["-1", "0", "2"])
	end

	def test_good_set_syntax27
		game = SetGame.new
		game.hand = Array.new 3
		assert_false (game.good_set_syntax? ["1", "0s", "2"])
	end

	def test_good_set_syntax28
		game = SetGame.new
		game.hand = Array.new 3
		assert_false (game.good_set_syntax? ["1", "0", "s2"])
	end

	def test_good_set_syntax29
		game = SetGame.new
		game.hand = Array.new 3
		assert_false (game.good_set_syntax? ["3", "0", "4"])
	end


	# hand.length == 12
	def test_good_set_syntax30
		game = SetGame.new
		game.hand = Array.new 12
		assert_false (game.good_set_syntax? [])
	end

	def test_good_set_syntax31
		game = SetGame.new
		game.hand = Array.new 12
		assert_false (game.good_set_syntax? ["nil"])
	end

	def test_good_set_syntax32
		game = SetGame.new
		game.hand = Array.new 12
		assert_false (game.good_set_syntax? ["\""])
	end

	def test_good_set_syntax33
		game = SetGame.new
		game.hand = Array.new 12
		assert_false (game.good_set_syntax? ["q"])
	end

	def test_good_set_syntax34
		game = SetGame.new
		game.hand = Array.new 12
		assert_false (game.good_set_syntax? ["true", "true"])
	end

	def test_good_set_syntax35
		game = SetGame.new
		game.hand = Array.new 12
		assert_false (game.good_set_syntax? ["true", "true", "true"])
	end

	def test_good_set_syntax36
		game = SetGame.new
		game.hand = Array.new 12
		assert_false (game.good_set_syntax? ["0", "0", "0"])
	end

	def test_good_set_syntax37
		game = SetGame.new
		game.hand = Array.new 12
		assert_false (game.good_set_syntax? ["0", "0", "1"])
	end

	def test_good_set_syntax38
		game = SetGame.new
		game.hand = Array.new 12
		assert_true (game.good_set_syntax? ["0", "1", "2"])
	end

	def test_good_set_syntax39
		game = SetGame.new
		game.hand = Array.new 12
		assert_true (game.good_set_syntax? ["2", "1", "0"])
	end

	def test_good_set_syntax40
		game = SetGame.new
		game.hand = Array.new 12
		assert_true (game.good_set_syntax? ["3", "0", "2"])
	end

	def test_good_set_syntax41
		game = SetGame.new
		game.hand = Array.new 12
		assert_false (game.good_set_syntax? ["-1", "0", "2"])
	end

	def test_good_set_syntax42
		game = SetGame.new
		game.hand = Array.new 12
		assert_false (game.good_set_syntax? ["1", "0s", "2"])
	end

	def test_good_set_syntax43
		game = SetGame.new
		game.hand = Array.new 12
		assert_false (game.good_set_syntax? ["1", "0", "s2"])
	end

	def test_good_set_syntax44
		game = SetGame.new
		game.hand = Array.new 12
		assert_true (game.good_set_syntax? ["3", "0", "4"])
	end

	def test_good_set_syntax45
		game = SetGame.new
		game.hand = Array.new 12
		assert_true (game.good_set_syntax? ["7", "4", "11"])
	end

	def test_good_set_syntax46
		game = SetGame.new
		game.hand = Array.new 12
		assert_false (game.good_set_syntax? ["12", "0", "5"])
	end


	# hand.length == 21

	def test_good_set_syntax47
		game = SetGame.new
		game.hand = Array.new 21
		assert_false (game.good_set_syntax? [])
	end

	def test_good_set_syntax48
		game = SetGame.new
		game.hand = Array.new 21
		assert_false (game.good_set_syntax? ["nil"])
	end

	def test_good_set_syntax49
		game = SetGame.new
		game.hand = Array.new 21
		assert_false (game.good_set_syntax? ["\""])
	end

	def test_good_set_syntax50
		game = SetGame.new
		game.hand = Array.new 21
		assert_false (game.good_set_syntax? ["q"])
	end

	def test_good_set_syntax51
		game = SetGame.new
		game.hand = Array.new 21
		assert_false (game.good_set_syntax? ["true", "true"])
	end

	def test_good_set_syntax52
		game = SetGame.new
		game.hand = Array.new 21
		assert_false (game.good_set_syntax? ["true", "true", "true"])
	end

	def test_good_set_syntax53
		game = SetGame.new
		game.hand = Array.new 21
		assert_false (game.good_set_syntax? ["0", "0", "0"])
	end

	def test_good_set_syntax54
		game = SetGame.new
		game.hand = Array.new 21
		assert_false (game.good_set_syntax? ["0", "0", "1"])
	end

	def test_good_set_syntax55
		game = SetGame.new
		game.hand = Array.new 21
		assert_true (game.good_set_syntax? ["0", "1", "2"])
	end

	def test_good_set_syntax56
		game = SetGame.new
		game.hand = Array.new 21
		assert_true (game.good_set_syntax? ["2", "1", "0"])
	end

	def test_good_set_syntax57
		game = SetGame.new
		game.hand = Array.new 21
		assert_true (game.good_set_syntax? ["3", "0", "2"])
	end

	def test_good_set_syntax58
		game = SetGame.new
		game.hand = Array.new 21
		assert_false (game.good_set_syntax? ["-1", "0", "2"])
	end

	def test_good_set_syntax59
		game = SetGame.new
		game.hand = Array.new 21
		assert_false (game.good_set_syntax? ["1", "0s", "2"])
	end

	def test_good_set_syntax60
		game = SetGame.new
		game.hand = Array.new 21
		assert_false (game.good_set_syntax? ["1", "0", "s2"])
	end

	def test_good_set_syntax61
		game = SetGame.new
		game.hand = Array.new 21
		assert_true (game.good_set_syntax? ["3", "0", "4"])
	end

	def test_good_set_syntax62
		game = SetGame.new
		game.hand = Array.new 21
		assert_true (game.good_set_syntax? ["7", "4", "11"])
	end

	def test_good_set_syntax63
		game = SetGame.new
		game.hand = Array.new 21
		assert_true (game.good_set_syntax? ["12", "0", "5"])
	end

	def test_good_set_syntax64
		game = SetGame.new
		game.hand = Array.new 21
		assert_true (game.good_set_syntax? ["18", "3", "20"])
	end

	def test_good_set_syntax65
		game = SetGame.new
		game.hand = Array.new 21
		assert_false (game.good_set_syntax? ["14", "0", "21"])
	end

end
