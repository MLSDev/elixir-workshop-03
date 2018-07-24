defmodule HolidayAppWeb.Router do
  use HolidayAppWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug HolidayAppWeb.Plugs.FetchCurrentUser
  end

  scope "/", HolidayAppWeb do
    pipe_through :browser

    get "/", HomeController, :index

    resources "/session", SessionController, only: [:new, :create]
  end

  scope "/", HolidayAppWeb do
    pipe_through [:browser, HolidayAppWeb.Plugs.EnsureLoggedIn]

    resources "/session", SessionController, only: [:delete], singleton: true
    resources "/holidays", HolidayController
  end
end
