# class Board
# 	attr_reader :grid, :marks

# 	def self.blank_grid
# 		Array.new(3){Array.new(3)}
# 	end

# 	def initialize(grid=Board.blank_grid)
# 		@grid = grid
# 		@marks = [:X, :O]
# 	end

# 	def [](x, y)
# 		grid[x][y]
# 	end

# 	def []=(x, y, value)
# 		grid[x][y] = value
# 	end

# 	def place_mark(pos, mark)
# 		self[*pos] = mark
# 	end


# 	def empty?(pos)
# 		self[*pos].nil?
# 	end

# 	def winner
# 		(grid + cols + diagonals).each do |i|
# 			return :X if i == [:X, :X, :X]
# 			return :O if i == [:O, :O, :O]
# 		end
# 		nil
# 	end

# 	def cols
# 		result = [[],[],[]]
# 		grid.each do |row|
# 			row.each_with_index do |mark, i|
# 				result[i] << mark
# 			end
# 		end
# 		result
# 	end

# 	def diagonals
# 		up_diag = [[0,2],[1,1],[2,0]]
# 		down_diag = [[0,0],[1,1],[2,2]]

# 		[down_diag, up_diag].collect do |i|
# 			i.collect{|row,col| grid[row][col]}
# 		end
# 	end


# 	def over?
# 		grid.flatten.none? {|i| i.nil?} || winner
# 	end
# end

class Board

	attr_reader :grid, :mark


	def self.make_grid
		Array.new(3){Array.new(3)}
	end

	def initialize(grid=Board.make_grid)
		@grid = grid
		@mark = [:X, :O]
	end

	def place_mark(pos, mark)
		self[*pos] = mark
	end

	def []=(x, y, mark)
		grid[x][y] = mark
	end

	def [](x, y)
		grid[x][y]
	end

	def empty?(pos)
		self[*pos].nil?
	end

	def winner
		(grid + col + diagonal).each do |i|
			return :X if i == [:X, :X, :X]
			return :O if i == [:O, :O, :O]
		end
		nil
	end

	def col
		result = [[],[],[]]

		grid.each do |row|
			row.each_with_index do |m, i|
				result[i] << m
			end
		end
		result
	end

	def diagonal
		up_diag = [[0,2],[1,1],[2,0]]
		down_diag = [[0,0],[1,1],[2,2]]

		[down_diag, up_diag].each do |i|
			i.collect{|row, col| grid[row][col]}
		end
	end

	def over?
		grid.flatten.none?(&:nil?) || winner
	end

end
