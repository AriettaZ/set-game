## Project 2 - The Game of Set
### 1. [Overview](#overview)
### 2. [User Manual](#user-manual)
   * **[Rule](#rule)**
   * **[Start Menu](#start-menu)**
   * **[Help](#help)**
### 3. [Game Setting](#game-setting)
### 4. [Team](#team)
### 5. [Individual Contributions](#individual-contributions)

***

### Overview
This console-based game of Set is based on card game [Set](https://en.wikipedia.org/wiki/Set_%28game%29) and shares the same rule. On the top of basic functionalities, this game provides tutorial, autoplay mode, saving game, game result statistics and puzzle mode to provide a more user-friendly and enjoyable experience for the players.

To start the game, enter the following code in the terminal

```
ruby main.rb
```
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
*	hint	- Display a correct set.
* Removes - one hint from the hint counter.
*	quit	- Quit to main menu without saving.
* save	- Save the game. Game continues.
* show	- Redisplay the current hand. Useful if screen is full.


#### Game Setting

#####  Difficulty Level
  * Easy - 27 hints can be used
  * Medium - 10 hints can be used
  * Hard - 5 hints can be used

##### Score
  ```math
  Score=(Constant/(Time Spent))*(Correct sets - Hint used)/Correct sets)
  ```


***

### Team
<img src="https://raw.githubusercontent.com/cse3901-osu-2018su/MAGiC-Project-2-Ruby-Game-of-Set/ariel_dev/magic.png?token=AVn9GV61Zs0E_28kxcSKBh9xgh9hrJH7ks5bF1mswA%3D%3D" width="400">

| Role|Team Member|
| ------------- |-------------|
| Overall Project Manager| Channing Jacobs |
|Coding Manager|Mike Lin|
|Testing Manager|Gail Chen|
|Documentation Manager| Ariel Zhu|
***

### Individual Contributions
Please list who did what for each part of the project.
Also list if people worked together (pair programmed) on a particular section.

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
  * Mike: start save and load game
  * Gail:
  * Ariel:
  * Chinning:
