#Author: Mike
#Date: 5/24
#Edit: Gail, Mike 5/26 V1.0

require_relative "set_game"

game = SetGame.new
choice = game.menu_get_choice
until choice == 5
  game.menu_redirect_choice(choice)
  choice = game.menu_get_choice
end
puts "Goodbye~"
