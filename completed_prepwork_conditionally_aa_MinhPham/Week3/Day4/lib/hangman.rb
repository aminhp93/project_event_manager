# class Hangman

#   Max_guesses = 8
#   attr_reader :guesser, :referee, :board

#   def initialize(guesser, referee)
#   	@guesser = guesser
#   	@referee = referee
#   	@num_remaining_guesses = Max_guesses
#   end

#   def play
#   	setup
#   	while @num_remaining_guesses > 0
#   		p @board
#   		take_turn

#   		if won?
#   			p @board
#   			puts "guesser win!"
#   			return
#   		end
#   	end
#   	puts "Word was: #{@referee.require_secret}"
#   	puts "Guesser loses!"
#   	nil
#   end

#   def setup
#   	secret_length = @referee.pick_secret_word
#   	@guesser.register_secret_length(secret_length)
#   	@board = [nil] * secret_length
#   end

#   def take_turn
#   	guess = @guesser.guess(@board)
#   	indices = @referee.check_guess(guess)
#   	update_board(guess, indices)

#   	@num_remaining_guesses -= 1 if indices.empty?
#   	@guesser.handle_response(guess, indices)
#   end

#   def update_board(guess, indices)
#   	indices.each {|i| @board[i] = guess}
#   end

#   def won?
#   	@board.all?
#   end
# end

# class HumanPlayer
# 	def register_secret_length(length)
# 		puts "Secret is #{length} letters long"
# 	end

# 	def guess(board)
# 		p board
# 		puts "Input guess:"
# 		gets.chomp
# 	end

# 	def handle_response(guess, response)
# 		puts "Found #{guess} at positions #{response}"
# 	end

# 	def pick_secret_word
# 		puts "Think of a secret word; how long is it?"

# 		begin
# 			Integer(gets.chomp)
# 		rescue ArgumentError
# 			puts "Enter a valid length"
# 			retry
# 		end
# 	end

# 	def check_guess(guess)
# 		puts "player guessed #{guess}"
# 		puts "What positions does that occur at?"
# 		gets.chomp.split(",").collect{|i| Integer(i)}
# 	end

# 	def require_secret
# 		puts "Whst word were you thinking of?"
# 		gets.chomp
# 	end
# end

# class ComputerPlayer
# 	def self.player_with_dict_file(dict_file_name)
# 		ComputerPlayer.new(File.readlines(dict_file_name).collect(&:chomp))
# 	end

# 	attr_reader :candidate_words

# 	def initialize(dictionary)
# 		@dictionary = dictionary
# 	end

# 	def pick_secret_word
# 		@secret_word = @dictionary.sample
# 		@secret_word.length
# 	end

# 	def check_guess(guess)
# 		response = []
# 		@secret_word.split("").each_with_index do |letter, index|
# 			response << index if letter == guess
# 		end
# 		response
# 	end

# 	def register_secret_length(length)
# 		@candidate_words = @dictionary.select {|word| word.length == length}
# 	end

# 	def guess(board)
# 		freq_table = freq_table(board)
# 		most_frequent_letters = freq_table.sort_by {|letter,count| count}
# 		letter, _ = most_frequent_letters.last
# 		letter
# 	end

# 	def handle_response(guess, response_indices)
# 		@candidate_words.reject! do |word|
# 			should_delete = false

# 			word.split("").each_with_index do |letter, index|
# 				if (letter == guess) && (!response_indices.include?(index))
# 					should_delete = true
# 					break
# 				elsif (letter != guess) && (response_indices.include?(index))
# 					should_delete = true
# 					break
# 				end
# 			end
# 			should_delete
# 		end
# 	end

# 	def require_secret
# 		@secret_word
# 	end

# 	def freq_table(board)
# 		freq_table = Hash.new(0)
# 		@candidate_words.each do |word|
# 			board.each_with_index do |letter, index|
# 				freq_table[word[index]] += 1 if letter.nil?
# 			end
# 		end
# 		freq_table
# 	end
# end

# if __FILE__ == $PROGRAM_NAME
# 	p "Guesser: Computer (Yes/No)?"
# 	if gets.chomp == "yes"
# 		guesser = ComputerPlayer.player_with_dict_file("dictionary.txt")
# 	else
# 		guesser = HumanPlayer.new
# 	end

# 	p "referee: computer(y/no)?"
# 	if gets.chomp == "yes"
# 		referee = ComputerPlayer.player_with_dict_file("dictionary.txt")
# 	else
# 		referee = HumanPlayer.new
# 	end
# 	Hangman.new(guesser, referee).play
# end

class Hangman
	Max_guesses = 8
	attr_reader :guesser, :referee, :board

	def initialize(guesser, referee)
		@guesser = guesser
		@referee = referee
		@num_remaining_guesses = Max_guesses
	end

	def play
		setup
		while @num_remaining_guesses > 0
			if won?
				puts "you win"
			end
		end
		puts "You lose"

	end

	def setup
		@secret_word = @referee.pick_secret_word
		word_length = @guesser.register_secret_length(word_length)
		@board = @num_remaining_guesses 
	end

	def take_turn
		guess = @guesser.guess
		check_guess(guess)
		update_board
		@guesser.handle_response
	end
end

class ComputerPlayer

	def self.player_with_dict_file(file_name)
		ComputerPlayer.new(File.readlines(file_name).collect(&:chomp))
	end

	attr_reader :candidate_words

	def initialize(dictionary)
		@dictionary = dictionary
	end

	def pick_secret_word
		@secret_word = @dictionary.sample
		@secret_word.length
	end

	def check_guess(guess)
		result = []
		@secret_word.split("").each_with_index do |letter, index|
			result << index if letter == guess
		end
		result
	end

	def register_secret_length(length)
		@candidate_words = @dictionary.select{|word| word.length == length}
	end

	def guess(board)
		freq_table = freq_table(board)
		most_frequent_letters = freq_table.sort_by{|letter,count| count}
		letter, _ = most_frequent_letters.last
		letter
	end

	def handle_response(guess, response_indices)
		@candidate_words.reject! do |word|
			should_delete = false
			word.split("").each_with_index do |letter, index|
				if (letter == guess) && (!response_indices.include?(index))
					should_delete = true
					break
				elsif (letter != guess) && (response_indices.include?(index))
					should_delete = true
					break
				end
			end
			should_delete
		end
	end

	def require_secret
		@secret_word
	end

	def freq_table
		result = Hash.new(0)
		@candidate_words.each do |word|
			board.each_with_index do |letter, index|
				freq_table[word[index]] += 1 if letter.nil?
			end
		end
		result
	end
end

class HumanPlayer

	def initialize
	end

	def pick_secret_word
	end

	def check_guess
	end

	def register_secret_length
	end

	def guess

	end

	def handle_response
	end
end


