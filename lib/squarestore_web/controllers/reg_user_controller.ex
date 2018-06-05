defmodule SquarestoreWeb.RegUserController do
    use SquarestoreWeb, :controller
	alias Squarestore.Userdata
    alias Squarestore.Userdata.User

    def index(conn, _params) do
	    render conn, "index.html"
    end
end
