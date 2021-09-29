defmodule UnderstandingGenserverTest do
  use ExUnit.Case
  doctest UnderstandingGenserver

  test "greets the world" do
    assert UnderstandingGenserver.hello() == :world
  end
end
