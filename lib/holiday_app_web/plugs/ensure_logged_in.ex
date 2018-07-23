defmodule HolidayAppWeb.Plugs.EnsureLoggedIn do
  import Plug.Conn
  import Phoenix.Controller, only: [put_flash: 3, redirect: 2]

  def init(_opts), do: nil

  def call(conn, _) do
    if conn.assigns[:current_user] do
      conn
    else
      conn
      |> put_flash(:error, "Please log in.")
      |> redirect(to: "/")
      |> halt()
    end
  end
end
