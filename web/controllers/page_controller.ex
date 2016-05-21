defmodule Tradenara.PageController do
  use Tradenara.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
