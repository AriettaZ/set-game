module Tutorial
=begin
	Author: Ariel
	Created: 5/26
	Edit: N/A
	Requires: N/A
	Returns:  N/A
	Description: Give user tutorial about how to play set game
=end

	def get_tutorial()
		puts "Welcome to Sets tutorial!","You have a deck of 81 cards varying in four features:","Number (one, two, or three)",
		"Symbol (diamond, squiggle, oval)","Shading (solid, striped, or open)","and Color (red, green, or purple)","Each possible combination of features (e.g., a card with three striped green diamonds) appears precisely once in the deck.",
		"Please press Enter to continue Tutorial or other keys to quit",""
		if gets =="\n"
			puts "=============================","A set consists of three cards satisfying all of these conditions:", "They all have the same number or have three different numbers.",
			"They all have the same symbol or have three different symbols.","They all have the same shading or have three different shadings.",
			"And they all have the same color or have three different colors."
			cardA = Card.new('red','striped','diamond','1')
			cardB = Card.new('red','striped','diamond','2')
			cardC = Card.new('red','striped','diamond','3')
			cardD = Card.new('green','solid','diamond','2')
			cardE = Card.new('green','solid','squiggle','2')
			cardF = Card.new('purple','open','diamond','3')
			puts "","This is an example of a 6 cards: "
			show_hand [cardA, cardB, cardC,cardD,cardE,cardF]
			puts "","cards #0, #1 and #2 form a set: "
			show_hand [cardA, cardB, cardC]
			puts "To choose this set, enter their card numbers separated by ',': 0,1,2"

			puts "","card #0, #3 and #4 are another set: "
			show_hand [cardA, cardD, cardF]
			puts "To choose this set, enter their card numbers separated by ',': 0,3,5","Please press Enter to continue Tutorial to other keys to quit",""
			if gets =="\n"
				puts "=============================","You're given 12 cards in the first round as below",""

				card1 = Card.new('red','striped','diamond','1')
				card2 = Card.new('red','striped','diamond','2')
				card3 = Card.new('red','striped','diamond','3')
				card4 = Card.new('red','striped','squiggle','1')
				card5 = Card.new('red','striped','squiggle','2')
				card6 = Card.new('red','striped','squiggle','3')
				card7 = Card.new('red','striped','oval','1')
				card8 = Card.new('red','striped','oval','2')
				card9 = Card.new('red','striped','oval','3')
				card10 = Card.new('red','solid','diamond','1')
				card11 = Card.new('red','solid','diamond','2')
				card12 = Card.new('red','solid','diamond','3')
				show_hand [card1, card2, card3, card4, card5, card6, card7, card8, card9,card10, card11, card12]

				puts "","There must be at least one set among displayed cards. To indicate your set, please enter card numbers separated by ','","If set is correct, 3 cards will be replaced. If not, the cards will remain the same",
				"", "Please press Enter to quit Tutorial",""
				if gets=="\n"
				end
			end
		end
	end

end
