## **Project 2 - The Game of Set **
#### 1. [Overview](#overview)
#### 2. [User Manual](#user-manual)
   * **[Rule](#rule)**
   * **[User Manual](#user-manual)**
   * **[User Manual](#user-manual)**

#### 3. [Team](#team)
#### 4. [Individual Contributions](#individual-contributions)

***

### Overview
This console-based game of Set is based on card game [Set](https://en.wikipedia.org/wiki/Set_%28game%29) and shares the same rule. On the top of basic functionalities, this game provides tutorial, autoplay mode, saving game, game result statistics and puzzle mode to provide a more user-friendly and enjoyable experience for the players.

To start the game, enter the following code in the terminal

```
ruby main.rb
```
***
### User Manual
#### Rule
The player has a deck of 81 cards varying in four features. The game will end when 
If there's a set, enter their card numbers separated by ','
If set is correct, 3 cards will be replaced. If not, the cards will remain the same
If 21 cards available in the table or no cards in deck, no card will be added to the table

***
### Team
<img src="https://raw.githubusercontent.com/cse3901-osu-2018su/MAGiC-Project-2-Ruby-Game-of-Set/ariel_dev/magic.png?token=AVn9GV61Zs0E_28kxcSKBh9xgh9hrJH7ks5bF1mswA%3D%3D" width="400">
* Overall Project Manager: Channing Jacobs
* Coding Manager: Mike Lin
* Testing Manager: Gail Chen
* Documentation: Ariel Zhu
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
