defmodule ConsoleIOTest do 
  use ExUnit.Case

  test "ensures human input is an integer" do 
    assert ConsoleIO.process_human_move("3\n") == 3
    assert ConsoleIO.process_human_move("asdkfj\n") == false
  end

end
