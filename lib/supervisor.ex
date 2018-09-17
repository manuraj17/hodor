defmodule Hodor.Supervisor do
  use Supervisor

  def start_link(opts) do
    Supervisor.start_link(__MODULE__, :ok, opts)
  end

  def init(_opts) do
    children = [
      {Plug.Adapters.Cowboy2, scheme: :http, plug: Hodor.Server, options: [port: 4040]}
    ]

    Supervisor.start_link(children, [strategy: :simple_one_for_one])
  end
end
