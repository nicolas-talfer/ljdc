defmodule Slack.Client do
  use Tesla
  require Logger

  @behaviour Slack.Client.Behaviour

  plug(Tesla.Middleware.BaseUrl, Application.get_env(:ljdc, :slack_webhook))
  plug(Tesla.Middleware.FollowRedirects)
  plug(Tesla.Middleware.JSON)

  @impl Slack.Client.Behaviour
  def post_message(message) do
    case post("/", message) do
      {:ok, %Tesla.Env{status: 200}} ->
        Logger.debug("Successfully posted message on Slack")
        :ok

      other ->
        Logger.error("failed to post message on Slack - #{inspect(other)}")
        {:error, "failed to post message on Slack"}
    end
  end
end
