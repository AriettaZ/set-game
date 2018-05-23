require_relative 'card'

deck=[]
Colors=['red','purple','green']
Shadings=['striped','solid','open']
Symbols=['diamond','squiggle','oval']
Numbers=['1','2','3']

for $color_index in 0..2
  for $shading_index in 0..2
    for $symbol_index in 0..2
      for $number_index in 0..2
        deck.push(Card.new(Colors[$color_index], Shadings[$shading_index], Symbols[$symbol_index], Numbers[$number_index]))
      end
    end
  end
end
# for $index in 0..80
#   puts deck[$index].color
#   puts deck[$index].shading
#   puts deck[$index].symbol
#   puts deck[$index].number
#   puts ""
# end

deck=deck.shuffle()

for $index in 0..80
  puts deck[$index].color
  puts deck[$index].shading
  puts deck[$index].symbol
  puts deck[$index].number
  puts ""
end
