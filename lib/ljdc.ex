defmodule LJDC do
  require Logger

  defmodule Post do
    defstruct [:title, :info, :gif]

    @type t :: %__MODULE__{
            title: String.t(),
            info: String.t(),
            gif: String.t()
          }
  end

  def random() do
    try do
      {:ok, html} = LJDC.Client.random()
      {:ok, _} = LJDC.Parser.parse(html)
    rescue
      error ->
        Logger.error("Failed to fetch/parse gif: #{inspect(error)}")
        error
    end
  end

  def parse(html) do
    {:ok, document} = Floki.parse_document(html)

    # get the article part
    [article] = Floki.find(document, "article.blog-post")

    # retrieve blog title
    [{"h1", _attr, [title]}] = Floki.find(article, "h1.blog-post-title")

    # retrieve blog info
    [{"div", _attr, [_svg, span, date]}] = Floki.find(article, "div.post-meta-info")
    {"span", _attr, [author]} = span

    author =
      case author do
        {"a", _attr, [author]} -> author
        author when is_binary(author) -> author
      end

    info = (author <> date) |> String.trim()

    # retriev gif url
    [{"object", object_attr, _}] = Floki.find(article, "object")
    {_, gif} = List.keyfind(object_attr, "data", 0)
    result = %LJDC.Post{title: title, info: info, gif: gif}

    {:ok, result}
  end
end

# article: https://lesjoiesducode.fr/intelligence-artificielle-grok-elon-musk-dispose-deja-de-son-api-en-version-beta
