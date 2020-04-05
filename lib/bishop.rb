require_relative "board.rb"

class Bishop
    attr_accessor :pos, :color, :symbol
    def initialize(pos = [0,0], color = "black")
        @pos = pos
        @color = color
        @color == "black" ? @symbol = "♝" : @symbol = "♗"
        $board.board[pos[0]][pos[1]] = self
    end

    def moves
      moves = []
      slots = [[1,1],[1,-1],[-1,-1],[-1,1]]
      slots.each do |slot|
        curr = [@pos[0]+slot[0],@pos[1]+slot[1]]
        if valid_move?(curr)
          while valid_move?(curr) do
            moves << curr
            break if $board.board[curr[0]][curr[1]].color != self.color && !$board.board[curr[0]][curr[1]].color.nil?
            curr = [curr[0]+slot[0],curr[1]+slot[1]]
          end
        end
      end
      # pp "Bishop Moves : #{moves}"
      moves
    end

    def valid_move?(pos)
      if (0..7).include?(pos[0]) && (0..7).include?(pos[1])
        $board.board[pos[0]][pos[1]].color == @color ? false : true
      else
        false
      end
    end
end
