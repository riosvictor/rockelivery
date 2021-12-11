defmodule Rockelivery.Repo.Migrations.CreateUsersTable do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :address, :string
      add :age, :integer
      add :cep, :string
      add :cpf, :string
      add :email, :string
      add :name, :string
      add :password_hash, :string

      timestamps()
    end

    create index(:users, [:cpf], unique: true)
    create index(:users, [:email], unique: true)
  end
end
