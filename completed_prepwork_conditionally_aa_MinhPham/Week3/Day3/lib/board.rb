class Board
	def self.default_grid
		Array.new(10) { Array.new(10)}
	end

	def self.random
    	self.new(self.default_grid, true)
  	end

	attr_reader :grid

	def initialize(grid=self.class.default_grid, random = false)
		@grid = grid
		randomize if random
	end

	def randomize(count = 10)
    	count.times { place_random_ship }
  	end

	def count
		grid.flatten.select {|i| i == :s}.length
	end

	def [](pos)
    	x, y = pos
    	grid[x][y]
  	end

	def []=(pos, val)
	    x, y = pos
	    grid[x][y] = val
	end

	def empty?(pos=nil)
		if pos
			self[pos].nil?
		else
			count == 0
		end
	end

	def full?
		grid.flatten.none?(&:nil?)
	end

	def in_range?(pos)
		pos.all? {|i| i.between?(0, grid.length)}
	end

	def place_random_ship
		raise "hacked" if full?
		pos = random_pos

		until empty?(pos)
			pos = random_pos
		end

		self[pos] = :s
	end

	def random_pos
		[rand(size), rand(size)]
	end

	def size
		grid.length
	end

	def won?
		grid.flatten.none? {|i| i == :s}
	end
end