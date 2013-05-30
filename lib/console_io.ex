defmodule ConsoleIO do

  def gets(message) do
    IO.gets message
  end

  def get_player_type(player_name, selection_list_message) do
    puts(selection_list_message)
    gets("\nPlease select a type for #{player_name}: ")
    |> ensure_input_is_integer
  end

  def puts(message) do
    IO.puts message
  end

  def put_error_message(message) do
    IO.puts "Error: #{message}"
  end

  def ensure_input_is_integer(input_value) do 
    try do
      number = strip_newlines(input_value)
      { index, _ } = String.to_integer(number)
      index
    rescue
      _ -> false
    end
  end

  def strip_newlines(text) do
    String.replace(text, "\n", "")
  end
end
