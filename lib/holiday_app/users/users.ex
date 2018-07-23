defmodule HolidayApp.Users do
  @moduledoc """
  The Users context.
  """
  import Ecto.Query, warn: false

  alias HolidayApp.Repo
  alias HolidayApp.Users.User

  @doc """
  Lists all users
  """
  def list_users, do: Repo.all(User)

  @doc """
  Finds user by `id`.
  """
  def get_user!(id), do: Repo.get!(User, id)
end
