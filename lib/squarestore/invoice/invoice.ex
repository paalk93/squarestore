defmodule Squarestore.Invoice.Invoices do
  use Ecto.Schema
  import Ecto.Changeset


  schema "invoices" do
    field :invoice_address, :integer
    field :product_id, :map
    field :shipping_address, :integer
    field :total_sum, :decimal
    field :user_id, :integer

    timestamps()
  end

  @doc false
  def changeset(invoice, attrs) do
    invoice
    |> cast(attrs, [:total_sum, :shipping_address, :invoice_address, :product_id])
    |> validate_required([:total_sum, :shipping_address, :invoice_address, :product_id])
  end
end
