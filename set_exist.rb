#Description: Check if there exist a set in the check_table
#Author: Mike
#Create Date: 5/23

require_relative "check_set"

def score_to_order(score)
	sortedScore = score.sort{|a,b| a[1]<=>b[1]}
	order = [sortedScore[1][0]]+[sortedScore[2][0]]+[sortedScore[3][0]]
end

def set_exist(check_table,score)
	order = score_to_order score
	for i in 0...check_table.length
		combination = check_table[i]
		if check_set?(combination[0],combination[1],combination[2],order)
			return combination
		end
	end
	return []
end