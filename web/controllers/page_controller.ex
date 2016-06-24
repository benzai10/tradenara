defmodule Tradenara.PageController do
  use Tradenara.Web, :controller
  alias Tradenara.Category
  alias Tradenara.Company
  alias Tradenara.Article

  def index(conn, _params) do
    categories = Repo.all(Category)
    companies = Repo.all(Company)
    articles = Repo.all(Article)
    render conn, "index.html", categories: categories, companies: companies, articles: articles
  end
end
