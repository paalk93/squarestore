defmodule Squarestore.Identity.User do
# adding in needed functions
	use Ecto.Schema
	import Ecto.Changeset
	import Ecto.Association
	require Logger
	schema "users" do
		field :fname, :string
		field :lname, :string
		field :phone, :string
		field :email, :string
		field :password, :string
		field :wishlist, :map
		has_many :addresses, Squarestore.Identity.Address
		timestamps()
	end
	def changeset(user, attrs, addr) do
		# Logger.debug("user #{inspect(user)}")
		user
		|> Squarestore.Repo.preload(:addresses)
		|> cast(attrs, [:fname, :lname, :phone, :email, :password, :wishlist])
		|> validate_required([:fname, :lname, :email])
		|> put_change(:addresses, [addr])

	end

end


# , [:address, :country, :city, :zip_code]
