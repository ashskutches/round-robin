class Tournament
  attr_accessor :players, :matches

  def initialize(players = [], matches = [])
    @players = players
    @matches = matches
  end

  def display_menu
    100.times { puts "\n" }
    puts "    Menu"
    puts "========"
    puts "1. Player Menu"
    puts "2. See Bracket"
    puts "Please select:"
    menu_option = gets
    case menu_option
    when /1/
      display_players
      prompt_to_add_players
      generate_bracket
    when /2/
      if @matches.size < 2
        puts "Not enough players"
      else
        display_bracket
      end
    else
      puts "Not a valid option"
    end
    self.display_menu
  end

  def display_players
    100.times { puts "\n" }
    puts "Players"
    puts "=== #{@players.count} ===="
    @players.each do |player|
      puts "#{player.id}: #{player.name}"
    end
  end

  def display_bracket
    100.times { puts "\n" }
    @matches.each do |match|
      puts "Match: #{match.id} #{match.player1.name} vs #{match.player2.name}"
    end
    puts "Please press any button to continue......."
    gets
  end

  def prompt_to_add_players
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
  end

  def generate_bracket
    @matches = []
    @players.each do |player1|
      @players = @players - [player1]
      @players.each { |player2| @matches << Match.new(player1, player2) }
    end
  end
end # Tournament

class Player
  attr_accessor :name, :id

 def initialize(name, index)
    @name = name
    @id = index
  end
end

class Match
  attr_accessor :id, :player1, :player2
  @@index = 1

  def initialize(p1, p2)
    @player1 = p1
    @player2 = p2
    @id = @@index
    @@index = @@index +1
  end
end



# Input Script
tournament = Tournament.new
tournament.display_menu

