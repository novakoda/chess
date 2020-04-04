require "./lib/board.rb"
require "./lib/empty.rb"

describe Board do

  describe "#at_pos" do
    board = Board.new
    it "Selects the slot at the position" do
      board.board[1][1].symbol = "J"
      expect(board.at_pos([1,1]).symbol).to eql("J")
    end
  end

  describe "#show" do
    str_7 = "_|_|_|_|_|_|_|_ 7\n"
    str_6 = "_|_|_|_|_|_|_|_ 6\n"
    str_5 = "_|_|_|_|_|_|_|_ 5\n"
    str_4 = "_|_|_|_|_|_|_|_ 4\n"
    str_3 = "_|_|_|_|_|_|_|_ 3\n"
    str_2 = "_|_|_|_|_|_|_|_ 2\n"
    str_1 = "_|_|_|_|_|_|_|_ 1\n"
    str_0 = "_|_|_|_|_|_|_|_ 0\n"
    str = "0 1 2 3 4 5 6 7"

    board = Board.new

    it "Displays the board" do
      expect(board.show).to eql(puts str_7 + str_6 + str_5 + str_4 + str_3 + str_2 + str_1 + str_0 + str)
    end

    it "Works when positions change" do
      str_1 = "_|X|_|_|_|_|_|_ 1\n"
      board.at_pos([1,1]).symbol = "X"
      expect(board.show).to eql(puts str_7 + str_6 + str_5 + str_4 + str_3 + str_2 + str_1 + str_0 + str)
    end

  end
end
