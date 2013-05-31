defmodule PlayerTest do
  use ExUnit.Case, async: true

  @subject Player

  test "initializes a Player record with default values" do
    player = @subject.new
    
    assert player.marker == :x
    assert player.type == "human"
  end

  test "initializes a Player record with the given player type and marker" do
    player = @subject.new marker: :bar,  type: "foo"
    
    assert player.marker == :bar
    assert player.type == "foo"
  end
end
