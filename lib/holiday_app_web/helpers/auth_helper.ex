defmodule HolidayAppWeb.Helpers.AuthHelper do
  import Plug.Conn

  def login(conn, user) do
    conn
    |> configure_session(renew: true)
    |> put_session(:user_id, user.id)
    |> assign(:current_user, user)
  end

  def logout(conn) do
    conn
    |> configure_session(drop: true)
    |> put_session(:user_id, nil)
    |> assign(:current_user, nil)
  end
end
