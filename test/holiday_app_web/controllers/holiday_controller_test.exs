defmodule HolidayAppWeb.HolidayControllerTest do
  use HolidayAppWeb.ConnCase

  describe "index" do
    test "lists all holidays", %{conn: conn} do
      conn = get conn, holiday_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Holidays"
    end

    test "accepts date range", %{conn: conn} do
      insert(:holiday, %{date: ~D[2018-01-01], title: "New Year"})
      insert(:holiday, %{date: ~D[2018-02-14], title: "St. Valentine"})
      conn = get conn, holiday_path(conn, :index, start_date: "2018-01-01", end_date: "2018-01-31")
      response = html_response(conn, 200)
      assert response =~ "New Year"
      refute response =~ "St. Valentine"
    end
  end

  describe "new holiday" do
    test "renders form", %{conn: conn} do
      conn = get conn, holiday_path(conn, :new)
      assert html_response(conn, 200) =~ "New Holiday"
    end
  end

  describe "create holiday" do
    test "redirects to show when data is valid", %{conn: conn} do
      params = string_params_for(:holiday)
      conn = post conn, holiday_path(conn, :create), holiday: params

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == holiday_path(conn, :show, id)

      conn = get conn, holiday_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Holiday"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      params = %{"kind" => ""}
      conn = post conn, holiday_path(conn, :create), holiday: params
      assert html_response(conn, 200) =~ "New Holiday"
    end
  end

  describe "edit holiday" do
    test "renders form for editing chosen holiday", %{conn: conn} do
      holiday = insert(:holiday)
      conn = get conn, holiday_path(conn, :edit, holiday)
      assert html_response(conn, 200) =~ "Edit Holiday"
    end
  end

  describe "update holiday" do
    setup %{conn: conn} do
      holiday = insert(:holiday)
      {:ok, conn: conn, holiday: holiday}
    end

    test "redirects when data is valid", %{conn: conn, holiday: holiday} do
      params = %{"kind" => "workday"}
      conn = put conn, holiday_path(conn, :update, holiday), holiday: params
      assert redirected_to(conn) == holiday_path(conn, :show, holiday)

      conn = get conn, holiday_path(conn, :show, holiday)
      assert html_response(conn, 200) =~ "workday"
    end

    test "renders errors when data is invalid", %{conn: conn, holiday: holiday} do
      params = %{"kind" => ""}
      conn = put conn, holiday_path(conn, :update, holiday), holiday: params
      assert html_response(conn, 200) =~ "Edit Holiday"
    end
  end

  describe "delete holiday" do
    test "deletes chosen holiday", %{conn: conn} do
      holiday = insert(:holiday)
      conn = delete conn, holiday_path(conn, :delete, holiday)
      assert redirected_to(conn) == holiday_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, holiday_path(conn, :show, holiday)
      end
    end
  end
end
