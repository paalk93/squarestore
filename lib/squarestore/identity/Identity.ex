defmodule Squarestore.Identity do

#Importing functions
	import Ecto.Query

#Setting up Aliases
	alias Squarestore.Repo
	alias Squarestore.Identity.User

#Add a new user
	def add_user(userdata \\ %{}) do
		%User{}
		|> User.changeset(userdata)
		|> Repo.insert()
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
