defmodule Tradenara.CompanyViewTest do
  use Tradenara.ConnCase, async: true
  import Phoenix.View

  test "renders index.html", %{conn: conn} do
    companies = [%Tradenara.Company{id: "1", name: "Company One"},
                 %Tradenara.Company{id: "2", name: "Company Two"}]
    content = render_to_string(Tradenara.CompanyView, "index.html", conn: conn, companies: companies)

    assert String.contains?(content, "Listing companies")
    for company <- companies do
      assert String.contains?(content, company.name)
    end
  end

  test "renders new.html", %{conn: conn} do
    changeset = Tradenara.Company.changeset(%Tradenara.Company{})
    categories = [{"cats", 123}]

    content = render_to_string(Tradenara.CompanyView, "new.html", conn: conn, changeset: changeset, categories: categories)
    assert String.contains?(content, "New company")
  end
end
