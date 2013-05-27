Code.require_file "../../lib/game_rules.exs", __FILE__

ExUnit.start

defmodule GameRulesTest do
  use ExUnit.Case
  
  test "combines the given board with the winning combinations" do
    assert GameRules.board_combinations( [:x,:x,:x,:_,:_,:o,:_,:_,:o] ) == [[:x,:x,:x],[:_,:_,:o],[:_,:_,:o],[:x,:_,:_],[:x,:_,:_],[:x,:o,:o],[:x,:_,:o],[:x,:_,:_]]
  end
  
  test "the board has spaces" do
    assert GameRules.is_winning_row( [:x,:x,:x] ) == true
    assert GameRules.is_winning_row( [:x,:x,:o] ) == false
  end
  
  test "returns true if winning row is present" do
    assert GameRules.winning_row_is_available_for_marker( [:x,:x,:x,:_,:_,:_,:_,:_,:_], :x ) == true
    assert GameRules.winning_row_is_available_for_marker( [:x,:x,:x,:_,:_,:_,:_,:_,:_], :o ) == false
  end
  
  test "returns winning row combinations" do
    assert GameRules.winning_combinations == [ [0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6] ]
  end
  
end