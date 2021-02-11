defmodule JBB.Repo.Migrations.CreateCalendarEventInstance do
  use Ecto.Migration

  def change do
    create table(:calendar_event_instance) do
      add :start, :utc_datetime
      add :end, :utc_datetime
      add :owner_userid, references(:users, on_delete: :nothing)
      add :calendar_event_id, references(:calendar_events, on_delete: :nothing)

      timestamps()
    end

    create index(:calendar_event_instance, [:owner_userid])
    create index(:calendar_event_instance, [:calendar_event_id])
  end
end
