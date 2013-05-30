defmodule GameRules do

  def player_markers do
    [:x, :o]
  end

  def winning_combinations do
    [ [0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6] ]
  end

  def board_combinations(board) do
    Enum.map( winning_combinations, fn(winning_combination) -> combine_winning_combination_and_board(winning_combination, board) end )
  end

  def combine_winning_combination_and_board(winning_combination, board) do
    Enum.map( winning_combination, fn(combination_index) -> Enum.fetch!(board, combination_index) end )
  end

  def get_game_status(board) do
    cond do
      find_winner(board) ->
        "\n#{find_winner(board)} wins!\n"
      game_is_tie?(board) ->
        "\nIt's a tie!\n"
    end
  end

  def winning_row_is_present_for_marker(board, marker) do
    Enum.map( board_combinations(board), fn(board_combination) -> 
      board_combination == [marker, marker, marker] end)
    |> collection_contains_true?
  end

  def immediate_win_available_for_marker(board, marker) do
    board_combinations(board)
    |> Enum.map(fn(combination) -> 
      Board.count_marker_type(combination, :_) == 1 && Board.count_marker_type(combination, marker) == 2 end)
    |> collection_contains_true?
  end

  def collection_contains_true?(collection) do
    Enum.any?(collection, fn(verdict) -> verdict == true end)
  end

  def is_winning_row(board_row, marker) do
    Board.count_marker_type(board_row, marker) == 3
  end

  def game_is_over?(board) do
    player_markers
    |> someone_won?(board) or game_is_tie?(board)
  end

  def game_is_tie?(board) do
    Board.board_is_full?(board)
  end

  def someone_won?(markers, board) do
    Enum.count(markers, fn(marker) -> winning_row_is_present_for_marker(board, marker) == true end ) > 0
  end

  def find_winner(board) do
    player_markers
    |> Enum.filter_map(fn(marker) -> winning_row_is_present_for_marker(board, marker) == true end, fn(marker) -> marker end)
    |> Enum.first
  end

  def players_to_markers(players) do
    Enum.map(players, fn(player) -> player.marker end)
  end

  def alternate_players(current_player) do
    players = player_markers
    player1 = Enum.first(players)
    if player1 == current_player do
      List.last(players)
    else 
      player1
    end
  end

  def alternate_players(players, current_player) do
    player1 = Enum.first(players)
    if player1 == current_player do
      List.last(players)
    else
      player1
    end
  end

end
