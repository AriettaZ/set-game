require_relative 'card'
require_relative 'get_deck'
require_relative 'print_deck'
$deck=[]
$Colors=['red','purple','green']
$Shadings=['striped','solid','open']
$Symbols=['diamond','squiggle','oval']
$Numbers=['1','2','3']
# generate 81 cards

get_deck
$deck=$deck.shuffle
print_deck

$hand = []
get_hand
show_hand
$top_card += 1
puts $top_card
