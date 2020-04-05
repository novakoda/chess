require_relative "board.rb"

class Knight
    attr_accessor :pos, :color, :parent, :children, :symbol
    def initialize(pos = [0,0], color = "black", parent = nil, children = [])
        @pos = pos
        @color = color
        @parent = parent
        @children = children
        @color == "black" ? @symbol = "♞" : @symbol = "♘"
        $board.board[pos[0]][pos[1]] = self
    end

    def moves
      moves = []
      slots = [[1,2],[2,1],[1,-2],[2,-1],[-1,-2],[-2,-1],[-1,2],[-2,1]]
      slots.each do |slot|
        curr = [@pos[0]+slot[0],@pos[1]+slot[1]]
        if valid_move?(curr)
          moves << curr
        end
      end
      # pp "Knight Moves : #{moves}"
      moves
    end

    def valid_move?(pos)
      if (0..7).include?(pos[0]) && (0..7).include?(pos[1])
        $board.at_pos(pos).color == @color ? false : true
      else
        false
      end
    end
end
