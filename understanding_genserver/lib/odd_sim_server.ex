defmodule OddSimServer do
  @behaviour SimServer

  ## Client API
  def next(oddserver) do
    SimServer.call(oddserver, :next)
  end

  def skip(oddserver) do
    SimServer.cast(oddserver, :skip)
  end

  def start_link() do
    SimServer.start_link(__MODULE__, 1)
  end

  ## callbacks
  def handle_call(:next, _from, current) do
    {current, current + 2}
  end

  def handle_cast(:skip, current) do
    {current + 2}
  end

  def handle_info(_msg, state) do
    IO.puts("Non sense message received")
    {state}
  end
end
