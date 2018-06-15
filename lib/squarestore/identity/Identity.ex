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

		%User{}
		|> User.changeset(userdata, address)
		|> Repo.insert()
	end

	def add_address(addressdata \\ %{}, id) do
		Address.changeset(User, id, addressdata)
		|> Repo.insert()
	end
#Get all the CreateUsers
	def list_users do
		Repo.all(User)
	end
#Get a single user
	 def get_user!(id) do
		 Repo.get!(User, id) |> Repo.preload(:addresses)
	end

	def get_address!(id) do
		user_id = Kernel.elem(Integer.parse(id), 0)
		query = from u in "addresses", where: u.user_id == ^user_id, select: [:address, :country, :city, :zip_code]
		Repo.all(query)
	end
	def finduser(name) do
		query = from u in "users", where: u.fname == ^name, select: [:id]
		Repo.all(query)
	end
	def finduser(term) do
		IO.puts("Error: You really shouldn't have done that")
	end
	def finduser(term , key) do
		if key == :lname do
			query = from u in "users", where: u.lname == ^term, select: [:id]
			Repo.all(query)
		end
		if key == :fname do
			query = from u in "users", where: u.fname == ^term, select: [:id]
			Repo.all(query)
		end
	end

	def remove_user(user) do
		Repo.get!(User, user)
		|>Repo.delete()
	end


end
