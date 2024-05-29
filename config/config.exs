import Config

config :tesla, adapter: Tesla.Adapter.Hackney

config :ljdc, slack_webhook: System.fetch_env!("SLACK_WEBHOOK")
