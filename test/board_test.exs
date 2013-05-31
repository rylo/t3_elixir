defmodule BoardTest do
  use ExUnit.Case

  @subject Board

  test "the board has spaces" do
    assert @subject.empty_board == [:_,:_,:_,:_,:_,:_,:_,:_,:_]
  end

  test "sets a space's value" do
    assert @subject.set_space(@subject.empty_board, 1, :marker) == [:_,:marker,:_,:_,:_,:_,:_,:_,:_]
  end

  test "gets a space's value" do
    assert @subject.get_space([:x, :o, :_], 1) == :o
  end

  test "gets the indexes of empty spaces on the board" do
    assert @subject.empty_space_indexes([:o,:_,:x,:_,:x,:_,:_]) == [1,3,5,6]
  end

  test "returns true if the given move index is valid" do
    assert @subject.is_valid_move?(1, [:o, :_]) == true
    assert @subject.is_valid_move?(0, [:o, :_]) == false
  end
end
