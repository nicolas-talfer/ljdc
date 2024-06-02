defmodule LJDC.Repo.Migrations.DeleteInfoColumn do
  use Ecto.Migration

  # def change do
  #   alter table(:posts), do: remove :info
  # end

  def up do
    alter table(:posts), do: remove(:info)
  end

  def down do
    alter table(:posts), do: add(:info, :string)
  end
end
