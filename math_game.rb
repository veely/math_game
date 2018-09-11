class Player

  def initialize(name)
    @name = name
    @lives = 3
  end

  def lose_life
    @lives -= 1
  end

  def dead?
    @lives <= 0
  end

  def summary
    "#{@name} Life Count: #{@lives}"
  end

end

class Game

  def initialize()
    @player1 = Player.new('Player1')
    @player2 = Player.new('Player2')
  end

  def players
    [@player1, @player2]
  end

  def game_over?
    players.any? { |p| p.dead? }
  end

  def summary
    summary = players.map { |p| p.summary }.join("\n")
  end

  def run
    while !game_over?
      print "What is 2+2? "
      answer = gets.chomp.to_i
      if answer == 4
        puts "good job"
        puts summary
      else
        puts "wrong"
        @player1.lose_life
        puts summary
      end
    end
  end
end

game = Game.new
game.run