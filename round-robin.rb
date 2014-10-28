class Player
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

class Match
  attr_accessor :player1_name, :player2_name

  def initialize(p1, p2)
    @player1_name = p1
    @player2_name = p2
  end
end

class Tournament
  attr_accessor :players, :matches

  def initialize(players = [], matches = [])
    @players = players
    @matches = matches
  end

  def get_player_names
    100.times { puts "\n" }
    name = ""
    while !name.include?("done") do
      self.players << Player.new(name) unless name.empty?
      if !self.players.empty?
        puts "Type DONE when completed"
        puts "\n"
        puts "================="
        puts "PLAYERS #{self.players.count}: #{self.players.collect(&:name).to_s.gsub(/\\n/, "")}"
        puts "\n"
      end
      puts "Enter player#{self.players.size + 1}'s name"
      puts "================="
      name = gets
      100.times { puts "\n" }
    end
  end

  def display_menu
    puts "    Menu"
    puts "========"
    puts "1. See Players"
    puts "2. See Bracket"
    puts "Please select:"
    menu_option = gets
    case menu_option
    when /1/
      display_players
      self.display_menu
    when /2/
      puts "TWO"
    else
      puts "Not a valid option"
    end
  end

  def display_players
    100.times { puts "\n" }
    puts "Players"
    puts "=== #{@players.count} ===="
    puts @players.collect(&:name)
  end

  def generate_bracket
    if @players.count > 2
      group_one = @players.take(@players.count / 2)
      group_two = @players - group_one
      group_one.each do |player1|
        group_two.each do |player2|
          @matches << Match.new(player1, player2)
        end
      end
    else
      puts "Not enough players supplied!" and return
    end
  end
end


# Input Script
tournament = Tournament.new
tournament.get_player_names



tournament.generate_bracket
tournament.display_menu
#name = gets

