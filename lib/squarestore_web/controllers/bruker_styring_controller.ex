defmodule SquarestoreWeb.BrukerStyringController do
  use SquarestoreWeb, :controller
  alias Squarestore.Userdata
  alias Squarestore.Userdata.User

	def index(conn, _params) do
		users = Userdata.list_users()
		user = Userdata.get_user!(1)
	    render conn, "index.html", users: users, user: user
	end
	def index(conn, %{"id" => id}) do
		users = Userdata.list_users()
		user = Userdata.get_user!(id)
	    render conn, "index.html", users: users, user: user
	end
end
