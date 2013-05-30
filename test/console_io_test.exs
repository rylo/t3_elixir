defmodule ConsoleIOTest do 
  use ExUnit.Case

  test "ensures human input is an integer" do 
    assert ConsoleIO.ensure_input_is_integer("3\n") == 3
    assert ConsoleIO.ensure_input_is_integer("asdkfj\n") == false
  end
end
