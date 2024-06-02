defmodule LJDC.Repo.Migrations.AddPostsTable do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string
      add :info, :string
      add :gif, :string
      timestamps()
    end
  end
end
