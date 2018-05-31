module FindSet
=begin
  	Author: Channing, Mike
  	Created: 5/25
  	Editor: Mike 5/27 change function names and method logic
  	Description: Finds 1 valid sets in hand.
  	Requires: @hand != nil
  	Updates: N/A
  	Returns: An array of valid set or an empty array if there don't exist any set.
=end
  	def find_set
  		# Create a hash to represent the number of cards in each section of the table
  		hand_stat  = organize

  		# Score the catgories to find the one that contains the least possible sets
  		catg_score = catg_set(hand_stat)

  		# Get all the possible sets from the catgory with lowest catg_score
  		check_table = get_check_table(hand_stat, catg_score)

  		# Use catg_score and card_table to find one valid sets
  		set_exist(check_table, catg_score)
  	end

=begin
  	Author: Channing
  	Created: 5/25
  	Edit: Ariel 5/26 Change formal parameter to instance variables
  	Description: Create a hash to hold statistics (counts) of the number of each card
  				attribute found within the hand.
  	Example: hand_stat = {
  				red: [card1, card2, card5]
  				purple: [card3, card4, card6]
  				green: []
  				...
  				attribute12: [Card, Card, Card, Card]
  				}
  	Require: hand.class == Array; for each element in hand, element.class == Card
  	Updates: N/A
  	Returns: hash with keys representing card attributes: {$Colors + $Shadings + $Symbols + $Numbers}
  		 and values corresponding to number of cards with this attribute in hand.
  		 hash { this_card_attr : [hand.each {|card| card.has(this_card_attr)}]

=end
  	def organize
  		# create hash
  		hand_stat = Hash.new {|k,v| k[v] = []}
  		# create keys based on card attr, set to default [] value
  		card_attrs = $Colors + $Shadings + $Symbols + $Numbers
  		card_attrs.each {|attr| hand_stat[attr.intern]}
  		# add cards to hash
  		for card in @hand
  			[:color, :shading, :symbol, :number].each {|catg|
  				hand_stat[card[catg].intern] << card
  			}
  		end
  		hand_stat
  	end

=begin
  	Author: Mike
  	Created: 5/25
  	Edit: Ariel 5/26 Change formal parameter to instance variables
  	Description: Return a valid array of categories and their number of possible sets formed from a category.
  				For the purpose of reduce number of cases to check for find_set
  	Example: For category $Colors, red has 3 cards, green has 2 cards, purple has 5 cards.
  			Then, the possible sets formed from category $Colors is 3C3+5C3+3*2*5=41
  	Requires: hand_stat != nil and hand_stat is hash with keys representing card attributes: {$Colors + $Shadings + 		$Symbols + $Numbers} and values corresponding to number of cards with this attribute in hand.
  				hash { this_card_attr : [hand.each {|card| card.has(this_card_attr)}]
  	Updates: N/A
  	Returns: [["color",color_possible_set#],["shading",shading_possible_set#],["symbol",symbol_possible_set#],["number",number_possible_set#]] where for all scores, 0<=scores<=220
=end
  def catg_set(hand_stat)
  	catg_score=[['color',0],['shading',0],['symbol',0],['number',0]]

  	catg_score[0][1] = $Colors.reduce 1 do|product, feature| product * hand_stat[feature.intern].length end
  	catg_score[0][1] += $Colors.reduce 0 do
  		|sum, feature|
  		len = hand_stat[feature.intern].length
  		sum + (len*(len-1)*(len-2).to_f/6)
  	end

  	catg_score[1][1] = $Shadings.reduce 1 do |product, feature| product * hand_stat[feature.intern].length end
  	catg_score[1][1] += $Shadings.reduce 0 do
  		|sum, feature|
  		len = hand_stat[feature.intern].length
  		sum+(len*(len-1)*(len-2).to_f/6)
  	end

  	catg_score[2][1] =  $Symbols.reduce 1 do |product, feature| product * hand_stat[feature.intern].length end
  	catg_score[2][1] += $Symbols.reduce 0 do
  		|sum, feature|
  		len = hand_stat[feature.intern].length
  		sum+(len*(len-1)*(len-2).to_f/6)
  	end

  	catg_score[3][1] =  $Numbers.reduce 1 do |product, feature| product * hand_stat[feature.intern].length end
  	catg_score[3][1] += $Numbers.reduce 0 do
  		|sum, feature|
  		len = hand_stat[feature.intern].length
  		sum+(len*(len-1)*(len-2).to_f/6)
  	end

  	catg_score
  end

=begin
  	Author: Mike
  	Created: 5/25
  	Editor: N/A
  	Description: Return a check table consists of combinations of set with lowest possible number of sets from hand.
  	Requires: |hand_stat| = |hand|*3
  				for all attribute ∈ ($Colors, $Shadings, $Symbols, $Numbers)
  				for all card in hand_stat[:attribute], card has attribute
  				hand_stat = {
  								attribute1:[Card, Card, Card]
  								attribute2:[Card, Card, Card]
  								...
  								attribute12:[Card, Card, Card]
  							}
  				score.class = Array
  					for element in score, element.class = Array, element.length = 2
  					for a,b in element[0] element[1], a∈Set("color","shading","symbol","number"), 0<=b<=220
  	Updates: N/A
  	Returns: [[Card, Card, Card],[Card,Card,Card],...,[Card,Card,Card]]
  		 where each [Card,Card,Card] is a possible combination of set (with lowest possible number of sets from )hand.
=end
  def get_check_table(hand_stat,catg_score)
  	sorted_catg_score = catg_score.sort{|a,b| a[1]<=>b[1]}
  	category = sorted_catg_score[0][0]
  	check_catg = []
  	case category
  		when "color"
  			category = $Colors
  		when "shading"
  			category = $Shadings
  		when "symbol"
  			category = $Symbols
  		when "number"
  			category = $Numbers
  	end

  	check_table = []
  	category.each {
  		|attr|
  		check_table.push(*hand_stat[attr.intern].combination(3).to_a)
  	}
  	attr_card_table = category.map do
  		|attr|
  		hand_stat[attr.intern]
  	end
  	check_table.push *(attr_card_table[0].product(attr_card_table[1],attr_card_table[2]))
  end

=begin
  	Author: Mike
  	Created: 5/23
  	Edit: Mike 5/24 minor changes
  	Edit: Mike 5/27 minor changes
  	Description: Check if there exist a set in the check_table
  	Requires: check_table.class = Array,
  				for combination in check_table, combination.class = Array, combination.length = 3,
  				∀x∈combination, x.class=Card
  			  score.class = Array
  				for element in score, element.class = Array, element.length = 2
  				for a,b in element[0] element[1], a∈Set("color","shading","symbol","number"), 0<=b<=220
  	Updates: N/A
  	Returns: True if there is at least a set in check_table combinations and false otherwise

=end
  	def set_exist(check_table,score)
  		sortedScore = score.sort{|a,b| a[1]<=>b[1]}
  		order = [sortedScore[1][0]]+[sortedScore[2][0]]+[sortedScore[3][0]]

  		for combination in check_table
  			return combination if check_set?(combination[0],combination[1],combination[2],order)
  		end
  		return []
  	end

=begin
  	Author: Mike
  	Created: 5/23
  	Edit: 5/24 by Mike, Minor changes, add documentation
  	Description: Check in order provided in check_order, whether the provided cards form a set.
  	Requires: card1.class=card2.class=card3.class=Card, 0<=check_order.length<=4,
  				∀x∈check_order, x∈Set("color","shading","symbol","number")
  	Updates: N/A
  	Returns: True if the provided cards form a set, false otherwise
=end
  	def check_set?(card1, card2, card3, check_order)
  		for order in check_order
  			case order
  				when "color"
  					result = check_attr?(:color, card1, card2, card3)
  				when "shading"
  					result = check_attr?(:shading, card1, card2, card3)
  				when "symbol"
  					result = check_attr?(:symbol, card1, card2, card3)
  				when "number"
  					result = check_attr?(:number, card1, card2, card3)
  			end

  			return false if(result==false)
  		end
  		return true
  	end

=begin
    	Author: Mike
    	Created: 5/23
    	Edit: 5/24 by Mike, Minor changes, add documentation
    	Description: Check whether the provided attribute and cards follows Set convention
    	Requires: card1.class=card2.class=card3.class=Card,
    				attr∈Set(:color,:shading,:symbol,:number)
    	Updates: N/A
    	Returns: True if the provided attribute and cards follow set convention and false otherwise
=end
    	def check_attr?(attr,card1,card2,card3)
    		if(card1[attr]==card2[attr])
    			return false if(card2[attr]!=card3[attr])
    		else
    			return false if(card1[attr]==card3[attr] || card2[attr]==card3[attr])
    		end
    		return true
    	end

end
