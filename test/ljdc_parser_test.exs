defmodule LJDC.Parser.Test do
  use ExUnit.Case

  test "nominal case" do
    result =
      "test/ljdc_sample.html"
      |> File.read!()
      |> LJDC.Parser.parse()

    assert result ==
             {:ok,
              %LJDC.Post{
                title: "Quand ça compile",
                info: "Les joies du code, commit du 21 Août 2018",
                gif: "https://lesjoiesducode.fr/content/031/v2J6obU.gif"
              }}
  end
end
