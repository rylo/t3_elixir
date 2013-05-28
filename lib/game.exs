# game loop
# pulling in logic from other modules

defmodule Game do
  
  def start_loop do
    # TODO: setup
    IO.puts('Welcome to Elixir Tic-Tac-Toe')
    loop_step(Board.empty_spaces, {:x, :o})
  end
  
  def loop_step(board, players) do
    board = Board.set_space(board, Player.get_move(player))
    if(not GameRules.game_is_over(board), 
      do: loop_step(board, players),
      else: IO.puts('Game over!'))
  end
  
end