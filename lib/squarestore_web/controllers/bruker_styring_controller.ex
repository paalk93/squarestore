defmodule SquarestoreWeb.BrukerStyringController do
  use SquarestoreWeb, :controller
  import Ecto.Query, warn: false

  alias Squarestore.Repo
  alias Squarestore.Identity
  alias Squarestore.Identity.User
  alias Squarestore.Identity.Adress

  def index(conn, _params) do
    users = Identity.list_users()
    adresses = Identity.list_adresses()
    render(conn, "index.html", users: users, adresses: adresses)
  end

  def show(conn, %{"id" => id}) do
    user = Identity.get_user!(id)
    adress = Identity.get_adress!(id)
    render(conn, "show.html", user: user, adress: adress)
  end

  def new(conn, _params) do
    changeset = User.changeset(%User{adress: [%Adress{}]})
    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"user" => user_params}) do
    changeset = User.changeset(%User{}, user_params)
    case Repo.insert(changeset) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "User created successfully.")
        |> redirect(to: bruker_styring_path(conn, :index))
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Identity.get_user!(id)
    {:ok, _user} = Identity.delete_user(user)
    conn
    |> put_flash(:info, "User deleted successfully.")
    |> redirect(to: bruker_styring_path(conn, :index))
  end

  def edit(conn, %{"id" => id}) do
    user = Identity.get_user!(id)
    changeset = Identity.change_user(user)
    render(conn, "edit.html", user: user, changeset: changeset)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Identity.get_user!(id)
    case Identity.update_user(user, user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "User updated successfully.")
        |> redirect(to: bruker_styring_path(conn, :index, products: user))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", user: user, changeset: changeset)
    end
  end


end
