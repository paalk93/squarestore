defmodule Squarestore.Identity do

#Importing functions
	import Ecto.Query
	import Ecto.Association

#Setting up Aliases
	alias Squarestore.Repo
	alias Squarestore.Identity
	alias Squarestore.Identity.User
	alias Squarestore.Identity.Address
	alias Ecto.Multi
	require Logger

#Add a new user
	def create_user(userdata) do

		# Logger.debug("user_address = #{inspect(user_address)}")
		userdata = Map.put(userdata, :user_id, nil)
		address = %Address{}
		|> Address.changeset(userdata)





		user = %User{fname: userdata.fname, lname: userdata.lname, phone: userdata.fname, email: userdata.email, password: userdata.password, wishlist: userdata.wishlist, addresses: [address]}


		# %User{}
		# |> User.changeset(user)
		Repo.insert!(user)
	end

	def add_user(userdata) do
		%User{}
		|> User.changeset(userdata)
		|> Repo.insert()
	end

	def add_address(addressdata \\ %{}) do
		%Address{}
		|>Address.changeset(addressdata)
		|>Repo.insert()
	end


#Get all the CreateUsers
	def list_users do
		Repo.all(User)
	end
#Get a single user
	 def get_user!(id) do
		 Repo.get!(User, id)
	end

	def get_address!(id) do
		user_id = Kernel.elem(Integer.parse(id), 0)
		query = from u in "identity_addresses", where: u.user_id == ^user_id, select: [:address, :country, :city, :zip_code]
		Repo.all(query)
	end

	def remove_user(user) do
		Repo.get!(User, user)
		|>Repo.delete()
	end


end
