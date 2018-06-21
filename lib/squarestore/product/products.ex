defmodule Squarestore.Product.Products do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :name, :string
    field :image, :map
    field :pnr, :string
    field :summary, :string
    field :base_price, :integer
    field :storage_status, :integer
    field :supplier, :integer
    field :alternative_products, :integer

    timestamps()
  end

  def changeset(products, attrs) do
    products
    |> cast(attrs, [:name, :image, :pnr, :summary, :base_price, :storage_status, :supplier, :alternative_products])
    |> validate_required([:name, :summary, :base_price])
  end
end
