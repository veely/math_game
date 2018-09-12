class TurnManager

  def initialize(players)
    @players = players.dup
  end

  def next_turn
    answerer = get_answerer
  end

  def get_answerer
    @players.first
  end

end

class Turn
  attr_reader :answerer

  def initialize(answerer)
    @answerer = answerer
  end
end
