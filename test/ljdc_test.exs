defmodule LJDCTest do
  use ExUnit.Case

  test "nominal case - offline" do
    {:ok, html} = File.read("test/ljdc_sample.html")

    assert LJDC.parse(html) ==
             {:ok,
              %LJDC.Post{
                title: "Quand ça compile",
                info: "Les joies du code, commit du 21 Août 2018",
                gif: "https://lesjoiesducode.fr/content/031/v2J6obU.gif"
              }}
  end
end
