defmodule HolidayAppWeb.ConnCaseHelper do
  import Plug.Conn
  import Phoenix.ConnTest

  @endpoint HolidayAppWeb.Endpoint

  def build_conn_with_session() do
    build_conn()
    |> bypass_through(HolidayAppWeb.Router, [:browser])
    |> get("/")
  end

  def build_conn_and_login(user) do
    build_conn_with_session()
    |> put_session(:user_id, user.id)
    |> assign(:current_user, user)
    |> HolidayAppWeb.Plugs.FetchCurrentUser.call(%{})
    |> send_resp(200, "Flush session")
    |> recycle()
  end
end
