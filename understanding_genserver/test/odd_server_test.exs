defmodule OddServerTest do
  use ExUnit.Case

  test "state in stateless world" do
    oddserver = OddServer.init()
    send(oddserver, {:next, self()})

    receive do
      n -> assert(n == 1)
    end
  end
end
