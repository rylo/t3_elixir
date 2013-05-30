Code.require_file "../../lib/board.exs", __FILE__
Code.require_file "../../lib/console_io.exs", __FILE__
Code.require_file "../../lib/negamax_strategy.exs", __FILE__
Code.require_file "../../lib/random_strategy.exs", __FILE__

defmodule MoveAction do

  @io ConsoleIO

  def new("human", marker, board) do 
    input = @io.gets("What's your move, human? ")
    index = @io.process_human_move(input)
    
    if Board.is_valid_move(index, board) do 
      index
    else
      new("human", marker, board)
    end
  end

  def new("easy computer", marker, board) do 
    RandomStrategy.get_move(Board.empty_space_indexes(board), marker)
  end

  def new("ultimate computer", marker, board) do 
    NegamaxStrategy.get_move(board, marker)
  end

end
