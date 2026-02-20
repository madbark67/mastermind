require_relative "board"
require_relative "player"

class Game 
  def initialize 
    @player = Player.new("Player")
    @computer = Computer.new("Computer")
    @board = Board.new()
    @choice = nil
  end

  def play
    choose_role

    if (@choice == "A")
      computer_guess
    elsif (@choice == "B")
      player_guess  
    end
  end

  def choose_role
    while @choice != "A" && @choice != "B"
      puts "Do you want to be the creator of the secret code or guessor? (A: creator | B: guessor)"
      @choice = gets.chomp
    end
  end

  def computer_guess
    @player.take_code
    @board.store_secret(@player.code)


    while (!@board.win? && @board.turn_count != 12)

      @computer.generate_random
      @computer.check_history(@board.history)
      puts "====================================================="
      @board.check_code(@computer.code)
      puts "====================================================="
      @computer.remove_wrongs(@board.feedback)
    end

    if @board.win?
      puts "#{@computer.name} has guessed the code!"
    else
      puts "#{@player.name} has won! The code was #{@player.code}"
    end
  end

  def player_guess
    puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    puts "Guess the secret code within 12 turns"
    puts "Black: exact match | White: match but not in the right spot"
    puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

    @computer.generate_random

    @board.store_secret(@computer.code)

    while (!@board.win? && @board.turn_count != 12)
      @player.take_code

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