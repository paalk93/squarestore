defmodule Squarestore.Identity.Address do
  use Ecto.Schema
  import Ecto.Changeset


  schema "addresses" do
    field :address, :string
    field :city, :string
    field :country, :string
    field :zip_code, :integer

	belongs_to :user, Squarestore.Identity.User
    timestamps()
  end

  @doc false
  def changeset(address, attrs) do
    address
    |> cast(attrs, [:address, :country, :city, :zip_code, :user_id])
    |> validate_required([:address, :country, :city, :zip_code])

  end

	def changeset(user, id, params) do
		Squarestore.Repo.get!(user, id)
		|> Squarestore.Repo.preload(:addresses)
		|> Ecto.build_assoc(:addresses, params)
	end
end
