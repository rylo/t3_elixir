Code.require_file "../../lib/game.exs", __FILE__

defmodule Mix.Tasks.Play do
  use Mix.Task

  @shortdoc "This is short documentation, see"

  @moduledoc """
  A test task.
  """
  def run(_) do
    Game.start "human", "ultimate computer"
  end
end
