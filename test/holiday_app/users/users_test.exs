defmodule HolidayApp.UsersTest do
  use HolidayApp.DataCase

  alias HolidayApp.Users
  alias HolidayApp.Users.User

  describe "list_users/0" do
    test "returns all users" do
      insert_pair(:user)

      assert [%User{}, %User{}] = Users.list_users()
    end
  end

  describe "get_user!/1" do
    test "finds user by id" do
      %User{id: id} = insert(:user)

      assert %User{id: ^id} = Users.get_user!(id)
    end
  end
end
