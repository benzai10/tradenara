defmodule Tradenara.Article do
  use Tradenara.Web, :model

  schema "articles" do
    field :title, :string
    field :content, :string
    field :image, :string
    belongs_to :category, Tradenara.Category
    belongs_to :author, Tradenara.Author
    belongs_to :company, Tradenara.Company

    timestamps
  end

  @required_fields ~w(title content)
  @optional_fields ~w(image)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
