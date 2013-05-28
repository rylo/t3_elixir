Code.require_file "../../lib/game.exs", __FILE__

ExUnit.start

defmodule GameTest do
  use ExUnit.Case
  
  test "the game is a game." do
    assert Game.start_loop == 'l'
  end
  
end