defmodule Squarestore.Userdata.User do
# adding in needed functions
	use Ecto.Schema
	import Ecto.Changeset
	require Logger
	schema "users" do
		field :fname, :string
		field :lname, :string
		field :phone, :string
		field :email, :string
		field :password, :string
		field :wishlist, :map
		timestamps()
	end
	# def changeset(user, attrs) do
	# 	Logger.debug("userdata #{inspect(user)}")
	# 	user
	# 	|> cast(attrs, [:fname, :lname, :phone, :email, :password, :wishlist])
    # 	|> validate_required([:fname, :lname, :email])
	# end

end
