defmodule Squarestore.Identity.Adress do
  use Ecto.Schema
  import Ecto.Changeset


  schema "identity_adresses" do
    field :adress, :string
    field :city, :string
    field :country, :string
    field :zip_code, :integer
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(adress, attrs) do
    adress
    |> cast(attrs, [:adress, :country, :city, :zip_code])
    |> validate_required([:adress, :country, :city, :zip_code])
  end
end
