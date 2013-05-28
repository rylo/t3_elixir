Code.require_file "../../lib/move_action.exs", __FILE__
Code.require_file "../../lib/player.exs", __FILE__
Code.require_file "../../lib/board.exs", __FILE__

ExUnit.start

defmodule MoveActionTest do
  use ExUnit.Case
  
  test "gets a move from a human player" do
    human = Player.new
    assert MoveAction.process_human_move("3\n", human.marker, Board.empty_board) == {:_,:_,:_,:x,:_,:_,:_,:_,:_}
  end
  
  test "picks a random open space from the board" do
    computer = Player.new marker: :computer_marker, type: "easy computer"
    modified_board = MoveAction.new(computer.type, computer.marker, [:_,:x,:_,:x,:o,:x,:o,:o,:x])
    
    assert modified_board == [:computer_marker,:x,:_,:x,:o,:x,:o,:o,:x]
    || assert modified_board == [:_,:x,:computer_marker,:x,:o,:x,:o,:o,:x]
  end
  
end