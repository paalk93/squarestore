defmodule SquarestoreWeb.ProductsController do
  use SquarestoreWeb, :controller

  alias Squarestore.Repo
  alias Squarestore.Product
  alias Squarestore.Product.Products

  def index(conn, _params) do
    products = Product.list_products()
    render(conn, "index.html", products: products)
  end

  def show(conn, %{"id" => id}) do
  product = Product.get_product!(id)
  render(conn, "index.html", product: product)
  end

end
