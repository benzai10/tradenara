defmodule Tradenara.Repo.Migrations.AddCategoryIdToCompany do
  use Ecto.Migration

  def change do
    alter table(:companies) do
      add :category_id, references(:categories)
    end
  end
end
