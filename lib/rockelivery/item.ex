defmodule Rockelivery.Item do
  use Ecto.Schema

  import Ecto.Changeset

  alias Ecto.Enum
  alias Rockelivery.Order

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_fields [:description, :category, :price, :photo]
  @items_categories [:food, :drink, :desert]

  @derive {Jason.Encoder, only: [:id] ++ @required_fields}

  schema "items" do
    field :description, :string
    field :category, Enum, values: @items_categories
    field :photo, :string
    field :price, :decimal

    many_to_many :orders, Order, join_through: "orders_items"

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_fields)
    |> validate_required(@required_fields)
    |> validate_length(:description, min: 6)
    |> validate_number(:price, greater_than: 0)
  end
end
