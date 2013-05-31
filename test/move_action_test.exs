defmodule MoveActionTest do
  use ExUnit.Case, async: true

  @subject MoveAction

  test "picks a random open space from the board" do
    computer = Player.new marker: :computer_marker, type: "easy computer"
    returned_index = @subject.new(computer.type, computer.marker, [:_,:x,:_,:x,:o,:x,:o,:o,:x])
    
    assert returned_index == 0 || assert returned_index == 2
  end

  test "picks the best available space on the board" do
    computer = Player.new marker: :x, type: "ultimate computer"
    returned_index = @subject.new(computer.type, computer.marker, [:_,:x,:_,:x,:o,:x,:o,:o,:x])
    
    assert returned_index == 2
  end
end
