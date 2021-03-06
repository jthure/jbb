defmodule JBB.Repo.Migrations.CreateCalendarEvents do
  use Ecto.Migration

  def change do
    create table(:calendar_events) do
      add :name, :string
      add :start, :utc_datetime
      add :end, :utc_datetime
      add :calendar_event_status_id, references(:calendar_event_statuses, on_delete: :nothing)

      timestamps()
    end

    create index(:calendar_events, [:calendar_event_status_id])
  end
end
