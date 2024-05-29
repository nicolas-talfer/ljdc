import Config

config :ljdc, :url, "https://lesjoiesducode.fr/random"

import_config "#{Mix.env()}.exs"
