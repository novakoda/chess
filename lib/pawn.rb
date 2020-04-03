require_relative "board.rb"

class Pawn
    attr_accessor :pos, :color, :parent, :children, :symbol
    def initialize(board, pos = [0,0], color = "black", parent = nil, children = [])
        @pos = pos
        @color = color
        @parent = parent
        @children = children
        @color == "black" ? @symbol = "♟" : @symbol = "♙"
        board.board[pos[0]][pos[1]] = self
    end

    def moves
      if @pos[1] == 1
        moves = [[@pos[0],@pos[1]+2],[@pos[0],@pos[1]+1]]
      else
        moves = [[@pos[0],@pos[1]+1]]
      end
    end
end
