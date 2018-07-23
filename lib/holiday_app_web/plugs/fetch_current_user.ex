defmodule HolidayAppWeb.Plugs.FetchCurrentUser do
  import Plug.Conn

  alias HolidayApp.Users

  def init(_opts), do: nil

  def call(conn, _) do
    user_id = get_session(conn, :user_id)

    cond do
      user = conn.assigns[:current_user] ->
        conn
      user = user_id && Users.get_user!(user_id) ->
        assign(conn, :current_user, user)
      true ->
        assign(conn, :current_user, nil)
    end
  end
end