defmodule HolidayAppWeb.Helpers.TokenHelperTest do
  import Plug.Conn

  use HolidayAppWeb.ConnCase

  alias HolidayAppWeb.Helpers.TokenHelper

  setup do
    conn = build_conn_with_session()
    user = insert(:user)
    {:ok, conn: conn, user: user}
  end

  test "generate and verify token", %{conn: conn, user: user} do
    token = 
      conn
      |> TokenHelper.get_token(user.id)

    conn = put_session(conn, :token, token)

    {:ok, user_id} = TokenHelper.verify_token(conn)

    assert user_id == user.id
  end

  test "verify invalid token", %{conn: conn} do
    conn = put_session(conn, :token, "invalid token")

    assert {:error, :invalid} == TokenHelper.verify_token(conn)
  end

end