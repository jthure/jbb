# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :jbb,
  namespace: JBB,
  ecto_repos: [JBB.Repo]

# Configures the endpoint
config :jbb, JBBWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "96N2Xnu+epuee8JqDqaGgRaGXyjZcWPNTJltmm2zbXPxXE0lELDo8AvuFOcYzahb",
  render_errors: [view: JBBWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: JBB.PubSub,
  live_view: [signing_salt: "lNSIIDeV"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
