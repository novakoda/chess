require_relative "knight.rb"
require_relative "board.rb"
require_relative "player.rb"

class Game
  def initialize
    @player1 = Player.new("black")
    @player2 = Player.new("white")
    @board = Board.new
    Knight.new(@board,[1,0],"black")
    Knight.new(@board,[6,0],"black")
    @board.show
  end

  def valid_move?(pos)
    false if pos[0] < 0 || pos[0] > 7 || pos[1] < 0 || pos[1] > 7
    true
  end

  def turn
    puts "Select the piece you wish to move via coords X,Y"
    tester = @board.to_pos([1,0])
    puts "K should be #{tester}"
    answer = gets.chomp.gsub(/[^\d]/,'').to_i.digits.reverse
    if answer.length > 2 || @board.board[answer[0]][answer[1]] == "_"
      puts "Invalid answer"
      self.turn
    end
    piece = @board.to_pos(answer)
    puts "You selected the #{piece.symbol} at position #{answer}"
    self.move(piece)
  end

  def move(piece)
    moves = []

    piece.moves.each do |pos|
      moves << @board.to_pos(pos) if valid_move?(pos)
    end
    old_pos = piece.pos
    puts "Enter the destination position"
    answer = gets.chomp.gsub(/[^\d]/,'').to_i.digits.reverse
    if answer.length > 2
      puts "Invalid answer"
      self.move(piece)
    end
    piece.pos = answer
    @board.board[answer[0]][answer[1]] = piece
    @board.board[old_pos[0]][old_pos[1]] = Mpty.new
    @board.show
    self.turn
  end


end
