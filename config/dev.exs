use Mix.Config

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with brunch.io to recompile .js and .css sources.
config :queue_underflow, QueueUnderflow.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: [node: ["node_modules/brunch/bin/brunch", "watch", "--stdin",
                    cd: Path.expand("../", __DIR__)]]


# Watch static and templates for browser reloading.
config :queue_underflow, QueueUnderflow.Endpoint,
  live_reload: [
    patterns: [
      ~r{priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$},
      ~r{priv/gettext/.*(po)$},
      ~r{web/views/.*(ex)$},
      ~r{web/templates/.*(eex)$}
    ]
  ]

config :queue_underflow, QueueUnderflow.Endpoint,
  # leave other settings and change the `watchers` option.
  watchers: [ node: [ "node_modules/webpack/bin/webpack.js",
		      "--watch", "--progress", "--color",
		      cd: Path.expand("../", __DIR__) ] ]

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development. Avoid configuring such
# in production as building large stacktraces may be expensive.
config :phoenix, :stacktrace_depth, 20

# Configure your database
config :queue_underflow, QueueUnderflow.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: System.get_env("QUEUEUNDERFLOW_USERNAME"),
  password: System.get_env("QUEUEUNDERFLOW_PASSWORD"),
  database: "queue_underflow_dev",
  hostname: "localhost",
  pool_size: 10
