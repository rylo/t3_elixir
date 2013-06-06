defmodule NegamaxStrategyTest do
  use ExUnit.Case, async: true
  
  @subject NegamaxStrategy

  test "returns a score for the given player" do 
    assert @subject.current_board_score_for_marker([:o,:x,:x,:x,:o,:o,:o,:x,:x], :x, 1) == 0
    assert @subject.current_board_score_for_marker([:o,:o,:x,:x,:o,:o,:x,:x,:x], :x, 2) == 50
    assert @subject.current_board_score_for_marker([:o,:x,:o,:x,:o,:x,:o,:x,:x], :x, 1) == -100
  end

  test "returns the index of the space with the highest score" do 
    assert @subject.get_move([:_,:x,:x,:_,:o,:o,:o,:x,:x], :x) == 0
    assert @subject.get_move([:o,:x,:x,:_,:_,:o,:o,:x,:_], :x) == 4
    assert @subject.get_move([:_,:_,:_,:_,:o,:_,:_,:x,:x], :o) == 6
    assert @subject.get_move([:o,:x,:_,:_,:x,:_,:_,:_,:_], :o) == 7
    assert @subject.get_move([:_,:_,:_,:_,:_,:_,:_,:_,:_], :x) == 4
    assert @subject.get_move([:x,:o,:_,:_,:o,:_,:x,:_,:x], :o) == 7
    assert @subject.get_move([:x,:o,:x,:_,:o,:_,:o,:x,:x], :o) == 5
  end

  test "returns the maximum value from a nested list" do
    assert @subject.get_max_score([[1,2,3], [4,5,6], [100]]) == 100
  end
end
