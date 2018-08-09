use Mix.Config

# Configure your database
config :holiday_app, HolidayApp.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "your-username",
  password: "your-password",
  database: "holiday_app_dev",
  hostname: "localhost",
  pool_size: 10


config :holiday_app, token_salt: "some very long string to salt a token for dev env"