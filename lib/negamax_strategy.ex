defmodule NegamaxStrategy do
  
  @board Board
  @game_rules GameRules
  @game Game
  @presenter ConsoleBoardPresenter

  def get_move(board, marker) do
    if @game_rules.board_is_empty?(board) do
      [make_score_tuple(0.0, 4)]
    else
      start_negamax(board, marker)
    end
    |> get_highest_score
  end
  
  def start_negamax(board, marker) do
    Board.empty_space_indexes(board)
    |> Enum.map(fn(empty_space) ->
          Board.set_space(board, empty_space, marker)
          |> run(@game_rules.alternate_players(marker), 1)
          |> get_max
          |> make_score_tuple(empty_space)
        end)
  end
  
  def make_score_tuple(score, space_index) do
    {-1 * score, space_index}
  end
  
  def run(board, marker, depth) do
    Enum.map(Board.empty_space_indexes(board),
      fn(space_index) ->
        altered_board = @board.set_space(board, space_index, marker)
        if @game_rules.game_is_over?(altered_board) do
          current_board_score_for_marker(altered_board, marker, depth)
        else
          -1 * get_max(run(altered_board, @game_rules.alternate_players(marker), depth + 1))
        end
    end)
  end
  
  def get_max(list) do
    if Enum.count(list) > 0 do
      List.flatten(list)
      |> Enum.max
    else
      0
    end
  end
  
  def get_highest_score(score_tuples) do
    Enum.max(score_tuples, fn({score, _space_index}) -> score end)
    |> tuple_to_list
    |> List.last
  end
  
  def current_board_score_for_marker(board, marker, depth) do
    cond do
      @game_rules.find_winner(board) == marker ->
        100
      @game_rules.find_winner(board) ->
        -100
      @game_rules.immediate_win_available_for_marker(board, marker) ->
        50
      @game_rules.board_is_full?(board) ->
        0
      true ->
        0
    end / depth
  end

end
