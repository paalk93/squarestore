defmodule SquarestoreWeb.BrukerStyringController do
  use SquarestoreWeb, :controller
  alias Squarestore.Identity
  alias Squarestore.Identity.User
  require Logger

	def index(conn, _params) do
		users = Identity.list_users()
	    render conn, "index.html", users: users
	end

	def show(conn, %{"id" => id}) do
		users = Identity.list_users()
		user = Identity.get_user!(id)
		# address_list = Identity.get_address_list(id)
		user_address = Identity.get_address!(id)
	    render conn, "currentuser.html", users: users, user: user, user_address: user_address
	end
end
