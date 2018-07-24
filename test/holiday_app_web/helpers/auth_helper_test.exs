defmodule HolidayAppWeb.Helpers.AuthHelperTest do
  use HolidayAppWeb.ConnCase

  alias HolidayAppWeb.Helpers.AuthHelper

  setup do
    conn = build_conn_with_session()
    user = insert(:user)

    {:ok, conn: conn, user: user}
  end

  describe "login/2" do
    test "puts user_id into session", %{conn: conn, user: user} do
      conn = AuthHelper.login(conn, user)
      assert get_session(conn, :user_id) == user.id
    end

    test "puts current_user to conn.assigns", %{conn: conn, user: user} do
      conn = AuthHelper.login(conn, user)
      assert conn.assigns[:current_user] == user
    end
  end

  describe "logout/1" do
    test "removes user_id and current_user from conn", %{conn: conn, user: user} do
      conn =
        conn
        |> AuthHelper.login(user)
        |> AuthHelper.logout()

      refute get_session(conn, :user_id)
      refute conn.assigns[:current_user]
    end
  end
end
