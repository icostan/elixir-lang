defmodule StoreTest do
  use ExUnit.Case

  test "saves message" do
    pid = Store.init()
    response = Store.save(pid, "Hey!")

    assert {:ok, "message received!"} == response
  end

  test "retrieves all message" do
    pid = Store.init()
    Store.save(pid, "...world!")
    Store.save(pid, "Hello")

    response = Store.fetch(pid)

    assert {:ok, ["Hello", "...world!"]} == response
  end
end
