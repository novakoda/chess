require_relative "board.rb"

class King
    attr_accessor :pos, :color, :symbol
    def initialize(pos = [0,0], color = "black")
        @pos = pos
        @color = color
        @color == "black" ? @symbol = "♚" : @symbol = "♔"
        $board.board[pos[0]][pos[1]] = self
    end

    def moves
      moves = []
      slots = [[1,1],[1,-1],[-1,-1],[-1,1],[0,1],[0,-1],[1,0],[-1,0]]
      slots.each do |slot|
        curr = [@pos[0]+slot[0],@pos[1]+slot[1]]
        unless curr.include?(8) || curr.include?(-1) || $board.board[curr[0]][curr[1]].nil? || $board.board[curr[0]][curr[1]].color == self.color
          moves << curr
        end
      end
      moves
    end
end
