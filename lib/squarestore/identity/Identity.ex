defmodule Squarestore.Identity do

#Importing functions
	import Ecto.Query

#Setting up Aliases
	alias Squarestore.Repo
	alias Squarestore.Identity
	alias Squarestore.Identity.User
	alias Squarestore.Identity.Address
	alias Ecto.Multi
	require Logger

#Add a new user
	def create_user(userdata) do
		Multi.new
		|> Identity.add_user(userdata)
		|> Identity.id_to_userid(userdata)
		|> Identity.add_address()
	end
	def id_to_userid(id, userdata) do
		Map.merge(userdata, %{user_id: Kernel.elem(id, 1).id})
	end

	def add_user(userdata \\ %{}) do
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
