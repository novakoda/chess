require_relative "board.rb"

class King
    attr_accessor :pos, :color, :symbol, :enemy_moves
    def initialize(pos = [0,0], color = "black")
        @pos = pos
        @color = color
        @color == "black" ? @symbol = "♚" : @symbol = "♔"
        $board.board[pos[0]][pos[1]] = self
        @enemy_moves = []
        enemy = @color == "black" ? $pieces_w : $pieces_b
        enemy.each { |piece|
          piece.moves.each { |move| @enemy_moves << move unless move[0] > 7 || move[1] > 7 || move[0] < 0 || move[1] < 0 || $board.board[move[0]][move[1]].color == piece.color }
        }
        @enemy_moves.uniq!
    end

    def moves
      moves = []
      slots = [[1,1],[1,-1],[-1,-1],[-1,1],[0,1],[0,-1],[1,0],[-1,0]]
      slots.each do |slot|
        curr = [@pos[0]+slot[0],@pos[1]+slot[1]]
        if valid_move?(curr)
          moves << curr unless @enemy_moves.include?(curr)
        end
      end
      # pp "King Moves : #{moves}"
      moves
    end

    def check?
      @enemy_moves.include?(@pos) ? true : false
    end

    def checkmate?
      self.check? && self.moves.length == 0 ? true : false
    end

    def enemy_update
      @enemy_moves = []
      enemy = @color == "black" ? $pieces_w : $pieces_b
      enemy.each { |piece|
        piece.moves.each { |move| @enemy_moves << move unless move[0] > 7 || move[1] > 7 || move[0] < 0 || move[1] < 0 || $board.board[move[0]][move[1]].color == piece.color }
      }
      @enemy_moves.uniq!
    end

    def valid_move?(pos)
      if (0..7).include?(pos[0]) && (0..7).include?(pos[1])
        $board.at_pos(pos).color == @color ? false : true
      else
        false
      end
    end
end
