Code.require_file "../../lib/console_board_presenter.exs", __FILE__

ExUnit.start

defmodule ConsoleBoardPresenterTest do
  use ExUnit.Case
  
  test "renders a single row" do
    assert ConsoleBoardPresenter.render_row([:_,:x,:o]) == "   | x | o "
  end
  
  test "renders an entire board" do
    assert ConsoleBoardPresenter.render_board([:_,:x,:o,:x,:x,:o,:_,:x,:o]) == "   | x | o \n-----------\n x | x | o \n-----------\n   | x | o \n\n"
  end
  
end