defmodule Squarestore.Repo.Migrations.CreateIdentityAdresses do
  use Ecto.Migration

  def change do
    create table(:identity_addresses) do
      add :address, :string
      add :country, :string
      add :city, :string
      add :zip_code, :integer
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:identity_addresses, [:user_id])
  end
end
