defmodule Board do
  def spaces do
    {0,1,2,3,4,5,6,7,8,9}
  end
  def set_space(space_list, space_index, marker) do
    setelem(space_list, space_index, marker)
  end
end