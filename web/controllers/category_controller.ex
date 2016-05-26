defmodule Tradenara.CategoryController do
  use Tradenara.Web, :controller
  alias Tradenara.Category

  def index(conn, _params) do
    categories = Repo.all(Category)
    render(conn, "index.html", categories: categories)
  end

  def show(conn, %{"id" => id}) do
    category = Repo.get!(Category, id)
    render(conn, "show.html", category: category)
  end
end
