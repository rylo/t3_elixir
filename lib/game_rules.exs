defmodule GameRules do
  
  def winning_combinations do
    [ [0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6] ]
  end
  
  def board_combinations(board) do
    Enum.map( winning_combinations, fn(x) -> combine_winning_combination_and_board(x, board) end )
  end
  
  def combine_winning_combination_and_board(winning_combination, board) do
    Enum.map( winning_combination, fn(x) -> Enum.fetch!(board, x) end )
  end
  
  def winning_row_is_available_for_marker(board, marker) do
    Enum.count( Enum.map( board_combinations(board), fn(x) -> x == [marker, marker, marker] end ), fn(x) -> x == true end ) > 0
  end
  
  def is_winning_row( board_row ) do
    Enum.count( board_row, fn(x) -> x == :x end ) == 3
  end
  
end