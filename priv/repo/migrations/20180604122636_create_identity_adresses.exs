defmodule Squarestore.Repo.Migrations.CreateIdentityAdresses do
  use Ecto.Migration

  def change do
    create table(:identity_adresses) do
      add :adress, :string
      add :country, :string
      add :city, :string
      add :zip_code, :integer
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:identity_adresses, [:user_id])
  end
end
