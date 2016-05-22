defmodule Tradenara.CompanyController do
  use Tradenara.Web, :controller

  alias Tradenara.Company

  plug :scrub_params, "company" when action in [:create, :update]

  def action(conn, _) do
    apply(__MODULE__, action_name(conn),
      [conn, conn.params, conn.assigns.current_user])
  end

  def index(conn, _params, user) do
    companies = Repo.all(user_companies(user))
    render(conn, "index.html", companies: companies)
  end

  def new(conn, _params, user) do
    changeset =
      user
      |> build_assoc(:companies)
      |> Company.changeset()

    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"company" => company_params}, user) do
    changeset =
      user
      |> build_assoc(:companies)
      |> Company.changeset(company_params)

    case Repo.insert(changeset) do
      {:ok, _company} ->
        conn
        |> put_flash(:info, "Company created successfully.")
        |> redirect(to: company_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}, user) do
    company = Repo.get!(user_companies(user), id)
    render(conn, "show.html", company: company)
  end

  def edit(conn, %{"id" => id}, user) do
    company = Repo.get!(user_companies(user), id)
    changeset = Company.changeset(company)
    render(conn, "edit.html", company: company, changeset: changeset)
  end

  def update(conn, %{"id" => id, "company" => company_params}, user) do
    company = Repo.get!(user_companies(user), id)
    changeset = Company.changeset(company, company_params)

    case Repo.update(changeset) do
      {:ok, company} ->
        conn
        |> put_flash(:info, "Company updated successfully.")
        |> redirect(to: company_path(conn, :show, company))
      {:error, changeset} ->
        render(conn, "edit.html", company: company, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}, user) do
    company = Repo.get!(user_companies(user), id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(company)

    conn
    |> put_flash(:info, "Company deleted successfully.")
    |> redirect(to: company_path(conn, :index))
  end

  defp user_companies(user) do
    assoc(user, :companies)
  end
end
