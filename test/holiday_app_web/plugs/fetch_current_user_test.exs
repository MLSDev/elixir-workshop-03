defmodule HolidayAppWeb.Plugs.FetchCurrentUserTest do
  use HolidayAppWeb.ConnCase

  alias HolidayAppWeb.Plugs.FetchCurrentUser

  setup do
    conn = build_conn_with_session()
    user = insert(:user)
    {:ok, conn: conn, user: user}
  end

  test "already assigned current_user makes the plug pass", %{conn: conn, user: user} do
    conn =
      conn
      |> assign(:current_user, user)
      |> FetchCurrentUser.call(%{})

    assert conn.assigns[:current_user]
    assert user.id == conn.assigns[:current_user].id
  end

  test "user assigned to conn struct passes immediately after log in", %{conn: conn, user: user} do
    conn =
      conn
      |> put_session(:user_id, user.id)
      |> FetchCurrentUser.call(%{})

    assert conn.assigns[:current_user]
    assert user.id == conn.assigns[:current_user].id
  end

  test "not logged in user shall not pass", %{conn: conn} do
    conn =
      conn
      |> assign(:current_user, nil)
      |> put_session(:user_id, nil)
      |> FetchCurrentUser.call(%{})

    refute conn.assigns[:current_user]
  end
end
