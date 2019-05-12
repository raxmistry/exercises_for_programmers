# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :chapter4,
  ecto_repos: [Chapter4.Repo]

# Configures the endpoint
config :chapter4, Chapter4Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "B8MTiXA3pUH3C9iTiYDIlTVupY6P2MvT5gxYcPggYRPULiftOti0i37kTXQc/EdE",
  render_errors: [view: Chapter4Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Chapter4.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
