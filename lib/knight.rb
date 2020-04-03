require_relative "board.rb"

class Knight
    attr_accessor :pos, :color, :parent, :children, :symbol
    def initialize(board, pos = [0,0], color = "black", parent = nil, children = [])
        @pos = pos
        @color = color
        @parent = parent
        @children = children
        @color == "black" ? @symbol = "♞" : @symbol = "♘"
        board.board[pos[0]][pos[1]] = self
    end

    def moves
      moves = [[pos[0]+1,pos[1]+2],[pos[0]+2,pos[1]+1],[pos[0]+1,pos[1]-2],
      [pos[0]+2,pos[1]-1],[pos[0]-1,pos[1]-2],[pos[0]-2,pos[1]-1],
      [pos[0]-1,pos[1]+2],[pos[0]-2,pos[1]+1]]
    end
end




=begin

def knight_moves(pos, endpos, parent = nil)
    moves = [[1,2],[2,1],[1,-2],[2,-1],[-1,-2],[-2,-1],[-1,2],[-2,1]]

    root = Knight.new(pos)
    root_node = [root]
    puts "Root : #{root_node}"
    path = []

    while !root_node.empty? && path.empty?
      parent_node = root_node.shift
      moves.each do |move_pos|
        current_pos = [parent_node.pos[0] + move_pos[0], parent_node.pos[1] + move_pos[1]]
        if valid_move?(current_pos)
          child = Node.new(current_pos, parent_node)
          parent_node.children << child
          root_node << child
          if parent_node.pos == endpos
            until parent_node.nil? do
              path << parent_node.pos
              parent_node = parent_node.parent
            end

            return path.reverse
          end
        end
      end

    end

end


def knight_moves(pos, endpos, parent = nil)
    if pos == endpos
      moves += 0
      prev_pos = []
      curr_parent = parent

      until curr_parent.nil? do
        pos = curr_parent.pos
        prev_pos << pos
        curr_parent = parent.parent
      end

      return prev_pos
    end

    moves = [[1,2],[2,1],[1,-2],[2,-1],[-1,-2],[-2,-1],[-1,2],[-2,1]]

    root = Node.new(pos)
    parent.children << root unless parent.nil?

    moves.each do |move_pos|
        pos = [root.pos[0] + move_pos[0], root.pos[1] + move_pos[1]]
        knight_moves(pos, endpos, root) if valid_move?(pos)
    end
end
=end
