def replace3(user_input)
  for card in 0..2
    $hand[user_input[card] - 1] = $deck[$top_card]
    $top_card += 1
  end
end
