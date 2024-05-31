defmodule Slack.Test do
  use ExUnit.Case
  import Hammox

  setup_all do
    post = %LJDC.Post{title: "some title", info: "some info", gif: "some gif"}
    {:ok, %{post: post}}
  end

  test "nominal case", %{post: post} do
    Mox.defmock(Slack.Client.Mock, for: Slack.Client.Behaviour)
    expect(Slack.Client.Mock, :post_message, fn message ->
      assert is_map(message)
      :ok
    end)

    assert :ok == Slack.post_message(post, Slack.Client.Mock)
  end

  test "HTTP error", %{post: post} do

    error = {:error, "some error"}

    Mox.defmock(Slack.Client.Mock, for: Slack.Client.Behaviour)
    expect(Slack.Client.Mock, :post_message, fn _ ->
      error
    end)

    assert error == Slack.post_message(post, Slack.Client.Mock)
end

end
