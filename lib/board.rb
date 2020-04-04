require_relative "empty.rb"

class Board
  attr_accessor :board

  def initialize
    @board = Array.new(8){ Array.new(8, Mpty.new) }
  end

  def at_pos(pos)
    @board[pos[0]][pos[1]]
  end

  def show
    for i in 7.downto(0) do
      print "#{board[0][i].symbol}|#{board[1][i].symbol}|#{board[2][i].symbol}|"
      print "#{board[3][i].symbol}|#{board[4][i].symbol}|#{board[5][i].symbol}|"
      print "#{board[6][i].symbol}|#{board[7][i].symbol} #{i}"
      puts
    end
    puts "0 1 2 3 4 5 6 7"

  end
end
