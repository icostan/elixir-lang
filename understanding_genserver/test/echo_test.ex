defmodule EchoTest do
  use ExUnit.Case

  test "echo" do
    echo_pid = spawn(Echo, :run, [])
    GenServer.cast(echo_pid, :skip)
    GenServer.call(echo_pid, :next)
  end
end
