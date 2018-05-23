require_relative 'card'
require_relative 'get_deck'
require_relative 'print_deck'
require_relative 'get_hand'
require_relative 'show_hand'
<<<<<<< HEAD
require_relative 'replace3'
require_relative 'add3'
=======
>>>>>>> 354780f082354f06aa42392bc3aa70970c19905f

$deck=[]
$Colors=['red','purple','green']
$Shadings=['striped','solid','open']
$Symbols=['diamond','squiggle','oval']
$Numbers=['1','2','3']
# generate 81 cards
get_deck
$deck = $deck.shuffle
print_deck

<<<<<<< HEAD
puts "show original hand"
$hand = []
get_hand
show_hand
puts "top card index = #{$top_card}"
puts ""

puts "replace 3 cards:"
user_input = [2, 5, 9]
replace3(user_input)
show_hand
puts "top card index = #{$top_card}"
puts ""

puts "add 3 cards:"
add3
show_hand
puts "top card index = #{$top_card}"
puts ""
=======
$hand = []
get_hand
show_hand
$top_card += 1
puts $top_card
>>>>>>> 354780f082354f06aa42392bc3aa70970c19905f
