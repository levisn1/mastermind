class Player
  attr_reader :hypothesis
  def initialize
    @hypothesis = []
  end

  def select
    puts 'Select the 4 colours separating them with a space'
    selection = gets.chomp.to_s.split
    if selection.length > 4
      puts 'Too many colours'
      self.select
    else
      @hypothesis = selection
      #puts 'You selected the following colours:'
      #puts @hypothesis.join(' ')
    end
  end
end

lol = Player.new
lol.select
