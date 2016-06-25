defmodule Tradenara.Repo.Migrations.AddFieldsToCompany do
  use Ecto.Migration

  def change do
    add :front_image, :string
    add :front_description, :string
  end
end
