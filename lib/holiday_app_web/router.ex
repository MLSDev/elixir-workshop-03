defmodule HolidayAppWeb.Router do
  use HolidayAppWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", HolidayAppWeb do
    pipe_through :browser

    get "/", HolidayController, :index
    resources "/holidays", HolidayController
  end
end
