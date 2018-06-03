defmodule SquarestoreWeb.BrukerStyringController do
  use SquarestoreWeb, :controller
  alias Squarestore.Userdata
  alias Squarestore.Userdata.User

	def index(conn, %{"id" => id}) do
		users = Userdata.list_users()
		user = Userdata.get_user!(id)
	    render conn, "index.html", users: users, user: user
	end
	def show(conn, %{"id" => id}) do
		users = Userdata.list_users()
		user = Userdata.get_user!(id)
	    render conn, "currentuser.html", users: users, user: user
	end
end
