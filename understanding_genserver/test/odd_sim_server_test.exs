defmodule OddSimServerTest do
  use ExUnit.Case

  test "state in stateless world" do
    oddserver = OddSimServer.start_link()

    assert 1 == OddSimServer.next(oddserver)
    assert 3 == OddSimServer.next(oddserver)
    assert :ok == OddSimServer.skip(oddserver)
    assert 7 == OddSimServer.next(oddserver)
  end
end
