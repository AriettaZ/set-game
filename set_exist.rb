#Author: Mike
#Create Date: 5/23
#Edit: 5/24 by Mike, minor changes

require_relative "check_set"

=begin
Requires: check_table.class = Array, 
			for combination in check_table, combination.class = Array, combination.length = 3,
			∀x∈combination, x.class=Card
		  score.class = Array
			for element in score, element.class = Array, element.length = 2
			for a,b in element[0] element[1], a∈Set("color","shading","symbol","number"), 0<=b<=220
Returns: True if there is at least a set in check_table combinations and false otherwise
Description: Check if there exist a set in the check_table
=end

def set_exist(check_table,score)

	sortedScore = score.sort{|a,b| a[1]<=>b[1]}
	order = [sortedScore[1][0]]+[sortedScore[2][0]]+[sortedScore[3][0]]
	
	for combination in check_table
		if check_set?(combination[0],combination[1],combination[2],order)
			return combination
		end
	end
	return []
end