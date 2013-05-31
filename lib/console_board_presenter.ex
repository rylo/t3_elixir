defmodule ConsoleBoardPresenter do
  def render_board(board) do
    Enum.map(Board.split_into_rows(board), fn(row) -> render_row(row) end)
    |> Enum.join("\n-----------\n")
  end

  def render_row(row) do
    Enum.map_join(row, "|", fn(space_value) -> render_space(space_value) end)
  end

  def render_space(space_value) do
    space = if(space_value != :_, do: atom_to_binary(space_value), else: " ")
    " #{space} "
  end
end
