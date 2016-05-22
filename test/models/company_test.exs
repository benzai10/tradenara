defmodule Tradenara.CompanyTest do
  use Tradenara.ModelCase

  alias Tradenara.Company

  @valid_attrs %{city: "some content", description: "some content", name: "some content", street: "some content", url: "some content", zipcode: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Company.changeset(%Company{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Company.changeset(%Company{}, @invalid_attrs)
    refute changeset.valid?
  end
end
