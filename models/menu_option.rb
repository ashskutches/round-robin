class MenuOption
  attr_accessor :id, :name

  @@index = 1

  def initialize
    self.id = @@index
    @@index = @@index + 1
  end
end

class PlayerMenu < MenuOption
  def name
    "Add Players"
  end
  def action
    #display_players
    #prompt_to_add_players
  end
end

class BracketMenu < MenuOption
  def name
    "See Bracket"
  end
  def action
    #if @matches.size < 2
      #puts "Not enough players"
    #else
      #display_bracket
    #end
  end
end

class ErrorMenu < MenuOption
  def action
    puts "Not a valid option"
  end
end