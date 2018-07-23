defmodule HolidayAppWeb.Plugs.EnsureLoggedInTest do
  use HolidayAppWeb.ConnCase

  alias HolidayAppWeb.Plugs.EnsureLoggedIn

  setup do
    conn = build_conn_with_session()
    user = insert(:user)
    {:ok, conn: conn, user: user}
  end

  test "conn continues when the current_user exists", %{conn: conn, user: user} do
    conn =
      conn
      |> assign(:current_user, user)
      |> EnsureLoggedIn.call(%{})

    refute conn.halted
  end

  test "conn halts when no current_user exists", %{conn: conn} do
    conn = EnsureLoggedIn.call(conn, %{})
    assert conn.halted
  end
  
  test "reditects to root path", %{conn: conn} do
    conn = EnsureLoggedIn.call(conn, %{})

    assert redirected_to(conn, 302) =~ "/"
  end

  test "puts flash on failed login", %{conn: conn} do
    refute get_flash(conn, :error)

    conn = EnsureLoggedIn.call(conn, %{})

    assert get_flash(conn, :error)
  end
end
