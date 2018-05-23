def show_hand
<<<<<<< HEAD
  for card in 0..$hand.size-1
=======
  for card in 0..$hand.length-1
>>>>>>> 354780f082354f06aa42392bc3aa70970c19905f
    puts "#{card+1}: #{$hand[card].color}, #{$hand[card].shading}, #{$hand[card].symbol}, #{$hand[card].number}"
  end
end
