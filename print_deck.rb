#Author: Arial
#Create date: 5/21
#Edit: 5/24 Mike

def print_deck (deck)
	deck.length.times {|index|
		puts deck[index].color
		puts deck[index].shading
		puts deck[index].symbol
		puts deck[index].number
		puts ""
	}
end
