defmodule Store do
  def init() do
    spawn(__MODULE__, :loop, [[]])
  end

  def save(pid, message) do
    send(pid, {:save, self(), message})

    receive do
      {:ok, response} -> {:ok, response}
    end
  end

  def fetch(pid) do
    send(pid, {:fetch, self()})

    receive do
      {:ok, response} -> {:ok, response}
    end
  end

  def loop(state) do
    state =
      receive do
        {:save, from, msg} ->
          send(from, {:ok, "message received!"})
          [msg | state]

        {:fetch, from} ->
          send(from, {:ok, state})
          state
      end

    loop(state)
  end
end
