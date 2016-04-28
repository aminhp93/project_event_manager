# class Code
#   attr_reader :pegs

#   PEGS = { "B" => :blue, "G" => :green, "O" => :orange, "P" => :purple, "R" => :red, "Y" => :yellow}

#   def self.parse(string)
#   	result = string.split("").collect do |i|
#   		raise "haha you have been hacked" unless PEGS.has_key?(i.upcase)
#   		PEGS[i.upcase]
#   	end
#   	Code.new(result)
#   end

#   def self.random
#   	result = []
#   	4.times do |i|
#   		result << PEGS.values.sample
#   	end
#   	Code.new(result)
#   end

#   def initialize(pegs)
#   	@pegs = pegs
#   end

#   def [](i)
#   	pegs[i]
#   end

#   def exact_matches(other_code)
#   	result = 0
#   	pegs.each_index do |i|
#   		result += 1 if self[i] == other_code[i]
#   	end
#   	result
#   end

#   def near_matches(other_code)
#   	other_color_counts = other_code.color_count

#   	result = 0
#   	self.color_count.each do |color, count|
#   		next unless other_color_counts.has_key?(color)
#   		result += [count, other_color_counts[color]].min
#   	end
#   	result - self.exact_matches(other_code)
#   end

#   def color_count
#   	result = Hash.new(0)
#   	@pegs.each do |color|
#   		result[color] += 1
#   	end
#   	result
#   end

#   def ==(other_code)
#   	return false unless other_code.is_a?(Code)
#   	self.pegs == other_code.pegs
#   end

# end

# class Game
#   attr_reader :secret_code
#   Max_turns = 10

#   def initialize(secret_code=Code.random)
#   	@secret_code = secret_code
#   end

#   def play
#   	Max_turns.times do 
#   		guess = get_guess

#   		if @secret_code == guess
#   			puts "Bingo. You are winner!"
#   			return
#   		end
#   		display_matches(guess)
#   	end
#   	puts "You lost"
#   end

#   def display_matches(guess)
#   	exact_matches = @secret_code.exact_matches(guess)
#   	near_matches = @secret_code.near_matches(guess)

#   	puts "You got #{exact_matches} exact matches!"
#   	puts "You got #{near_matches} near matches!"
#   end

#   def get_guess
#   	puts "Guess the code:"

#   	begin
#   		Code.parse(gets.chomp)
#   	rescue
#   		puts "Error parsing code"
#   		retry
#   	end
#   end
# end

# # if $PROGRAM_NAME == __FILE__
# # 	Game.new.play
# # end

# a = Code.parse("asfc")
# b = Game.new(a)
# p b.play

# class Code
# 	attr_reader :pegs

# 	PEGS = {"B" => :blue, "G" => :green, "O" => :orange, "P" => :purple, "R" => :red, "Y" => :yellow}

# 	def self.parse(string)
# 		result = string.split("").collect do |i|
# 			raise "You have been hacked!" unless PEGS.has_key?(i.upcase)
# 			PEGS[i.upcase]
# 		end
# 		Code.new(result)
# 	end

# 	def self.random
# 		result = []
# 		4.times do |i|
# 			result << PEGS.values.sample
# 		end
# 		Code.new(result)
# 	end

# 	def initialize(pegs)
# 		@pegs = pegs
# 	end

# 	def [](i)
# 		@pegs[i]
# 	end

# 	def exact_matches(other_code)
# 		result = 0
# 		pegs.each_index do |i|
# 			result += 1 if self[i] == other_code[i]
# 		end
# 		result
# 	end

# 	def near_matches(other_code)
# 		other_color_counts = other_code.color_count
# 		result = 0

# 		self.color_count.each do |color, count|
# 			result += [count, other_color_counts[color]].min
# 		end
# 		result - self.exact_matches(other_code)

# 	end

# 	def color_count
# 		result = Hash.new(0)

# 		@pegs.each do |i|
# 			result[i] += 1
# 		end
# 		result
# 	end

# 	def ==(other_code)
# 		return false unless other_code.is_a?(Code)
# 		self.pegs == other_code.pegs
# 	end
# end

# class Game
# 	Max_turns = 10
# 	attr_reader :secret_code

# 	def initialize(secret_code = Code.random)
# 		@secret_code = secret_code
# 	end

# 	def play
# 		Max_turns.times do 

# 			guess = get_guess

# 			if guess == @secret_code
# 				puts "bingo"
# 				return
# 			end
# 			display_matches
# 		end
# 		puts "you lost"
# 	end

# 	def get_guess
# 		puts "Make a guess: "

# 		begin
# 			Code.parse(gets.chomp)
# 		rescue
# 			puts "Error parsing code!"
# 			retry
# 		end
# 	end

# 	def display_matches(guess)
# 		exact_matches = @secret_code.exact_matches(guess)
# 		near_matches = @secret_code.near_matches(guess)
# 		puts "You got #{exact_matches} exact matches"
# 		puts "You got #{near_matches} near matches"
# 	end
# end

# if $PROGRAM_NAME == __FILE__
# 	GAME.new.play
# end

class Code
	attr_reader :pegs
	PEGS = {"B" => :blue, "O" => :orange, "Y" => :yellow, "G" => :green, "P" =>:purple, "R" => :red}

	def self.parse(string)
		pegs = string.split("").collect do |i|
			raise "parse error" unless PEGS.has_key?(i.upcase)
			PEGS[i.upcase]
		end
		Code.new(pegs)
	end

	def self.random
		pegs = []
		4.times {pegs << PEGS.values.sample}
		Code.new(pegs)
	end

	def initialize(pegs)
		@pegs = pegs
	end

	def [](i)
		pegs[i]
	end

	def exact_matches(other_code)
		result = 0
		pegs.each_index do |i|
			result += 1 if self[i] == other_code[i]
		end
		result
	end

	def near_matches(other_code)
		other_color_counts = other_code.color_count

		result = 0
		self.color_count.each do |color, count|
			next unless other_color_counts.has_key?(color)
				result += [count, other_color_counts[color]].min
			end
		result - self.exact_matches(other_code)
	end

	def color_count
		result = Hash.new(0)

		@pegs.each do |i|
			result[i] += 1
		end
		result
	end

	def ==(other_code)
		return false unless other_code.is_a?(Code)
		self.pegs == other_code.pegs
	end

end


class Game
	Max_turns = 10
	attr_reader :secret_code

	def initialize(secret_code=Code.random)
		@secret_code = secret_code
	end

	def play

		Max_turns.times do 
			guess = get_guess

			if guess == @secret_code
				puts 'you are winner'
				return
			end

			display_matches(guess)
		end
		puts "lost"
	end

	def get_guess
		puts "Guess the code:"
		begin
			Code.parse(gets.chomp)
		rescue
			puts "error parsing code"
			retry
		end
	end

	def display_matches(guess)
		exact_matches = @secret_code.exact_matches(guess)
		near_matches = @secret_code.near_matches(guess)
		puts "Ypou have #{exact_matches} exact_matches"
		puts "You ahve #{near_matches} near_matches"

	end
end

if $PROGRAM_NAME == __FILE__
	Game.new.play
end
















