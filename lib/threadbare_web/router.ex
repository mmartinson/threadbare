defmodule ThreadbareWeb.Router do
  use ThreadbareWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ThreadbareWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/auth", ThreadbareWeb do
    pipe_through :browser

    get "/logout", AuthController, :logout
    get "/:provider", AuthController, :request
    get "/:provider/callback", AuthController, :callback
  end

  # Other scopes may use custom stacks.
  # scope "/api", ThreadbareWeb do
  #   pipe_through :api
  # end
end
