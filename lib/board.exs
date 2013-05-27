defmodule Board do
  
  def empty_spaces do
    {:_,:_,:_,:_,:_,:_,:_,:_,:_}
  end
  
  def set_space(space_list, space_index, marker) do
    set_elem(space_list, space_index, marker)
  end
  
end