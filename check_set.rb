
#Author: Mike
#Create Date: 5/23
#Edit: 5/24 by Mike, Minor changes, add documentation

=begin
Requires: card1.class=card2.class=card3.class=Card,
			attr∈Set(:color,:shading,:symbol,:number)
Returns: True if the provided attribute and cards follow set convention and false otherwise
Description: Check whether the provided attribute and cards follows Set convention
=end

require_relative "card"
require_relative "main"

def check_attr?(attr,card1,card2,card3)
	if(card1[attr]==card2[attr])
		if(card2[attr]!=card3[attr])
			return false
		end
	else
		if(card1[attr]==card3[attr] || card2[attr]==card3[attr])
			return false
		end
	end
	return true
end


=begin
Requires: card1.class=card2.class=card3.class=Card, 0<=check_order.length<=4,
			∀x∈check_order, x∈Set("color","shading","symbol","number")
Returns: True if the provided cards form a set, false otherwise
Description: Check in order, whether the provided cards form a set
=end

def check_set?(card1, card2, card3, check_order)
	for order in check_order
		case order
			when "color"
				result = check_attr?(:color, card1, card2, card3)
			when "shading"
				result = check_attr?(:shading, card1, card2, card3)
			when "symbol"
				result = check_attr?(:symbol, card1, card2, card3)
			when "number"
				result = check_attr?(:number, card1, card2, card3)
		end
		if(result==false)
			return false
		end
	end
	return true

end
