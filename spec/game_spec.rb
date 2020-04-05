require "./lib/board.rb"
require "./lib/empty.rb"
require "./lib/game.rb"
require "./lib/player.rb"
require "./lib/knight.rb"
require "./lib/pawn.rb"

describe Game do
  game = Game.new

  str_7 = "♖|♘|♗|♔|♕|♗|♘|♖  7\n"
  str_6 = "♙|♙|♙|♙|♙|♙|♙|♙ 6\n"
  str_5 = "_|_|_|_|_|_|_|_ 5\n"
  str_4 = "_|_|_|_|_|_|_|_ 4\n"
  str_3 = "_|_|_|_|_|_|_|_ 3\n"
  str_2 = "_|_|_|_|_|_|_|_ 2\n"
  str_1 = "♟|♟|♟|♟|♟|♟|♟|♟ 1\n"
  str_0 = "♜|♞|♝|♚|♛|♝|♞|♜ 0\n"
  str = "0 1 2 3 4 5 6 7"

  it "Adds pieces to the board" do
    expect($board.show).to eql(puts str_7 + str_6 + str_5 + str_4 + str_3 + str_2 + str_1 + str_0 + str)
  end

  knight = $board.at_pos([1,0])

  describe "#valid_move?" do

    it "returns false for moves not on board" do
      expect(game.valid_move?([-1,1], knight)).to eql(false)
    end

    it "returns false for moves on same color pieces" do
      expect(game.valid_move?([3,1], knight)).to eql(false)
    end

    it "returns true for moves on empty slots" do
      expect(game.valid_move?([2,2], knight)).to eql(true)
    end

    it "returns true for moves on enemy pieces" do
      Knight.new([2,2],"white")
      expect(game.valid_move?([2,2], knight)).to eql(true)
    end


  end

  describe "#winner" do


  end

end
