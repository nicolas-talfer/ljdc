defmodule LJDC.V3 do
  require Logger

  defmodule Post do
    defstruct [:title, :info, :gif]
  end

  @spec random() :: {:ok, %LJDC.Post{gif: any(), info: binary(), title: any()}} | {:error, any()}
  def random() do
    with {:ok, {{_, 200, _}, _, html}} <- :httpc.request(url()) do
      LJDC.Parser.parse(to_string(html))
    else
      error ->
        Logger.error("Failed to fetch/parse gif: #{inspect(error)}")
        {:error, error}
    end
  end

  defp url(), do: Application.get_env(:ljdc, :url)
end
