require_relative "check_syntax.rb"

def test a
	puts (check_syntax a)
	puts (a.to_s)
	puts
end

x = []
test x
x = [0]
test x
x = [0, 0]
test x
x = [0, 0, 0]
test x
x = [0, 0, 1]
test x
x = [0, 0, 2]
test x
x = [0, 0, 3]
test x
x = [2, 2, 2]
test x
x = [1,2,3]
test x

x = (0..2).to_a
test x

x = ["a","a","a"]
test x

x = [true, true, true]
test x

x = [nil]
test x

