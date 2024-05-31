defmodule Slack do
  @spec post_message(LJDC.Post.t(), atom()) :: :ok | {:error, any()}
  def post_message(%LJDC.Post{title: title, info: info, gif: gif}, slack_client \\ Slack.Client) do
    slack_client.post_message(%{
      "blocks" => [
        %{
          "type" => "header",
          "text" => %{
            "type" => "plain_text",
            "text" => title,
            "emoji" => true
          }
        },
        %{
          "type" => "image",
          "title" => %{
            "type" => "plain_text",
            "text" => info,
            "emoji" => true
          },
          "image_url" => gif,
          "alt_text" => title
        }
      ]
    })
  end
end
