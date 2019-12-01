defmodule ThreadbareWeb.Auth do
  @moduledoc false

  import Plug.Conn

  def current_user(conn) do
    Map.get(conn.assigns, :current_user)
  end

  def login(conn, user) do
    conn
    |> assign(:current_user, user)
    |> put_session(:current_user, user)
    |> configure_session(renew: true)
  end

  def logout(conn) do
    conn
    |> assign(:current_user, nil)
    |> clear_session()
  end
end
