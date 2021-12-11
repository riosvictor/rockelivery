defmodule Rockelivery.UserTest do
  use Rockelivery.DataCase, async: true

  import Rockelivery.Factory

  alias Ecto.Changeset
  alias Rockelivery.User

  describe "changeset/2" do
    test "when all params are valid, returns a valid changeset" do
      response =
        :user_params
        |> build()
        |> User.changeset()

      assert %Changeset{changes: %{name: "Sandro Souza"}, valid?: true} = response
    end

    test "when updating a changeset, returns a valid changeset with the given changes" do
      params = build(:user_params)

      update_params = %{
        name: "John Murdock",
        password: "123456"
      }

      response =
        params
        |> User.changeset()
        |> User.changeset(update_params)

      assert %Changeset{changes: %{name: "John Murdock"}, valid?: true} = response
    end

    test "when there are some error, returns an invalid changeset" do
      wrong_params = build(:user_params, %{"age" => 15, "password" => "123"})

      response = User.changeset(wrong_params)

      expected_response = %{
        age: ["must be greater than or equal to 18"],
        password: ["should be at least 6 character(s)"]
      }

      assert errors_on(response) == expected_response
    end
  end
end
