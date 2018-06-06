defmodule Squarestore.Identity do

#Importing functions
	import Ecto.Query

#Setting up Aliases
	alias Squarestore.Repo
	alias Squarestore.Identity
	alias Squarestore.Identity.User
	alias Squarestore.Identity.Address
	require Logger

#Add a new user
	def create_user(userdata) do
		returnvalue = Identity.add_user(userdata)
		Map.merge(userdata, %{user_id: Kernel.elem(returnvalue, 1).id})
		|> Identity.add_address()
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




	def get_address_list(id) do
		query = from u in "identity_addresses", where: u.user_id == ^Kernel.elem(Integer.parse(id), 0), select: u.id
		Repo.all(query)
	end
	def get_address!(id) do
		adr_list = Identity.get_address_list(id)
		for a <- adr_list do
			Repo.get!(Address, a)
		end
	end


	def remove_user(user) do
		Repo.get!(User, user)
		|>Repo.delete()
	end


end
