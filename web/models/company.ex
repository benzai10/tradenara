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

    timestamps
  end

  @required_fields ~w(name description)
  @optional_fields ~w()

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
