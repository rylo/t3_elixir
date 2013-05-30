defmodule GameTest do
  use ExUnit.Case
  
  test "runs through an entire game" do
    assert Game.start("easy computer", "easy computer") == :game_over
  end
end
