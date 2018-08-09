defmodule HolidayAppWeb.Helpers.AuthHelper do
  import Plug.Conn
  alias HolidayAppWeb.Helpers.TokenHelper

  def login(conn, user) do
    conn
    |> configure_session(renew: true)
    |> put_session(:token, TokenHelper.get_token(conn, user.id))
    |> assign(:current_user, user)
  end

  def logout(conn) do
    conn
    |> configure_session(drop: true)
    |> put_session(:token, nil)
    |> assign(:current_user, nil)
  end
end
