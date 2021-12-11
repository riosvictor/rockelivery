defmodule Rockelivery.Order do
  use Ecto.Schema

  import Ecto.Changeset

  alias Ecto.Enum
  alias Rockelivery.{Item, User}

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_fields [:address, :payment_method, :user_id]
  @payment_methods [:money, :debit_card, :credit_card, :pix]

  @derive {Jason.Encoder, only: [:id, :items] ++ @required_fields}

  schema "orders" do
    field :address, :string
    field :comments, :string
    field :payment_method, Enum, values: @payment_methods

    many_to_many :items, Item, join_through: "orders_items"
    belongs_to :user, User

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params, items) do
    struct
    |> cast(params, @required_fields)
    |> validate_required(@required_fields)
    |> put_assoc(:items, items)
    |> validate_length(:description, min: 6)
    |> validate_number(:price, greater_than: 0)
  end
end
