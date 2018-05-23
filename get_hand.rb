def get_hand
  hand = []
  for ptr in 0..11
    hand.push($deck[ptr])
  end
end
