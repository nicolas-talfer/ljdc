defmodule Slack.Client do
  use Tesla

  plug(
    Tesla.Middleware.BaseUrl,
    Application.get_env(:ljdc, :slack_webhook)
  )

  plug(Tesla.Middleware.FollowRedirects)
  plug(Tesla.Middleware.JSON)

  def post_message(message) do
    case post("/", message) do
      {:ok, %Tesla.Env{status: 200}} ->
        :ok

      other ->
        IO.inspect(other)
        {:error, "failed to post message on Slack"}
    end
  end
end
