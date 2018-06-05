defmodule Squarestore.Repo.Migrations.CreateInvoices do
  use Ecto.Migration

  def change do
    create table(:invoices) do
      add :total_sum, :decimal
      add :shipping_address, :integer
      add :invoice_address, :integer
      add :product_id, :map
      add :user_id, references(:"users:integer", on_delete: :nothing)

      timestamps()
    end

    create index(:invoices, [:user_id])
  end
end
