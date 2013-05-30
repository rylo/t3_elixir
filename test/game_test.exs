defmodule GameTest do
  use ExUnit.Case

  test "runs through an entire game" do
    assert Game.start(true) == { :game_over }
  end
end
