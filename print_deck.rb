def print_deck
	for index in 0..80
		puts $deck[index].color
		puts $deck[index].shading
		puts $deck[index].symbol
		puts $deck[index].number
		puts ""
	end
end
