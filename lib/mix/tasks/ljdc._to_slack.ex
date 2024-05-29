defmodule Mix.Tasks.LjdcToSlack do
  @moduledoc "Posts a random gif from LJDC in a Slack channel"
  @shortdoc "Posts a random gif from LJDC in a Slack channel"

  use Mix.Task

  @impl Mix.Task
  def run(_) do
    Application.ensure_all_started(:ljdc)

    Mix.Shell.IO.info("Fetching random gif from LJDC...")
    {:ok, post} = LJDC.random()

    Mix.Shell.IO.info("Posting gif '#{post.title}' in Slack...")
    :ok = Slack.post_message(post)

    Mix.Shell.IO.info("Enjoy !")
  end
end
