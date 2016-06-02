# # class ComputerPlayer
# # 	attr_reader :name, :board
# # 	attr_accessor :mark

# # 	def initialize(name)
# # 		@name = name
# # 	end

# # 	def display(board)
# # 		@board = board
# # 	end

# # 	def get_move
# # 		moves = []
# # 		(0..2).each do |i|
# # 			(0..2).each do |j|
# # 				moves << [i, j] if board[i,j].nil?
# # 			end
# # 		end

# # 		moves.each do |move|
# # 			return move if wins?(move)
# # 		end
# # 		moves.samples
# # 	end

# # 	def wins?(move)
# # 		board[*move] = mark
# # 		if board.winner == mark
# # 			board[*move] = nil
# # 			true
# # 		else
# # 			board[*move] = nil
# # 			false
# # 		end
# # 	end

# # end

# class ComputerPlayer
# 	attr_reader :name, :board
# 	attr_accessor :marks

# 	def initialize(name)
# 		@name = name
# 	end

# 	def display(board)
# 		@board = board
# 	end

# 	def get_move
# 		moves = []
# 		(0..2).each do |i|
# 			(0..2).each do |j|
# 				moves << [i,j] if board[i,j].nil?
# 			end
# 		end

# 		moves.each do |move|
# 			return move if win?(move)
# 		end

# 		moves.sample
# 	end

# 	def win?(move)
# 		board[*move] = marks
# 		if board.winner == marks
# 			board[*move] = nil
# 			true
# 		else
# 			board[*move] = nil 
# 			false
# 		end
# 	end
# end

class ComputerPlayer
	attr_reader :name, :board
	attr_accessor :mark

	def initialize(name123)
		@name = name123
	end

	def display(board)
		
		@board = board
	end

	def get_move
		moves = []
		(0..2).each do |i|
			(0..2).each do |j|
				moves << [i,j] if board[i,j].nil?
			end
		end
		moves.each do |move|
			return move if win?(move)
		end
		moves.sample
	end

	def win?(move)
		board[*move] = mark
		if board.winner == mark
			board[*move] = nil
			true
		else
			board[*move] = nil
			false
		end
	end

end