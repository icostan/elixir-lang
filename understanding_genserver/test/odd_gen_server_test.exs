defmodule OddGenServerTest do
  use ExUnit.Case

  test "state in stateless world" do
    oddserver = OddGenServer.start_link()

    assert 1 == OddGenServer.next(oddserver)
    assert 3 == OddGenServer.next(oddserver)
    assert :ok == OddGenServer.skip(oddserver)
    assert 7 == OddGenServer.next(oddserver)
  end
end
