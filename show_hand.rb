def show_hand
	for card in 0..$hand.size-1
		puts "#{card+1}: #{$hand[card].color}, #{$hand[card].shading}, #{$hand[card].symbol}, #{$hand[card].number}"
	end
end
