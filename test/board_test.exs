Code.require_file "../../lib/board.exs", __FILE__

ExUnit.start

defmodule BoardTest do
  use ExUnit.Case
  
  test "the board has spaces" do
    assert Board.empty_spaces == {:_,:_,:_,:_,:_,:_,:_,:_,:_}
  end
  
  test "sets a space's value" do
    assert Board.set_space(Board.empty_spaces, 1, :marker) == {:_,:marker,:_,:_,:_,:_,:_,:_,:_}
  end
  
  test "gets a space's value" do
    assert Board.get_space([:x, :o, :_], 1) == :o
  end
  
end