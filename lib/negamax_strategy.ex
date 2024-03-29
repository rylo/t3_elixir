defmodule NegamaxStrategy do 
  @board Board
  @game_rules GameRules

  def get_move(board, marker) do 
    if @board.is_empty?(board) do 
      [ make_score_tuple(0, 4) ]
    else
      start(board, marker)
    end
    |> get_highest_score_index_from_tuples
  end

  def start(board, marker) do 
    @board.empty_space_indexes(board)
    |> Enum.map(fn(empty_space_index) ->
      @board.set_space(board, empty_space_index, marker)
      |> run(@game_rules.alternate_players(marker), 1)
      |> get_max_score
      |> inverse_number
      |> make_score_tuple(empty_space_index)
    end)
  end

  def run(board, marker, depth) do
    if @game_rules.game_is_over?(board) do
      current_board_score_for_marker(board, marker, depth)
    else
      @board.empty_space_indexes(board)
      |> Enum.map(fn(empty_space_index) ->
        @board.set_space(board, empty_space_index, marker)
        |> run(@game_rules.alternate_players(marker), depth + 1)
        |> get_max_score
        |> inverse_number
      end)
    end
  end

  def make_score_tuple(score, space_index) do 
    { score, space_index }
  end

  def inverse_number(number) do 
    -1 * number
  end

  def get_max_score(list) when list == [] do 
    0
  end

  def get_max_score(list) do 
    List.flatten([list])
    |> Enum.max
  end

  def get_highest_score_index_from_tuples(score_tuples) do 
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
      @game_rules.game_is_tie?(board) ->
        0
    end / depth
  end
end
