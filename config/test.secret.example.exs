use Mix.Config

# Configure your database
config :holiday_app, HolidayApp.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "your-username",
  password: "your-password",
  database: "holiday_app_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
