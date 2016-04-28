require_relative "board"
require_relative "player"

class BattleshipGame
  attr_reader :board, :player

  def initialize(player=HumanPlayer.new("Minh"), board=Board.random)
    @player = player
    @board = board
    @hit = false

  end

  def attack(pos)
    if board[pos] == :s
      @hit = true
    else
      @hit = false
    end
    board[pos] = :x
  end

  def count
    board.count

  end

  def game_over?
    board.won?
  
  end

  def play_turn
    pos = player.get_play
    self.attack(pos)
  end

  def play
    play_turn until game_over?
    puts "You win"
  end

  def play_turn
    pos = nil

    until valid_play?(pos)
      display
      pos = player.get_play
    end
    attack(pos)
  end

  def valid_play?(pos)
    pos.is_a?(Array) && board.in_range?(pos)
  end

  def display
    system("clear")
    board.display
    puts "Its is a hit" if hit?
    puts "There are #{count} ships remainign."
  end

  def hit?
    @hit
  end

end

if __FILE__ == $PROGRAM_NAME
  BattleshipGame.new.play
end
