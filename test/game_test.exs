defmodule GameTest do
  use ExUnit.Case

  test "runs through an entire game" do
    assert Game.setup(true) == { :game_over }
  end
end
