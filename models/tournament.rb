class Tournament
  attr_accessor :players, :matches

  def initialize(players = [], matches = [])
    @players = players
    @matches = matches
  end

  def bracket
  end
end
