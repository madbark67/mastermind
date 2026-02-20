class Board 
  def initialize
    @secret_code = Array.new(4)
    @code_guess = Array.new(4)
    @turn_count = 0
    @feedback = {black: 0, white: 0}
    @history = Array.new()
  end

  def store_secret(code)
    @secret_code = code.split("")
  end

  def check_code(guess)
    @history.push(guess)
    @code_guess = guess.split("")
    check_contains
    check_exact
    print_feedback
  end


  private 

  def check_contains
    unique_values = @code_guess.uniq
    unique_values.each do |value|
      @feedback[:white] += @secret_code.count(value)
    end
  end

  def check_exact
    @code_guess.each_with_index do |value,index|
      if value == @secret_code[index]
        @feedback[:white] -= 1
        @feedback[:black] += 1
      end
    end
  end

  def print_feedback
    puts "Black: #{@feedback[:black]} | White: #{@feedback[:white]}"
  end

end