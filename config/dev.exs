import Config

config :tesla, adapter: Tesla.Adapter.Hackney

config :ljdc, LJDC.Repo,
  database: "ljdc_dev",
  username: "root",
  password: "",
  hostname: "localhost"

import_config "slack.exs"
