Code.require_file "../../lib/negamax.exs", __FILE__

ExUnit.start

defmodule NegamaxTest do
  use ExUnit.Case
  
  test "returns a score for the given player" do    
    assert Negamax.current_board_score_for_marker([:o,:x,:x,
                                                   :x,:o,:o,
                                                   :o,:x,:x], :x, 1) == 0
    assert Negamax.current_board_score_for_marker([:o,:o,:x,
                                                   :x,:o,:o,
                                                   :x,:x,:x], :x, 2) == 50
    assert Negamax.current_board_score_for_marker([:o,:x,:o,
                                                   :x,:o,:x,
                                                   :o,:x,:x], :x, 1) == -100
  end
  
  test "returns the index of the space with the highest score" do
    assert Negamax.find_best_move([:_,:x,:x,
                                   :_,:o,:o,
                                   :o,:x,:x], :x) == 0
                        
    assert Negamax.find_best_move([:o,:x,:x,
                                   :_,:_,:o,
                                   :o,:x,:_], :x) == 4
                                   
   assert Negamax.find_best_move([:_,:_,:_,
                                  :_,:o,:_,
                                  :_,:x,:x], :o) == 6
                                   
   assert Negamax.find_best_move([:o,:x,:_,
                                  :_,:x,:_,
                                  :_,:_,:_], :o) == 7
                                   
    assert Negamax.find_best_move([:_,:_,:_,
                                   :_,:_,:_,
                                   :_,:_,:_], :x) == 4
  end
  
end