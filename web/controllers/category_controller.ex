defmodule Tradenara.CategoryController do
  use Tradenara.Web, :controller
  alias Tradenara.Category
  alias Tradenara.Company
  alias Tradenara.Article

  def index(conn, _params) do
    categories = Repo.all(Category)
    companies = Repo.all(Company)
    articles = Repo.all(Article)
    render(conn, "index.html", categories: categories, companies: companies, articles: articles)
  end

  def show(conn, %{"id" => id}) do
    category = Repo.get!(Category, id)
    render(conn, "show.html", category: category)
  end
end