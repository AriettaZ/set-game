def get_hand
  for $top_card in 0..11
    $hand.push($deck[$top_card])
  end
end
