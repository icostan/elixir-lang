defmodule ShoppingList do
  use GenServer

  #
  # Client Functions
  #
  def add(pid, name) do
    GenServer.cast(pid, {:add, name})
  end

  def remove(pid, name) do
    GenServer.cast(pid, {:remove, name})
  end

  def print(pid) do
    GenServer.call(pid, :print)
  end

  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  #
  # Server Callbacks
  #
  def handle_cast({:add, name}, shopping_list) do
    new_shopping_list = [name | shopping_list]
    {:noreply, new_shopping_list}
  end

  def handle_cast({:remove, name}, shopping_list) do
    new_shopping_list = List.delete(shopping_list, name)
    {:noreply, new_shopping_list}
  end

  def handle_call(:print, _from, shopping_list) do
    {:reply, shopping_list, shopping_list}
  end

  def init(:ok) do
    {:ok, []}
  end
end
