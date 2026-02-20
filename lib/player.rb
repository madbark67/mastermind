class Player 
  attr_reader :code, :name

  def initialize(name)
    @name = name
    @code = ""
  end

  def take_code
    @code = ""
    while @code.length != 4 || !@code.match?(/^[a-z]+$/)
      puts "#{@name}: please enter a 4 letter code (a-z)"
      @code = gets.chomp
    end
  end

end

class Computer < Player 
  def initialize(name)
    super(name)
    @letters = ("a".."z").to_a
  end

  def generate_random
    @code = Array.new(4) {@letters.sample}.join
  end

  def remove_wrongs(feedback)
    if (feedback[:black] == 0 && feedback[:white] == 0)
      @letters = @letters - @code.split("").uniq
    end
  end

  def check_history(history)
    while history.include?(@code)
      generate_random
    end
  end
end