defmodule SquarestoreWeb.BrukerStyringController do
  use SquarestoreWeb, :controller
  alias Squarestore.Identity
  # alias Squarestore.Identity.User
  require Logger

	def index(conn, %{"id" => id}) do
		users = Identity.list_users()
		user = Identity.get_user!(id)
		user_address = Identity.get_address!(id)
	    render conn, "index.html", users: users, user: user, user_address: user_address
	end

	def show(conn, %{"id" => id}) do
		users = Identity.list_users()
		user = Identity.get_user!(id)
		user_address = Identity.get_address!(id)
	    render conn, "currentuser.html", users: users, user: user, user_address: user_address
	end
end
