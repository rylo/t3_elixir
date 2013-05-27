Code.require_file "../../lib/board.exs", __FILE__

ExUnit.start

defmodule BoardTest do
  use ExUnit.Case

  test "the board has spaces" do
    assert Board.spaces == {0,1,2,3,4,5,6,7,8,9}
  end
  
  test "sets a space's value" do
    assert Board.set_space({0, 1}, 1, :marker) == {0,:marker}
  end
end