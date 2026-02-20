class Board 

  attr_reader :turn_count

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
    @feedback[:black] = 0
    @feedback[:white] = 0
    @turn_count += 1
    check_exact

    print_turns
    print_guess
    print_feedback
  end

  def win?
    @feedback[:black] == 4 ? true : false
  end

  private 

  def check_exact
    temporary_guess = @code_guess.dup
    temporary_secret = @secret_code.dup
    temporary_guess.each_with_index do |value,index|
      if value == temporary_secret[index]
        @feedback[:black] += 1
        temporary_guess[index] = nil
        temporary_secret[index] = nil
      end
    end
    check_contains(temporary_guess.compact, temporary_secret.compact)
  end

  def check_contains(temporary_guess, temporary_secret)
    temporary_guess.uniq.each do |value|
      guess_count = temporary_guess.count(value)
      secret_count = temporary_secret.count(value)
      @feedback[:white] += [guess_count,secret_count].min
    end
  end

  def print_feedback
    puts "Black: #{@feedback[:black]} | White: #{@feedback[:white]}"
  end

  def print_turns
    puts "Guess Number: #{@turn_count}"
  end

  def print_guess
    puts "Guess: #{@code_guess.join}"
  end
end