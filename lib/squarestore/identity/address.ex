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
    |> cast_assoc(attrs, [:address, :country, :city, :zip_code, :user_id])
    |> validate_required([:address, :country, :city, :zip_code])

  end

#   def changeset(address, attrs) do
# 	address
# 	|> cast(attrs, [:address, :country, :city, :zip_code, :user_id])
# 	|> validate_required([:address, :country, :city, :zip_code])
# 	# build_assoc(user, :addresses, [addr])
	# end
end


# |> Squarestore.Repo.preload(:addresses)
# |> cast(attrs, [:fname, :lname, :phone, :email, :password, :wishlist])
# |> validate_required([:fname, :lname, :email])
# |> put_change(:addresses, [addr])
