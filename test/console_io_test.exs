Code.require_file "../../lib/game_rules.exs", __FILE__

ExUnit.start

defmodule ConsoleIOTest do
  use ExUnit.Case
  
  test "uses erlang's stdio" do
    # assert ConsoleIO.puts('') == nil
  end
  
end