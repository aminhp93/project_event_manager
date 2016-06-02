# # # require_relative 'board'
# # # require_relative 'human_player'
# # # require_relative 'computer_player'

# # # class Game
# # # 	attr_accessor :player_one, :player_two, :board, :current_player

# # # 	def initialize(player_one, player_two)
# # # 		@player_one = player_one
# # # 		player_one.mark = :X
# # # 		@player_two = player_two
# # # 		player_two.mark = :O
# # # 		@board = Board.new
# # # 		@current_player = player_one
# # # 	end

# # # 	def play
# # # 		current_player.display(board)

# # # 		until board.over?
# # # 			play_turn
# # # 		end

# # # 		if game_winner
# # # 			game_winner.display(board)
# # # 			puts "#{gam_winner.name} wins!"
# # # 		else
# # # 			puts "lost"
# # # 		end
# # # 	end

# # # 	def play_turn
# # # 		board.place_mark(current_player.get_move, current_player.mark)
		
# # # 		switch_players!
# # # 		current_player.display(board)
# # # 	end

# # # 	def switch_players!
# # # 		self.current_player = current_player == player_one ? player_two : player_one
	
# # # 	end

# # # 	def game_winner
# # # 		return player_one if board.winner == player_one.mark
# # # 		return player_two if board.winner == player_two.mark

# # # 	end
# # # end

# # # if $PROGRAM_NAME == __FILE__
# # # a = HumanPlayer.new("a")
# # # b = ComputerPlayer.new("b")
# # # c = Game.new(a, b)
# # #  c.play
# # # end
# # require_relative 'board'
# # require_relative 'human_player'
# # require_relative 'computer_player'

# # class Game
# # 	attr_accessor :player_one, :player_two, :board, :current_player

# # 	def initialize(a, b)
# # 		@player_one = a
# # 		@player_two = b
# # 		player_one.mark = :X
# # 		player_two.mark = :O
# # 		@board = Board.new
# # 		@current_player = a
# # 	end

# # 	def play
# # 		current_player.display(board)

# # 		until board.over?
# # 			play_turn
# # 		end

# # 		if game_winner
# # 			game_winner.display(board)
# # 			puts "#{game_winner.name} wins "
# # 		else
# # 			puts "Cat's game"
# # 		end
# # 	end

# # 	def game_winner
# # 		return player_one if board.winner == player_one.mark
# # 		return player_two if board.winner == player_two.mark
# # 		nil
# # 	end

# # 	def play_turn
		
# # 		board.place_mark(current_player.get_move, current_player.mark)
# # 		switch_players!
# # 		current_player.display(board)
# # 	end

# # 	def switch_players!
# # 		self.current_player = current_player == player_one ? player_two : player_one
# # 	end
# # end

# require_relative 'board'
# require_relative 'human_player'
# require_relative 'computer_player'
# class Game
	
# 	attr_accessor :player_one, :player_two, :current_player, :board

# 	def initialize(player_one, player_two)
# 		@player_one = player_one
# 		@player_two = player_two
# 		player_one.mark = :X, player_two.mark = :O
# 		@board = Board.new
# 		@current_player = player_one
# 	end

# 	def play
# 		current_player.display(board)
# 		until board.over?
# 			play_turn
# 		end

# 		if game_winner
# 			game_winner.display(board)
# 			puts "#{game_winner} won"
# 		else
# 			puts "lost"
# 		end
# 	end

# 	def game_winner
# 		return player_one if board.winner == player_one.mark
# 		return player_two if board.winner == player_two.mark
# 		nil
# 	end

# 	def play_turn
# 		board.place_mark(current_player.get_move, current_player.mark)
# 		switch_players!
# 		current_player.display(board)
# 	end

# 	def switch_players!
# 		self.current_player = current_player == player_one ? player_two : player_one
# 	end

# end
# if $PROGRAM_NAME == __FILE__
# 	a = HumanPlayer.new("a")
# 	b = ComputerPlayer.new("b")
# 	c = Game.new(a, b)
# 	c.play
# end

require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game
	attr_accessor :player_one, :player_two, :board, :current_player
	attr_reader :board

	def initialize(player_one, player_two)
		@player_one = player_one
		@player_two = player_two
		@current_player = player_one
		@board = Board.new
	end

	def play
		current_player.display(board)
		until board.over?
			play_turn
		end
		if game_winner
			game_winner.display(board)
			puts "winner is #{current_player}"
		else
			puts "lost"
		end
	end

	def play_turn
		board.place_mark(current_player.get_move, current_player.mark)
		switch_players!
		current_player.display(board)
	end

	def game_winner
		return player_one if board.winner == player_one.mark
		return player_two if board.winner == player_two.mark
		nil
	end

	def switch_players!
		self.current_player = current_player == player_one ? player_two : player_one
	end
end

if $PROGRAM_NAME == __FILE__
	a = HumanPlayer.new("a")
	b = ComputerPlayer.new("b")
	c = Game.new(a, b)
	p c.play
end






















