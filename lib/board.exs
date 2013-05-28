defmodule Board do
  
  def empty_spaces do
    {:_,:_,:_,:_,:_,:_,:_,:_,:_}
  end
  
  def set_space(board, space_index, marker) do
    set_elem(board, space_index, marker)
  end
  
  def get_space(space_list, space_index) do
    Enum.fetch!(space_list, space_index)
  end
  
end