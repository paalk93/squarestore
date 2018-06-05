defmodule Squarestore.Identity.Address do
  use Ecto.Schema
  import Ecto.Changeset


  schema "identity_addresses" do
    field :address, :string
    field :city, :string
    field :country, :string
    field :zip_code, :integer
    field :user_id, :integer

    timestamps()
  end

  @doc false
  def changeset(address, attrs) do
    address
    |> cast(attrs, [:address, :country, :city, :zip_code])
    |> validate_required([:address, :country, :city, :zip_code])
  end
end
