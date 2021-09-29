defmodule Echo do
  def run do
    receive do
      msg -> IO.inspect(msg)
    end
  end
end
