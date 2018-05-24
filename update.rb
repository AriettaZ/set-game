require_relative "check_set"
require_relative "replace3"
require_relative "add3"
def update(hand,user_input,top_card,deck)
  if hand.length<21 && user_input=='none' && top_card<81
    puts '3 cards will be added'
    add3(deck,hand,top_card)
  elsif (hand.length == 21||top_card==81)&&user_input=='none'
    puts 'At least one set'
  else
    # convert string to array
    user_input=eval(user_input)
    if check_set?(user_input[0], user_input[1],user_input[2],hand)
      puts 'Correct set! 3 cards will be replaced'
      replace3(deck,hand,user_input,top_card)
    else
      puts 'Wrong set'
    end
  end
end
