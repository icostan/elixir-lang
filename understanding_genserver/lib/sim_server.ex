defmodule SimServer do

  @callback handle_call(any, pid, any) :: {atom, any}
  @callback handle_cast(any, any) :: {any}
  @callback handle_info(any, any) :: {any}

  def call(pid, msg) do
    send pid, {:"$gen_call", self(), msg}
    receive do
      reply -> reply
    end
  end

  def cast(pid, msg) do
    send pid, {:"$gen_cast", msg}
    :ok
  end

  def start_link(module, start_state) do
    spawn(__MODULE__, :run, [module, start_state])
  end

  def run(module, state) do
    receive do
      {:"$gen_call", from, msg} ->
        {reply, new_state} = module.handle_call(msg, from, state)
        send from, reply
        run(module, new_state)

      {:"$gen_cast", msg} ->
        {new_state} = module.handle_cast(msg, state)
        run(module, new_state)

      # everything else handled as `handle_info`
      msg ->
        {new_state} = module.handle_info(msg, state)
        run(module, new_state)
    end
  end
end
