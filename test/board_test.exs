Code.require_file "../../lib/board.exs", __FILE__

ExUnit.start

defmodule BoardTest do
  use ExUnit.Case
  
  test "the board has spaces" do
    assert Board.empty_spaces == {:_,:_,:_,:_,:_,:_,:_,:_,:_}
  end
  
  test "sets a space's value" do
    assert Board.set_space({0, 1}, 1, :marker) == {0,:marker}
  end
  
end