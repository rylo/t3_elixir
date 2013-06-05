defmodule MoveAction do 
  @io ConsoleIO

  def new("human", marker, board) do 
    input = @io.gets "\nWhat's your move, human? "
    index = @io.ensure_input_is_integer input
    
    if Board.is_valid_move?(index, board) do 
      index
    else
      @io.error_message "Invalid move. Please input a number between 0 and 8."
      new("human", marker, board)
    end
  end

  def new("easy computer", marker, board) do 
    Board.empty_space_indexes(board)
    |> RandomStrategy.get_move(marker)
  end

  def new("ultimate computer", marker, board) do 
    board
    |> NegamaxStrategy.get_move(marker)
  end
end
