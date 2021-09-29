defmodule OddServer do
  @doc """
  Spawns server and initializes current number to 1.
  """
  @spec init() :: pid
  def init() do
    spawn(__MODULE__, :run, [1])
  end

  @doc """
  Provided as callback to spawn, stores state and calls itself recursively.
  """
  def run(current) do
    receive do
      {:next, pid} ->
        send(pid, current)
        run(current + 2)

      {:skip} ->
        run(current + 2)

      _ ->
        IO.puts("Non sense message received.")
        run(current)
    end
  end
end
