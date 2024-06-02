import Config

config :ljdc, ecto_repos: [LJDC.Repo]

import_config "#{Mix.env()}.exs"
