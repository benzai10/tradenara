use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :tradenara, Tradenara.Endpoint,
  secret_key_base: "K3w9aQmhSdJSccL+QwpDROcJesVqeTjcco6gD+0KFtkq0FPzjJc3XiPfI0DYRv/M"

# Configure your database
config :tradenara, Tradenara.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "tradenara_prod",
  pool_size: 20
