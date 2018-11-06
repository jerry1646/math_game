require "./player.rb"
require "./question.rb"
require "./game.rb"


puts "Welcome to the Math game!"
p1 = Player.new("Jerry")
p2 = Player.new("Jeff")
game = Game.new(p1,p2)

while !game.over
  game.new_turn
  res = game.take_input
  game.check_result
end