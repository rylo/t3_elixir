defmodule RandomStrategy do 
  def get_move(board, _marker) do 
    random_index(board)
  end

  def random_index(collection) do 
    :random.seed(:erlang.now)
    index = :random.uniform(Enum.count(collection)) - 1
    Enum.fetch!(collection, index)
  end
end
