defmodule Tradenara.CategoryController do
  use Tradenara.Web, :controller
  alias Tradenara.Category
  alias Tradenara.Company
  alias Tradenara.Article

  def index(conn, params) do
    categories = Repo.all(Category)
    companies = Repo.all(Company)
    articles = Repo.all(Article)
    render(conn, "index.html", categories: categories, companies: companies, articles: articles)
  end

  # # def index(conn, {"search_term" => search_term}) do
  # def index(conn, params) do
  #   render(conn, "results.html")
  # end

  def show(conn, %{"id" => id}) do
    category = Repo.get!(Category, id)
    render(conn, "show.html", category: category)
  end
end
