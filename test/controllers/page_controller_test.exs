defmodule Tradenara.PageControllerTest do
  use Tradenara.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Welcome to TradeNara!"
  end
end
