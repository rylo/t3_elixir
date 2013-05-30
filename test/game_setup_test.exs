defmodule GameSetupTest do
  use ExUnit.Case, async: true

  @subject GameSetup

  test "sets up the game according to a user's input" do
    assert @subject.make_players("human", "easy computer") == [Player[marker: :x, type: "human"],Player[marker: :o, type: "easy computer"]]
  end

  test "returns a human-readable list of player types" do
    assert @subject.humanized_player_types == " 1 - Human\n 2 - Easy computer\n 3 - Ultimate computer"
  end

  test "gets the player type from the given index" do
    assert @subject.get_player_type(1) == "human"
    assert @subject.get_player_type(2) == "easy computer"
    assert @subject.get_player_type(3) == "ultimate computer"
  end

  test "validates a user type selection" do
    assert @subject.is_valid_player_selection?("asdf") == false
    assert @subject.is_valid_player_selection?(1) == true
    assert @subject.is_valid_player_selection?(5) == false
  end
end
