defmodule Counter do
  def init, do: loop(0)

  def loop(counter) do
    IO.puts counter
    loop(counter + 1)
  end
end
