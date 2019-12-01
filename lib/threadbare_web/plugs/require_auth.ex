defmodule ThreadbareWeb.Plugs.Auth.RequireAuth do
  @moduledoc false

  import Plug.Conn
  import Phoenix.Controller, only: [redirect: 2]

  alias ThreadbareWeb.Auth

  def init(opts), do: opts

  def call(conn, _opts) do
    case get_session(conn, :current_user) do
      nil ->
        conn
        |> redirect(to: "/auth/slack")
        |> halt()

      user ->
        Auth.login(conn, user)
    end
  end
end
