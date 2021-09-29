defmodule OddGenServer do
  use GenServer

  ## Client API
  def next(oddserver) do
    GenServer.call(oddserver, :next)
  end

  def skip(oddserver) do
    GenServer.cast(oddserver, :skip)
  end

  def start_link() do
    GenServer.start_link(__MODULE__, 1)
  end

  ## Callbacks
  def handle_call(:next, _from, current) do
    {:reply, current, current + 2}
  end

  def handle_cast(:skip, current) do
    {:noreply, current + 2}
  end
end
