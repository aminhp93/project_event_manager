# class HumanPlayer
# 	def initialize(name)
# 		@name = name
# 	end

# 	def get_play
# 		gets.chomp.split(",").collect{|i| Integer(i)}
# 	end
# end

class HumanPlayer
	def initialize(name)
		@name = name
	end

	def get_play
		gets.chomp.split(", ").collect{|i| Integer(i)}
	end

end