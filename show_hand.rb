def show_hand
  for i in 0..11
    puts "#{i+1}: #{$hand[i].color}, #{$hand[i].shading}, #{$hand[i].symbol}, #{$hand[i].number}"
  end
end
