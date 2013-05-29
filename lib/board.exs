defmodule Board do
  
  def empty_board do
    [:_,:_,:_,:_,:_,:_,:_,:_,:_]
  end
  
  def empty_space_indexes(board) do
    emptys = Enum.map(board, fn(space_value, index) -> if(space_value == :_ , do: index) end)
    Enum.filter(emptys, fn(boolean_value) -> is_integer(boolean_value) end)
  end
  
  def set_space(board, space_index, marker) do
    # use a list instead? i.e. get rid of set_elem?
    set_elem(list_to_tuple(board), space_index, marker)
    |> tuple_to_list
  end
  
  def get_space(space_list, space_index) do
    Enum.fetch!(space_list, space_index)
  end
  
  def is_valid_move(index, board) do
    try do
      get_space(board, index) == :_
    catch
      _value ->
        false
    end
  end
  
end