# Author: Channing, moved methods into module to clean up set_game.rb

module SaveLoadGame
=begin
  	Author: Mike
  	Created: 5/26
  	Edit: Ariel 5/26 Change formal parameter to instance variables
  	Edit: Ariel 5/27 change the formal parameter to instance variables
  	Edit: Mike 5/27 update the method for the new instance variables
  	Description: Save a game archive by creating a .setgame file under stored_game/@username/ directory
  	Require: N/A
  	Updates: N/A
  	Returns: N/A
=end
  	def save_game
  		file_name = get_save_information
  		File.write file_name,Marshal.dump({
  			save_time: (Time.now - @start_time).to_f + @save_time.to_f,
  			top_card: @top_card,
  			number_of_hint: @number_of_hint,
  			number_of_correct: @number_of_correct,
  			number_of_wrong: @number_of_wrong,
  			deck: @deck,
  			hand: @hand,
  			username: @username,
  			total_hint: @total_hint
  			})
  		puts ">>>[Game #{File.basename file_name,'.setgame'} saved under username #{@username}]<<<"
  	end

=begin
  	Author: Mike
  	Created: 5/26
  	Edit: Mike 5/27 Add @username choice
  	EditL Ariel 5/30 add filter to file name
  	Description: Get file name for the game to save
  	Require: N/A
  	Updates: N/A
  	Returns: File name (with directory) for the game to save
=end
  	def get_save_information
  		#Ask and construct file name and create @username directory
  		puts "Please enter file name:"
  		path="stored_game/"+@username+"/"
  		Dir.mkdir path unless Dir.exist? path
  		input = gets.chomp
  		until !input.empty? && input[0,1]!='.' && input != 'menu'
  			puts "","The file name can't be empty, menu, or start with '.'. ","Please enter another file name:"
  			input = gets.chomp
  		end
  		file_name = path+input+".setgame"

  		#If the file name exist, ask the user for another file name
  		while File.exist?(file_name) || file_name.downcase.include?("menu")
  			puts "File name exist, please enter a new name."
  			puts "(Enter \"saved\" to see the saved games)"
  			file_name = gets.chomp
  			if file_name=="saved"
  				show_saved_games
  				puts "Please enter a different file name to save the game: "
  				file_name = path+gets.chomp+".setgame"
  			else
  				file_name = path+file_name+".setgame"
  			end
  		end

  		#Return file name
  		file_name
  	end

=begin
  	Author: Mike
  	Created: 5/26
  	Edit: Ariel 5/26 Change formal parameter to instance variables
  	Edit: Mike 5/27 Output message to give more information about the progress
  	Description: Load all instance variables of a game, output a message and let the user continue the game.
  	Require: N/A
  	Updates: @start_time, @save_time, @top_card, @number_of_hint, @number_of_correct, @number_of_wrong, @deck, @hand, @username, @total_hint, @is_end
  	Returns: N/A
=end
  	def load_game
  		#Get information for game to load
  		get_username
  		file_name = get_saved_games
  		return if file_name=="menu"
  		load = Marshal.load File.read(file_name)

  		#Load the instance variables
  		@start_time = Time.now
  		@save_time = load[:save_time]
  		@top_card = load[:top_card]
  		@number_of_hint = load[:number_of_hint]
  		@number_of_correct = load[:number_of_correct]
  		@number_of_wrong= load[:number_of_correct]
  		@deck = load[:deck]
  		@hand = load[:hand]
  		@username = load[:username]
  		@total_hint=load[:total_hint]
  		@is_end = false

  		#Output a message for the progress
  		msg1 = "You have completed #{@number_of_correct} sets (roughly #{(@number_of_correct*100).fdiv(27).truncate(2)}%)"
  		msg2 = "You have #{@total_hint-@number_of_hint} hints left. Lets Continue!"
  		puts
  		(msg1.length+10).times {print "*"}
  		puts "\n**** "+msg1+" ****"
  		puts "**** "+msg2.center(msg1.length)+" ****"
  		(msg1.length+10).times {print "*"}
  		puts

  		continue_game
  	end

=begin
  	Author: Mike
  	Created: 5/28
  	Edit: N/A
  	Description: Output saved games with current username
  	Require: stored_game directory created
  	Updates: N/A
  	Returns: N/A
=end
  	def show_saved_games
  		puts "\n=============Saved Game============="
  		path = "stored_game/"+@username+"/"

  		#Check if the user have any saved games
  		if !Dir.exist?(path) || Dir.empty?(path)
  			puts "You don't have saved games.\n\n"
  			return "menu"
  		end

  		#Output all the file names of saved games and creation time
  		Dir.foreach(path) do
  			|file_name|
  			puts File.basename(file_name,'.setgame').ljust(15)+"  "+File.new(path+file_name).ctime.strftime("%F %T") if File.extname(file_name)==".setgame"
  		end
  		puts
  	end

=begin
  	Author: Mike
  	Created: 5/26
  	Edit: Mike 5/28 Add menu choice
  	Description: Output a list of saved game and let the user to choose which game to load from.
  	Require: stored_game directory created
  	Updates: N/A
  	Returns: File name for the game to load or "menu" if the user want to go back to menu
=end
  	def get_saved_games
  		return "menu" if show_saved_games=="menu"

  		#Ask for the file name to load game
  		puts "Please enter file name:(Enter \"menu\" to return menu)"
  		file_name = gets.chomp
  		path="stored_game/"+@username+"/"
  		return "menu" if file_name=="menu"
  		file_name = path+file_name+".setgame"

  		#If file name not exist, show the saved game list again
  		until File.exist? file_name
  			puts "File name does not exist."
  			show_saved_games
  			puts "Please reenter file name to load:(Enter \"menu\" to return menu)"
  			file_name = gets.chomp
  			return "menu" if file_name=="menu"
  			file_name = path+file_name+".setgame"
  		end

  		#Return file_name
  		file_name
  	end

=begin
  	Author: Ariel
  	Created: 5/29
  	Edit: N/A
  	Description: Save game statistics to @username.csv under game_result directory
  	Require: N/A
  	Updates: game_result/@username/@username.csv
  	Returns: N/A
=end
  def save_game_result
  	#Create csv directory and file
  	path="game_result/"
  	Dir.mkdir path unless Dir.exist? path
  	file_name = path+"#{@username}.csv"

  	#If the statistics already exist, add a new row
  	if File.file?(file_name)
  		CSV.open(file_name, "a+") do |csv|
  			csv << [@start_time, (@end_time - @start_time + @save_time).to_f,get_score,@number_of_correct,@number_of_wrong,@total_hint,@number_of_hint]
  		end
  	#If the statistics not exist, create the file and add a new row
  	else
  		CSV.open(file_name, "a+",	:write_headers => true,
  				:headers => ["Start Time","Time Spent(secs)","Score","Correct Sets","Wrong Sets","Total Hints","Used Hints"]) do |csv|
  			csv << [@start_time, (@end_time - @start_time + @save_time).to_f,get_score,@number_of_correct,@number_of_wrong,@total_hint,@number_of_hint]
  		end
  	end
  end


end
