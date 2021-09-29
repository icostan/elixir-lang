defmodule Person do
  def create, do: spawn(Person, :listen, [])

  def say(to, message), do: send(to, {:msg, message})

  def listen do
    receive do
      {:msg, msg} -> IO.puts("Said '#{msg}' to #{inspect self()}")
    end
    listen()
  end
end
