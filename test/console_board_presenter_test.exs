defmodule ConsoleBoardPresenterTest do
  use ExUnit.Case

  @subject ConsoleBoardPresenter

  test "renders a single row" do
    assert @subject.render_row([:_,:x,:o], [0,1,2]) == " \e[92m0\e[0m | x | o "
  end

  test "renders an entire board" do
    assert @subject.render_board([:_,:x,:o,:x,:x,:o,:_,:x,:o]) == " \e[92m0\e[0m | x | o \n-----------\n x | x | o \n-----------\n \e[92m6\e[0m | x | o "
  end
end
