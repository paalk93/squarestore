defmodule SquarestoreWeb.BrukerStyringController do
  use SquarestoreWeb, :controller
  alias Squarestore.Identity
  alias Squarestore.Identity.User

	def index(conn, %{"id" => id}) do
		users = Identity.list_users()
		user = Identity.get_user!(id)
	    render conn, "index.html", users: users, user: user
	end
	def show(conn, %{"id" => id}) do
		users = Identity.list_users()
		user = Identity.get_user!(id)
	    render conn, "currentuser.html", users: users, user: user
	end
end
