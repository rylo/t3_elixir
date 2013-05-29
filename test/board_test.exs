Code.require_file "../../lib/board.exs", __FILE__

ExUnit.start

defmodule BoardTest do
  use ExUnit.Case
  
  test "the board has spaces" do
    assert Board.empty_board == [:_,:_,:_,:_,:_,:_,:_,:_,:_]
  end
  
  test "sets a space's value" do
    assert Board.set_space(Board.empty_board, 1, :marker) == [:_,:marker,:_,:_,:_,:_,:_,:_,:_]
  end
  
  test "gets a space's value" do
    assert Board.get_space([:x, :o, :_], 1) == :o
  end
  
  test "gets the indexes of empty spaces on the board" do
    assert Board.empty_space_indexes([:o,:_,:x,:_,:x,:_,:_]) == [1,3,5,6]
  end
  
  test "returns true if the given move index is valid" do
    assert Board.is_valid_move(1, [:o, :_]) == true
    assert Board.is_valid_move(0, [:o, :_]) == false
  end
  
end