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
                   :game, 
                   :game_rules, 
                   :game_setup, 
                   :move_action, 
                   :negamax_strategy, 
                   :player, 
                   :random_strategy, 
                   :test_io ],
      compile_path: "ebin" ]
  end

  defp deps do
    []
  end
end
