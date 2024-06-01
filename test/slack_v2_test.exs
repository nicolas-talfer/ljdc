defmodule Slack.Test.V2 do
  use ExUnit.Case
  import Hammox

  setup_all do
    # definition du module Client de test
    Mox.defmock(Slack.Client.Mock, for: Slack.Client.Behaviour)

    post = %LJDC.Post{title: "some title", info: "some info", gif: "some gif"}
    {:ok, %{post: post}}
  end

  test "nominal case", %{post: post} do
    # implementation du behaviour (mock)
    expect(Slack.Client.Mock, :post_message, fn message ->
      assert is_map(message)
      :ok
    end)

    assert :ok == Slack.post_message(post, Slack.Client.Mock)
  end

  test "HTTP error", %{post: post} do
    # implementation du behaviour (mock)
    expect(Slack.Client.Mock, :post_message, fn _ ->
      {:error, "some error"}
    end)

    assert {:error, "some error"} == Slack.post_message(post, Slack.Client.Mock)
  end
end
