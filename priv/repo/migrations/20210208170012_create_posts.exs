defmodule JBB.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :text, :string
      add :owner_userid, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:posts, [:owner_userid])
  end
end
