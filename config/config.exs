# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :transit_tracker,
  ecto_repos: [TransitTracker.Repo]

# Configures the endpoint
config :transit_tracker, TransitTrackerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "MBRfqMJDd05rIRfPs7UFmkaSs/APEV+HJPFwkxMpyB8jCKT76/kF0yKGgmPU+ZcC",
  render_errors: [view: TransitTrackerWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: TransitTracker.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]
  
config :ueberauth, Ueberauth,
  providers: [
    google: {Ueberauth.Strategy.Google, [default_scope: "emails profile plus.me"]}
  ]

config :ueberauth, Ueberauth.Strategy.Google.OAuth,
  client_id: System.get_env("GOOGLE_CLIENT_ID"),
  client_secret: System.get_env("GOOGLE_CLIENT_SECRET")

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
