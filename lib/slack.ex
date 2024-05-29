defmodule Slack do
  def post_message(%LJDC.Post{title: title, info: info, gif: gif}) do
    Slack.Client.post_message(%{
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
