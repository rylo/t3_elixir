defmodule GameRules do
  
  def winning_combinations do
    [ [0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6] ]
  end
  
  def board_combinations(board) do
    Enum.map( winning_combinations, fn(winning_combination) -> combine_winning_combination_and_board(winning_combination, board) end )
  end
  
  def combine_winning_combination_and_board(winning_combination, board) do
    Enum.map( winning_combination, fn(combination_index) -> Enum.fetch!(board, combination_index) end )
  end
  
  def winning_row_is_available_for_marker(board, marker) do
    Enum.count( Enum.map( board_combinations(board), fn(board_combination) -> board_combination == [marker, marker, marker] end ), fn(x) -> x == true end ) > 0
  end
  
  def is_winning_row( board_row ) do
    Enum.count( board_row, fn(x) -> x == :x end ) == 3
  end
  
  def game_is_over(board, markers) do
    Enum.count( markers, fn(marker) -> winning_row_is_available_for_marker(board, marker) == true end ) > 0 
      || game_is_tie(board)
  end
  
  def game_is_tie(board) do
    count_marker_type(board, :_) == 0
  end
  
  def count_marker_type(board, marker) do
    Enum.count( board, fn(board_space) -> board_space == marker end )
  end
  
end