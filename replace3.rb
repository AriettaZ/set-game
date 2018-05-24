def replace3(user_input)
	if $top_card < $deck.size
		for card in 0..2
			$hand[user_input[card] - 1] = $deck[$top_card]
			$top_card += 1
		end
	else
		delete_count = 0
		use_input.sort!
		for card in 0..2
			$hand.delete_at(user_input[card] - 1 - delete_count)
			delete_count += 1
		end
	end
end
