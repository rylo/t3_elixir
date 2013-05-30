defmodule GameRulesTest do
  use ExUnit.Case

  test "combines the given board with the winning combinations" do
    assert GameRules.board_combinations( [:x,:x,:x,
                                          :_,:_,:o,
                                          :_,:_,:o] ) == [[:x,:x,:x],[:_,:_,:o],[:_,:_,:o],[:x,:_,:_],[:x,:_,:_],[:x,:o,:o],[:x,:_,:o],[:x,:_,:_]]
  end

  test "the board has spaces" do
    assert GameRules.is_winning_row( [:x,:x,:x], :x ) == true
    assert GameRules.is_winning_row( [:x,:x,:o], :x ) == false
  end

  test "returns true if winning row is present" do
    assert GameRules.winning_row_is_available_for_marker( [:x,:x,:x,
                                                           :_,:_,:_,
                                                           :_,:_,:_], :x ) == true
    assert GameRules.winning_row_is_available_for_marker( [:x,:x,:x,
                                                           :_,:_,:_,
                                                           :_,:_,:_], :o ) == false
  end

  test "returns winning row combinations" do
    assert GameRules.winning_combinations == [ [0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6] ]
  end

  test "game is over conditions" do  
    assert GameRules.game_is_over?( [:x,:x,:x,
                                     :_,:_,:_,
                                     :_,:_,:_] ) == true
    assert GameRules.game_is_over?( [:x,:x,:o,
                                     :_,:_,:_,
                                     :_,:_,:_] ) == false
    assert GameRules.game_is_over?( [:x,:o,:x,
                                     :o,:x,:o,
                                     :o,:x,:o] ) == true
  end

  test "finds the winner of the game" do
    assert GameRules.find_winner([:_,:x,:x,
                                  :_,:x,:o,
                                  :o,:x,:o]) == :x
    assert GameRules.find_winner([:_,:x,:x,
                                  :_,:x,:o,
                                  :o,:o,:o]) == :o
    assert GameRules.find_winner([:_,:x,:x,
                                  :_,:x,:o,
                                  :o,:o,:_]) == nil
  end

  test "alternates player turns" do
    players = [Player.new(type: "human", marker: :x), Player.new(type: "easy computer", marker: :o)]
    assert GameRules.alternate_players(players, Enum.first(players)) == List.last(players)
  end

  test "returns whether immediate win is available for a given marker" do
    assert GameRules.immediate_win_available_for_marker( [:x,:x,:x,:_,:_,:_,:_,:_,:_], :x ) == false
  end
end
