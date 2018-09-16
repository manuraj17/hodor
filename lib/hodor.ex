defmodule Hodor do
  def init(default_options) do
    default_options
  end

  def call(conn, _options) do
    conn
    |> Plug.Conn.send_resp(200, "HODOR")
  end
end
