require_relative "knight.rb"
require_relative "rook.rb"
require_relative "bishop.rb"
require_relative "queen.rb"
require_relative "king.rb"
require_relative "pawn.rb"
require_relative "board.rb"
require_relative "player.rb"

class Game
  attr_accessor :pieces
  def initialize
    $board = Board.new
    $pieces_b = []
    $pieces_w = []

    for i in 0..7 do
      $pieces_b << Pawn.new([i,1],"black")
      $pieces_w << Pawn.new([i,6],"white")
    end

    $pieces_b << Knight.new([1,0],"black")
    $pieces_b << Knight.new([6,0],"black")
    $pieces_b << Rook.new([0,0],"black")
    $pieces_b << Rook.new([7,0],"black")
    $pieces_b << Bishop.new([2,0],"black")
    $pieces_b << Bishop.new([5,0],"black")
    $pieces_b << Queen.new([4,0],"black")

    $pieces_w << Knight.new([1,7],"white")
    $pieces_w << Knight.new([6,7],"white")
    $pieces_w << Rook.new([0,7],"white")
    $pieces_w << Rook.new([7,7],"white")
    $pieces_w << Bishop.new([2,7],"white")
    $pieces_w << Bishop.new([5,7],"white")
    $pieces_w << Queen.new([4,7],"white")

    $king_w = King.new([3,7],"white")
    $king_b = King.new([3,0],"black")

    $pieces_w << $king_w
    $pieces_b << $king_b
  end

  def valid_move?(pos, piece)
    if (0..7).include?(pos[0]) && (0..7).include?(pos[1])
      $board.at_pos(pos).color == piece.color ? false : true
    else
      false
    end
  end

  def turn_piece(player)
    $board.show
    if player.color == "black"
      puts "You're in check! Protect your King!\n" if $king_b.check?
    else
      puts "You're in check! Protect your King!\n" if $king_w.check?
    end
    puts "#{player.name}, select the piece you wish to move via coords X,Y"
    answer = gets.chomp.split(/[^\d]/).map(&:to_i)
    if answer.length > 2 || $board.board[answer[0]][answer[1]].symbol == "_"
      puts "Invalid answer"
      self.turn_piece(player)
    end
    piece = $board.at_pos(answer)
    if piece.color != player.color
      puts "You selected the wrong color"
      self.turn_piece(player)
    end
    puts "You selected the #{piece.symbol} at position #{answer}"
    puts
    self.turn_dest(piece, player)
  end

  def turn_dest(piece, player)
    moves = []
    piece.moves.each do |pos|
      moves << pos if valid_move?(pos, piece)
    end
    puts "Possible Moves : #{moves}"
    old_pos = piece.pos
    puts "Enter the destination position via coords X,Y"
    puts "or type 'back' to select another piece"
    response = gets.chomp
    self.turn_piece(player) if response == "back"

    answer = response.split(/[^\d]/).map(&:to_i)
    if answer.length > 2 || !moves.include?(answer)
      puts "Invalid answer"
      self.turn_dest(piece, player)
    end
    self.move_piece(piece, answer)
    puts
  end

  def move_piece(piece, pos)
    old_pos = piece.pos
    piece.pos = pos
    $board.board[pos[0]][pos[1]] = nil
    $board.board[pos[0]][pos[1]] = piece
    $board.board[old_pos[0]][old_pos[1]] = Mpty.new
  end

  def start
    puts "Enter a name for player 1 (white pieces)"
    p1_name = gets.chomp
    $player1 = Player.new("white", p1_name)
    puts "Enter a name for player 2 (black pieces)"
    p2_name = gets.chomp
    $player2 = Player.new("black", p2_name)
    puts
    self.play
  end

  def play
    until self.winner
      self.turn_piece($player1)
      $king_b.enemy_update
      puts "Check!" if $king_b.check? && !$king_b.checkmate?
      break if self.winner
      self.turn_piece($player2)
      $king_w.enemy_update
      puts "Check!\n" if $king_w.check? && !$king_w.checkmate?
    end
    self.finish
  end

  def winner
    return $player1 if $king_b.checkmate?
    return $player2 if $king_w.checkmate?
    false
  end

  def finish
    puts "Checkmate! #{self.winner.name} wins!"
    puts
    puts "Do you want to play again?"
    puts "Y/N"
    answer = gets.chomp.downcase
    accepted_answers = ["y", "yes"]
    declined_answers = ["n", "no"]
    until accepted_answers.any? { |item| answer == item } || declined_answers.any? { |item| answer == item }
        puts "Enter yes or no."
    end
    Game.new.play if accepted_answers.any? { |ans| ans == answer }
  end

end
