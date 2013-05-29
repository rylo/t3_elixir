Code.require_file "../../lib/console_io.exs", __FILE__
Code.require_file "../../lib/negamax.exs", __FILE__

defmodule MoveAction do
  
  @io ConsoleIO
  @negamax Negamax
  
  def new("human", marker, board) do
    @io.gets("What's your move, human? ")
    |> process_human_move(marker, board)
  end
  
  def new("easy computer", marker, board) do
    empty_spaces = Board.empty_space_indexes(board)
    Board.set_space(board, random_index(empty_spaces), marker)
  end
  
  def new("ultimate computer", marker, board) do
    best_move = Negamax.find_best_move(board, marker)
    Board.set_space(board, best_move, marker)
  end
  
  def process_human_move(input_value, marker, board) do
    try do
      number = String.replace(input_value, "\n", "")
      {index, _} = String.to_integer(number)
      
      if(Board.is_valid_move(index, board),
        do: Board.set_space(board, index, marker),
        else: new("human", marker, board))
    rescue
      _value ->
        @io.put_error_message("Invalid move.")
        new("human", marker, board)
    end
  end
  
  def random_index(collection) do
    :random.seed(:erlang.now)
    index = :random.uniform(Enum.count(collection)) - 1
    Enum.fetch!(collection, index)
  end
  
end