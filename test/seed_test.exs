defmodule Seed.Test do
  use ExUnit.Case, async: true

  test "test 1" do
    :persistent_term.put(:foo, 42)
  end

  test "test 2" do
    assert 42 == :persistent_term.get(:foo)
  end

  test "random" do
    assert Enum.random(1..5) < 2
  end
end
