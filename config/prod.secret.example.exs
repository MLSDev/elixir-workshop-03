use Mix.Config

# In this file, we keep production configuration that
# you'll likely want to automate and keep away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or yourself later on).

# use mix phx.gen.secret
config :holiday_app, HolidayAppWeb.Endpoint,
  secret_key_base: "your-secret-key-base"

# Configure your database
config :holiday_app, HolidayApp.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "your-username",
  password: "your-password",
  database: "holiday_app_prod",
  pool_size: 15

# Configure Guadrian implementation module
# Use mix guardian.gen.secret
config :holiday_app, HolidayAppWeb.Guardian,
  issuer: "holiday_app",
  secret_key: "your-guardian-secret" # put the result of the mix command above here
