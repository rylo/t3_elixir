defmodule ElixirT3.Mixfile do
  use Mix.Project

  def project do
    [ app: :t3_elixir,
      version: "0.0.1",
      deps: deps ]
  end

  def application do
    [ registered: [:board, 
                   :console_board_presenter, 
                   :console_io, 
                   :game_rules, 
                   :game, 
                   :move_action, 
                   :negamax_strategy, 
                   :player, 
                   :random_strategy],
      compile_path: "ebin" ]
  end

  defp deps do
    []
  end
end
