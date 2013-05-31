defmodule Mix.Tasks.Play do
  use Mix.Task

  def run(_) do
    Game.setup
  end
end
