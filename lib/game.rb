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
    @board.show
  end

  def valid_move?(pos)
    false if pos[0] < 0 || pos[0] > 7 || pos[1] < 0 || pos[1] > 7
    true
  end

  def select_piece
    puts "Select the piece you wish to move via coords X,Y"
    answer = gets.chomp.split(/[^\d]/).map(&:to_i)
    if answer.length > 2 || @board.board[answer[0]][answer[1]] == "_"
      puts "Invalid answer"
      self.select_piece
    end
    piece = @board.to_pos(answer)
    puts "You selected the #{piece.symbol} at position #{answer}"
    self.select_dest(piece)
  end

  def select_dest(piece)
    moves = []

    piece.moves.each do |pos|
      moves << @board.to_pos(pos) if valid_move?(pos)
    end
    old_pos = piece.pos
    puts "Enter the destination position"
    answer = gets.chomp.split(/[^\d]/).map(&:to_i)
    if answer.length > 2
      puts "Invalid answer"
      self.select_dest(piece)
    end
    self.move_piece(piece, answer)
    @board.show
    self.select_piece
  end

  def move_piece(piece, pos)
    old_pos = piece.pos
    piece.pos = pos
    @board.board[pos[0]][pos[1]] = piece
    @board.board[old_pos[0]][old_pos[1]] = Mpty.new
  end


end
