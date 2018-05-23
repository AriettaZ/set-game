def add3
  for card in 0..2
    $hand.push($deck[$top_card])
    $top_card += 1
  end
end
