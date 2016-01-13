class MainMenu
  def initialize(tournament)
    @menu_options = [player_menu, bracket_menu]
    @tournament = tournament
  end


  def menu_options

  end

  def steps
   @steps ||=  [
      Step.new(:name => :edit_estate, :url => Proc.new { wizard_client_estate_show_path(subject.id) }),
      Step.new(:name => :spouse, :url => Proc.new { wizard_client_estate_spouse_path(subject.id) }),
      Step.new(:name => :children, :url => Proc.new { wizard_client_estate_children_path(subject.id) })
    ]
  end

  def error_menu
    @error_menu ||= ErrorMenu.new(@tournament)
  end

  def player_menu
    @player_menu ||= PlayerMenu.new(@tournament)
  end

  def bracket_menu
    @bracket_menu ||= BracketMenu.new(@tournament)
  end

  def display_options
    puts "    Menu"
    puts "========"
    @menu_options.each { |o| puts "#{o.id}. #{o.name}" }
    puts "========"
  end

  def choose_option(user_input)
    error_menu.action and return unless @menu_options.collect(&:id).include? user_input.to_i
    selected_option = @menu_options.select { |option| option.id == user_input.to_i }.first
    selected_option.action
  end
end

