#Description: Check in order, whether the provided cards form a set
#Author: Mike
#Create Date: 5/23

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

def check_set?(card1, card2, card3, check_order)
	
	result=true
	for i in 0...check_order.length
		case check_order[i]
			when "color"
				result = result && check_attr?(:color, card1, card2, card3)
			when "shading"
				result = result && check_attr?(:shading, card1, card2, card3)
			when "symbol"
				result = result && check_attr?(:symbol, card1, card2, card3)
			when "number"
				result = result && check_attr?(:number, card1, card2, card3)
		end
		if(result==false)
			return false
		end
	end
	return result
	
end

