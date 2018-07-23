use Mix.Config

# use mix phx.gen.secret
config :holiday_app, HolidayAppWeb.Endpoint,
  secret_key_base: "your-secret-key-base"

# Configure your database
config :holiday_app, HolidayApp.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "your-username",
  password: "your-password",
  database: "holiday_app_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
