#Author: Mike
#Date: 5/24

require_relative "set_game"

game = SetGame.new
choice = game.menu_get_choice
game.menu_redirect_choice(choice)
