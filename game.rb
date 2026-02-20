require_relative "board"
require_relative "player"

class Game 
  def initialize 
    @player = Player.new("Player")
    @computer = Computer.new("Computer")
    @board = Board.new()
  end

  def play
    puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    puts "Guess the secret code within 12 turns"
    puts "Black: exact match | White: match but not in the right spot"
    puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

    @computer.generate_random

    @board.store_secret(@computer.code)

    while (!@board.win? && @board.turn_count != 12)
      @player.take_guess

      puts "====================================================="
      @board.check_code(@player.code)
      puts "====================================================="

    end

    if @board.win?
      puts "#{@player.name} has guessed the code!"
    else
      puts "#{@computer.name} has won! The code was #{@computer.code}"
    end
  end
end