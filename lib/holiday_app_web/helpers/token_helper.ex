defmodule HolidayAppWeb.Helpers.TokenHelper do
  import Plug.Conn

  def get_token(conn, user_id) do
    Phoenix.Token.sign(conn, salt, user_id)
  end

  def verify_token(conn) do
    token = get_session(conn, :token)
    Phoenix.Token.verify(conn, salt, token, max_age: 86400)
  end

  defp salt do
    Application.get_env(:holiday_app, :token_salt)
  end
end