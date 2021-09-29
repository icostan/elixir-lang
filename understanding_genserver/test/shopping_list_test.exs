defmodule ShoppingListTest do
  use ExUnit.Case

  setup_all do
    {:ok, pid} = ShoppingList.start_link()
    %{pid: pid}
  end

  test "add/remove and print", %{pid: pid} do
    assert :ok = ShoppingList.add(pid, "Eggs")
    assert :ok = ShoppingList.add(pid, "Bread")
    assert ["Bread", "Eggs"] = ShoppingList.print(pid)

    assert :ok = ShoppingList.remove(pid, "Eggs")
    assert ["Bread"] = ShoppingList.print(pid)
  end
end
