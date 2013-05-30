defmodule Game do
  
  @game_rules GameRules
  @io ConsoleIO
  @presenter ConsoleBoardPresenter
  
  def start(player1_type, player2_type) do
    @io.puts 'Welcome to Elixir Tic-Tac-Toe'
    players = [Player.new(type: player1_type, marker: :x), Player.new(type: player2_type, marker: :o)]
    loop_step(Board.empty_board, players, Enum.first(players))
  end
  
  def loop_step(board, players, current_player) do
    @io.puts @presenter.render_board(board)
    move_index = MoveAction.new(current_player.type, current_player.marker, board)
    board = Board.set_space(board, move_index, current_player.marker)
    
    if not @game_rules.game_is_over?(board) do
      loop_step(board, players, @game_rules.alternate_players(players, current_player))
    else
      end_game(board)
    end
  end
  
  def end_game(board) do
    @io.puts @presenter.render_board(board)
    @io.puts 'Game over!'
    :game_over
  end
  
end