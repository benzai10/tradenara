defmodule Tradenara.UserView do
  use Tradenara.Web, :view

  alias Tradenara.User

  def first_name(%User{name: name}) do
    name
    |> String.split(" ")
    |> Enum.at(0)
  end
end
