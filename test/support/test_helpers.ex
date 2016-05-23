defmodule Tradenara.TestHelpers do
  alias Tradenara.Repo

  def insert_user(attrs \\ %{}) do
    changes = Dict.merge(%{
          name: "Some User",
          username: "user#{Base.encode16(:crypto.rand_bytes(8))}",
          password: "supersecret",
                         }, attrs)

    %Tradenara.User{}
    |> Tradenara.User.registration_changeset(changes)
    |> Repo.insert!()
  end

  def insert_company(user, attrs \\ %{}) do
    user
    |> Ecto.build_assoc(:companies, attrs)
    |> Repo.insert!()
  end
end
