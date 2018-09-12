class TurnManager

  def initialize(players)
    @players = players.dup
  end

  def next_turn
    currentPlayer = get_currentPlayer
    @players.rotate!
    Turn.new(currentPlayer)
  end

  def get_currentPlayer
    @players.first
  end

end

class Turn
  attr_reader :currentPlayer

  def initialize(currentPlayer)
    @currentPlayer = currentPlayer
  end

end
