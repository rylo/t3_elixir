defmodule TestIO do 
  def gets(_message) do 
  end

  def puts(_message) do 
  end

  def puts(message, color) do 
    colorize_text(message, color)
  end

  def get_player_type(player_name, selection_list_message) do 
    puts(selection_list_message)
    colorize_text("\nPlease select a type for #{player_name}: ", :blue)
  end

  def standard_message(message) do 
    puts(message, :blue)
  end

  def error_message(message) do 
    puts("Error: #{message}", :red)
  end

  def ensure_input_is_integer(input_value) do 
    ConsoleIO.ensure_input_is_integer(input_value)
  end

  def strip_newlines(text) do 
    ConsoleIO.strip_newlines(text)
  end

  def colorize_text(text, color) do 
    ConsoleIO.colorize_text(text, color)
  end
end
