defmodule Slack.Client.Behaviour do
  @callback post_message(map()) :: :ok | {:error, any()}
end
