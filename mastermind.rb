class Player
  attr_accessor :hypothesis
  attr_reader :possibilities
  def initialize
    @possibilities = ['white', 'yellow', 'brown', 'red', 'blue', 'orange', 'black', 'green']
    @hypothesis = []
  end

  def select
    puts 'Please formulate your hypothesis'
    selection = gets.chomp.to_s.split
    if selection.length > 4 || selection.length < 4 || selection.all? { |x| @possibilities.include?(x) } == false
      puts 'Please insert 4 colours'
      self.select
    else
      self.hypothesis = selection
    end
  end
end

class Game
  def initialize(player)
    @secret_code = player.possibilities.sample(4)
    @player = player
  end
  def start
    p @secret_code
    c = 0
    hint_colours = 0
    hint_position = 0
    while c < 10
      @player.select
      if @player.hypothesis == @secret_code
        puts 'You won'
        break
      else
        @secret_code.each do |y|
          if @player.hypothesis.include?(y)
            hint_colours += 1
            if @secret_code.index(y) == @player.hypothesis.index(y)
              hint_position += 1
            end
          end
        end
      end
        puts "Your hypothesis countains #{hint_colours} right colours"
        puts "Your hypothesis countains #{hint_position} colours in the right position"
        hint_colours = 0
        hint_position = 0
        c += 1
    end
  puts 'You finished the attempts'
  end
end

player = Player.new
game = Game.new(player)
game.start



