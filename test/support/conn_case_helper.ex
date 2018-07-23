defmodule HolidayAppWeb.ConnCaseHelper do
  import Phoenix.ConnTest

  @endpoint HolidayAppWeb.Endpoint

  def build_conn_with_session() do
    build_conn()
    |> bypass_through(HolidayAppWeb.Router, [:browser])
    |> get("/")
  end
end
