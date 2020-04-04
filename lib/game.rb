require_relative "knight.rb"
require_relative "rook.rb"
require_relative "pawn.rb"
require_relative "board.rb"
require_relative "player.rb"

class Game
  def initialize
    $board = Board.new
    Knight.new([1,0],"black")
    Knight.new([6,0],"black")
    Rook.new([0,0],"black")
    Rook.new([7,0],"black")

    Knight.new([1,7],"white")
    Knight.new([6,7],"white")
    Rook.new([0,7],"white")
    Rook.new([7,7],"white")
    for i in 0..7 do
      Pawn.new([i,1],"black")
      Pawn.new([i,6],"white")
    end
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
    puts "Select the #{player.color} piece you wish to move via coords X,Y"
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
    piece.color == "black" ? self.turn_piece($player1) : self.turn_piece($player2)
  end

  def move_piece(piece, pos)
    old_pos = piece.pos
    piece.pos = pos
    $board.board[pos[0]][pos[1]] = nil
    $board.board[pos[0]][pos[1]] = piece
    $board.board[old_pos[0]][old_pos[1]] = Mpty.new
  end



end
