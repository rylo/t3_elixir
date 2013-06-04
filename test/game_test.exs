defmodule GameTest do
  use ExUnit.Case

  test "runs through an entire game" do
    assert Game.setup(true, TestIO) == { :game_over }
  end
end
