defmodule LJDC.Ecto.Rollback.Test do
  use ExUnit.Case

  setup do
    on_exit(fn -> Mix.Tasks.Ecto.Migrate.run(["--quiet"]) end)
  end

  test "rollback" do
    assert :ok == Mix.Tasks.Ecto.Rollback.run(["--all"])
  end
end
