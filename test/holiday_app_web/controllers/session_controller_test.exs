defmodule HolidayAppWeb.SessionControllerTest do
  use HolidayAppWeb.ConnCase

  alias HolidayApp.Users.User

  setup do
    conn = build_conn_with_session()

    user =
      build(:user)
      |> encrypt_password("dummyPassword")
      |> insert()

    {:ok, conn: conn, user: user}
  end

  describe "new" do
    test "renders form", %{conn: conn} do
      conn = get conn, session_path(conn, :new)
      assert html_response(conn, 200) =~ "Login"
    end
  end

  describe "create" do
    test "logs user in", %{conn: conn, user: user} do
      conn = post conn, session_path(conn, :create, email: user.email, password: "dummyPassword")
      assert redirected_to(conn) == "/"
      assert get_flash(conn, :info) =~  "You have logged in"
    end

    test "denies on wrong password", %{conn: conn, user: user} do
      conn = post conn, session_path(conn, :create, email: user.email, password: "wrong")
      assert html_response(conn, 200)
      assert get_flash(conn, :error) =~  "Invalid email/password combination"
    end
  end

  describe "delete" do
    test "logs user out", %{conn: conn, user: user} do
      conn = post conn, session_path(conn, :create, email: user.email, password: "dummyPassword")
      conn = delete conn, session_path(conn, :delete)
      assert redirected_to(conn) == "/"
      assert get_flash(conn, :info) =~ "You have logged out"
    end
  end

  defp encrypt_password(user, password) do
    user
    |> User.create_changeset(%{password: password, password_confirmation: password})
    |> Ecto.Changeset.apply_changes()
  end
end
