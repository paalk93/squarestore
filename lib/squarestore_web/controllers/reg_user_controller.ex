defmodule SquarestoreWeb.RegUserController do
    use SquarestoreWeb, :controller
  
    def index(conn, _params) do
      render conn, "reg_user.html"
    end
  end