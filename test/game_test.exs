Code.require_file "../../lib/game.exs", __FILE__

ExUnit.start

defmodule GameTest do
  use ExUnit.Case
  
  test "runs through an entire game" do
    assert Game.start("easy computer", "easy computer") == :game_over
  end
  
  test "alternates player turns" do
    players = [Player.new(type: "human", marker: :x), Player.new(type: "easy computer", marker: :o)]
    
    assert Game.alternate_players(players, Enum.first(players)) == List.last(players)
  end
  
end