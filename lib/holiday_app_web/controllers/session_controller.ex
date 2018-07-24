defmodule HolidayAppWeb.SessionController do
  use HolidayAppWeb, :controller

  alias HolidayApp.Users

  def new(conn, _params) do
    render(conn, :new)
  end

  def create(conn, %{"email" => email, "password" => password}) do
    case Users.find_by_email_and_password(email, password) do
      {:ok, user} ->
        conn
        |> login(user)
        |> put_flash(:info, "You have logged in!")
        |> redirect(to: "/")
      {:error, _reason} ->
        conn
        |> put_flash(:error, "Invalid email/password combination")
        |> render(:new)
    end
  end

  def delete(conn, _params) do
    conn
    |> logout()
    |> put_flash(:info, "You have logged out.")
    |> redirect(to: "/")
  end

  defp login(conn, user) do
    conn
    |> put_session(:user_id, user.id)
    |> assign(:current_user, user)
  end

  defp logout(conn) do
    conn
    |> put_session(:user_id, nil)
    |> assign(:current_user, nil)
  end
end
