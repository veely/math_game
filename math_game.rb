require './turn_manager.rb'

class Player

  attr_reader :name, :lives
  MAX_LIVES = 3
  def initialize(name)
    @name = name
    @lives = MAX_LIVES
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
    @turn_manager = TurnManager.new(self.players)
  end

  def players
    [@player1, @player2]
  end

  def game_over?
    players.any? { |p| p.dead? }
  end

  def summary
    summary = players.map { |p| p.summary }.join("\n")
    """
------ SUMMARY ------
#{summary}
---------------------
    """
  end

  def run
    playerList = players.dup
    while !game_over?
      puts summary
      currentPlayer = playerList.first
      firstNum = rand(1..20)
      secondNum = rand(1..20)
      answer = firstNum + secondNum
      print "#{currentPlayer.name}: What is #{firstNum} plus #{secondNum}? "
      playerAnswer = gets.chomp.to_i
      if playerAnswer == answer
        puts "#{currentPlayer.name} answered correctly!"
      else
        puts "#{currentPlayer.name} answered incorrectly!"
        currentPlayer.lose_life
      end
      playerList.rotate!
    end
    winner = nil
    playerList.each { |p|
      if p.dead? == false
        winner = p
      end
    }
    puts "The winner is #{winner.name}!"
  end
end

game = Game.new
game.run