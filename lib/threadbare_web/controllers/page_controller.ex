defmodule ThreadbareWeb.PageController do
  use ThreadbareWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
