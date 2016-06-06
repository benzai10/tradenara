defmodule Tradenara.SearchController do
  use Tradenara.Web, :controller
  alias Tradenara.Company
  alias Tradenara.Article
  import Ecto.Query

  def index(conn, %{"search" => %{"query" => query}}) do
    # do the actual search using 'query'
    company_query = from c in Company, where: ilike(c.name, ^("%#{query}%"))
    companies = Repo.all(company_query)
    article_query = from a in Article, where: ilike(a.content, ^("%#{query}%"))
    articles = Repo.all(article_query)
    render(conn, "index.html", companies: companies, articles: articles, query: query)
  end
end
