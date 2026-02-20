class Player 
  attr_reader :code, :name

  def initialize(name)
    @name = name
    @code = ""
  end

  def take_guess
    @code = ""
    while @code.length != 4 || !@code.match?(/^[a-z]+$/)
      puts "#{@name}: please enter a 4 letter guess (a-z)"
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

end