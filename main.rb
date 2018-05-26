#Author: Mike
#Date: 5/24
#Edit: Gail, Mike 5/26 V1.0

require_relative "set_game"

game = SetGame.new
#generate 81 cards and shuffled
deck = game.get_deck
game.shuffle(deck)
#top_card is the next card to be selected in deck
hand, top_card = game.get_hand(deck)

until top_card==81 && game.find_set(hand).empty?
	game.show_hand hand
#	Machine Self-Playing
#	hint = []
#	game.find_set(hand).each do |card| hint.push(hand.index(card)) end
#	user_input = hint
	user_input = game.get_user_cards hand.length
	hand, top_card = game.update(hand,user_input,top_card,deck)
end
	puts "All Clear! Good Game!"
	puts "You get #{Time.now-game.startTime} scores. (Lower score is better)"
