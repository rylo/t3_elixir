defmodule Game do

  @game_rules GameRules
  @io ConsoleIO
  @presenter ConsoleBoardPresenter
  @setup GameSetup

  def start(test // false) do
    @io.standard_message "Welcome to Elixir Tic-Tac-Toe!\n"
    players = if test do
      @setup.make_players("easy computer", "easy computer")
    else
      @setup.make_players
    end
    loop_step(Board.empty_board, players, Enum.first(players))
  end

  def loop_step(board, players, current_player) do
    @io.puts @presenter.render_board(board)
    @io.standard_message "\n#{current_player.marker}'s turn\n"
    
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
    @io.puts @game_rules.get_game_status(board)
    @io.puts 'Game over!'
    { :game_over }
  end
end
