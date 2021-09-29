defmodule ApiOddServerTest do
  use ExUnit.Case

  test "sends message" do
    oddserver = ApiOddServer.init()

    assert 1 == ApiOddServer.next(oddserver)
    assert 3 == ApiOddServer.next(oddserver)
    assert :ok == ApiOddServer.skip(oddserver)
    assert 7 == ApiOddServer.next(oddserver)
  end
end
