class Game
  attr_reader :over
  def initialize(p1, p2)
    @players = [p1, p2]
    @c_player = @players.sample
    @turn = 1
    @over = false
  end

  def generate_qtype
    types = ["sum", "sub", "mult", "div"]
    types.sample
  end

  def generate_question(type)
    case type
    when "sum"
      @c_question = Sum.new
    when "sub"
      @c_question = Sub.new
    when "mult"
      @c_question = Mult.new
    when "div"
      @c_question = Div.new
    end
  end

  def new_turn
    self.generate_question(self.generate_qtype)
    puts "----- NEW TURN -----"
    puts "#{@c_player.name}: #{@c_question.ask}"
  end

  def take_input
    @response = gets.chomp.to_f
  end

  def check_result
    correct = @c_question.check(@response)
    response = @c_question.generate_response
    puts "#{@c_player.name}: #{response}"
    if correct
      self.change_turn
    else
      @c_player.wrong
      self.change_turn
    end
  end

  def change_turn
    self.turn_summ
    if @c_player.lose?
      self.change_player
      self.endgame
    else
      self.change_player
    end
  end

  def change_player
    @c_player = @players.select{|p| p.name != @c_player.name}[0]
  end

  def turn_summ
    puts "#{@players[0].name}: #{@players[0].lives}/3 vs #{@players[1].name}: #{@players[1].lives}/3 "
  end

  def endgame
    @over = true
    puts "#{@c_player.name} wins with a score of #{@c_player.lives}/3"
    puts "----- GAME OVER -----"
    puts "Good bye!"
  end
end