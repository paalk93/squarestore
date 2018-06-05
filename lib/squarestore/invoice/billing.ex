defmodule Squarestore.Invoice.Billing do
  use Ecto.Schema
  import Ecto.Changeset


  schema "invoice_billings" do
    field :card_holder, :string
    field :card_number, :string
    field :card_type, :string
    field :ccv, :integer
    field :expiry_month, :integer
    field :expiry_year, :integer
    field :invoice_address, :integer
    field :user_id, :integer

    timestamps()
  end

  @doc false
  def changeset(billing, attrs) do
    billing
    |> cast(attrs, [:card_number, :expiry_month, :expiry_year, :card_holder, :ccv, :card_type, :invoice_address])
    |> validate_required([:card_number, :expiry_month, :expiry_year, :card_holder, :ccv, :card_type, :invoice_address])
  end
end
