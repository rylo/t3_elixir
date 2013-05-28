defmodule ConsoleIO do
  
  def gets(message) do
    IO.gets(message)
  end
  
  def puts(message) do
    IO.puts(message)
  end
  
  def put_error_message(message) do
    "Error: " <> message
    |> IO.puts
  end
  
end