defmodule LJDC.Parser do
  @spec parse(binary()) :: {:ok, %LJDC.Post{gif: binary(), info: binary(), title: binary()}}
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

    # retrieve gif url
    [{"object", object_attr, _}] = Floki.find(article, "object")
    {_, gif} = List.keyfind(object_attr, "data", 0)
    result = %LJDC.Post{title: title, info: info, gif: gif}

    {:ok, result}
  end
end
