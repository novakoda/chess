require_relative "board.rb"

class Queen
    attr_accessor :pos, :color, :symbol
    def initialize(pos = [0,0], color = "black")
        @pos = pos
        @color = color
        @color == "black" ? @symbol = "♛" : @symbol = "♕"
        $board.board[pos[0]][pos[1]] = self
    end

    def moves
      moves = []
      slots = [[1,1],[1,-1],[-1,-1],[-1,1],[0,1],[0,-1],[1,0],[-1,0]]
      slots.each do |slot|
        curr = [@pos[0]+slot[0],@pos[1]+slot[1]]
        unless curr.include?(8) || curr.include?(-1)
          until curr.include?(8) || curr.include?(-1) || $board.board[curr[0]][curr[1]].nil? || $board.board[curr[0]][curr[1]].color == self.color do
            moves << curr
            break if $board.board[curr[0]][curr[1]].color != self.color && !$board.board[curr[0]][curr[1]].color.nil?
            curr = [curr[0]+slot[0],curr[1]+slot[1]]
          end
        end
      end

      moves
    end
end

=begin
def moves
  moves = []
  i = 0
  until $board.board[@pos[0]][i].color == self.color || i > 7 do
    moves << [@pos[0],i]
    i += 1
  end
  j = 0
  until $board.board[j][@pos[1]].color == self.color || j > 7 do
    moves << [j,@pos[1]]
    j += 1
  end
  moves
end

=end
