defmodule Tradenara.Repo.Migrations.CreateArticle do
  use Ecto.Migration

  def change do
    create table(:articles) do
      add :title, :string
      add :content, :text
      add :image, :string
      add :category_id, references(:categories, on_delete: :nothing)
      add :author_id, references(:users, on_delete: :nothing)
      add :company_id, references(:companies, on_delete: :nothing)

      timestamps
    end
    create index(:articles, [:category_id])
    create index(:articles, [:author_id])
    create index(:articles, [:company_id])

  end
end
