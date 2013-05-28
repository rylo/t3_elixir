Code.require_file "../../lib/player.exs", __FILE__

ExUnit.start

defmodule PlayerTest do
  use ExUnit.Case
  
  test "initializes a Player record with default values" do
    player = Player.new
    assert player.marker == :x
    assert player.type == "human"
  end
  
  test "initializes a Player record with the given player type and marker" do
    player = Player.new type: "foo", marker: :bar
    assert player.marker == :bar
    assert player.type == "foo"
  end
  
end