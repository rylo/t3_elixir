defmodule ConsoleBoardPresenter do 
  def render_board(board) do 
    Enum.map(Board.split_into_rows(board), fn({row, row_indexes}) -> render_row(row, row_indexes) end)
    |> Enum.join("\n-----------\n")
  end

  def render_row(row_markers, row_indexes) do 
    List.zip([row_markers, row_indexes])
    |> Enum.map_join("|", fn({space_value, space_index}) -> render_space(space_value, space_index) end)
  end

  def render_space(space_value, space_index) do 
    if space_value != :_ do 
      " #{atom_to_binary(space_value)} "
    else
      " #{ConsoleIO.colorize_text(space_index, :green)} "
    end
  end
end
