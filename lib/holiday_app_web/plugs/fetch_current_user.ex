defmodule HolidayAppWeb.Plugs.FetchCurrentUser do
  import Plug.Conn
  alias HolidayAppWeb.Helpers.TokenHelper

  alias HolidayApp.Users

  def init(_opts), do: nil

  def call(conn, _) do
    if (conn.assigns[:current_user]) do
      conn
    else
      case TokenHelper.verify_token(conn) do
        {:ok, user_id} ->
          assign(conn, :current_user, Users.get_user!(user_id))
        {:error, _} ->
          assign(conn, :current_user, nil)
      end
    end
  end
end