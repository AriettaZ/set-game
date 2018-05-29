#Author: Mike
#Date: 5/24
#Edit: Gail, Mike 5/26 V1.0
#Edit: Gail 5/26 V2.0
#Edit: Channing 5/28 Simplified loop logic

require_relative "set_game"

game = SetGame.new

loop do
  break if !game.menu_redirect_choice?(game.menu_get_choice)
end

puts "Goodbye~"

