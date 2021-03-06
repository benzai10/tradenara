defmodule Tradenara.ArticleTest do
  use Tradenara.ModelCase

  alias Tradenara.Article

  @valid_attrs %{content: "some content", image: "some content", title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Article.changeset(%Article{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Article.changeset(%Article{}, @invalid_attrs)
    refute changeset.valid?
  end
end
