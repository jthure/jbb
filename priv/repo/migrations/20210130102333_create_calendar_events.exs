defmodule JBB.Repo.Migrations.CreateCalendarEvents do
  use Ecto.Migration

  def change do
    create table(:calendar_events) do
      add :title, :string
      add :start, :utc_datetime
      add :end, :utc_datetime
      add :owner_userid, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:calendar_events, [:owner_userid])
  end
end
