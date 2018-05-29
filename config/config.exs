# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :bioq,
  ecto_repos: [Bioq.Repo]

# Configures the endpoint
config :bioq, BioqWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "J27duEXOYg/qASKBqVQSfJDlPF4UHlReViwPVzYYVaYD4D8unFNqSS6WQV4r3pjM",
  render_errors: [view: BioqWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Bioq.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
