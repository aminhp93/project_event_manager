# # # I/O Exercises
# # #
# # # * Write a `guessing_game` method. The computer should choose a number between
# # #   1 and 100. Prompt the user to `guess a number`. Each time through a play loop,
# # #   get a guess from the user. Print the number guessed and whether it was `too
# # #   high` or `too low`. Track the number of guesses the player takes. When the
# # #   player guesses the number, print out what the number was and how many guesses
# # #   the player needed.
# # # * Write a program that prompts the user for a file name, reads that file,
# # #   shuffles the lines, and saves it to the file "{input_name}-shuffled.txt". You
# # #   could create a random number using the Random class, or you could use the
# # #   `shuffle` method in array.

# # # def guessing_game
# # # 	secret = rand(1..10)

# # # 	guesses = 0
# # # 	while true
# # # 		puts "Guess a number!"
# # # 		guess = Integer(gets.chomp)
# # # 		guesses += 1

# # # 		case guess <=> secret
# # # 		when -1
# # # 			puts "#{guess} is too low"
# # # 		when 0
# # # 			puts "You found the number #{guess}!"
# # # 			break
# # # 		when 1
# # # 			puts "#{guess} is too high"

# # # 		end
# # # 	end
# # # 	puts "it took you #{guesses} guesses"
# # # end

# # # def shuffle_file(filename)
# # # 	base = File.basename(filename, ".*")
# # # 	extension = File.extname(filename)
# # # 	File.open("#{base}-shuffled#{extension}", "w") do |f|
# # # 		File.readlines(filename).shuffle.each do |line|
# # # 			f.puts line.chomp
# # # 		end
# # # 	end
# # # end

# # # if $PROGRAM_NAME == __FILE__
# # # 	if ARGV.length == 1
# # # 		shuffle_file(ARGV.shift)
# # # 	else
# # # 		puts "ENTER FILENAME TO SHUFFLE:"
# # # 		filename = gets.chomp
# # # 		shuffle_file(filename)
# # # 	end
# # # end

# # def guessing_game
# # 	secret = rand(1..10)

# # 	guesses = 0
# # 	while true
# # 		puts "guess a number"
# # 		guess = Integer(gets.chomp)
# # 		guesses += 1

# # 		case guess <=> secret
# # 		when -1
# # 			puts "your #{guess} is too low"
# # 		when 0
# # 			puts "you are correct. It is #{guess}"
# # 			break
# # 		when 1
# # 			puts "your #{guess} is too high"
# # 		end
# # 	end
# # 	puts "your number of guesses are #{guesses}"
# # end

# # def shuffle_file(filename)
# # 	base = File.basename(filename, ".*")
# # 	extension = File.extname(filename)

# # 	File.open("#{base}-shuffle#{extension}", "w") do |f|
# # 		File.readline(filename).shuffle.each do |line|

# # 			f.puts line.chomp
# # 		end
# # 	end
# # end

# # if $PROGRAM_NAME == __FILE__
# # 	if ARGV.length == 1
# # 		shuffle_file(ARGV.shift)
# # 	else
# # 		puts "ENTER THE FILENAME"
# # 		filename = gets.chomp
# # 		shuffle_file(filename)
# # 	end
# # end

# def guessing_game
# 	secret = rand(1..10)

# 	guesses = 0
# 	while true
# 		puts "guess a number"
# 		guess = Integer(gets.chomp)
# 		guesses += 1

# 		case guess <=> secret
# 		when -1
# 			puts "#{guess} is too low"
# 		when 0
# 			puts "#{guess} is correct"
# 			break
# 		when 1
# 			puts "#{guess} is too high"
# 		end
# 	end
# 	puts "your number of guesses is #{guesses}"
# end		

# def shuffle_file(filename)
# 	base = File.basename(filename, ".*")
# 	extension = File.extname(filename)

# 	File.open("#{base}-shuffle#{extension}", "w") do |f|
# 		File.readline(filename).shuffle.each do |line|
# 			f.puts line.chomp
# 		end
# 	end
# end

# if $FILENAME == __FILE__
# 	if ARGV.length == 1
# 		shuffle_file(ARGV.shift)
# 	else
# 		puts "enter a filename"
# 		filename = gets.chomp
# 		shuffle_file(filename)
# 	end
# end

def guessing_game
	secret = rand(1..10)
	guesses = 0
	while true
		puts "guess a number"
		guess = Integer(gets.chomp)

		guesses += 1
		if  guess < secret
		
			puts "your#{guess} too low"
		
		elsif guess > secret
			puts "your#{guess} too high"
		elsif guess == secret
			puts "Your #{guess} win"
		break
		end
	end
	puts "#{guesses}"
end




























