use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :tradenara, Tradenara.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :tradenara, Tradenara.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "tradenara_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# Ease up the number of hashing rounds
config :comeonin, :bcrypt_log_rounds, 4
config :comeonin, :pbkdf2_rounds, 1
