defmodule Tradenara.Company do
  use Tradenara.Web, :model

  schema "companies" do
    field :url, :string
    field :name, :string
    field :description, :string
    field :street, :string
    field :zipcode, :string
    field :city, :string
    belongs_to :user, Tradenara.User
    belongs_to :category, Tradenara.Category

    timestamps
  end

  @required_fields ~w(name description)
  @optional_fields ~w(category_id url)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> assoc_constraint(:category)
  end
end
