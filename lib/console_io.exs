defmodule ConsoleIO do
  
  def gets(message) do
    IO.gets message
  end
  
  def puts(message) do
    IO.puts message
  end
  
  def put_error_message(message) do
    IO.puts "Error: #{message}"
  end
  
  def process_human_move(input_value) do 
    try do
      number = String.replace(input_value, "\n", "")
      {index, _} = String.to_integer(number)
      index
    rescue
      _value -> 
        put_error_message("Invalid move.")
        false
    end
  end
  
end