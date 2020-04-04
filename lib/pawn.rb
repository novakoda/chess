require_relative "board.rb"

class Pawn
    attr_accessor :pos, :color, :parent, :children, :symbol
    def initialize(pos = [0,0], color = "black", parent = nil, children = [])
        @pos = pos
        @color = color
        @parent = parent
        @children = children
        @color == "black" ? @symbol = "♟" : @symbol = "♙"
        $board.board[pos[0]][pos[1]] = self
    end

    def moves
      if @color == "black"
        @pos[1] == 1 ? moves = [[@pos[0],@pos[1]+2],[@pos[0],@pos[1]+1]] : moves = [[@pos[0],@pos[1]+1]]
        jumps = [[@pos[0]+1,@pos[1]+1], [@pos[0]-1,@pos[1]+1]]
        jumps.each do |jump|
          unless jump.include?(8) || jump.include?(-1)
            slot = $board.at_pos(jump)
            moves << jump if !slot.nil? && slot.symbol != "_" && slot.color == "white"
          end
        end
      else
        @pos[1] == 6 ? moves = [[@pos[0],@pos[1]-2],[@pos[0],@pos[1]-1]] : moves = [[@pos[0],@pos[1]-1]]
        jumps = [[@pos[0]+1,@pos[1]-1], [@pos[0]-1,@pos[1]-1]]
        jumps.each do |jump|
          unless jump.include?(8) || jump.include?(-1)
            slot = $board.at_pos(jump)
            moves << jump if !slot.nil? && slot.symbol != "_" && slot.color == "black"
          end
        end
      end
      moves
    end
end
