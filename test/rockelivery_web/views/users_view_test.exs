defmodule RockeliveryWeb.UsersViewTest do
  use RockeliveryWeb.ConnCase, async: true

  import Phoenix.View
  import Rockelivery.Factory

  alias RockeliveryWeb.UsersView

  test "renders create.json" do
    user = build(:user)

    response = render(UsersView, "create.json", user: user)

    assert %{
             message: "User created!",
             user: %Rockelivery.User{
               address: "Rua de cima, 89",
               age: 27,
               cep: "12345678",
               cpf: "12345678901",
               email: "sandro@banana.com",
               id: "eed5f246-1475-4b31-9822-e123d165f518",
               inserted_at: nil,
               name: "Sandro Souza",
               password: "123456",
               password_hash: nil,
               updated_at: nil
             }
           } = response
  end
end
