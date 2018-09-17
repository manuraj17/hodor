defmodule Hodor do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      # worker(__MODULE__, [], function: :start_server)
      {Plug.Adapters.Cowboy2, scheme: :http, plug: Hodor.Server, options: [port: 4040]}
    ]

    Supervisor.start_link(children, [strategy: :one_for_one])
  end
end
