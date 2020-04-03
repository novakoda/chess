require_relative "knight.rb"
require_relative "pawn.rb"
require_relative "board.rb"
require_relative "player.rb"

class Game
  def initialize
    @player1 = Player.new("black")
    @player2 = Player.new("white")
    @board = Board.new
    Knight.new(@board,[1,0],"black")
    Knight.new(@board,[6,0],"black")
    Knight.new(@board,[1,7],"white")
    Knight.new(@board,[6,7],"white")
    for i in 0..7 do
      Pawn.new(@board,[i,6],"white")
      Pawn.new(@board,[i,1],"black")
    end
  end

  def valid_move?(pos)
    if pos[0] < 0 || pos[0] > 7 || pos[1] < 0 || pos[1] > 7
      false
    else
      true
    end
  end

  def turn_piece
    @board.show
    puts "Select the piece you wish to move via coords X,Y"
    answer = gets.chomp.split(/[^\d]/).map(&:to_i)
    if answer.length > 2 || @board.board[answer[0]][answer[1]].symbol == "_"
      puts "Invalid answer"
      self.turn_piece
    end
    piece = @board.to_pos(answer)
    puts "You selected the #{piece.symbol} at position #{answer}"
    puts
    self.turn_dest(piece)
  end

  def turn_dest(piece)
    moves = []

    piece.moves.each do |pos|
      moves << pos if valid_move?(pos)
    end
    puts "Possible Moves : #{moves}"
    old_pos = piece.pos
    puts "Enter the destination position via coords X,Y"
    puts "or type 'back' to select another piece"
    response = gets.chomp
    self.turn_piece if response == "back"
    answer = gets.chomp.split(/[^\d]/).map(&:to_i)
    if answer.length > 2 || !moves.include?(answer)
      puts "Invalid answer"
      self.turn_dest(piece)
    end
    self.move_piece(piece, answer)
    self.turn_piece
  end

  def move_piece(piece, pos)
    old_pos = piece.pos
    piece.pos = pos
    @board.board[pos[0]][pos[1]] = piece
    @board.board[old_pos[0]][old_pos[1]] = Mpty.new
  end


end
