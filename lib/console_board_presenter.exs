defmodule ConsoleBoardPresenter do

  def render_row(row) do
    Enum.map_join(row, "|", fn(space_value) -> print_space(space_value) end)
  end

  def render_board(board) do
    Enum.map(split_into_rows(board), fn(row) -> render_row(row) end)
    |> Enum.join("\n-----------\n")
  end

  def print_space(space_value) do
    space = if(space_value != :_, do: atom_to_binary(space_value), else: " ")
    " #{space} "
  end

  # Board?
  def split_into_rows(board) do
    [Enum.take(board, 3), Enum.take(Enum.drop(board, 3), 3), Enum.drop(board, 6)]
  end

end
