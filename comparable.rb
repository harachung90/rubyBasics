class Player
  include Comparable

  attr_accessor :name, :score

  def <=>(other_player)
    score <=> other_player.score
  end
  def initialize (name, score)
    @name = name
    @score = score
  end
end

player1 = Player.new("Hara", 100)
player2 = Player.new("Jon", 80)

puts "Player 1 > Player 2: %s" % (player1 > player2)
puts "Player 1 < Player 2: %s" % (player1 < player2)