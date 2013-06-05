defmodule ConsoleIO do 
  def gets(message) do 
    IO.gets message
  end

  def puts(message) do 
    IO.puts message
  end

  def puts(message, color) do 
    colorize_text(message, color)
    |> puts
  end

  def get_player_type(player_name, selection_list_message) do 
    puts(selection_list_message)
    colorize_text("\nPlease select a type for #{player_name}: ", :blue)
    |> gets
    |> ensure_input_is_integer
  end

  def standard_message(message) do 
    puts(message, :blue)
  end

  def error_message(message) do 
    puts("Error: #{message}", :red)
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

  def colorize_text(text, color) do 
    text_color = case color do
      :blue  -> "\033[94m"
      :green -> "\033[92m"
      :red   -> "\033[91m"
      _ -> ""
    end
    "#{text_color}#{text}\033[0m"
  end
end
