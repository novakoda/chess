require_relative "game.rb"
require_relative "player.rb"

$player1 = Player.new("white")
$player2 = Player.new("black")
game = Game.new
game.turn_piece($player1)
