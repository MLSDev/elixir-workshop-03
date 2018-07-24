defmodule HolidayAppWeb.SessionController do
  use HolidayAppWeb, :controller

  alias HolidayApp.Users
  alias HolidayAppWeb.Helpers.AuthHelper

  def new(conn, _params) do
    render(conn, :new)
  end

  def create(conn, %{"email" => email, "password" => password}) do
    case Users.find_by_email_and_password(email, password) do
      {:ok, user} ->
        conn
        |> AuthHelper.login(user)
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
    |> AuthHelper.logout()
    |> put_flash(:info, "You have logged out.")
    |> redirect(to: "/")
  end
end
