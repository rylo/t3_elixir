defmodule Board do

  @empty_space_marker :_

  def empty_board do
    List.duplicate(@empty_space_marker, 9)
  end

  def empty_space_indexes(board) do
    Enum.map(board, fn(space_value, index) -> if(space_value == @empty_space_marker , do: index) end)
    |> Enum.filter(fn(boolean_value) -> is_integer(boolean_value) end)
  end

  def set_space(board, space_index, marker) do
    set_elem(list_to_tuple(board), space_index, marker)
    |> tuple_to_list
  end

  def get_space(space_list, space_index) do
    Enum.fetch!(space_list, space_index)
  end

  def is_valid_move(index, board) do
    try do
      get_space(board, index) == @empty_space_marker
    catch
      _value ->
        false
    end
  end

end
