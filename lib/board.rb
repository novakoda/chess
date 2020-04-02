require_relative "empty.rb"

class Board
  attr_accessor :board

  def initialize
    @board = Array.new(8){ Array.new(8, Mpty.new) }
  end

  def to_pos(pos)
    @board[pos[0]][pos[1]]
  end

  def show
    print "#{board[0][7].symbol}|#{board[1][7].symbol}|#{board[2][7].symbol}|"
    print "#{board[3][7].symbol}|#{board[4][7].symbol}|#{board[5][7].symbol}|"
    print "#{board[6][7].symbol}|#{board[7][7].symbol} 7"
    puts
    print "#{board[0][6].symbol}|#{board[1][6].symbol}|#{board[2][6].symbol}|"
    print "#{board[3][6].symbol}|#{board[4][6].symbol}|#{board[5][6].symbol}|"
    print "#{board[6][6].symbol}|#{board[7][6].symbol} 6"
    puts
    print "#{board[0][5].symbol}|#{board[1][5].symbol}|#{board[2][5].symbol}|"
    print "#{board[3][5].symbol}|#{board[4][5].symbol}|#{board[5][5].symbol}|"
    print "#{board[6][5].symbol}|#{board[7][5].symbol} 5"
    puts
    print "#{board[0][4].symbol}|#{board[1][4].symbol}|#{board[2][4].symbol}|"
    print "#{board[3][4].symbol}|#{board[4][4].symbol}|#{board[5][4].symbol}|"
    print "#{board[6][4].symbol}|#{board[7][4].symbol} 4"
    puts
    print "#{board[0][3].symbol}|#{board[1][3].symbol}|#{board[2][3].symbol}|"
    print "#{board[3][3].symbol}|#{board[4][3].symbol}|#{board[5][3].symbol}|"
    print "#{board[6][3].symbol}|#{board[7][3].symbol} 3"
    puts
    print "#{board[0][2].symbol}|#{board[1][2].symbol}|#{board[2][2].symbol}|"
    print "#{board[3][2].symbol}|#{board[4][2].symbol}|#{board[5][2].symbol}|"
    print "#{board[6][2].symbol}|#{board[7][2].symbol} 2"
    puts
    print "#{board[0][1].symbol}|#{board[1][1].symbol}|#{board[2][1].symbol}|"
    print "#{board[3][1].symbol}|#{board[4][1].symbol}|#{board[5][1].symbol}|"
    print "#{board[6][1].symbol}|#{board[7][1].symbol} 1"
    puts
    print "#{board[0][0].symbol}|#{board[1][0].symbol}|#{board[2][0].symbol}|"
    print "#{board[3][0].symbol}|#{board[4][0].symbol}|#{board[5][0].symbol}|"
    print "#{board[6][0].symbol}|#{board[7][0].symbol} 0"
    puts
    puts "0 1 2 3 4 5 6 7"

  end
end
