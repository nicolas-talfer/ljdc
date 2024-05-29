defmodule LJDC.V2.Test do
  use ExUnit.Case
  import Mock

  test "nominal case" do
    html = File.read!("test/ljdc_sample.html")

    with_mock :httpc, request: fn _url -> {:ok, {{"HTTP/1.1", 200, "OK"}, [], html}} end do
      assert match?({:ok, %LJDC.Post{}}, LJDC.V2.random())
    end
  end

  test "HTTP 500" do
    with_mock :httpc, request: fn _url -> {:ok, {{"HTTP/1.1", 500, "Internal Server Error"}, [], ""}} end do
      assert match?({:error, _}, LJDC.V2.random())
    end
  end

  test "connection refused" do
    error = {:error, {:failed_connect, [{:to_address, {"lesjoiesducode.fr", 443}}, {:inet, [:inet], :nxdomain}]}}

    with_mock :httpc, request: fn _url -> error end do
      assert match?({:error, _}, LJDC.V2.random())
    end
  end
end
