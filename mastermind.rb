class Player
  attr_accessor :hypothesis
  def initialize
    @hypothesis = []
  end

  def select
    puts 'Please formulate your hypothesis'
    selection = gets.chomp.to_s.split
    if selection.length > 4 or selection.length < 4 or
      puts 'Respect the rules'
      self.select
    else
      self.hypothesis = selection
    end
  end
end

class Game
  def initialize(player)
    @possibilities = ['white', 'yellow', 'brown', 'red', 'blue', 'orange', 'black', 'green']
    @secret_code = @possibilities.sample(4)
    @player = player
  end
  def start
    p @secret_code
    c = 0
    @player.select
    while c < 10
      if @player.hypothesis == @secret_code
        puts 'You won'
        break
      else
        @player.select
        c += 1
      end
    end
    puts 'Hai esaurito i tentativi'
  end
end

player = Player.new
game = Game.new(player)
game.start



