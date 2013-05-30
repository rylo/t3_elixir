defmodule GameSetup do
  @io ConsoleIO
  @player_types [{ 1, "human" }, { 2, "easy computer" }, { 3, "ultimate computer" }]

  def make_players do 
    [Player.new(type: ask_for_player_type("X")), Player.new(type: ask_for_player_type("O"), marker: :o)]
  end

  def make_players(player_1_type, player_2_type) do 
    [Player.new(type: player_1_type), Player.new(type: player_2_type, marker: :o)]
  end

  def ask_for_player_type(player) do 
    index = @io.get_player_type(player, humanized_player_types)
    if is_integer(index) and is_valid_player_selection?(index) do
      get_player_type index
    else
      ask_for_player_type player
    end
  end

  def get_player_type(index) do
    @player_types
    |> Enum.filter(fn({ selection_index, _player_type }) -> selection_index == index end)
    |> Enum.map(fn({ _selection_index, player_type }) -> player_type end)
    |> Enum.first
  end

  def is_valid_player_selection?(index) do
    @player_types
    |> Enum.map(fn({ selection_index, _player_type }) -> selection_index end)
    |> Enum.any?(fn(selection_index) -> selection_index == index end)
  end

  def humanized_player_types do
    @player_types
    |> Enum.map(fn({ selection_index, player_type }) -> " #{selection_index} - #{String.capitalize(player_type)}" end)
    |> Enum.join("\n")
  end
end
