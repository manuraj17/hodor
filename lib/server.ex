defmodule Hodor.Server do
  use Plug.Router
  use Plug.Debugger
  require Logger

  plug(Plug.Logger, log: :debug)

  plug(:match)
  plug(:dispatch)

  def start_link do
    # Cowboy adapter:
    # https://hexdocs.pm/plug/Plug.Adapters.Cowboy.html
    {:ok, _} = Plug.Adapters.Cowboy2.http __MODULE__, []
  end

  match _ do
    send_resp(conn, 200, "hodor")
  end
end
