defmodule LJDC.Client do
  use Tesla

  plug(Tesla.Middleware.BaseUrl, "https://lesjoiesducode.fr")
  plug(Tesla.Middleware.FollowRedirects)

  @spec random() :: {:error, any()} | {:ok, binary()}
  def random() do
    case get("/random") do
      {:ok, %Tesla.Env{status: 200, url: _url, body: body}} ->
        # IO.inspect url
        {:ok, body}

      _other ->
        {:error, "failed to get random post"}
    end
  end
end
