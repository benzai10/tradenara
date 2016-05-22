# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Tradenara.Repo.insert!(%Tradenara.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Tradenara.Repo
alias Tradenara.Category

for category <- ~w(Export Import Machines Steel Paper Cars) do
    Repo.get_by(Category, name: category) ||
      Repo.insert!(%Category{name: category})
end
