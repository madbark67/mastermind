require_relative "board"
require_relative "player"

class Game 
  def initialize 
    @player = Player.new()
    @computer = Computer.new()
    @board = Board.new()
  end

  def play
    @computer.generate_code

    @board.store_secret("abcd")
    @board.check_code("bccx")

    @player.take_guess
  end
end