class Player 
  def initialize
    
  end

  def take_guess
    
  end
  
  def print_guess
    puts "Guess: #{@code_guess.join}"
    @history = @code_guess.join
  end
end

class Computer < Player 
  
end