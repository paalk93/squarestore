defmodule Squarestore.Identity do

#Importing functions
	# import Ecto.Query

#Setting up Aliases
	alias Squarestore.Repo
	alias Squarestore.Identity
	alias Squarestore.Identity.User
	alias Squarestore.Identity.Address

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

	def remove_user(user) do
		Repo.get!(User, user)
		|>Repo.delete()
	end


end
