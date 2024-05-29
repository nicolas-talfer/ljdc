defmodule LJDC.V1.Test do
  use ExUnit.Case

  test "nominal case" do
    result = LJDC.V1.random()

    assert match?(
             {:ok, %LJDC.Post{title: _, info: _, gif: _}},
             result
           )

    {:ok, post} = result
    assert is_binary(post.title)
    assert is_binary(post.info)
    assert match?(%URI{}, URI.parse(post.gif))
  end
end
