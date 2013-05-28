Code.require_file "../../lib/game_rules.exs", __FILE__

ExUnit.start

defmodule ConsoleIOTest do
  use ExUnit.Case
  
  test "combines the given board with the winning combinations" do
    assert ConsoleIO.lol
  end
  
end