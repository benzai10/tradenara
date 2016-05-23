defmodule Tradenara.CompanyControllerTest do
  use Tradenara.ConnCase

  setup %{conn: conn} = config do
    if username = config[:login_as] do
      user = insert_user(username: username)
      conn = assign(conn, :current_user, user)
      {:ok, conn: conn, user: user}
    else
      :ok
    end
  end

  @tag login_as: "max"
  test "lists all user's companies on index", %{conn: conn, user: user} do
    user_company = insert_company(user, name: "Company One")
    other_company = insert_company(insert_user(username: "other"), name: "Another Company")

    conn = get conn, company_path(conn, :index)
    assert html_response(conn, 200) =~ ~r/Listing companies/
    assert String.contains?(conn.resp_body, user_company.name)
    refute String.contains?(conn.resp_body, other_company.name)
  end

  alias Tradenara.Company
  @valid_attrs %{name: "Company One", description: "This is the company description"}
  @invalid_attrs %{name: "invalid company"}

  defp company_count(query), do: Repo.one(from c in query, select: count(c.id))

  @tag login_as: "max"
  test "creates user video and redirects", %{conn: conn, user: user} do
    conn = post conn, company_path(conn, :create), company: @valid_attrs
    assert redirected_to(conn) == company_path(conn, :index)
    assert Repo.get_by!(Company, @valid_attrs).user_id == user.id
  end

  @tag login_as: "max"
  test "does not create company and renders errors when invalid", %{conn: conn} do
    count_before = company_count(Company)
    conn = post conn, company_path(conn, :create), company: @invalid_attrs
    assert html_response(conn, 200) =~ "check the errors"
    assert company_count(Company) == count_before
  end

  @tag login_as: "max"
  test "authorizes actions against access by other users", %{user: owner, conn: conn} do
    company = insert_company(owner, @valid_attrs)
    non_owner = insert_user(username: "sneaky")
    conn = assign(conn, :current_user, non_owner)

    assert_error_sent :not_found, fn ->
      get(conn, company_path(conn, :show, company))
    end
    assert_error_sent :not_found, fn ->
      get(conn, company_path(conn, :edit, company))
    end
    assert_error_sent :not_found, fn ->
      put(conn, company_path(conn, :update, company, company: @valid_attrs))
    end
    assert_error_sent :not_found, fn ->
      delete(conn, company_path(conn, :delete, company))
    end
  end

  test "requires user authentication on all actions", %{conn: conn} do
    Enum.each([
      get(conn, company_path(conn, :new)),
      get(conn, company_path(conn, :index)),
      get(conn, company_path(conn, :show, "123")),
      get(conn, company_path(conn, :edit, "123")),
      put(conn, company_path(conn, :update, "123", %{})),
      post(conn, company_path(conn, :create, %{})),
      delete(conn, company_path(conn, :delete, "123")),
    ], fn conn ->
      assert html_response(conn, 302)
      assert conn.halted
    end)
  end

end
