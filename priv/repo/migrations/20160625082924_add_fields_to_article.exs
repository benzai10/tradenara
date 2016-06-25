defmodule Tradenara.Repo.Migrations.AddFieldsToArticle do
  use Ecto.Migration

  def change do
    add :front_image, :string
    add :front_title, :string
    add :front_content, :string
  end
end
