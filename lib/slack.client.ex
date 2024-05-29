defmodule Slack.Client do
  use Tesla
  require Logger

  plug(
    Tesla.Middleware.BaseUrl,
    Application.get_env(:ljdc, :slack_webhook)
  )

  plug(Tesla.Middleware.FollowRedirects)
  plug(Tesla.Middleware.JSON)

  @spec post_message(map()) :: :ok | {:error, any()}
  def post_message(message) do
    case post("/", message) do
      {:ok, %Tesla.Env{status: 200}} ->
        :ok

      other ->
        Logger.error("failed to post message on Slack - #{inspect(other)}")
        {:error, "failed to post message on Slack"}
    end
  end
end
