defmodule Squarestore.Product do
  import Ecto.Query, warn: false
  alias Squarestore.Repo

  alias Squarestore.Product.Products

  def list_products do
    Repo.all(Products)
  end

  def get_product!(id), do: Repo.get!(Products,id)

  def create_product(attrs \\ %{}) do
    %Products{}
    |> Products.changeset(attrs)
    |> Repo.insert
  end

  def change_product(%Products{} = products) do
      Products.changeset(products, %{})
  end

  def delete_product(%Products{} = product) do
      Repo.delete(product)
  end

  def update_product(%Products{} = product, attrs) do
    product
    |> Products.changeset(attrs)
    |> Repo.update()
  end


end
