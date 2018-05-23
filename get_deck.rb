require_relative 'card'
def get_deck
  for color_index in 0..2
    for shading_index in 0..2
      for symbol_index in 0..2
        for number_index in 0..2
          $deck.push(Card.new($Colors[color_index], $Shadings[shading_index], $Symbols[symbol_index], $Numbers[number_index]))
        end
      end
    end
  end
end
