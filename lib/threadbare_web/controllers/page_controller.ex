defmodule ThreadbareWeb.PageController do
  use ThreadbareWeb, :controller

  import ThreadbareWeb.Auth

  alias Threadbare

  plug Ueberauth
  plug ThreadbareWeb.Plugs.Auth.RequireAuth

  def index(conn, _params) do
    :ok = conn |> current_user() |> Threadbare.connect()
    render(conn, "app.html")
  end
end
