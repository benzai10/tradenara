defmodule Tradenara.Repo.Migrations.AddFieldsToCompany do
  use Ecto.Migration

  def change do
    alter table(:companies) do
      add :front_image, :string
      add :front_description, :string
    end
  end
end
