defmodule Threadbare do
  @moduledoc false

  def connect(token) do
    IO.inspect("connecting with token #{token}")
    :ok
  end

  def user_from_auth(%{credentials: %{token: token}} = auth) do
    IO.inspect(auth)
    {:ok, token}
  end

  def user_from_auth(auth) do
    IO.inspect(auth)
    {:error, :no_token}
  end
end
