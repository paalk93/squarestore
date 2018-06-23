defmodule Squarestore.Identity.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :fname, :string
    field :lname, :string
    field :phone, :string
    field :email, :string
    field :password, :string
    field :wishlist, :map

    has_many :adress, Squarestore.Identity.Adress

    timestamps()
  end

  def changeset(user, attrs \\ %{}) do
    user
    |> Squarestore.Repo.preload(:adress)
    |> cast(attrs, [:fname, :lname, :phone, :email, :password, :wishlist])
    |> cast_assoc(:adress)
    |> validate_required([:fname, :lname, :phone, :email, :password])
  end

end
