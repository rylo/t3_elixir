defmodule ConsoleBoardPresenter do
  
  def render_board(board) do
    rows = Enum.map(split_into_rows(board), fn(row) -> render_row(row) end)
    Enum.join(rows, "\n-----------\n")
  end
  
  def render_row(row) do
    Enum.map_join(row, "|", fn(space_value) -> print_space(space_value) end)
  end
  
  def print_space(space_value) do
    " " <> if(space_value != :_, do: atom_to_binary(space_value), else: " ") <> " "
  end
  
  def split_into_rows(board) do
    [Enum.take(board, 3), Enum.take(Enum.drop(board, 3), 3), Enum.drop(board, 6)]
  end
  
end