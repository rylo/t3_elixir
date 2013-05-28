Code.require_file "../../lib/move_action.exs", __FILE__
Code.require_file "../../lib/player.exs", __FILE__
Code.require_file "../../lib/board.exs", __FILE__
Code.require_file "../../lib/game_rules.exs", __FILE__
Code.require_file "../../lib/console_board_presenter.exs", __FILE__

defmodule Game do
  
  def start(player1_type, player2_type) do
    ConsoleIO.puts 'Welcome to Elixir Tic-Tac-Toe'
    players = [Player.new(type: player1_type, marker: :x), Player.new(type: player2_type, marker: :o)]
    loop_step(Board.empty_board, players, Enum.first(players))
  end
  
  def loop_step(board, players, current_player) do
    ConsoleIO.puts ConsoleBoardPresenter.render_board(board)
    board = MoveAction.new(current_player.type, current_player.marker, board)
    if(not game_is_over(board, players), 
       do: loop_step(board, players, alternate_players(players, current_player)),
       else: end_game(board, players))
  end
  
  def alternate_players(players, current_player) do
    player1 = Enum.first(players)
    if(player1 == current_player,
      do: List.last(players),
      else: player1)
  end
  
  def end_game(board, players) do
    ConsoleIO.puts ConsoleBoardPresenter.render_board(board)
    ConsoleIO.puts 'Game over!'
    :game_over
  end
  
  def game_is_over(board, players) do
    GameRules.game_is_over(board, players)
  end
  
end