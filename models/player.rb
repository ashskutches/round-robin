class Player
  attr_accessor :name, :id

  def initialize(name, index)
    @name = name
    @id = index
  end

  def self.prompt_to_add_players_from_user
    index = -1
    name = ""
    while !name.include?("done") do
      unless name.empty?
        name = name.sub(/\n/, "")
        @players << Player.new(name, index)
      end

      100.times { puts "\n" }
      puts "Type done  when completed"
      puts "\n"
      puts "================="
      puts "PLAYERS #{@players.count}: #{@players.collect(&:name).to_s.gsub(/\\n/, "")}"
      puts "\n"
      puts "Enter player#{@players.size + 1}'s name"
      puts "================="
      name = gets
      index += 1
    end

    return @players
  end

  def self.display_players(players)
    puts "Players"
    puts "=== #{@players.count} ===="
    players.each do |player|
      puts "#{player.id}: #{player.name}"
    end
  end

end