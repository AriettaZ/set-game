## Project 2 - The Game of Set
### 1. [Overview](#overview)
### 2. [User Manual](#user-manual)
   * **[Rule](#rule)**
   * **[Start Menu](#start-menu)**
   * **[Help](#help)**

### 3. [Game Setting](#game-setting)
### 4. [Team](#team)
### 5. [Individual Contributions](#individual-contributions)
  * **[Development](#development)**
  * **[Testing](#testing)**
  * **[Meetings](#meetings)**
***

### Overview
This console-based game of Set is based on card game [Set](https://en.wikipedia.org/wiki/Set_%28game%29) and shares the same rule. On the top of basic functionalities, this game provides tutorial, autoplay mode, saving game, game result statistics and puzzle mode to provide a more user-friendly and enjoyable experience for the players.

To start the game, enter the following code in the terminal

```
ruby main.rb
```
To get the best user experience, please expand the terminal to at least 125*40

***

### User Manual

### Rule

* The player has a deck of 81 cards varying in four features.
* The game begins by assigning 12 cards to the player and will end when no sets on hand and no cards in deck.
* There must be at least one set among displayed cards.
* To indicate the set, players enter card numbers separated by ',' (e.g. 1,2,3)
  * If the set is correct, 3 cards in the set will be replaced by 3 new cards from deck
  * If not, the displayed cards will remain the same

### Start Menu

**What to expect for each choice:**

* New Game - start a new journey
  1. Enter username
  2. Choose [difficulty level](#difficulty-level)
  3. Start a brand new set game
  4. Receive game score and results
  5. Return to menu

* Tutorial - receive interactive learning experience
  1. Game introduction
  2. Return to menu

* Load Game - pick up saved games
  1. Enter username
  2. Choose from a list of saved games
  3. Continue the saved game
  4. Receive game [score](#score) and results
  5. Return to menu

* Delete Saved Game - clean up saved game folder
  1. Enter username
  2. Choose from a list of saved games
  3. Confirm the decision
  4. Return to menu

* Autoplay Mode - learn from examples
  1. A game played by the computer. It's a great learning resources for beginners.
  2. Return to menu

* Game Result History - see your progress
  1. Enter username
  2. Game history and data analysis
  3. Return to menu

* Puzzle Mode - take a quick challenge
  1. Find the only set within 12 cards
  2. Return to menu

* Quit
  1. Leave the game

#### Help
**Available help during the game through command line:**

**Command Keyword list:**

* help	- Redisplay this help menu.
*	hint	- Display a correct set. Removes one hint from the hint counter.
*	quit	- Quit to main menu without saving.
* save	- Save the game. Game continues.
* show	- Redisplay the current hand. Useful if screen is full.

***

### Game Setting

#####  Difficulty Level
  * Easy - at most 27 hints can be used
  * Medium - at most 10 hints can be used
  * Hard - at most 5 hints can be used

##### Score
  * The score is a non-negative number.
  * To get a higher score:
    * Use fewer hints
    * Spend less time
    * Give more correct sets
  * Score calculation is shown as follow:

```math
Score=(Constant/(Time Spent+1)*(Correct sets - Hint used)/(Correct sets+1))
```

##### Naming Tradition
  * File name and user name can't be empty
  * File name and user name shouldn't start with '.'


***

### Team
<img src="https://raw.githubusercontent.com/cse3901-osu-2018su/MAGiC-Project-2-Ruby-Game-of-Set/ariel_dev/magic.png?token=AVn9GV61Zs0E_28kxcSKBh9xgh9hrJH7ks5bF1mswA%3D%3D" width="400">

| Role|Team Member|
| ------------- |-------------|
| Overall Project Manager| Channing Jacobs |
|Coding Manager|Mike Lin|
|Testing Manager|Gail Chen|
|Documentation Manager| Ariel Zhu|

*Contact Us: osu.magic.team@gmail.com*

***

### Individual Contributions
#### Development
Mike:
* catg_set
* get_check_table
* check_attr?
* check_set?
* set_exist
* find_set
* save_game
* get_username
* continue_game

Channing:
* find_set
* good_set_syntax
* organize
* get_user_cards
* show_progress
* puzzle_game
* good_set_syntax?
* get_hint

Gail:
* add3
* replace3
* show_stat
* menu_get_choice
* valid_choice?
* select_level
* get_hand
* show_hand
* card class

Ariel:
* get_score
* get_tutorial
* show_result
* clear
* menu_redirect_choice?
* save_game_result
* get_deck
* handle_no_set
* update
* card class

#### Testing
Unit Testing:

Mike:
* catg_set
* check_set
* find_set
* get_check_table
* set_exist

Channing:
* get_hint
* organize
* good_set_syntax

Gail:
* update
* replace3
* add3
* get_hand
* show_hand
* valid_choice?

Ariel:
* get_score

#### Meetings

* May 22nd:
  * Group came up with the overall algorithm and structure together
  * Channing and Mike: sample testing plan
  * Ariel and Gail: Card class and deck generation
* May 24th:
  * Mike: update main.rb, check_attribute, get_deck and check_set functions
  * Ariel: update update function and add test cases to update and get_deck function
  * Gail: update show_hand, get_hand, add_3 and replace_3 functions and add test cases
  * Channing: group meeting notes; start and finish check_user_input function
  * Mike and Channing: start find_set function
* May 25th:
  * Mike and Channing: edit and finish find_set function
  * Gail: start menu_get_choice and valid_choice?(user_input) function
  * Ariel: menu_redirect_choice and get_tutorial
* May 26th:
  * Mike: start save and load game function
  * Gail: update menu, valid_choice
  * Ariel: start get_score, update get_tutorial, start get_result
  * Chinning: start puzzle mode, progress_bar, redo get_user_card and help command list, update main
* May 30th
  * Mike: overall documentation and function improvement, unit testing
  * Gail: overall documentation and function improvement, unit testing
  * Ariel: Readme, finish show_result, handle_no_set and update update function
  * Chinning: puzzle mode, unit testing, integration testing
