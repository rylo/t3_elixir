Code.require_file "../../lib/game.exs", __FILE__

ExUnit.start

defmodule GameTest do
  use ExUnit.Case
  
  test "runs through an entire game" do
    assert Game.start("easy computer", "easy computer") == :game_over
  end
  
end