defmodule Board do
  @empty_space_marker :_

  def empty_board do
    List.duplicate(@empty_space_marker, 9)
  end

  def is_empty?(board) do
    empty_space_indexes(board)
    |> Enum.count == 9
  end

  def is_full?(board) do
    count_marker_type(board, @empty_space_marker) == 0
  end

  def empty_space_indexes(board) do
    Enum.map(board, fn(space_value, index) -> if(space_value == @empty_space_marker , do: index) end)
    |> Enum.filter(fn(boolean_value) -> is_integer boolean_value end)
  end

  def set_space(board, space_index, marker) do
    set_elem(list_to_tuple(board), space_index, marker)
    |> tuple_to_list
  end

  def get_space(space_list, space_index) do
    Enum.fetch!(space_list, space_index)
  end

  def space_is_empty?(index, board) do
    get_space(board, index) == @empty_space_marker
  end

  def is_valid_move?(index, board) do
    try do
      space_is_empty?(index, board)
    rescue
      _ -> false
    end
  end

  def count_marker_type(collection, marker) do
    Enum.count( collection, fn(collection_element) -> collection_element == marker end )
  end

  def split_into_rows(board) do
    [Enum.take(board, 3), Enum.take(Enum.drop(board, 3), 3), Enum.drop(board, 6)]
  end
end
