defmodule Tradenara.Repo.Migrations.CreateCompany do
  use Ecto.Migration

  def change do
    create table(:companies) do
      add :url, :string
      add :name, :string
      add :description, :text
      add :street, :string
      add :zipcode, :string
      add :city, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps
    end
    create index(:companies, [:user_id])

  end
end
