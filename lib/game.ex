defmodule Game do

  @game_rules GameRules
  @io ConsoleIO
  @presenter ConsoleBoardPresenter
  @setup GameSetup

  def setup do
    @io.standard_message "Welcome to Elixir Tic-Tac-Toe!\n"
    @setup.make_players
    |> start
  end

  def setup(is_test, io // @io) when is_test == true  do
    @setup.make_players("easy computer", "easy computer")
    |> start(io)
  end

  def start(players, io // @io) do
    loop_step(Board.empty_board, players, Enum.first(players), io)
  end

  def loop_step(board, players, current_player, io // @io) do
    io.puts @presenter.render_board(board)
    io.standard_message "\n#{current_player.marker}'s turn\n"
    
    move_index = MoveAction.new(current_player.type, current_player.marker, board)
    board = Board.set_space(board, move_index, current_player.marker)
    
    if not @game_rules.game_is_over?(board) do
      loop_step(board, players, @game_rules.alternate_players(players, current_player), io)
    else
      end_game(board, io)
    end
  end

  def end_game(board, io) do
    io.puts @presenter.render_board(board)
    io.puts @game_rules.get_game_status(board)
    io.puts 'Game over!'
    { :game_over }
  end
end
