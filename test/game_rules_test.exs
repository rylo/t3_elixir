defmodule GameRulesTest do
  use ExUnit.Case, async: true

  @subject GameRules

  test "combines the given board with the winning combinations" do
    assert @subject.board_combinations( [:x,:x,:x,:_,:_,:o,:_,:_,:o] ) == [[:x,:x,:x],[:_,:_,:o],[:_,:_,:o],[:x,:_,:_],[:x,:_,:_],[:x,:o,:o],[:x,:_,:o],[:x,:_,:_]]
  end

  test "the board has spaces" do
    assert @subject.is_winning_row( [:x,:x,:x], :x ) == true
    assert @subject.is_winning_row( [:x,:x,:o], :x ) == false
  end

  test "returns true if winning row is present" do
    assert @subject.winning_row_is_present_for_marker( [:x,:x,:x,:_,:_,:_,:_,:_,:_], :x ) == true
    assert @subject.winning_row_is_present_for_marker( [:x,:x,:x,:_,:_,:_,:_,:_,:_], :o ) == false
  end

  test "returns winning row combinations" do
    assert @subject.winning_combinations == [ [0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6] ]
  end

  test "game is over conditions" do  
    assert @subject.game_is_over?( [:x,:x,:x,:_,:_,:_,:_,:_,:_] ) == true
    assert @subject.game_is_over?( [:x,:x,:o,:_,:_,:_,:_,:_,:_] ) == false
    assert @subject.game_is_over?( [:x,:o,:x,:o,:x,:o,:o,:x,:o] ) == true
  end

  test "finds the winner of the game" do
    assert @subject.find_winner( [:_,:x,:x,:_,:x,:o,:o,:x,:o]) == :x
    assert @subject.find_winner( [:_,:x,:x,:_,:x,:o,:o,:o,:o]) == :o
    assert @subject.find_winner( [:_,:x,:x,:_,:x,:o,:o,:o,:_]) == nil
  end

  test "alternates player turns" do
    players = [Player.new(type: "human", marker: :x), Player.new(type: "easy computer", marker: :o)]
    assert @subject.alternate_players(players, Enum.first(players)) == List.last(players)
  end

  test "returns whether immediate win is available for a given marker" do
    assert @subject.immediate_win_available_for_marker( [:x,:x,:x,:_,:_,:_,:_,:_,:_], :x ) == false
  end
  
  test "returns the game's status in text" do
    assert @subject.get_game_status([:x,:x,:x,:_,:_,:_,:_,:_,:_]) == "\nx wins!\n"
    assert @subject.get_game_status([:o,:_,:_,:_,:o,:_,:_,:_,:o]) == "\no wins!\n"
    assert @subject.get_game_status([:x,:o,:x,:o,:x,:o,:o,:x,:o]) == "\nIt's a tie!\n"
  end
end
