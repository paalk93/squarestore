defmodule SquarestoreWeb.RegUserController do
    use SquarestoreWeb, :controller
	alias Squarestore.Userdata
    alias Squarestore.Userdata.User

    def index(conn, _params) do
		changeset = Userdata.add_user(%User{})
	    render conn, "index.html", changeset: changeset
    end
end
