# HolidayApp

Internal MLSDev Elixir Workshop #03 - Authentication

## Up and running

* Clone project
* `mix deps.get`
* Setup `config/*.exs` files (pay attention to secret config examples)
* `mix ecto.setup` # create, migrate and seed database
* `mix test`
* `iex -S mix phx.server`
* Open [http://localhost:4000](http://localhost:4000) in your browser

## Docs

* `mix docs`
* `open doc/index.html`

## Coverage

* `mix test --cover`

HTML output:
* `mix coveralls.html`
* `open cover/excoveralls.html`

## Seeds

Check `priv/repo/seeds.exs` file

## Commits and branches

* Initial commit
   - Copy of last commit of the [previous](https://github.com/MLSDev/elixir-workshop-02) Elixir Workshop
* Branch: [simple_auth](https://github.com/MLSDev/elixir-workshop-03/tree/simple_auth)
   - email/password authentication using [Comeonin](https://github.com/riverrun/comeonin)
* Branch: [jwt](https://github.com/MLSDev/elixir-workshop-03/tree/jwt)
   - JWT-based authentication using [Guardian](https://github.com/ueberauth/guardian)
