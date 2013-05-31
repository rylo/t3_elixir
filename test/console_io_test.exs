defmodule ConsoleIOTest do 
  use ExUnit.Case

  @subject ConsoleIO

  test "ensures human input is an integer" do 
    assert @subject.colorize_text("O HAY DERE!", :blue)     == "\033[94mO HAY DERE!\033[0m"
    assert @subject.colorize_text("O HAY DERE!", :green)    == "\033[92mO HAY DERE!\033[0m"
    assert @subject.colorize_text("O HAY DERE!", :red)      == "\033[91mO HAY DERE!\033[0m"
    assert @subject.colorize_text("O HAY DERE!", :no_color) == "O HAY DERE!\033[0m"
  end

  test "colorizes text" do 
    assert @subject.ensure_input_is_integer("3\n")      == 3
    assert @subject.ensure_input_is_integer("asdkfj\n") == false
  end
end
