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

def check_set?(user_input,hand)
	if user_input.length==0
		return false
	end
	
	card1 = hand[user_input[0]]
	card2 = hand[user_input[1]]
	card3 = hand[user_input[2]]
	
	result = check_attr?(:color, card1, card2, card3)
	result = result && check_attr?(:shading, card1, card2, card3)
	result = result && check_attr?(:symbol, card1, card2, card3)
	result = result && check_attr?(:number, card1, card2, card3)
	
end

