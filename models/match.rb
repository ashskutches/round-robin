class Match
  attr_accessor :id, :player1, :player2
  @@index = 1

  def initialize(p1, p2)
    @player1 = p1
    @player2 = p2
    @id = @@index
    @@index += 1
  end
end