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

  def find_winner
    players.select { |p| !p.dead? }.first
  end

  def run
    while !game_over?
      puts summary
      currentPlayer = @turn_manager.next_turn.currentPlayer
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
      sleep(1)
    end
    winner = find_winner
    puts "The winner is #{winner.name}!"
  end

end