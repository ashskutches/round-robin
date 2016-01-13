def Bracket
  attr_accessor :players, :matches

  def self.generate(players, matches)
    @players.each do |player1|
      @opponents = @players - [player1]
      @opponents.each { |player2| @matches << Match.new(player1, player2) }
    end
  end
end